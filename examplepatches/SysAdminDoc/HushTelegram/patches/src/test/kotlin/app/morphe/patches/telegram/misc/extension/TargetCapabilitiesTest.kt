/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.extension

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.ads.GET_SPONSORED_MESSAGES
import app.morphe.patches.telegram.ads.GET_SPONSORED_PEERS
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.ads.hideAdsPatch
import app.morphe.patches.telegram.misc.analytics.REPORT_READ_METRICS
import app.morphe.patches.telegram.misc.analytics.AppLogEvent
import app.morphe.patches.telegram.misc.analytics.disableAnalyticsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Synthetic hosts cover every target subset, including a fingerprint match with an unsafe shape.
 * The vendor fixture gates require complete coverage separately; partial builds must retain their
 * surviving hooks without claiming targets they didn't insert.
 */
class TargetCapabilitiesTest {
    private enum class Target(val status: String, val hook: String) {
        CHANNEL("channelAds", "$EXTENSION_PACKAGE/ads/Ads;->skipSponsoredMessages()Z"),
        VIDEO("videoAds", "$EXTENSION_PACKAGE/ads/Ads;->skipVideoAds()Z"),
        SEARCH("searchAds", "$EXTENSION_PACKAGE/ads/Ads;->skipSearchAds()Z"),
        READ_METRICS("readMetrics", "$EXTENSION_PACKAGE/misc/Analytics;->skipReadMetrics(Ljava/util/List;)Z"),
    }

    private val adTargets = listOf(Target.CHANNEL, Target.VIDEO, Target.SEARCH)
    private val reportTargets = listOf(Target.READ_METRICS)

    @Test
    fun `every ad target subset records surviving hooks and rejects an empty build`() {
        verifySubsets("hideAds", adTargets) { hideAdsPatch.execute(it) }
    }

    @Test
    fun `every report target subset records surviving hooks and rejects an empty build`() {
        verifySubsets("disableAnalytics", reportTargets) { disableAnalyticsPatch.execute(it) }
    }

    private fun verifySubsets(family: String, targets: List<Target>, execute: (BytecodePatchContext) -> Unit) {
        val premiumTargets = if (family == "disableAnalytics") AppLogEvent.entries else emptyList()
        val targetCount = targets.size + premiumTargets.size
        for (mask in 0 until (1 shl targets.size)) {
            val present = targets.filterIndexed { index, _ -> mask and (1 shl index) != 0 }
            val originals = present.associateWith { host(it) }
            val context = PatchContexts.of(ExtensionDex.classes() + originals.values)
            val warnings = PatchLogCapture.warnings {
                if (present.isEmpty()) {
                    val failure = assertThrows(PatchException::class.java) { execute(context) }
                    assertTrue(failure.message, failure.message.orEmpty().contains("none of the $targetCount"))
                } else execute(context)
            }
            // These synthetic builds have no ConnectionsManager, so Ghost mode stays out and says so.
            val ghost = if (family == "disableAnalytics" && present.isNotEmpty()) 1 else 0
            assertEquals("$family subset $present warnings", if (present.isEmpty()) 0 else targetCount - present.size + ghost, warnings.size)
            for (premium in premiumTargets) {
                assertFlag(context, premium.capability, false)
                if (present.isNotEmpty()) assertTrue(warnings.toString(), warnings.any { premium.type in it })
            }
            if (family == "disableAnalytics") {
                assertFlag(context, "ghostMode", false)
                if (present.isNotEmpty()) assertTrue(warnings.toString(), warnings.any { "without Ghost mode" in it })
            }
            assertFlag(context, family, present.isNotEmpty())
            for (target in Target.entries) assertFlag(context, target.status, target in present)
            for ((target, original) in originals) {
                val before = original.methods.single()
                val patched = context.mutableClassDefBy(original.type).methods.single { it.name == before.name }
                assertTrue("$family subset $present lost ${target.hook}", patched.instructions().any {
                    it.opcode == Opcode.INVOKE_STATIC && (it as ReferenceInstruction).reference.toString() == target.hook
                })
            }
        }
    }

    @Test
    fun `an unsafe search request retains the other hooks without a search capability`() {
        val hosts = adTargets.associateWith { host(it, supportedShape = it != Target.SEARCH) }
        val context = PatchContexts.of(ExtensionDex.classes() + hosts.values)
        val warnings = PatchLogCapture.warnings { hideAdsPatch.execute(context) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("without Telegram's own way past"))
        assertFlag(context, "hideAds", true)
        assertFlag(context, "channelAds", true)
        assertFlag(context, "videoAds", true)
        assertFlag(context, "searchAds", false)
        assertUnchanged(context, hosts.getValue(Target.SEARCH))
    }

    @Test
    fun `an unsafe metrics request alone hooks nothing and claims no capability`() {
        val host = host(Target.READ_METRICS, supportedShape = false)
        val context = PatchContexts.of(ExtensionDex.classes() + host)
        val warnings = PatchLogCapture.warnings {
            val failure = assertThrows(PatchException::class.java) { disableAnalyticsPatch.execute(context) }
            assertTrue(failure.message, failure.message.orEmpty().contains("none of the ${1 + AppLogEvent.entries.size}"))
            assertTrue(failure.message, failure.message.orEmpty().contains("doesn't check its batch"))
        }
        assertEquals(0, warnings.size)
        for (premium in AppLogEvent.entries) assertFlag(context, premium.capability, false)
        assertFlag(context, "disableAnalytics", false)
        assertFlag(context, "readMetrics", false)
        assertUnchanged(context, host)
    }

    @Test
    fun `every missing capability stub refuses before any host method is changed`() {
        for (target in Target.entries) {
            val targets = if (target in adTargets) adTargets else reportTargets
            val hosts = targets.map { host(it) }
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == target.status }
            val failure = assertThrows(PatchException::class.java) {
                if (target in adTargets) hideAdsPatch.execute(context) else disableAnalyticsPatch.execute(context)
            }
            assertTrue(failure.message, failure.message.orEmpty().contains("no boolean method ${target.status}()"))
            hosts.forEach { assertUnchanged(context, it) }
            assertFlag(context, if (target in adTargets) "hideAds" else "disableAnalytics", false)
            targets.filter { it != target }.forEach { assertFlag(context, it.status, false) }
        }
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val instructions = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions()
        assertEquals("$name is a constant build fact", Opcode.CONST_4, instructions[0].opcode)
        assertEquals("$name coverage", if (expected) 1 else 0, (instructions[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals("$name returns the constant without reading a preference", Opcode.RETURN, instructions[1].opcode)
    }

    private fun assertUnchanged(context: BytecodePatchContext, original: ClassDef) {
        val method = original.methods.single()
        val patched = context.mutableClassDefBy(original.type).methods.single { it.name == method.name }
        assertEquals(method.instructions().map { it.opcode }, patched.instructions().map { it.opcode })
        assertEquals(method.instructions().filterIsInstance<ReferenceInstruction>().map { it.reference.toString() },
            patched.instructions().filterIsInstance<ReferenceInstruction>().map { it.reference.toString() })
    }

    private fun host(target: Target, supportedShape: Boolean = true): ClassDef {
        val type = when (target) {
            Target.CHANNEL -> MESSAGES_CONTROLLER
            Target.VIDEO -> "Lorg/telegram/messenger/video/VideoAds;"
            Target.SEARCH -> "Lfixture/Search;"
            Target.READ_METRICS -> "Lfixture/ReadMetrics;"
        }
        val parameters = when (target) {
            Target.CHANNEL -> listOf("J")
            Target.SEARCH -> listOf("I", "Ljava/lang/String;")
            else -> emptyList()
        }
        val returns = if (target == Target.CHANNEL) MESSAGES_CONTROLLER.removeSuffix(";") + "\$SponsoredMessagesInfo;" else "V"
        val registers = if (target == Target.SEARCH) 5 else if (target == Target.CHANNEL) 4 else 3
        val body = when (target) {
            Target.CHANNEL -> """
                new-instance v0, $GET_SPONSORED_MESSAGES
                const/4 v0, 0x0
                return-object v0
            """
            Target.VIDEO -> """
                new-instance v0, $GET_SPONSORED_MESSAGES
                return-void
            """
            Target.SEARCH -> """
                const/4 v1, 0x0
                const/4 v2, 0x0
                if-eqz p0, :request
                ${if (supportedShape) "goto :done" else "nop"}
                :request
                new-instance v0, $GET_SPONSORED_PEERS
                invoke-virtual {v1, v0, v2}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I
                move-result v0
                :done
                return-void
            """
            Target.READ_METRICS -> """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                ${if (supportedShape) "invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z\nmove-result v1" else "const/4 v1, 0x0"}
                if-nez v1, :done
                new-instance v1, $REPORT_READ_METRICS
                :done
                return-void
            """
        }
        val isStatic = target == Target.SEARCH || target == Target.READ_METRICS
        val method = MutableMethod(ImmutableMethod(
            type, target.status, parameters.map { ImmutableMethodParameter(it, null, null) }, returns,
            AccessFlags.PUBLIC.value or if (isStatic) AccessFlags.STATIC.value else 0, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        )).apply { addInstructionsWithLabels(0, body.trimIndent()) }
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, listOf(method))
    }

    private fun Method.instructions() = implementation?.instructions?.toList().orEmpty()
}
