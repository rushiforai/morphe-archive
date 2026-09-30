/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide ads on each declared build: the two things it finds are there once in the whole build, and
 * the patch, run over the build's own classes, puts the filter in front of the merge and writes the
 * extension's two stubs against the build's names.
 */
class HideAdsFixtureTest {
    private val feedAds = "$EXTENSION_PACKAGE/ads/FeedAds;"

    @Test
    fun `each declared build has one feed merge and one injected check, and the patch hooks both`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val checks = FixtureDex.methodsWhere(build, { true }) { it.isInjectedCheck() }
            assertEquals("$where: static boolean methods reading the injected hash", 1, checks.size)
            val injected = checks.single()

            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, MEDIA, injected.definingClass))
            assertEquals("$where: the feed cache, Media and the injected check's class", 3, classes.size)
            val merges = classes.getValue(FEED_CACHE).methods.filter { it.isFeedMerge() }
            assertEquals("$where: the feed cache's page merges", 1, merges.size)
            val merge = merges.single()

            val getters = merge.instructions().mapNotNull { it.mediaGetter() }.distinct()
            assertTrue("$where: the merge asks an item for its post: $getters", getters.isNotEmpty())
            val getter = getters.first()
            val item = FixtureDex.classes(build, setOf(getter.definingClass))[getter.definingClass]
            assertNotNull("$where: the item class ${getter.definingClass} is in the build", item)
            assertTrue(
                "$where: ${getter.definingClass} defines ${getter.name}()",
                item!!.methods.any { it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == MEDIA },
            )
            val askers = classes.getValue(MEDIA).methods.filter { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.instructions().any { it.calls(injected.definingClass, injected.name) }
            }
            assertEquals("$where: Media's own methods that ask the injected check", 1, askers.size)

            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            hideAdsPatch.execute(context)

            val patched = context.mutableClassDefBy(FEED_CACHE).methods.single { it.sameSignatureAs(merge) }
            val head = patched.instructions()
            val page = patched.implementation!!.registerCount - 9 + 5
            val filter = head[0]
            assertEquals("$where: the merge starts with the filter", Opcode.INVOKE_STATIC_RANGE, filter.opcode)
            assertEquals("$feedAds->filter(Ljava/util/List;)Ljava/util/List;", filter.referenceText())
            assertEquals("$where: the filter reads the page, p5", page, (filter as RegisterRangeInstruction).startRegister)
            assertEquals(1, filter.registerCount)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, head[1].opcode)
            assertEquals("$where: the filtered page goes back in p5", page, (head[1] as OneRegisterInstruction).registerA)
            assertEquals("$where: nothing else changed in the merge", merge.instructions().size + 2, head.size)

            val stubs = context.mutableClassDefBy(feedAds).methods
            val itemMedia = stubs.single { it.name == "itemMedia" }.instructions()
            assertEquals(getter.definingClass, itemMedia.first { it.opcode == Opcode.INSTANCE_OF }.typeText())
            assertEquals(
                "${getter.definingClass}->${getter.name}()$MEDIA",
                itemMedia.single { it.opcode == Opcode.INVOKE_VIRTUAL }.referenceText(),
            )
            val isAd = stubs.single { it.name == "isAd" }.instructions()
            assertEquals(
                "$MEDIA->${askers.single().name}()Z",
                isAd.single { it.opcode == Opcode.INVOKE_VIRTUAL }.referenceText(),
            )

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideAds" }.instructions()
            assertEquals("$where: SettingsStatus.hideAds() answers true", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }

    /** The fingerprint's shape, read by hand: static, boolean, one object, both hashes. */
    private fun Method.isInjectedCheck(): Boolean {
        if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || parameterTypes.size != 1) return false
        if (!parameterTypes.single().startsWith("L")) return false
        val literals = instructions().mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }.toSet()
        return 0x8669a9b0.toInt().toLong() in literals && INJECTED_FIELD.toLong() in literals
    }

    private fun Method.isFeedMerge(): Boolean =
        returnType == "Ljava/lang/Object;" && parameterTypes.size == 8 &&
            parameterTypes[4] == "Ljava/util/List;" && parameterTypes[6] == "Lkotlin/jvm/functions/Function3;" &&
            instructions().any {
                it.calls(FEED_CACHE.removeSuffix(";") + "\$addAndSaveItemsFromFeedFetchSuccess\$2\$1;", "<init>")
            }

    private fun Instruction.mediaGetter(): MethodReference? {
        if (opcode != Opcode.INVOKE_VIRTUAL) return null
        val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
        return reference.takeIf { it.returnType == MEDIA && it.parameterTypes.isEmpty() && it.definingClass != MEDIA }
    }

    private fun Instruction.calls(definingClass: String, name: String): Boolean =
        ((this as? ReferenceInstruction)?.reference as? MethodReference)
            ?.let { it.definingClass == definingClass && it.name == name } == true

    private fun Instruction.referenceText(): String = (this as ReferenceInstruction).reference.toString()

    private fun Instruction.typeText(): String = ((this as ReferenceInstruction).reference as TypeReference).type

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}
