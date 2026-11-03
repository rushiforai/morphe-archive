package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** 585's theme check: the session's benefit lookup, asked for CUSTOM_APP_THEME. */
internal val APP_THEME_GATE_BODY = """
    const v0, 0x141d6
    invoke-static {p0, v0}, LX/1BU;->A06(LX/HL1;I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, LX/20S;
    const-string v0, "$APP_THEME_BENEFIT"
    invoke-virtual {p0, v0}, LX/20S;->A02(Ljava/lang/String;)Z
    move-result v0
    return v0
""".trimIndent()

private const val GATE = "LX/HQz;->A00($FB_USER_SESSION)Z"
private const val UNLOCK_CALL = "$SETTINGS->unlockAppThemes()Z"
internal const val THEME_TAP = "LX/HTn;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"
private const val PICKER = "LX/IcE;"
private const val THEME_REDRAW = "$PICKER->A1j()V"
private const val PICK = "$PICKER->A02:Ljava/lang/String;"
private const val TOAST = "LX/RYQ;"
private const val STATIC_PUBLIC = 0x9
private const val ASK_GATE = "const/4 v0, 0x0\ninvoke-static {v0}, $GATE\nmove-result v0\nreturn-void"

/**
 * 585's tap case, cut down: it skips a theme that's already picked, writes the pick into the picker, shows the toast
 * and jumps to the shared return. The fragment is v6 and the toast's register v0.
 */
private fun themeTapBody(beforeToast: String = "", landing: String = "sget-object v0, LX/04B;->A00:LX/04B;") = """
    iget-object v6, p0, LX/HTn;->A00:Ljava/lang/Object;
    check-cast v6, $PICKER
    check-cast p1, LX/INl;
    iget-object v5, p1, LX/INl;->A03:Ljava/lang/String;
    iget-object v0, v6, $PICK
    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :done
    const-string v1, "$THEME_PICKER_SURFACE"
    iput-object v5, v6, $PICK
    new-instance v0, $INSTANT_FEEDBACK
    invoke-direct {v0}, $INSTANT_FEEDBACK-><init>()V
    $beforeToast
    iget-object v0, v0, $INSTANT_FEEDBACK->A00:$TOAST
    invoke-virtual {v0}, $TOAST->A01()V
    goto :done
    :done
    $landing
    return-object v0
""".trimIndent()

private fun themeTap(body: String = themeTapBody()) = fixtureMethod(THEME_TAP, body, 10)

/** The picker: its list builder and onViewCreated ask the theme check, and another no-argument method doesn't. */
private fun themePicker(builderFlags: Int = AccessFlags.PUBLIC.value, secondBuilder: Boolean = false) = fixtureClass(PICKER, listOfNotNull(
    fixtureMethod(THEME_REDRAW, ASK_GATE, 2, builderFlags),
    fixtureMethod("$PICKER->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V", ASK_GATE, 4),
    fixtureMethod("$PICKER->A1i()V", "return-void", 1),
    if (secondBuilder) fixtureMethod("$PICKER->A1k()V", ASK_GATE, 2) else null,
))

/** The tap case, its picker and the theme check, the check being the one class the complete fixture already has. */
internal fun appThemePickFixture(tap: MutableMethod = themeTap(), picker: MutableClass = themePicker()): List<MutableClass> = listOf(
    fixtureClass("LX/HTn;", listOf(tap)), picker, fixtureClass("LX/HQz;", listOf(fixtureMethod(GATE, APP_THEME_GATE_BODY, 2, STATIC_PUBLIC))),
)

class AppThemesTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        appThemePick = null
    }

    private val staticPublic = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

    private fun gate(id: String = GATE, body: String = APP_THEME_GATE_BODY, flags: Int = staticPublic, registers: Int = 2) =
        fixtureMethod(id, body, registers, flags)

    private fun holder(vararg methods: MutableMethod) = fixtureClass(methods.first().definingClass, methods.toList())

    @Test fun discoveryFindsTheOneStaticThemeCheckAndNotTheGenericLookup() {
        // The lookup it calls names the benefit too, but takes it as a String.
        val lookup = holder(gate("LX/20S;->A02(Ljava/lang/String;)Z", flags = AccessFlags.PUBLIC.value, registers = 3))
        val found = mirroredControls(listOf(holder(gate()), lookup), null)
        assertEquals(setOf(GATE), found.getValue(APP_THEMES).map { it.hookId() }.toSet())
        validateControls(found, setOf(APP_THEMES))

        for (changed in listOf(
            listOf(holder(gate(body = APP_THEME_GATE_BODY.replace(APP_THEME_BENEFIT, APP_ICON_BENEFIT)))),
            listOf(holder(gate(flags = AccessFlags.PUBLIC.value, registers = 3))),
            listOf(holder(gate("LX/HQz;->A00(Landroid/content/Context;$FB_USER_SESSION)Z", registers = 3))),
            // A second check, so which one the picker reads is no longer known.
            listOf(holder(gate()), holder(gate("LX/HR0;->A00($FB_USER_SESSION)Z"))),
        )) assertFailsWith<PatchException> { validateControls(mirroredControls(changed, null), setOf(APP_THEMES)) }
    }

    @Test fun onAnswersYesAndOffRunsMessengersOwnCheckUntouched() {
        val method = gate()
        val original = method.implementation!!.instructions.toList()
        method.injectAppThemeGate()
        val code = method.implementation!!.instructions.toList()
        assertEquals(UNLOCK_CALL, (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), code.take(5).map { it.opcode })
        assertEquals(1, (code[3] as NarrowLiteralInstruction).narrowLiteral)
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        assertEquals(addresses[5], addresses[2] + (code[2] as OffsetInstruction).codeOffset)
        assertEquals(original, code.drop(5))
    }

    @Test fun aChangedThemeCheckStopsThePatchBeforeAnyEdit() {
        for (method in listOf(
            gate(body = APP_THEME_GATE_BODY.replace(APP_THEME_BENEFIT, APP_ICON_BENEFIT)),
            gate(flags = AccessFlags.PUBLIC.value, registers = 3),
            // No local register left for the switch's answer.
            fixtureMethod(GATE, "const-string p0, \"$APP_THEME_BENEFIT\"\nconst/4 p0, 0x0\nreturn p0", 1, staticPublic),
        )) {
            val before = method.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { method.injectAppThemeGate() }
            assertEquals(before, method.implementation!!.instructions.toList())
        }
    }

    @Test fun everyStockBuildHasOneThemeCheckThatThePickerAndTheAppliedThemeBothRead() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes: List<ClassDef> = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val gates = classes.flatMap { it.methods }.filter { it.isAppThemeGate() }
            assertEquals(activeProfile.hooks.getValue(APP_THEMES), gates.map { it.hookId() }.toSet(), code)
            val id = gates.single().hookId()
            // The Theme picker's fragments and the scheme Messenger draws ask this one check, so a yes both unlocks and applies.
            val callers = classes.flatMap { it.methods }.filter { method ->
                method.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == id } == true
            }
            assertTrue(callers.count { it.name == "onViewCreated" } >= 1, code)
            assertTrue(callers.size >= 5, "$code: ${callers.size}")
            val method = MutableMethod(gates.single())
            val before = method.implementation!!.instructions.toList()
            method.injectAppThemeGate()
            val after = method.implementation!!.instructions.toList()
            assertEquals(UNLOCK_CALL, (after[0] as ReferenceInstruction).reference.toString(), code)
            assertEquals(before, after.drop(5), code)
        }
    }

    @Test fun discoveryFindsTheTapCaseAndThePickersListBuilder() {
        val found = mirroredControls(appThemePickFixture(), null)
        assertEquals(setOf(THEME_TAP), found.getValue(APP_THEME_PICK).map { it.hookId() }.toSet())
        validateControls(found, setOf(APP_THEMES, APP_THEME_PICK))
        assertEquals(AppThemePickSite(13, 0, 6, PICK), appThemePick!!.site)
        assertEquals(THEME_REDRAW, appThemePick!!.redraw)

        for ((case, classes) in listOf(
            "another surface" to appThemePickFixture(themeTap(themeTapBody().replace(THEME_PICKER_SURFACE, "msgr_icon_picker"))),
            "picker register written before the toast" to appThemePickFixture(themeTap(themeTapBody(beforeToast = "move-object v6, v1"))),
            "landing reads the toast's register" to appThemePickFixture(themeTap(themeTapBody(landing = "sget-object v1, LX/04B;->A00:LX/04B;"))),
            "two list builders" to appThemePickFixture(picker = themePicker(secondBuilder = true)),
            "private list builder" to appThemePickFixture(picker = themePicker(builderFlags = AccessFlags.PRIVATE.value)),
        )) assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes, null), setOf(APP_THEME_PICK)) }
    }

    @Test fun aPickRedrawsTheListAfterTheToastWhileOnAndOffJumpsOnAsBefore() {
        val tap = themeTap()
        mirroredControls(appThemePickFixture(tap), null)
        val original = tap.implementation!!.instructions.toList()
        injectControl(APP_THEMES, mapOf(APP_THEME_PICK to listOf(tap)))
        val code = tap.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.GOTO), code.subList(14, 19).map { it.opcode })
        assertEquals(UNLOCK_CALL, (code[14] as ReferenceInstruction).reference.toString())
        assertEquals(THEME_REDRAW, (code[17] as ReferenceInstruction).reference.toString())
        assertEquals(6, (code[17] as FiveRegisterInstruction).registerC)
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        // Off skips straight to Messenger's own jump, which still lands on the shared return.
        assertEquals(addresses[18], addresses[16] + (code[16] as OffsetInstruction).codeOffset)
        assertEquals(addresses[19], addresses[18] + (code[18] as OffsetInstruction).codeOffset)
        assertEquals(original.take(14), code.take(14))
        assertEquals(original.drop(14), code.drop(18))
    }

    @Test fun aTapCaseThatMovedAfterDiscoveryStopsThePatchBeforeAnyEdit() {
        mirroredControls(appThemePickFixture(), null)
        for (tap in listOf(themeTap(themeTapBody(beforeToast = "move-object v6, v1")), themeTap(themeTapBody(landing = "const/4 v0, 0x0")))) {
            val before = tap.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { tap.injectAppThemePick() }
            assertEquals(before, tap.implementation!!.instructions.toList())
        }
        appThemePick = null
        val tap = themeTap()
        assertFailsWith<PatchException> { tap.injectAppThemePick() }
    }

    @Test fun everyStockBuildRedrawsThePickerFromItsOneTapCase() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes: List<ClassDef> = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val pick = resolveAppThemePick(classes)
            assertTrue(pick != null, code)
            assertEquals(activeProfile.hooks.getValue(APP_THEME_PICK), setOf(pick.tap.hookId()), code)
            // The list builder belongs to the picker the pick is written into, and asks the very check app_themes answers.
            assertEquals(pick.site.pickField.substringBefore("->"), pick.redraw.substringBefore("->"), code)
            val builder = classes.first { it.type == pick.redraw.substringBefore("->") }.methods.single { it.hookId() == pick.redraw }
            assertTrue(builder.implementation!!.instructions.any { (it as? ReferenceInstruction)?.reference?.toString() in activeProfile.hooks.getValue(APP_THEMES) }, code)
            appThemePick = pick
            val method = MutableMethod(pick.tap)
            val before = method.implementation!!.instructions.toList()
            method.injectAppThemePick()
            val after = method.implementation!!.instructions.toList()
            val show = pick.site.show
            assertEquals(UNLOCK_CALL, (after[show + 1] as ReferenceInstruction).reference.toString(), code)
            assertEquals(pick.redraw, (after[show + 4] as ReferenceInstruction).reference.toString(), code)
            // A goto that jumps across the new lines may come back wider, and an odd-length insert re-pads a switch
            // payload with a nop; neither changes what runs.
            fun Instruction.jump() = (if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode) to
                (this as? ReferenceInstruction)?.reference?.toString()
            fun List<Instruction>.shape() = filter { it.opcode != Opcode.NOP }.map { it.jump() }
            assertEquals(before.shape(), after.filterIndexed { i, _ -> i !in show + 1..show + 4 }.shape(), code)
        }
    }
}
