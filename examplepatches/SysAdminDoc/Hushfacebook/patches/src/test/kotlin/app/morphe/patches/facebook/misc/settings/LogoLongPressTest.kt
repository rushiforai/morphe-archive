/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.settings

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.RepoFiles
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.settings.SettingsPatchHosts.builder
import app.morphe.patches.facebook.misc.settings.SettingsPatchHosts.loads
import app.morphe.patches.facebook.misc.settings.SettingsPatchHosts.on
import app.morphe.patches.facebook.misc.settings.SettingsPatchHosts.setContentDescription
import app.morphe.patches.facebook.misc.settings.SettingsPatchHosts.setOnClickListener
import app.morphe.patches.facebook.misc.settings.SettingsPatchHosts.setOnTouchListener
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/**
 * A long press on the Facebook logo at the top of the home feed opens the Hushfacebook screen, for
 * a launcher with no shortcut menu (#2). The settings patch sends the call that gives the logo its
 * touch listener, right after the one that gives it its tap, to SettingsEntry, in the one method
 * of the top bar that holds the logo's trace section.
 */
class LogoLongPressTest {
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun Instruction.call(): String? = ((this as? ReferenceInstruction)?.reference)?.toString()

    /** The bar's logo builder in [classes] after [hook] ran over them. */
    private fun patched(classes: List<ClassDef>, hook: app.morphe.patcher.patch.BytecodePatchContext.() -> Unit): List<Instruction> {
        val context = PatchContexts.of(classes)
        context.hook()
        return context.mutableClassDefBy(WORDMARK_NAVIGATION_BAR).methods
            .single { holdsString(it, CREATE_WORDMARK_VIEW) }.instructions()
    }

    private fun refusal(vararg classes: ClassDef): String = try {
        PatchContexts.of(classes.toList()).hookLogoLongPress()
        fail("the patch went on without its evidence")
        ""
    } catch (expected: PatchException) {
        expected.message.orEmpty()
    }

    @Test
    fun theLogosTouchListenerGoesToTheStandInWithTheSameRegisters() {
        val before = SettingsPatchHosts.bar().methods.single().instructions()

        val after = patched(listOf(SettingsPatchHosts.bar())) { hookLogoLongPress() }

        assertEquals("instruction count", before.size, after.size)
        assertEquals(Opcode.INVOKE_STATIC, after[3].opcode)
        assertEquals(LOGO_TOUCH_STAND_IN, after[3].call())
        assertEquals("the logo, then Facebook's listener", listOf(1, 3), after[3].registers())
        assertEquals("the logo's tap is Facebook's, as it was", LOGO_CLICK_CALL, after[2].call())
        assertEquals("the container's touch listener isn't the logo's", Opcode.INVOKE_VIRTUAL, after[1].opcode)
        assertEquals(before.map { it.call() }.filterIndexed { index, _ -> index != 3 },
            after.map { it.call() }.filterIndexed { index, _ -> index != 3 })
    }

    @Test
    fun aRangeCallStaysARangeCall() {
        val bar = SettingsPatchHosts.barWith(builder("initContents", ImmutableMethodImplementation(20, listOf(
            loads(0, CREATE_WORDMARK_VIEW),
            ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE, 17, 2, setOnClickListener),
            ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE, 17, 2, setOnTouchListener),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        ), null, null)))

        val after = patched(listOf(bar)) { hookLogoLongPress() }

        assertEquals(Opcode.INVOKE_STATIC_RANGE, after[2].opcode)
        assertEquals(LOGO_TOUCH_STAND_IN, after[2].call())
        assertEquals(listOf(17, 18), after[2].registers())
    }

    /** Each piece of evidence the hook stands on, missing, stops the patch and says which. */
    @Test
    fun missingEvidenceStopsThePatch() {
        val returns = ImmutableInstruction10x(Opcode.RETURN_VOID)
        fun bar(vararg instructions: Instruction) = SettingsPatchHosts.bar(*instructions, returns)

        assertTrue(refusal().contains("has no $WORDMARK_NAVIGATION_BAR"))
        assertTrue(refusal(bar(on(1, 2, setOnClickListener), on(1, 3, setOnTouchListener)))
            .contains("holding \"$CREATE_WORDMARK_VIEW\", found 0"))
        val body = ImmutableMethodImplementation(6, listOf(
            loads(0, CREATE_WORDMARK_VIEW), on(1, 2, setOnClickListener), on(1, 3, setOnTouchListener), returns,
        ), null, null)
        assertTrue(refusal(SettingsPatchHosts.barWith(builder("a", body), builder("b", body))).contains("found 2"))
        val loaded = loads(0, CREATE_WORDMARK_VIEW)
        assertTrue(refusal(bar(loaded, on(1, 2, setOnClickListener), on(1, 3, setOnTouchListener), on(2, 3, setOnClickListener)))
            .contains("it gives 2"))
        assertTrue(refusal(bar(loaded, on(1, 2, setOnClickListener), on(1, 0, setContentDescription), on(1, 3, setOnTouchListener)))
            .contains("no longer followed by its touch listener"))
        assertTrue(refusal(bar(loaded, on(1, 2, setOnClickListener), on(2, 3, setOnTouchListener)))
            .contains("goes to another view (v2, not v1)"))
    }

    /**
     * The stand-in the rewrite calls is in the SettingsEntry the bundle ships, public and static,
     * with exactly the descriptor the rewrite writes. Read from the compiled extension, so a Java
     * parameter that compiles to another type fails here rather than as a NoSuchMethodError when
     * Facebook builds its top bar.
     */
    @Test
    fun theStandInIsInTheExtension() {
        val declared = ExtensionDex.classDef(ENTRY).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "$ENTRY->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("SettingsEntry declares no public static $LOGO_TOUCH_STAND_IN: $declared", LOGO_TOUCH_STAND_IN in declared)
    }

    /**
     * The receipt refuses a patched build whose logo call isn't the stand-in, right after the logo
     * gets its tap, in the one method holding both of the logo's trace sections with the builder's
     * shape, which the fixture test below pins on every declared build. The rule names what the
     * patch names, so a rename on one side can't leave the rule looking for something no build has.
     */
    @Test
    fun theContractFileHoldsTheLogoHook() {
        val rules = File(RepoFiles.root, "scripts/injected-mutation-contracts.txt").readLines()
            .map { it.trim() }
            .filter { it.startsWith("next-call ") && it.contains("->setLogoTouchListener(") }
        assertEquals(
            listOf(
                "next-call $LOGO_TOUCH_STAND_IN after $LOGO_CLICK_CALL in static $builderShape " +
                    "holding $CREATE_WORDMARK_VIEW $initContents",
            ),
            rules,
        )
    }

    /** The logo builder's shape on every declared build: static, a context and the bar in, nothing out. */
    private val builderShape = "(Landroid/content/Context;$WORDMARK_NAVIGATION_BAR)V"

    /** The builder's other trace section, which only it holds. */
    private val initContents = "WordmarkNavigationBar.initContents"

    /** Where each declared build gives its logo the touch listener, and the registers it uses. */
    private data class Pin(val index: Int, val registers: List<Int>)

    private val pins = mapOf(
        "581.0.0.45.58" to Pin(155, listOf(11, 1)),
        "580.0.0.51.74" to Pin(155, listOf(9, 1)),
        "577.0.0.50.72" to Pin(139, listOf(11, 1)),
    )

    /**
     * Both declared builds keep the top bar's class name and give the logo its tap, its touch
     * listener and its content description in that order, in the one method holding both of its
     * trace sections. The settings patch, run over each build's bar, sends that touch listener
     * call to the stand-in on Facebook's registers and changes nothing else in the method.
     */
    @Test
    fun eachDeclaredBuildGivesTheLogoItsTouchListenerWhereThePatchLooks() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertEquals("a declared build has no pin", versions, pins.keys)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val pin = pins.getValue(version)
                val bar = FixtureDex.classes(bundle, setOf(WORDMARK_NAVIGATION_BAR))[WORDMARK_NAVIGATION_BAR]
                    ?: throw AssertionError("${bundle.name} has no $WORDMARK_NAVIGATION_BAR")
                val builders = bar.methods.filter { holdsString(it, CREATE_WORDMARK_VIEW) }
                assertEquals("${bundle.name}: methods holding the logo's trace section", 1, builders.size)
                val builder = builders.single()
                assertTrue("${bundle.name}: the builder isn't initContents", holdsString(builder, initContents))
                assertEquals(
                    "${bundle.name}: the builder's shape",
                    builderShape,
                    builder.parameterTypes.joinToString("", "(", ")") + builder.returnType,
                )
                assertTrue("${bundle.name}: the builder isn't static", AccessFlags.STATIC.isSet(builder.accessFlags))
                val was = builder.instructions()
                val index = logoTouchListenerIndex(builder)
                assertEquals("${bundle.name}: where the logo gets its touch listener", pin.index, index)
                val logo = was[index].registers().first()
                assertEquals("${bundle.name}: the logo's tap", LOGO_CLICK_CALL, was[index - 1].call())
                assertEquals("${bundle.name}: the tap goes to the logo", logo, was[index - 1].registers().first())
                assertEquals("${bundle.name}: the logo's description comes next",
                    SettingsPatchHosts.setContentDescription.toString(), was[index + 1].call())
                assertEquals("${bundle.name}: the description goes to the logo", logo, was[index + 1].registers().first())

                val context = PatchContexts.of(SettingsPatchHosts.appAndMainTab() + bar)
                settingsPatch.execute(context)

                val now = context.mutableClassDefBy(WORDMARK_NAVIGATION_BAR).methods
                    .single { holdsString(it, CREATE_WORDMARK_VIEW) }.instructions()
                assertEquals("${bundle.name}: instruction count", was.size, now.size)
                assertEquals("${bundle.name}: the stand-in", LOGO_TOUCH_STAND_IN, now[index].call())
                assertEquals("${bundle.name}: the static form", Opcode.INVOKE_STATIC, now[index].opcode)
                assertEquals("${bundle.name}: Facebook's registers", pin.registers, now[index].registers())
                was.indices.filter { it != index }.forEach { i ->
                    assertEquals("${bundle.name} at $i", was[i].opcode, now[i].opcode)
                    assertEquals("${bundle.name} at $i", was[i].call(), now[i].call())
                    assertEquals("${bundle.name} at $i", was[i].registers(), now[i].registers())
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
