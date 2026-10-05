/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.PatchLogCapture
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Synthetic list holders and ad views stand in for Pinterest's, so every subset a future build
 * could leave is covered: what survives is hooked and claimed, and what's gone is warned about
 * and never claimed. The vendor fixture tests check the real build separately.
 */
class FeedPatchesTest {
    private enum class Holder(val type: String, val literal: String, val parameters: List<String>) {
        FEED("Lfixture/Feed;", ", _items count:", listOf(STRING, STRING, STRING, LIST)),
        PAGE("Lfixture/Page;", "PagedResponse(bookmark=", listOf(STRING, STRING, LIST)),
        MODELS("Lfixture/Models;", "ModelListWithBookmark(models=", listOf(LIST, STRING)),
    }

    private val filterCall = "$EXTENSION_PACKAGE/ads/FeedFilter;->filter(Ljava/util/List;)Ljava/util/List;"
    private val visibilityCall = "$EXTENSION_PACKAGE/ads/Ads;->adViewVisibility(I)I"
    private val measureCall = "$EXTENSION_PACKAGE/ads/Ads;->adViewMeasureSpec(I)I"

    @Test
    fun `every holder subset is filtered where it survives and an empty build stops`() {
        for (mask in 0 until (1 shl Holder.entries.size)) {
            val present = Holder.entries.filterIndexed { index, _ -> mask and (1 shl index) != 0 }
            val context = PatchContexts.of(ExtensionDex.classes() + present.map { holder(it) })
            val warnings = PatchLogCapture.warnings {
                if (present.isEmpty()) {
                    val failure = assertThrows(PatchException::class.java) { feedListHookPatch.execute(context) }
                    assertTrue(failure.message, failure.message.orEmpty().contains("none of the 3"))
                } else {
                    feedListHookPatch.execute(context)
                    hideAdsPatch.execute(context)
                    hideAiPinsPatch.execute(context)
                }
            }
            if (present.isEmpty()) continue
            // One warning per missing holder, and one per missing ad-only view.
            assertEquals("subset $present warnings: $warnings", 3 - present.size + AD_ONLY_VIEWS.size + 1, warnings.size)
            assertEquals(present.size, feedListHoldersHooked)
            assertFlag(context, "hideAds", true)
            assertFlag(context, "feedAds", true)
            assertFlag(context, "adViews", false)
            assertFlag(context, "hideAiPins", true)
            assertFlag(context, "feedAiPins", true)
            for (holder in present) {
                val init = context.mutableClassDefBy(holder.type).methods.single { it.name == "<init>" }
                val first = init.instructions()[0]
                assertEquals(Opcode.INVOKE_STATIC_RANGE, first.opcode)
                assertEquals(filterCall, (first as ReferenceInstruction).reference.toString())
                // The list parameter is the register filtered and then replaced.
                val listRegister = init.implementation!!.registerCount - init.parameters.size - 1 +
                    1 + holder.parameters.indexOf(LIST)
                assertEquals(listRegister, (first as RegisterRangeInstruction).startRegister)
                assertEquals(1, first.registerCount)
                val second = init.instructions()[1]
                assertEquals(Opcode.MOVE_RESULT_OBJECT, second.opcode)
                assertEquals(listRegister, (second as OneRegisterInstruction).registerA)
            }
        }
    }

    @Test
    fun `an AI-label build with no list holder refuses rather than claiming a filter`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        assertThrows(PatchException::class.java) { feedListHookPatch.execute(context) }
        val failure = assertThrows(PatchException::class.java) { hideAiPinsPatch.execute(context) }
        assertTrue(failure.message, failure.message.orEmpty().contains("no list holder was hooked"))
        assertFlag(context, "hideAiPins", false)
        assertFlag(context, "feedAiPins", false)
    }

    @Test
    fun `an ad-only view is held folded through overrides added for it`() {
        val type = AD_ONLY_VIEWS[0]
        val context = PatchContexts.of(ExtensionDex.classes() + Holder.entries.map { holder(it) } + adView(type, LAYOUT))
        val warnings = PatchLogCapture.warnings {
            feedListHookPatch.execute(context)
            hideAdsPatch.execute(context)
        }
        assertEquals(warnings.toString(), AD_ONLY_VIEWS.size - 1, warnings.size)
        assertFlag(context, "adViews", true)
        val view = context.mutableClassDefBy(type)
        val visibility = view.methods.single { it.name == "setVisibility" }
        assertEquals(listOf(visibilityCall), calls(visibility, visibilityCall))
        assertEquals(1, visibility.instructions().count {
            it.opcode == Opcode.INVOKE_SUPER_RANGE && (it as ReferenceInstruction).reference.toString() == "$LAYOUT->setVisibility(I)V"
        })
        val measure = view.methods.single { it.name == "onMeasure" }
        assertEquals("one rewrite per dimension", listOf(measureCall, measureCall), calls(measure, measureCall))
        assertEquals(1, measure.instructions().count {
            it.opcode == Opcode.INVOKE_SUPER_RANGE && (it as ReferenceInstruction).reference.toString() == "$LAYOUT->onMeasure(II)V"
        })
    }

    @Test
    fun `a view that declares the methods is rewritten at their start, and a final one above is left alone`() {
        val declares = AD_ONLY_VIEWS[1]
        val blocked = AD_ONLY_VIEWS[2]
        val sealed = "Lfixture/SealedLayout;"
        val context = PatchContexts.of(ExtensionDex.classes() + Holder.entries.map { holder(it) } +
            adView(declares, LAYOUT, declared = true) + adView(blocked, sealed) + sealedLayout(sealed))
        val warnings = PatchLogCapture.warnings {
            feedListHookPatch.execute(context)
            hideAdsPatch.execute(context)
        }
        assertTrue(warnings.toString(), warnings.any { blocked in it && "override" in it })
        assertFlag(context, "adViews", true)
        val visibility = context.mutableClassDefBy(declares).methods.single { it.name == "setVisibility" }
        assertEquals(Opcode.INVOKE_STATIC_RANGE, visibility.instructions()[0].opcode)
        assertEquals(visibilityCall, (visibility.instructions()[0] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT, visibility.instructions()[1].opcode)
        val measure = context.mutableClassDefBy(declares).methods.single { it.name == "onMeasure" }
        assertEquals(listOf(measureCall, measureCall), calls(measure, measureCall))
        val untouched = context.mutableClassDefBy(blocked).methods
        assertFalse("an override of a final method would stop the class loading",
            untouched.any { it.name == "setVisibility" || it.name == "onMeasure" })
    }

    @Test
    fun `a missing status stub refuses before any holder changes`() {
        for (status in listOf("hideAds", "feedAds", "adViews")) {
            val context = PatchContexts.of(ExtensionDex.classes() + Holder.entries.map { holder(it) })
            context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == status }
            feedListHookPatch.execute(context)
            val failure = assertThrows(PatchException::class.java) { hideAdsPatch.execute(context) }
            assertTrue(failure.message, failure.message.orEmpty().contains("no boolean method $status()"))
            if (status != "hideAds") assertFlag(context, "hideAds", false)
        }
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val instructions = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions()
        assertEquals("$name is a constant build fact", Opcode.CONST_4, instructions[0].opcode)
        assertEquals("$name coverage", if (expected) 1 else 0, (instructions[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals("$name returns the constant without reading a preference", Opcode.RETURN, instructions[1].opcode)
    }

    private fun holder(holder: Holder): ClassDef {
        val toString = method(holder.type, "toString", emptyList(), STRING, 1, AccessFlags.PUBLIC.value,
            """
                const-string v0, "${holder.literal}"
                return-object v0
            """)
        val init = method(holder.type, "<init>", holder.parameters, "V", 2 + holder.parameters.size,
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
            """
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                return-void
            """)
        return ImmutableClassDef(holder.type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
            listOf(toString, init))
    }

    /** A view whose superclass is [superclass]; [declared] gives it its own setVisibility and onMeasure. */
    private fun adView(type: String, superclass: String, declared: Boolean = false): ClassDef {
        val methods = mutableListOf(method(type, "<init>", listOf(CONTEXT), "V", 2,
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
            """
                invoke-direct {p0, p1}, $superclass-><init>(Landroid/content/Context;)V
                return-void
            """))
        if (declared) {
            methods += method(type, "setVisibility", listOf("I"), "V", 2, AccessFlags.PUBLIC.value,
                """
                    invoke-super {p0, p1}, $superclass->setVisibility(I)V
                    return-void
                """)
            methods += method(type, "onMeasure", listOf("I", "I"), "V", 3, AccessFlags.PUBLIC.value,
                """
                    invoke-super {p0, p1, p2}, $superclass->onMeasure(II)V
                    return-void
                """)
        }
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, superclass, null, null, null, null, methods)
    }

    /** A layout in the app whose setVisibility and onMeasure are final, as a Kotlin class can make them. */
    private fun sealedLayout(type: String): ClassDef {
        val flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value, LAYOUT, null, null, null, null, listOf(
            method(type, "setVisibility", listOf("I"), "V", 2, flags, "return-void"),
            method(type, "onMeasure", listOf("I", "I"), "V", 3, flags, "return-void"),
        ))
    }

    private fun calls(method: Method, reference: String) = method.instructions()
        .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        .filter { it == reference }

    private fun method(
        type: String, name: String, parameters: List<String>, returns: String, registers: Int, flags: Int, body: String,
    ): Method = MutableMethod(ImmutableMethod(
        type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
        ImmutableMethodImplementation(registers, emptyList(), null, null),
    )).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    private fun Method.instructions() = implementation?.instructions?.toList().orEmpty()

    private companion object {
        const val STRING = "Ljava/lang/String;"
        const val LIST = "Ljava/util/List;"
        const val CONTEXT = "Landroid/content/Context;"
        const val LAYOUT = "Landroid/widget/FrameLayout;"
    }
}
