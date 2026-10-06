/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.transitions

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.io.File

/**
 * Turn off screen transitions' two anchors on every Facebook build the bundle declares. The tab
 * bar's pager controller slides a tab's pages only when the style it reads equals one value, and
 * its way through for any other style moves the pager and animates nothing. The sliding panel's
 * snapToPanel hands its `animate` argument to the method that picks scrollTo or smoothScrollTo.
 * Then the patch: the style goes through the extension before the comparison, and `animate` before
 * anything reads it. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class TurnOffScreenTransitionsFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Method.shape() = parameterTypes.map(CharSequence::toString)

    private fun MethodReference.shape() = parameterTypes.map(CharSequence::toString)

    private fun MethodReference.key() = definingClass + "->" + name + parameterTypes.joinToString("", "(", ")") + returnType

    private fun Instruction.animates(): Boolean {
        val owner = call?.definingClass ?: return false
        return owner == "Landroid/view/animation/TranslateAnimation;" || owner == "Landroid/view/ViewPropertyAnimator;"
    }

    @Before
    @After
    fun forgetTheLastMatches() {
        ShowTabFingerprint.clearMatch()
        SnapToPanelFingerprint.clearMatch()
    }

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    @Test
    fun `each declared build has both anchors, and the patch asks before Facebook decides to slide`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name

                // The tab bar's pager controller.
                val tabOwners = FixtureDex.classesHolding(bundle, TAB_OUT_OF_BOUNDS_LOG).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val showTabs = tabOwners.flatMap { owner -> owner.methods.filter { holdsString(it, TAB_OUT_OF_BOUNDS_LOG) } }
                assertEquals("$name: methods logging $TAB_OUT_OF_BOUNDS_LOG", 1, showTabs.size)
                val showTab = showTabs.single()
                val tabCode = showTab.code()
                val reads = tabCode.indices.filter { tabCode[it].call?.key() == "Ljava/lang/Number;->intValue()I" }
                assertEquals("$name: styles read", 1, reads.size)
                val read = reads.single()
                assertEquals("$name: the style is kept", Opcode.MOVE_RESULT, tabCode[read + 1].opcode)
                val style = (tabCode[read + 1] as OneRegisterInstruction).registerA
                val test = (read + 2..read + 4).first { tabCode[it].opcode == Opcode.IF_EQ }
                val compared = tabCode[test] as TwoRegisterInstruction
                assertTrue("$name: the comparison reads the style", style == compared.registerA || style == compared.registerB)
                val slide = if (style == compared.registerA) compared.registerB else compared.registerA
                // Not equal falls through: the pager moves, and the method returns with nothing animated.
                val plain = tabCode.drop(test + 1).takeWhile { it.opcode != Opcode.RETURN_VOID }
                assertTrue("$name: the way through for other styles is longer than a pager move", plain.size <= 4)
                assertTrue("$name: the way through for other styles animates", plain.none { it.animates() })
                assertTrue("$name: the way through for other styles doesn't move the pager", plain.any {
                    it.call?.let { call -> call.definingClass == "Landroidx/viewpager/widget/ViewPager;" && call.shape() == listOf("I", "Z") } == true
                })
                assertTrue("$name: the controller has no slide left", tabCode.any { it.animates() })

                // The sliding panel.
                val panelOwners = FixtureDex.classesHolding(bundle, PANEL_NOT_FOUND_LOG).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val snaps = panelOwners.flatMap { owner -> owner.methods.filter { holdsString(it, PANEL_NOT_FOUND_LOG) } }
                assertEquals("$name: methods logging $PANEL_NOT_FOUND_LOG", 1, snaps.size)
                val snap = snaps.single()
                val panel = panelOwners.single { it.type == snap.definingClass }
                assertEquals("$name: the panel's kind", "Landroid/widget/HorizontalScrollView;", panel.superclass)
                assertEquals("$name: snapToPanel's shape", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z"), snap.shape())
                assertEquals("$name: snapToPanel's shape", "V", snap.returnType)
                assertTrue("$name: snapToPanel is an instance method", !AccessFlags.STATIC.isSet(snap.accessFlags))
                val snapCode = snap.code()
                val animate = snap.implementation!!.registerCount - 1
                val handOns = snapCode.filter { it.opcode == Opcode.INVOKE_STATIC && it.call?.definingClass == panel.type && it.call?.shape()?.lastOrNull() == "Z" }
                assertEquals("$name: calls handing animate on", 1, handOns.size)
                val handOn = handOns.single() as Instruction35c
                assertEquals("$name: animate is the last argument handed on", animate, listOf(handOn.registerC, handOn.registerD, handOn.registerE, handOn.registerF, handOn.registerG)[handOn.registerCount - 1])
                val scrolls = panel.methods.single { it.name == handOn.call!!.name && it.shape() == handOn.call!!.shape() }.code()
                assertTrue("$name: the scrolling method has no way without the glide", scrolls.any { it.opcode == Opcode.INVOKE_SUPER && it.call?.key() == "Landroid/widget/HorizontalScrollView;->scrollTo(II)V" })
                assertTrue("$name: the scrolling method doesn't glide", scrolls.any { it.call?.key() == "Landroid/widget/HorizontalScrollView;->smoothScrollTo(II)V" })
                // The settle after a swipe goes to the scrolling method directly, so it keeps its glide.
                val direct = panel.methods.filter { it !== snap && it.implementation?.instructions?.any { call -> call.call?.key() == handOn.call!!.key() } == true }
                assertTrue("$name: only snapToPanel reaches the scrolling method", direct.isNotEmpty())
                println("$name: tabs ${showTab.definingClass}->${showTab.name}, style v$style against v$slide; panel ${snap.definingClass}->${snap.name} " +
                    "hands v$animate to ${handOn.call!!.name}, which ${direct.size} other methods call")

                val context = PatchContexts.of((tabOwners + panelOwners).distinctBy { it.type } + ExtensionDex.classDef(SETTINGS_STATUS))
                forgetTheLastMatches()
                turnOffScreenTransitionsPatch.execute(context)

                val patchedTab = context.mutableClassDefBy(showTab.definingClass).methods
                    .single { it.name == showTab.name && it.shape() == showTab.shape() && it.returnType == "V" }.code()
                assertEquals("$name: two instructions into the controller", tabCode.size + 2, patchedTab.size)
                val ask = patchedTab[read + 2]
                assertEquals("$name: the call", Opcode.INVOKE_STATIC, ask.opcode)
                assertEquals("$name: the call", TAB_STYLE, ask.call!!.key())
                assertEquals("$name: the call passes the style and the one that slides", 2, (ask as Instruction35c).registerCount)
                assertEquals("$name: the style", style, ask.registerC)
                assertEquals("$name: the style that slides", slide, ask.registerD)
                assertEquals("$name: the answer", Opcode.MOVE_RESULT, patchedTab[read + 3].opcode)
                assertEquals("$name: the comparison reads the answer", style, (patchedTab[read + 3] as OneRegisterInstruction).registerA)
                val stillCompared = patchedTab[test + 2]
                assertEquals("$name: the comparison follows", Opcode.IF_EQ, stillCompared.opcode)
                assertEquals("$name: the comparison", compared.registerA to compared.registerB, (stillCompared as TwoRegisterInstruction).let { it.registerA to it.registerB })

                val patchedSnap = context.mutableClassDefBy(snap.definingClass).methods
                    .single { it.name == snap.name && it.shape() == snap.shape() && it.returnType == "V" }.code()
                assertEquals("$name: two instructions into snapToPanel", snapCode.size + 2, patchedSnap.size)
                assertEquals("$name: the call", Opcode.INVOKE_STATIC, patchedSnap[0].opcode)
                assertEquals("$name: the call", PANEL_SLIDES, patchedSnap[0].call!!.key())
                assertEquals("$name: the call passes animate alone", 1, (patchedSnap[0] as Instruction35c).registerCount)
                assertEquals("$name: the call passes animate", animate, (patchedSnap[0] as Instruction35c).registerC)
                assertEquals("$name: the answer", Opcode.MOVE_RESULT, patchedSnap[1].opcode)
                assertEquals("$name: animate keeps the answer", animate, (patchedSnap[1] as OneRegisterInstruction).registerA)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "turnOffScreenTransitions" }.code()
                assertEquals("$name: SettingsStatus.turnOffScreenTransitions() answers true", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }

    @Test
    fun `the extension has the hooks the patch calls`() {
        for (hook in listOf(TAB_STYLE, PANEL_SLIDES)) {
            val type = hook.substringBefore("->")
            val hooks = ExtensionDex.classDef(type).methods.filter { method ->
                "$type->${method.name}${method.parameterTypes.joinToString("", "(", ")")}${method.returnType}" == hook
            }
            assertEquals("$hook in the extension", 1, hooks.size)
            assertTrue("$hook is static", AccessFlags.STATIC.isSet(hooks.single().accessFlags))
        }
    }

    @Test
    fun `a controller that reads no style refuses, naming the method`() {
        val type = "LX/270;"
        val code = listOf(
            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(TAB_OUT_OF_BOUNDS_LOG)),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
        val method = ImmutableMethod(type, "A06", null, "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(2, code, null, null))
        val context = PatchContexts.of(listOf(ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
            null, null, null, null, listOf(method))))
        val failure = assertThrows(PatchException::class.java) {
            context.mutableClassDefBy(type).methods.single().quietTabSwitch()
        }
        assertEquals("$PATCH: $type->A06 reads 0 styles, expected 1", failure.message)
    }
}
