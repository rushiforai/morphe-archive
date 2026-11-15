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
import app.morphe.patches.pinterest.misc.extension.HOOK_TARGETS
import app.morphe.patches.pinterest.misc.extension.PatchLogCapture
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
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
    /** Each holder with the list constructors it has in 14.39.0: the feed holder has two. */
    private enum class Holder(val type: String, val literal: String, val constructors: List<List<String>>) {
        FEED("Lfixture/Feed;", ", _items count:", listOf(listOf(STRING, STRING, LIST), listOf(STRING, LIST, STRING, STRING))),
        PAGE("Lfixture/Page;", "PagedResponse(bookmark=", listOf(listOf(STRING, STRING, LIST))),
        MODELS("Lfixture/Models;", "ModelListWithBookmark(models=", listOf(listOf(LIST, STRING))),
    }

    private val allViews = "TextAdView=2/2;LegacyPromotedCloseupActionButtonModule=2/2;" +
        "PromotedPinCloseupFloatingActionBarModule=2/2;BoardSponsoredCuratorView=2/2"

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
            // One warning per missing holder and per missing ad-only view, one for no view at all, one for no Google ad SDK
            // start, one for no Meta consent check and one for no interstitial checks.
            assertEquals("subset $present warnings: $warnings", 3 - present.size + AD_ONLY_VIEWS.size + 4, warnings.size)
            assertFlag(context, "googleAds", false)
            assertFlag(context, "metaAds", false)
            assertFlag(context, "interstitialAds", false)
            assertEquals(present.size, feedListHoldersHooked)
            assertFlag(context, "hideAds", true)
            assertFlag(context, "feedAds", true)
            assertFlag(context, "adViews", false)
            assertFlag(context, "hideAiPins", true)
            assertFlag(context, "feedAiPins", true)
            for (holder in present) {
                val inits = context.mutableClassDefBy(holder.type).methods.filter { it.name == "<init>" }
                assertEquals(holder.constructors.size, inits.size)
                for (init in inits) {
                    val first = init.instructions()[0]
                    assertEquals(Opcode.INVOKE_STATIC_RANGE, first.opcode)
                    assertEquals(filterCall, (first as ReferenceInstruction).reference.toString())
                    // The list parameter is the register filtered and then replaced.
                    val listRegister = init.implementation!!.registerCount - init.parameters.size - 1 +
                        1 + init.parameterTypes.map { it.toString() }.indexOf(LIST)
                    assertEquals(listRegister, (first as RegisterRangeInstruction).startRegister)
                    assertEquals(1, first.registerCount)
                    val second = init.instructions()[1]
                    assertEquals(Opcode.MOVE_RESULT_OBJECT, second.opcode)
                    assertEquals(listRegister, (second as OneRegisterInstruction).registerA)
                }
            }
            // Each holder is recorded by name, whole where it survived and missing where it didn't.
            val expected = listOf("feedList" to Holder.FEED, "pagedResponse" to Holder.PAGE, "modelList" to Holder.MODELS)
                .joinToString(";") { (id, holder) ->
                    val all = holder.constructors.size
                    "$id=${if (holder in present) all else 0}/$all"
                }
            assertEquals("subset $present", expected, recorded(context, "feedLists"))
        }
    }

    @Test
    fun `a build with every target records each holder constructor and view as whole`() {
        val context = PatchContexts.of(ExtensionDex.classes() + Holder.entries.map { holder(it) } +
            AD_ONLY_VIEWS.map { adView(it, LAYOUT) })
        val warnings = PatchLogCapture.warnings {
            feedListHookPatch.execute(context)
            hideAdsPatch.execute(context)
        }
        assertEquals("only the absent Google ad SDK start, Meta consent check and interstitial checks: $warnings", 3, warnings.size)
        assertEquals("feedList=2/2;pagedResponse=1/1;modelList=1/1", recorded(context, "feedLists"))
        assertEquals(allViews, recorded(context, "adViews"))
        assertFlag(context, "feedAds", true)
        assertFlag(context, "adViews", true)
    }

    @Test
    fun `a partial build records each missing holder constructor and view by name`() {
        val halfSealed = "Lfixture/HalfSealedLayout;"
        val oneConstructor = holder(Holder.FEED, Holder.FEED.constructors.take(1))
        val context = PatchContexts.of(ExtensionDex.classes() + oneConstructor + holder(Holder.MODELS) +
            adView(AD_ONLY_VIEWS[0], LAYOUT) + adView(AD_ONLY_VIEWS[2], halfSealed) + sealedLayout(halfSealed, measureOnly = true))
        val warnings = PatchLogCapture.warnings {
            feedListHookPatch.execute(context)
            hideAdsPatch.execute(context)
        }
        assertTrue(warnings.toString(), warnings.any { "Lfixture/Feed;" in it && "1 of the 2 constructors" in it })
        assertTrue(warnings.toString(), warnings.any { "paged response" in it })
        assertEquals(2, feedListHoldersHooked)
        assertEquals("feedList=1/2;pagedResponse=0/1;modelList=1/1", recorded(context, "feedLists"))
        assertEquals("TextAdView=2/2;LegacyPromotedCloseupActionButtonModule=0/2;" +
            "PromotedPinCloseupFloatingActionBarModule=1/2;BoardSponsoredCuratorView=0/2", recorded(context, "adViews"))
        // The coarse flags still say some of each went in; the record says which.
        assertFlag(context, "feedAds", true)
        assertFlag(context, "adViews", true)
    }

    @Test
    fun `a missing target record stub refuses before any holder or view changes`() {
        for (stub in listOf("feedLists", "adViews")) {
            val context = PatchContexts.of(ExtensionDex.classes() + Holder.entries.map { holder(it) } + adView(AD_ONLY_VIEWS[0], LAYOUT))
            context.mutableClassDefBy(HOOK_TARGETS).methods.removeAll { it.name == stub }
            if (stub == "feedLists") {
                val failure = assertThrows(PatchException::class.java) { feedListHookPatch.execute(context) }
                assertTrue(failure.message, failure.message.orEmpty().contains("stub named feedLists"))
                val init = context.mutableClassDefBy(Holder.PAGE.type).methods.single { it.name == "<init>" }
                assertTrue("no holder hooked", calls(init, filterCall).isEmpty())
            } else {
                feedListHookPatch.execute(context)
                val failure = assertThrows(PatchException::class.java) { hideAdsPatch.execute(context) }
                assertTrue(failure.message, failure.message.orEmpty().contains("stub named adViews"))
                assertFalse("no view held", context.mutableClassDefBy(AD_ONLY_VIEWS[0]).methods.any { it.name == "setVisibility" })
                assertFlag(context, "hideAds", false)
            }
        }
    }

    /** The text the [HOOK_TARGETS] stub [name] answers once patched. */
    private fun recorded(context: BytecodePatchContext, name: String): String {
        val body = context.mutableClassDefBy(HOOK_TARGETS).methods.single { it.name == name }.instructions()
        assertEquals("$name answers a constant", Opcode.CONST_STRING, body[0].opcode)
        assertEquals(Opcode.RETURN_OBJECT, body[1].opcode)
        return ((body[0] as ReferenceInstruction).reference as StringReference).string
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
        assertEquals(warnings.toString(), AD_ONLY_VIEWS.size + 2, warnings.size)
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
    fun `both interstitial questions are answered together, and an unclear build changes neither`() {
        val gate = "Lfixture/Interstitials;"
        val other = "Lfixture/OtherInterstitials;"
        val builds = mapOf(
            "whole" to listOf(interstitials(gate)),
            "a second killswitch read" to listOf(interstitials(gate), interstitials(other, experiment = false, gateMethod = false)),
            "a second experiment check" to listOf(interstitials(gate), interstitials(other, killswitch = false, gateMethod = false)),
            "the questions in two classes" to listOf(interstitials(gate, experiment = false), interstitials(other, killswitch = false)),
            "no experiment check" to listOf(interstitials(gate, experiment = false)),
            "no killswitch read" to listOf(interstitials(gate, killswitch = false)),
            "a static killswitch read" to listOf(interstitials(gate, staticKillswitch = true)),
            "a killswitch read with no local" to listOf(interstitials(gate, killswitchRegisters = 1)),
        )
        for ((name, classes) in builds) {
            val context = PatchContexts.of(ExtensionDex.classes() + Holder.entries.map { holder(it) } + classes)
            val warnings = PatchLogCapture.warnings {
                feedListHookPatch.execute(context)
                hideAdsPatch.execute(context)
            }
            val whole = name == "whole"
            assertEquals("$name: $warnings", whole, warnings.none { "interstitial" in it })
            assertFlag(context, "interstitialAds", whole)
            for (owner in classes) for (method in context.mutableClassDefBy(owner.type).methods) {
                val first = (method.instructions()[0] as? ReferenceInstruction)?.reference?.toString().orEmpty()
                val hooked = "$EXTENSION_PACKAGE/ads/Ads;" in first
                val expected = whole && method.returnType == "Z"
                assertEquals("$name: ${owner.type}->${method.name}", expected, hooked)
                if (!expected) continue
                val (hook, answer) = if (method.parameterTypes.isEmpty()) "killInterstitials" to 1 else "skipInterstitials" to 0
                assertEquals(name, "$EXTENSION_PACKAGE/ads/Ads;->$hook()Z", first)
                assertEquals(name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN),
                    method.instructions().subList(1, 5).map { it.opcode })
                assertEquals("$name: $hook answer", answer, (method.instructions()[3] as NarrowLiteralInstruction).narrowLiteral)
                // A no from the hook runs Pinterest's own first instruction, so it decides for itself.
                val own = (method.instructions()[2] as BuilderOffsetInstruction).target.location.instruction
                assertEquals("$name: $hook falls through to Pinterest's code", method.instructions()[5], own)
                assertEquals("$name: $hook falls through to Pinterest's code", Opcode.CONST_STRING, own?.opcode)
                // The answer register is a local, never the instance or a parameter the original body reads.
                val register = (method.instructions()[1] as OneRegisterInstruction).registerA
                assertTrue("$name: $hook writes v$register", register < method.implementation!!.registerCount - method.parameters.size - 1)
            }
        }
    }

    @Test
    fun `a missing status stub refuses before any holder changes`() {
        for (status in listOf("hideAds", "feedAds", "adViews", "googleAds", "metaAds", "interstitialAds")) {
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

    private fun holder(holder: Holder, constructors: List<List<String>> = holder.constructors): ClassDef {
        val toString = method(holder.type, "toString", emptyList(), STRING, 1, AccessFlags.PUBLIC.value,
            """
                const-string v0, "${holder.literal}"
                return-object v0
            """)
        val inits = constructors.map { parameters ->
            method(holder.type, "<init>", parameters, "V", 2 + parameters.size,
                AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
                """
                    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                    return-void
                """)
        }
        return ImmutableClassDef(holder.type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
            listOf(toString) + inits)
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

    /**
     * A layout in the app whose setVisibility and onMeasure are final, as a Kotlin class can make
     * them; with [measureOnly] only onMeasure is, so a view under it can be held by half.
     */
    private fun sealedLayout(type: String, measureOnly: Boolean = false): ClassDef {
        val flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
        val methods = mutableListOf(method(type, "onMeasure", listOf("I", "I"), "V", 3, flags, "return-void"))
        if (!measureOnly) methods += method(type, "setVisibility", listOf("I"), "V", 2, flags, "return-void")
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value, LAYOUT, null, null, null, null, methods)
    }

    /**
     * Pinterest's interstitial controller as 14.44.0 has it: the killswitch read `()Z`, the
     * experiment check `(kind, Z)Z` naming both kinds, and the pin-click gate, which names both
     * experiments too but answers nothing.
     */
    private fun interstitials(
        type: String, killswitch: Boolean = true, experiment: Boolean = true, gateMethod: Boolean = true,
        staticKillswitch: Boolean = false, killswitchRegisters: Int = 4,
    ): ClassDef {
        val methods = mutableListOf<Method>()
        val killswitchFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (staticKillswitch) AccessFlags.STATIC.value else 0)
        if (killswitch) methods += method(type, "d", emptyList(), "Z", killswitchRegisters, killswitchFlags,
            """
                const-string v0, "$INTERSTITIAL_KILLSWITCH"
                const/4 v0, 0x0
                return v0
            """)
        if (experiment) methods += method(type, "c", listOf("Lfixture/Kind;", "Z"), "Z", 4, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            """
                const-string v0, "$HOUSE_INTERSTITIAL"
                const-string v0, "$GMA_INTERSTITIAL"
                const/4 v0, 0x1
                return v0
            """)
        if (gateMethod) methods += method(type, "R", listOf("Lfixture/Kind;", "Z"), "V", 4, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            """
                const-string v0, "$HOUSE_INTERSTITIAL"
                const-string v0, "$GMA_INTERSTITIAL"
                return-void
            """)
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null, null, methods)
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
