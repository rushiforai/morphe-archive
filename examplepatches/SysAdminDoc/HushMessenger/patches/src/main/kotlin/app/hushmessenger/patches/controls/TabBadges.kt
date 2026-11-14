package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val TAB_BADGES = "tab_badges"
internal const val FACEBOOK_BADGE = "facebook_badge"

/** The bottom bar asks each tab's badge controller through this tab content call, logged under both names. */
internal const val TAB_CONTENT_SPEC = "messaging.navigation.home.tabs.tabcontent.TabContentInterfaceSpec"
internal const val BADGE_CONTROLLER_CALL = "getBadgeController"
internal const val FACEBOOK_BUTTON =
    "Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;"

internal const val TAB_BADGE_HELPER = "$SETTINGS->hideTabBadge(Ljava/lang/String;)Z"
internal const val FACEBOOK_BADGE_HELPER = "$SETTINGS->facebookButtonBadge(Z)Z"

private fun badgesChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the tab badges no longer match the tested build ($detail)")

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** The bottom bar's badge dispatcher: `(String tabId)` to the tab's badge controller, on an instance. */
internal fun Method.isTabBadgeDispatcher(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || !returnType.startsWith("L") ||
        parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;")) return false
    val strings = implementation?.instructions?.mapNotNull { it.string() }?.toSet() ?: return false
    return TAB_CONTENT_SPEC in strings && BADGE_CONTROLLER_CALL in strings
}

internal fun findTabBadges(classes: Iterable<ClassDef>): List<Method> = classes.flatMap { it.methods }.filter { it.isTabBadgeDispatcher() }

/**
 * The controller Messenger hands a tab whose badge is off: every no-badge branch of the dispatcher reads the same static
 * field of the controller type, so that field is the only one of that type it reads.
 */
internal fun Method.noBadgeController(): String {
    val code = implementation?.instructions?.toList() ?: badgesChanged("no code")
    val fields = code.filter { it.opcode == Opcode.SGET_OBJECT }
        .mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.type == returnType }.map { it.toString() }.toSet()
    return fields.singleOrNull() ?: badgesChanged("${fields.size} no-badge controllers")
}

internal fun MutableMethod.validateTabBadges(): String {
    if (!isTabBadgeDispatcher()) badgesChanged("dispatcher ${hookId()}")
    validateScratch()
    // The helper is a plain invoke, which reaches v15 at most.
    if (parameterRegister(1) > 15) badgesChanged("register out of range")
    return noBadgeController()
}

/**
 * Before the dispatcher looks the tab up, a hidden tab gets Messenger's own no-badge controller, the one it gives a tab
 * whose badge is turned off. The tab still opens; it just never shows a dot or count.
 */
internal fun MutableMethod.injectTabBadges() {
    val none = validateTabBadges()
    addInstructionsWithLabels(0, """
        invoke-static {p1}, $TAB_BADGE_HELPER
        move-result v0
        if-eqz v0, :stock_behavior
        sget-object v0, $none
        return-object v0
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

private fun Instruction.argumentRegisters(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/**
 * Index of the MOVE_RESULT of the Facebook button's badge check, or null. The button's build reads one controller and
 * drops it when the account doesn't badge the button, which is Messenger's own plain-button path:
 *
 *     check-cast vC, Controller
 *     ...
 *     invoke-virtual {vX, vSession}, ...(FbUserSession)Z
 *     move-result vR                                    <-
 *     if-nez vR, :build
 *     const/4 vC, 0x0
 *     :build
 *     ... new Button(..., vC as its Controller argument, ...)
 *
 * 587 puts vC into a builder's Controller field at :build and hands the builder to the button.
 */
internal fun Method.facebookBadgeCheck(): Int? {
    if (definingClass != FACEBOOK_BUTTON || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() ||
        !returnType.startsWith("L")) return null
    val code = implementation?.instructions?.toList() ?: return null
    val sites = code.indices.filter { i ->
        val callee = (code[i] as? ReferenceInstruction)?.reference as? MethodReference
        val result = code.getOrNull(i + 1) as? OneRegisterInstruction
        val test = code.getOrNull(i + 2)
        val drop = code.getOrNull(i + 3)
        code[i].opcode == Opcode.INVOKE_VIRTUAL && callee?.returnType == "Z" &&
            callee.parameterTypes.map { it.toString() } == listOf(FB_USER_SESSION) &&
            result?.opcode == Opcode.MOVE_RESULT && test?.opcode == Opcode.IF_NEZ &&
            (test as OneRegisterInstruction).registerA == result?.registerA && code.branchTarget(i + 2) == i + 4 &&
            drop?.opcode == Opcode.CONST_4 && (drop as NarrowLiteralInstruction).narrowLiteral == 0
    }
    val at = sites.singleOrNull() ?: return null
    val controller = (code[at + 3] as OneRegisterInstruction).registerA
    val cast = code.take(at).lastOrNull { it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == controller }
        ?: return null
    val type = ((cast as ReferenceInstruction).reference as TypeReference).type
    // The dropped register is the controller argument of the button the method returns.
    val build = code.drop(at + 4).firstOrNull { instruction ->
        val callee = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            callee?.name == "<init>" && callee.definingClass == returnType
    } ?: return null
    val arguments = build.argumentRegisters()
    var word = 1
    val slots = ((build as ReferenceInstruction).reference as MethodReference).parameterTypes.map { parameter ->
        val name = parameter.toString()
        (arguments.getOrNull(word) to name).also { word += if (name == "J" || name == "D") 2 else 1 }
    }
    // 587 hands the controller over through a builder: right after the check it goes into the builder's field of its
    // type, and the builder goes into the button.
    val stored = code[at + 4].takeIf { it.opcode == Opcode.IPUT_OBJECT && (it as TwoRegisterInstruction).registerA == controller }
    val field = stored?.let { (it as ReferenceInstruction).reference as FieldReference }
    if (field != null && field.type != type) return null
    val carrier = (stored as? TwoRegisterInstruction)?.registerB ?: controller
    val carried = field?.definingClass ?: type
    if (slots.count { it.first == carrier } != 1 || slots.single { it.first == carrier }.second != carried) return null
    return at + 1
}

internal fun findFacebookBadge(classes: Iterable<ClassDef>): List<Method> =
    classes.filter { it.type == FACEBOOK_BUTTON }.flatMap { it.methods }.filter { it.facebookBadgeCheck() != null }

internal fun MutableMethod.validateFacebookBadge(): Int {
    val result = facebookBadgeCheck() ?: badgesChanged("Facebook button ${hookId()}")
    val register = (implementation!!.instructions.elementAt(result) as OneRegisterInstruction).registerA
    // Only the check's own result may reach the test, or another path could skip the extension.
    if (register > 15 || result + 1 in jumpTargets()) badgesChanged("Facebook button badge test")
    return result
}

/** The check's answer goes through the extension, which can only turn a badged button into the plain one. */
internal fun MutableMethod.injectFacebookBadge() {
    val result = validateFacebookBadge()
    val register = (implementation!!.instructions.elementAt(result) as OneRegisterInstruction).registerA
    addInstructions(result + 1, """
        invoke-static {v$register}, $FACEBOOK_BADGE_HELPER
        move-result v$register
    """.trimIndent())
}
