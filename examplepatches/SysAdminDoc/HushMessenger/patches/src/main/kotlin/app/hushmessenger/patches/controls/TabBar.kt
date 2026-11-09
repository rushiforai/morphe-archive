package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The bar of tabs at the bottom. One builder on a singleton, (Context, FbUserSession, boolean), makes the home screen's frame
 * and picks how the bar sits in it: a plain column with the bar under the tabs' pages, an overlay where the bar lies
 * over the page and slides away on scroll, or Messenger's floating pill, which is always an overlay. Each tab's page
 * then says whether the bar may slide away while it scrolls.
 */
internal const val FLOATING_TAB_BAR = "floating_tab_bar"

/** The builder's choice between the plain column and the overlay the bar can slide away in. */
internal const val TAB_BAR_OVERLAY = "tab_bar_overlay"

/** The Chats page's answer on whether the bar slides away while the chat list scrolls. */
internal const val TAB_BAR_SCROLL_AWAY = "tab_bar_scroll_away"

private const val TAB_BAR_FLAGS = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

/** The flag the builder reads before it sets up the floating pill. */
internal const val FLOATING_TAB_BAR_FLAG = 0x0101055400014313L

/** The flag the Chats page reads for its scroll-away answer. */
internal const val CHATS_SCROLL_AWAY_FLAG = 0x0101039400033264L

private val TAB_BAR_BUILDER_PARAMETERS = listOf("Landroid/content/Context;", "Lcom/facebook/auth/usersession/FbUserSession;", "Z")

private fun tabBarChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the tab bar at the bottom changed ($detail)")

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.wide() = (this as? WideLiteralInstruction)?.wideLiteral

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.register() = (this as? OneRegisterInstruction)?.registerA

private fun Instruction.reads(): List<Int> =
    if (this is FiveRegisterInstruction) listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount) else emptyList()

/** Where a hook goes: right before the instruction at [index], handing the extension the yes or no in [answer]. */
internal class TabBarGate(val index: Int, val answer: Int)

internal fun Method.isTabBarBuilder() = !AccessFlags.STATIC.isSet(accessFlags) && returnType.startsWith("L") &&
    parameterTypes.map { it.toString() } == TAB_BAR_BUILDER_PARAMETERS

/**
 * The floating pill's gate in the builder: its flag loaded once, read through Messenger's config with nothing but a
 * move or a cast in between, and an if-eqz on the answer that skips the pill's setup. Nothing may land on the if-eqz.
 */
internal fun Method.floatingTabBarGate(): TabBarGate? {
    if (!isTabBarBuilder()) return null
    val code = code()
    val at = code.indices.singleOrNull { code[it].opcode == Opcode.CONST_WIDE && code[it].wide() == FLOATING_TAB_BAR_FLAG } ?: return null
    val flag = code[at].register() ?: return null
    val read = (at + 1..at + 3).firstOrNull { code.getOrNull(it)?.opcode == Opcode.INVOKE_INTERFACE } ?: return null
    for (between in at + 1 until read) {
        val step = code[between]
        if (step.opcode !in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.CHECK_CAST)) return null
        if (step.register() == flag || step.register() == flag + 1) return null
    }
    val call = code[read].method() ?: return null
    val args = code[read].reads()
    if (call.definingClass != TAB_BAR_FLAGS || call.returnType != "Z" || call.parameterTypes.map { it.toString() } != listOf("J") ||
        args.size != 3 || args[1] != flag || args[2] != flag + 1) return null
    val result = code.getOrNull(read + 1) ?: return null
    val answer = result.register() ?: return null
    if (result.opcode != Opcode.MOVE_RESULT || answer > 15) return null
    val gate = read + 2
    if (code.getOrNull(gate)?.opcode != Opcode.IF_EQZ || code[gate].register() != answer || code.branchTarget(gate) <= gate) return null
    if (gate in jumpTargets()) return null
    return TabBarGate(gate, answer)
}

/**
 * The overlay's gate in the same builder, after the floating flag's read: an if-nez on the floating setup, then a static
 * boolean check of its own that also takes the overlay when yes. Both branches go to the same place, and the hook goes
 * on the second if-nez. The checks before the flag that skip the pill chain one register through the same shape, so
 * the first if-nez must test another register than the check's answer.
 */
internal fun Method.tabBarOverlayGate(): TabBarGate? {
    if (!isTabBarBuilder()) return null
    val code = code()
    val flag = code.indexOfFirst { it.opcode == Opcode.CONST_WIDE && it.wide() == FLOATING_TAB_BAR_FLAG }
    if (flag < 0) return null
    val sites = (flag + 2 until code.size - 2).filter { at ->
        val check = code[at].method()
        code[at - 1].opcode == Opcode.IF_NEZ && code[at].opcode == Opcode.INVOKE_STATIC && check != null &&
            check.returnType == "Z" && check.parameterTypes.size == 1 && check.parameterTypes[0].startsWith("L") &&
            code[at].reads().size == 1 && code[at + 1].opcode == Opcode.MOVE_RESULT && code[at + 2].opcode == Opcode.IF_NEZ &&
            code[at + 2].register() == code[at + 1].register() && code[at - 1].register() != code[at + 1].register() &&
            code.branchTarget(at - 1) == code.branchTarget(at + 2) && code.branchTarget(at + 2) > at + 2
    }
    val at = sites.singleOrNull() ?: return null
    val answer = code[at + 1].register() ?: return null
    if (answer > 15 || at + 2 in jumpTargets()) return null
    return TabBarGate(at + 2, answer)
}

/**
 * The Chats page's scroll-away answer: an instance method with no parameters that ends by reading its flag through a
 * static (Object, long) boolean check and returning that answer. Nothing may land on the return.
 */
internal fun Method.tabBarScrollAwayReturn(): TabBarGate? {
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() || returnType != "Z") return null
    val code = code()
    val end = code.size - 1
    if (end < 3 || code[end].opcode != Opcode.RETURN) return null
    val load = code[end - 3]
    if (load.opcode != Opcode.CONST_WIDE || load.wide() != CHATS_SCROLL_AWAY_FLAG) return null
    val flag = load.register() ?: return null
    val call = code[end - 2].method() ?: return null
    val args = code[end - 2].reads()
    if (code[end - 2].opcode != Opcode.INVOKE_STATIC || call.returnType != "Z" ||
        call.parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;", "J") || args.size != 3 || args[1] != flag || args[2] != flag + 1) return null
    val answer = code[end - 1].register() ?: return null
    if (code[end - 1].opcode != Opcode.MOVE_RESULT || code[end].register() != answer || answer > 15) return null
    if (end in jumpTargets()) return null
    return TabBarGate(end, answer)
}

private fun Iterable<ClassDef>.tabBarBuilders() = flatMap { cls -> cls.methods.filter { it.isTabBarBuilder() } }

/** The one builder with the floating pill's gate. A second one, or none, leaves Floating tab bar unapplied. */
internal fun findFloatingTabBar(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.tabBarBuilders().filter { it.floatingTabBarGate() != null }.singleOrNull())

/** The one builder with the overlay's gate, the same method Floating tab bar edits. */
internal fun findTabBarOverlay(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.tabBarBuilders().filter { it.tabBarOverlayGate() != null }.singleOrNull())

/** The one page whose scroll-away answer reads the Chats flag. */
internal fun findTabBarScrollAway(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.flatMap { cls -> cls.methods.filter { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.tabBarScrollAwayReturn() != null } }.singleOrNull())

internal fun MutableMethod.validateFloatingTabBar(): TabBarGate =
    floatingTabBarGate() ?: tabBarChanged("no floating bar gate in ${hookId()}")

internal fun MutableMethod.validateTabBarOverlay(): TabBarGate =
    tabBarOverlayGate() ?: tabBarChanged("no overlay gate in ${hookId()}")

internal fun MutableMethod.validateTabBarScrollAway(): TabBarGate =
    tabBarScrollAwayReturn() ?: tabBarChanged("no scroll-away answer in ${hookId()}")

/** While Floating tab bar is on, the builder reads the pill's flag as yes. Off, Pause and safe mode keep Messenger's. */
internal fun MutableMethod.injectFloatingTabBar() {
    val gate = validateFloatingTabBar()
    addInstructions(gate.index, """
        invoke-static {v${gate.answer}}, $SETTINGS->floatingTabBar(I)Z
        move-result v${gate.answer}
    """.trimIndent())
}

/**
 * While Hide the tab bar while scrolling is on, the builder takes the overlay, so the bar lies over the page and can
 * slide away. Off, Pause and safe mode keep Messenger's own choice.
 */
internal fun MutableMethod.injectTabBarOverlay() {
    val gate = validateTabBarOverlay()
    addInstructions(gate.index, """
        invoke-static {v${gate.answer}}, $SETTINGS->tabBarOverlay(I)Z
        move-result v${gate.answer}
    """.trimIndent())
}

/** While Hide the tab bar while scrolling is on, the Chats page lets the bar slide away as its list scrolls. */
internal fun MutableMethod.injectTabBarScrollAway() {
    val gate = validateTabBarScrollAway()
    addInstructions(gate.index, """
        invoke-static {v${gate.answer}}, $SETTINGS->tabBarScrollAway(I)Z
        move-result v${gate.answer}
    """.trimIndent())
}
