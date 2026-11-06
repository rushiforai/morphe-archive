package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val APP_THEMES = "app_themes"
/** The Theme setting's tap case, which saves the pick and shows its toast but leaves the list as it was. */
internal const val APP_THEME_PICK = "app_theme_pick"
/** Messenger's subscription benefit name for its paid app themes, the ones the Theme setting locks behind an upgrade. */
internal const val APP_THEME_BENEFIT = "CUSTOM_APP_THEME"
/** The picker's logging surface, which only the Theme setting's tap case names. */
internal const val THEME_PICKER_SURFACE = "msgr_theme_picker"
internal const val INSTANT_FEEDBACK = "Lcom/facebook/fds/instantfeedback/FDSInstantFeedback;"
private const val STRING = "Ljava/lang/String;"

/**
 * The one benefit check for paid themes: static, on the session alone, and nothing but the benefit lookup. The Theme
 * picker, the setting's row and the scheme Messenger applies all call it, so one answer unlocks and applies a theme.
 * The generic benefit lookup it calls takes the name as a String, so it never matches.
 */
internal fun Method.isAppThemeGate() = returnType == "Z" && AccessFlags.STATIC.isSet(accessFlags) &&
    parameterTypes.map { it.toString() } == listOf(FB_USER_SESSION) &&
    implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == APP_THEME_BENEFIT } == true

internal fun MutableMethod.validateAppThemeGate() {
    validateScratch()
    if (!isAppThemeGate()) throw PatchException("Messenger controls: ${hookId()} is no longer the app theme benefit check")
}

/** Answers yes while the control is on, so the Theme setting offers every theme and Messenger draws the one picked. */
internal fun MutableMethod.injectAppThemeGate() {
    validateAppThemeGate()
    injectSwitch("$SETTINGS->unlockAppThemes()Z", "0x1")
}

/**
 * Where the tap case shows its "theme applied" toast. [show] is the toast's show call, [scratch] the register it
 * showed from, which the jump right after it overwrites before any read, and [fragment] the register holding the
 * picker, which the case just wrote the pick into ([pickField]).
 */
internal data class AppThemePickSite(val show: Int, val scratch: Int, val fragment: Int, val pickField: String)

/** The tap case and the picker's list builder, its one no-argument method that asks the theme check. */
internal data class AppThemePick(val tap: Method, val site: AppThemePickSite, val redraw: String)

internal var appThemePick: AppThemePick? = null

private fun Instruction.themeRef() = (this as? ReferenceInstruction)?.reference
private fun Method.themeCode() = implementation?.instructions?.toList().orEmpty()

/** The lambda that answers a tap on a theme: it names the picker's logging surface and makes the toast. */
internal fun Method.isAppThemeTap() = name == "invoke" && returnType == "Ljava/lang/Object;" &&
    parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") && themeCode().let { code ->
        code.any { (it.themeRef() as? StringReference)?.string == THEME_PICKER_SURFACE } &&
            code.any { it.opcode == Opcode.NEW_INSTANCE && (it.themeRef() as? TypeReference)?.type == INSTANT_FEEDBACK }
    }

/**
 * The seam right after the toast shows: nothing jumps onto the jump that follows, no try covers it or ends on it, the
 * jump's landing writes the toast's register first, and the picker's register is kept from the pick to the toast.
 * Null when the shape moved.
 */
internal fun Method.appThemePickSite(): AppThemePickSite? {
    val impl = implementation ?: return null
    val code = themeCode()
    // The toast reads its controller off the FDSInstantFeedback it made and shows it with a no-argument call on it.
    val show = code.indices.singleOrNull { i ->
        val read = code[i].themeRef() as? FieldReference
        val call = code.getOrNull(i + 1)
        val shown = call?.themeRef() as? MethodReference
        code[i].opcode == Opcode.IGET_OBJECT && read?.definingClass == INSTANT_FEEDBACK && call?.opcode == Opcode.INVOKE_VIRTUAL &&
            shown?.definingClass == read.type && shown.returnType == "V" && shown.parameterTypes.isEmpty() &&
            (call as FiveRegisterInstruction).registerC == (code[i] as TwoRegisterInstruction).registerA
    }?.plus(1) ?: return null
    val scratch = (code[show] as FiveRegisterInstruction).registerC
    val jump = code.getOrNull(show + 1) ?: return null
    if (jump.opcode !in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) || show + 1 in jumpTargets()) return null
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val at = addresses[show + 1]
    val landing = code.indices.singleOrNull { addresses[it] == at + (jump as OffsetInstruction).codeOffset } ?: return null
    if (code[landing].opcode != Opcode.SGET_OBJECT || !code[landing].readWrites(scratch)) return null
    if (impl.tryBlocks.any { it.startCodeAddress < at && it.startCodeAddress + it.codeUnitCount >= at }) return null
    // The pick is the last String the case writes into an object before the toast.
    val pick = (show - 1 downTo 0).firstOrNull { i ->
        code[i].opcode == Opcode.IPUT_OBJECT && (code[i].themeRef() as? FieldReference)?.type == STRING
    } ?: return null
    val fragment = (code[pick] as TwoRegisterInstruction).registerB
    val pickField = code[pick].themeRef().toString()
    if (fragment > 15 || (pick + 1 until show).any { code[it].readWrites(fragment) }) return null
    // The case compared the tapped theme with the one already picked, so it reads that field earlier on.
    if (code.take(pick).none { it.opcode == Opcode.IGET_OBJECT && it.themeRef().toString() == pickField }) return null
    return AppThemePickSite(show, scratch, fragment, pickField)
}

/**
 * Reads the tap case and the picker's list builder from the one case the build has, or null. Family B moved the list
 * builder up into the picker's abstract base, so a picker with no builder of its own takes its nearest superclass's,
 * as long as no class on the way overrides it and the tap's package can call it.
 */
internal fun resolveAppThemePick(classes: Iterable<ClassDef>): AppThemePick? {
    val byType = classes.associateBy { it.type }
    val tap = classes.flatMap { it.methods }.filter { it.isAppThemeTap() }.singleOrNull() ?: return null
    val site = tap.appThemePickSite() ?: return null
    fun asksGate(call: MethodReference) = call.returnType == "Z" && call.parameterTypes.map { it.toString() } == listOf(FB_USER_SESSION) &&
        byType[call.definingClass]?.methods?.singleOrNull { it.hookId() == call.toString() }?.isAppThemeGate() == true
    fun redraws(cls: ClassDef) = cls.methods.filter { m ->
        m.parameterTypes.isEmpty() && m.returnType == "V" && m.name != "<init>" &&
            !AccessFlags.STATIC.isSet(m.accessFlags) && !AccessFlags.PRIVATE.isSet(m.accessFlags) &&
            m.themeCode().any { it.opcode == Opcode.INVOKE_STATIC && (it.themeRef() as? MethodReference)?.let(::asksGate) == true }
    }
    val chain = generateSequence(byType[site.pickField.substringBefore("->")]) { it.superclass?.let(byType::get) }.take(8).toList()
    val owner = chain.indexOfFirst { redraws(it).isNotEmpty() }.takeIf { it >= 0 } ?: return null
    val redraw = redraws(chain[owner]).singleOrNull() ?: return null
    if (chain.take(owner).any { cls -> cls.methods.any { it.name == redraw.name && it.parameterTypes.isEmpty() } }) return null
    if (owner > 0 && !AccessFlags.PUBLIC.isSet(redraw.accessFlags) &&
        redraw.definingClass.substringBeforeLast('/', "") != tap.definingClass.substringBeforeLast('/', "")) return null
    return AppThemePick(tap, site, redraw.hookId())
}

internal fun findAppThemePick(classes: Iterable<ClassDef>): List<Method> {
    appThemePick = resolveAppThemePick(classes)
    return listOfNotNull(appThemePick?.tap)
}

internal fun MutableMethod.validateAppThemePick(): AppThemePick {
    val pick = appThemePick
    if (pick == null || pick.tap.hookId() != hookId() || !isAppThemeTap() || appThemePickSite() != pick.site)
        throw PatchException("Messenger controls: the Theme setting's tap case changed")
    return pick
}

/** While the control is on, the picker draws its list again after the toast, so the check moves to the theme just picked. */
internal fun MutableMethod.injectAppThemePick() {
    val pick = validateAppThemePick()
    val site = pick.site
    addInstructionsWithLabels(site.show + 1, """
        invoke-static {}, $SETTINGS->unlockAppThemes()Z
        move-result v${site.scratch}
        if-eqz v${site.scratch}, :stock_pick
        invoke-virtual {v${site.fragment}}, ${pick.redraw}
    """.trimIndent(), ExternalLabel("stock_pick", getInstruction(site.show + 1)))
}
