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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The bar of tabs at the bottom. One builder makes the home screen's frame and picks how the bar sits in it: a plain
 * column with the bar under the tabs' pages, an overlay where the bar lies over the page and slides away on scroll, or
 * Messenger's floating pill, which is always an overlay. 586 builds it in a singleton's (Context, FbUserSession,
 * boolean) method, 587 inline in the tab fragment's onCreateView. Each tab's page then says whether the bar may slide
 * away while it scrolls.
 */
internal const val FLOATING_TAB_BAR = "floating_tab_bar"

/** The builder's choice between the plain column and the overlay the bar can slide away in. */
internal const val TAB_BAR_OVERLAY = "tab_bar_overlay"

/** The Chats page's answer on whether the bar slides away while the chat list scrolls. */
internal const val TAB_BAR_SCROLL_AWAY = "tab_bar_scroll_away"

private const val TAB_BAR_FLAGS = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

/** The flag the builder reads before it sets up the floating pill, as 587 numbers it (586 read 0x0101055400014313). */
internal const val FLOATING_TAB_BAR_FLAG = 0x0101055600014560L

/** The flag the Chats page reads for its scroll-away answer, as 587 numbers it (586 read 0x0101039400033264). */
internal const val CHATS_SCROLL_AWAY_FLAG = 0x0101039000033352L

/**
 * The flag the Chats page reads when the bar's frame asks whether a scroll may move the bar at all, as 587 numbers it.
 * The scroll-away answer only sets how far the bar can go, so without this one the bar never starts sliding.
 */
internal const val CHATS_SLIDE_FLAG = 0x0101039000003351L

private val CHATS_PAGE_FLAGS = setOf(CHATS_SCROLL_AWAY_FLAG, CHATS_SLIDE_FLAG)

private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

private val TAB_BAR_BUILDER_PARAMETERS = listOf("Landroid/content/Context;", "Lcom/facebook/auth/usersession/FbUserSession;", "Z")

private val TAB_BAR_FRAGMENT_PARAMETERS = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;")

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
    parameterTypes.map { it.toString() }.let { it == TAB_BAR_BUILDER_PARAMETERS || name == "onCreateView" && it == TAB_BAR_FRAGMENT_PARAMETERS }

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
 * The overlay's gate in the same builder, after the floating flag's read. 586: an if-nez on the floating setup, then a
 * static boolean check of its own that also takes the overlay when yes. Both branches go to the same place, and the
 * hook goes on the second if-nez. The checks before the flag that skip the pill chain one register through the same
 * shape, so the first if-nez must test another register than the check's answer. 587 reads the same lazy answer
 * inline ([lazyOverlayCheck]) and branches the other way: an if-nez on the floating setup goes to the overlay right
 * after the check, the check's if-eqz to the plain column, and any if-nez between them to the column as well.
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
    }.map { it + 2 } + (flag + 2 until code.size - 6).filter { at ->
        if (!code.lazyOverlayCheck(at)) return@filter false
        val column = code.branchTarget(at + 5)
        val skips = (at - 1 downTo flag + 1).takeWhile { code[it].opcode == Opcode.IF_NEZ }
        column > at + 6 && skips.isNotEmpty() && code.branchTarget(skips.last()) == at + 6 &&
            skips.dropLast(1).all { code.branchTarget(it) == column }
    }.map { it + 5 }
    val gate = sites.singleOrNull() ?: return null
    val answer = code[gate - 1].register() ?: return null
    if (answer > 15 || gate in jumpTargets()) return null
    return TabBarGate(gate, answer)
}

/** A lazy boolean read inline: getValue() on the holder, a cast to Boolean, booleanValue() and an if-eqz on the answer. */
private fun List<Instruction>.lazyOverlayCheck(at: Int): Boolean {
    val get = this[at].method() ?: return false
    val box = this[at + 1].register()
    return this[at].opcode == Opcode.INVOKE_INTERFACE && get.name == "getValue" && get.parameterTypes.isEmpty() &&
        get.returnType == "Ljava/lang/Object;" && this[at].reads().size == 1 &&
        this[at + 1].opcode == Opcode.MOVE_RESULT_OBJECT && this[at + 2].opcode == Opcode.CHECK_CAST &&
        this[at + 2].register() == box && (this[at + 2] as ReferenceInstruction).reference.toString() == "Ljava/lang/Boolean;" &&
        this[at + 3].opcode == Opcode.INVOKE_VIRTUAL && this[at + 3].method()?.toString() == "Ljava/lang/Boolean;->booleanValue()Z" &&
        this[at + 3].reads() == listOf(box) && this[at + 4].opcode == Opcode.MOVE_RESULT &&
        this[at + 5].opcode == Opcode.IF_EQZ && this[at + 5].register() == this[at + 4].register()
}

/**
 * One of the Chats page's two answers, its scroll-away answer or its slide answer: an instance method with no
 * parameters that ends by reading its flag and returning that answer, through a static (Object, long) boolean check
 * (586) or the config interface's (long) check right after a cast to it (587). The slide answer's early no's (page not
 * shown, list busy) jump onto the same return ([earlyNosOnly]). The hook goes in front of it and those jumps keep
 * landing on the return itself, so only the flag's answer goes through the switch.
 */
internal fun Method.tabBarScrollAwayReturn(): TabBarGate? = chatsPageAnswer()?.second

/** [tabBarScrollAwayReturn] with the flag it reads. */
private fun Method.chatsPageAnswer(): Pair<Long, TabBarGate>? {
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() || returnType != "Z") return null
    val code = code()
    val end = code.size - 1
    if (end < 3 || code[end].opcode != Opcode.RETURN) return null
    val cast = code[end - 3].takeIf { it.opcode == Opcode.CHECK_CAST }
    val load = code.getOrNull(if (cast == null) end - 3 else end - 4) ?: return null
    val read = load.wide()?.takeIf { load.opcode == Opcode.CONST_WIDE && it in CHATS_PAGE_FLAGS } ?: return null
    val flag = load.register() ?: return null
    val call = code[end - 2].method() ?: return null
    val args = code[end - 2].reads()
    val form = if (cast == null) {
        code[end - 2].opcode == Opcode.INVOKE_STATIC && call.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;", "J")
    } else {
        code[end - 2].opcode == Opcode.INVOKE_INTERFACE && call.definingClass == TAB_BAR_FLAGS &&
            (cast as ReferenceInstruction).reference.toString() == TAB_BAR_FLAGS && args.firstOrNull() == cast.register() &&
            args.firstOrNull() != flag + 1 && call.parameterTypes.map { it.toString() } == listOf("J")
    }
    if (!form || call.returnType != "Z" || args.size != 3 || args[1] != flag || args[2] != flag + 1) return null
    val answer = code[end - 1].register() ?: return null
    if (code[end - 1].opcode != Opcode.MOVE_RESULT || code[end].register() != answer || answer > 15) return null
    if (!earlyNosOnly(code, end, answer)) return null
    return read to TabBarGate(end, answer)
}

/**
 * Whether every jump onto the return at [end] carries a no: none from a switch or a catch, nothing landing anywhere up
 * to the last jump, and the answer's last write before each jump a const/4 of 0. Those jumps skip the hook, so a page
 * that isn't showing still says no with the switch on.
 */
private fun Method.earlyNosOnly(code: List<Instruction>, end: Int, answer: Int): Boolean {
    if (end in jumpTargets(branches = false)) return false
    val early = code.indices.filter { code.branchTarget(it) == end }
    if (early.isEmpty()) return true
    val last = early.max()
    if (jumpTargets().any { it <= last }) return false
    return early.all { at ->
        val write = (at - 1 downTo 0).firstOrNull { code[it].writes(answer) } ?: return@all false
        code[write].opcode == Opcode.CONST_4 && (code[write] as NarrowLiteralInstruction).narrowLiteral == 0
    }
}

private fun Instruction.writes(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))

/**
 * Where the bar's frame decides whether a scroll may move the bar: it asks the page under it for its slide answer
 * ([asksPage] says which interface calls count), and on yes reads its own slide check, a function held in a field and
 * unboxed by a static (Function0) boolean helper. Messenger only fills that field for the floating pill, with its own
 * overlay flag. The hook goes on the if-eqz that tests the helper's answer, one per method, and nothing may land on it.
 */
internal fun Method.tabBarSlideCheck(asksPage: (MethodReference) -> Boolean = { true }): TabBarGate? {
    if (returnType != "Z") return null
    val code = code()
    val gates = code.indices.filter { at ->
        val call = code[at].method()
        code[at].opcode == Opcode.INVOKE_INTERFACE && call != null && call.returnType == "Z" && call.parameterTypes.isEmpty() && asksPage(call)
    }.mapNotNull { at ->
        val check = (at + 1..at + 4).firstOrNull { code.slideFunctionCheck(it) } ?: return@mapNotNull null
        val between = setOf(Opcode.MOVE_RESULT, Opcode.CONST_4, Opcode.IF_NE, Opcode.IF_EQZ)
        if ((at + 1 until check).all { code[it].opcode in between }) check + 3 else null
    }
    val gate = gates.singleOrNull() ?: return null
    val answer = code[gate].register() ?: return null
    if (answer > 15 || gate in jumpTargets()) return null
    return TabBarGate(gate, answer)
}

/** A function read from a field, unboxed to a yes or no by a static helper, and an if-eqz forward on the answer. */
private fun List<Instruction>.slideFunctionCheck(at: Int): Boolean {
    val field = (getOrNull(at) as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    val unbox = getOrNull(at + 1)?.method() ?: return false
    val held = this[at].register() ?: return false
    val answer = getOrNull(at + 2)?.register() ?: return false
    return this[at].opcode == Opcode.IGET_OBJECT && field.type == FUNCTION0 &&
        this[at + 1].opcode == Opcode.INVOKE_STATIC && unbox.returnType == "Z" &&
        unbox.parameterTypes.map { it.toString() } == listOf(FUNCTION0) && this[at + 1].reads() == listOf(held) &&
        this[at + 2].opcode == Opcode.MOVE_RESULT && getOrNull(at + 3)?.opcode == Opcode.IF_EQZ &&
        this[at + 3].register() == answer && branchTarget(at + 3) > at + 3
}

private fun Iterable<ClassDef>.tabBarBuilders() = flatMap { cls -> cls.methods.filter { it.isTabBarBuilder() } }

/** The one builder with the floating pill's gate. A second one, or none, leaves Floating tab bar unapplied. */
internal fun findFloatingTabBar(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.tabBarBuilders().filter { it.floatingTabBarGate() != null }.singleOrNull())

/** The one builder with the overlay's gate, the same method Floating tab bar edits. */
internal fun findTabBarOverlay(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.tabBarBuilders().filter { it.tabBarOverlayGate() != null }.singleOrNull())

/**
 * The Chats page's two answers, each the one method reading its flag and both on the same page, then every check in
 * the bar's frame that asks a page for its slide answer through an interface that page implements. A part missing,
 * or found twice, leaves Hide the tab bar while scrolling unapplied.
 */
internal fun findTabBarScrollAway(classes: Iterable<ClassDef>): List<Method> {
    val answers = classes.flatMap { cls ->
        cls.methods.filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }.mapNotNull { m -> m.chatsPageAnswer()?.let { Triple(cls, m, it.first) } }
    }
    val scroll = answers.filter { it.third == CHATS_SCROLL_AWAY_FLAG }.singleOrNull() ?: return emptyList()
    val slide = answers.filter { it.third == CHATS_SLIDE_FLAG }.singleOrNull() ?: return emptyList()
    if (scroll.first.type != slide.first.type) return emptyList()
    val page = slide.first.interfaces.map { it.toString() }.toSet()
    val asksPage = { call: MethodReference -> call.name == slide.second.name && call.definingClass in page }
    val checks = classes.flatMap { cls -> cls.methods.filter { it.returnType == "Z" && it.tabBarSlideCheck(asksPage) != null } }
    if (checks.isEmpty()) return emptyList()
    return listOf(scroll.second, slide.second) + checks
}

internal fun MutableMethod.validateFloatingTabBar(): TabBarGate =
    floatingTabBarGate() ?: tabBarChanged("no floating bar gate in ${hookId()}")

internal fun MutableMethod.validateTabBarOverlay(): TabBarGate =
    tabBarOverlayGate() ?: tabBarChanged("no overlay gate in ${hookId()}")

internal fun MutableMethod.validateTabBarScrollAway(): TabBarGate =
    tabBarScrollAwayReturn() ?: tabBarSlideCheck() ?: tabBarChanged("no scroll-away answer or slide check in ${hookId()}")

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

/**
 * While Hide the tab bar while scrolling is on, the Chats page lets the bar slide away as its list scrolls, and the
 * bar's frame lets a scroll move it even where Messenger's own overlay flag says no.
 */
internal fun MutableMethod.injectTabBarScrollAway() {
    val gate = validateTabBarScrollAway()
    addInstructions(gate.index, """
        invoke-static {v${gate.answer}}, $SETTINGS->tabBarScrollAway(I)Z
        move-result v${gate.answer}
    """.trimIndent())
}
