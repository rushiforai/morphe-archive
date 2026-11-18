package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Swiping sideways on the home screen to change tabs. Messenger's home screen is one fragment that swaps a tab's page
 * in and out, not a pager, so there is nothing to swipe: the only way to another tab is tapping its button. The
 * fragment does keep everything a swipe needs, though. One method hands back the tab on screen, read out of the tab
 * configuration the bar was built from, whose list is the tabs in the order they sit in the bar, and a one-line switch
 * method is what a tab button's own click listener calls. The patch proves that method, the configuration field, its
 * list and the switch, writes the four names into the extension as a route, and wraps the view the fragment builds in
 * a frame that watches for the gesture.
 */
internal const val TAB_SWIPE = "tab_swipe"

private const val TAB_SWIPE_EXTENSION = "Lapp/hushmessenger/extension/TabSwipe;"

/** Takes the home screen's view and the fragment that built it, and gives back the view to show. */
internal const val TAB_SWIPE_WRAP = "$TAB_SWIPE_EXTENSION->wrap(Landroid/view/View;Ljava/lang/Object;)Landroid/view/View;"

internal const val TAB_SWIPE_ROUTE = "$HOST_SCREENS->tabSwipeRoute()Ljava/lang/String;"

private const val TAB_LIST = "Ljava/util/List;"

private val HOME_VIEW_PARAMETERS = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;")

/** The four names the extension reflects on: the current tab, the tab configuration, its tab list and the switch. */
internal data class TabSwipeRoute(val current: String, val config: String, val tabs: String, val select: String) {
    override fun toString() = "$current|$config|$tabs|$select"
}

private fun tabSwipeChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the home screen's tabs changed ($detail)")

private fun extensionChanged(): Nothing =
    throw PatchException("Messenger controls: the extension's tab swipe differs from this patch version")

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.register() = (this as? OneRegisterInstruction)?.registerA

private fun Instruction.source() = (this as? TwoRegisterInstruction)?.registerB

private fun Instruction.reads(): List<Int> =
    if (this is FiveRegisterInstruction) listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount) else emptyList()

/** The names one method hands over: the configuration field it reads, that configuration's tab list and the tab type. */
private class TabReader(val config: FieldReference, val tabs: FieldReference, val tab: String)

/**
 * The home screen's current tab, which is the one method that reads all three names together: the tab configuration
 * out of a field of its own, that configuration's tab list, and the int saying which of the list is showing. It ends
 * `return (Tab) configuration.list.get(index)`, and a build whose last six instructions aren't exactly that is a
 * build this route can't be read off, so the switch stays unapplied rather than guessing a name.
 */
private fun Method.tabReader(): TabReader? {
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() || !returnType.startsWith("L") ||
        implementation == null) {
        return null
    }
    val self = parameterRegister(0)
    val code = code()
    val end = code.size - 1
    if (end < 5) return null
    val tabs = code[end - 5].field() ?: return null
    val index = code[end - 4].field() ?: return null
    val get = code[end - 3].method() ?: return null
    val held = code[end - 2].register() ?: return null
    if (code[end].opcode != Opcode.RETURN_OBJECT || code[end].register() != held ||
        code[end - 1].opcode != Opcode.CHECK_CAST || code[end - 1].register() != held ||
        (code[end - 1] as ReferenceInstruction).reference.toString() != returnType ||
        code[end - 2].opcode != Opcode.MOVE_RESULT_OBJECT ||
        code[end - 3].opcode != Opcode.INVOKE_INTERFACE || get.definingClass != TAB_LIST || get.name != "get" ||
        get.parameterTypes.map { it.toString() } != listOf("I") || get.returnType != "Ljava/lang/Object;" ||
        code[end - 3].reads() != listOf(code[end - 5].register(), code[end - 4].register()) ||
        code[end - 4].opcode != Opcode.IGET || index.definingClass != definingClass || index.type != "I" ||
        code[end - 4].source() != self ||
        code[end - 5].opcode != Opcode.IGET_OBJECT || tabs.type != TAB_LIST
    ) {
        return null
    }
    // The configuration itself, read from the fragment into the register the tab list is read out of.
    val config = code.indices.filter { at ->
        code[at].opcode == Opcode.IGET_OBJECT && code[at].source() == self &&
            code[at].register() == code[end - 5].source() && code[at].field()?.type == tabs.definingClass
    }.map { code[it].field()!! }.distinctBy { it.name }.singleOrNull() ?: return null
    if (config.definingClass != definingClass) return null
    return TabReader(config, tabs, returnType)
}

/**
 * The home screen's tab switch, the call a tab button's click listener makes: an instance method taking one tab and
 * returning nothing, which passes it on with no arguments of its own and throws the answer away. Only one method on
 * the home screen looks like that, and the extension calls it for the tab a swipe lands on.
 */
private fun Method.isTabSelect(tab: String): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || implementation == null ||
        parameterTypes.map { it.toString() } != listOf(tab)
    ) {
        return false
    }
    val self = parameterRegister(0)
    val code = code()
    if (code.size != 3) return false
    val call = code.getOrNull(1)?.method() ?: return false
    val none = code[0].register() ?: return false
    return code[0].opcode == Opcode.CONST_4 && (code[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        code[1].opcode == Opcode.INVOKE_VIRTUAL && call.definingClass == definingClass && call.returnType == "Z" &&
        call.parameterTypes.map { it.toString() } == listOf("Landroid/os/Bundle;", tab) &&
        code[1].reads() == listOf(self, none, self + 1) && code[2].opcode == Opcode.RETURN_VOID
}

/** The fragment method that builds the home screen and hands back its view, which is what gets wrapped. */
private fun Method.isHomeViewBuilder() = !AccessFlags.STATIC.isSet(accessFlags) && name == "onCreateView" &&
    returnType == "Landroid/view/View;" && parameterTypes.map { it.toString() } == HOME_VIEW_PARAMETERS

/**
 * The view builder's one exit, or null when the call can't go in front of it: more than one place the view comes back
 * from, a jump onto that return, a catch around it, or fewer than two locals for the registers the call reads.
 */
private fun Method.homeViewExit(): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    val exit = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }.singleOrNull() ?: return null
    if (exit in jumpTargets() || parameterRegister(0) < 2) return null
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    if (implementation!!.tryBlocks.any { addresses[exit] - it.startCodeAddress in 0 until it.codeUnitCount }) return null
    return exit
}

/** The home screen: one current-tab read, one tab switch for the tab it names, and one view builder to wrap. */
private fun ClassDef.homeView(): Method? {
    val tab = methods.mapNotNull { it.tabReader() }.singleOrNull()?.tab ?: return null
    if (methods.count { it.isTabSelect(tab) } != 1) return null
    return methods.filter { it.isHomeViewBuilder() }.singleOrNull()?.takeIf { it.homeViewExit() != null }
}

/** The one home screen. A second one, or none, leaves Swipe between tabs unapplied. */
internal fun findTabSwipe(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.mapNotNull { it.homeView() }.singleOrNull())

/** Reads the four names off the home screen the view builder belongs to. */
internal fun resolveTabSwipe(view: Method, classOf: (String) -> ClassDef?): TabSwipeRoute {
    val home = classOf(view.definingClass) ?: tabSwipeChanged("the home screen is gone")
    if (home.homeView()?.hookId() != view.hookId()) tabSwipeChanged("${view.hookId()} isn't the home screen's view builder")
    val (current, reader) = home.methods.mapNotNull { method -> method.tabReader()?.let { method to it } }.single()
    val select = home.methods.single { it.isTabSelect(reader.tab) }
    return TabSwipeRoute(
        current = current.hookId(),
        config = "${home.type}->${reader.config.name}:${reader.config.type}",
        tabs = "${reader.tabs.definingClass}->${reader.tabs.name}:$TAB_LIST",
        select = select.hookId(),
    )
}

/**
 * The view builder's one exit, with two locals free for the call, nothing jumping onto the return itself, and no catch
 * around it, since the call that goes in front of it must not land in a handler written for the code it replaces.
 */
internal fun MutableMethod.validateTabSwipe(): Int {
    if (!isHomeViewBuilder() || implementation == null) tabSwipeChanged("${hookId()} isn't the home screen's view builder")
    val code = code()
    val exit = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }.singleOrNull()
        ?: tabSwipeChanged("the view doesn't come back from ${hookId()} at one place")
    if (exit in jumpTargets()) tabSwipeChanged("a jump lands on the view coming back from ${hookId()}")
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    if (implementation!!.tryBlocks.any { addresses[exit] - it.startCodeAddress in 0 until it.codeUnitCount }) {
        tabSwipeChanged("a catch covers the view coming back from ${hookId()}")
    }
    if (parameterRegister(0) < 2) tabSwipeChanged("no two local registers in ${hookId()}")
    // The finder reads the same answer, so a build the discovery accepts is a build this injection fits.
    return homeViewExit() ?: tabSwipeChanged("the view coming back from ${hookId()} can't be wrapped")
}

/**
 * While Swipe between tabs is on, the home screen's view goes inside a frame that watches for a sideways drag and
 * changes tab on it. Off, Pause and safe mode the frame hands every touch straight through, exactly as before.
 */
internal fun MutableMethod.injectTabSwipe() {
    val exit = validateTabSwipe()
    val root = getInstruction<OneRegisterInstruction>(exit).registerA
    addInstructions(exit, """
        move-object/from16 v0, v$root
        move-object/from16 v1, p0
        invoke-static {v0, v1}, $TAB_SWIPE_WRAP
        move-result-object v0
    """.trimIndent())
    replaceInstruction(exit + 4, "return-object v0")
}

/** The extension stub the route is written into, checked before any edit. */
internal fun tabSwipeStub(): MutableMethod {
    val wrap = classDefByOrNull(TAB_SWIPE_EXTENSION)?.methods?.singleOrNull { it.hookId() == TAB_SWIPE_WRAP }
    if (wrap == null || !AccessFlags.STATIC.isSet(wrap.accessFlags) || !AccessFlags.PUBLIC.isSet(wrap.accessFlags)) extensionChanged()
    val stub = mutableClassDefBy(HOST_SCREENS).methods.singleOrNull { it.hookId() == TAB_SWIPE_ROUTE } ?: extensionChanged()
    stub.validateRouteStub(TAB_SWIPE_ROUTE)
    return stub
}

internal fun MutableMethod.writeTabSwipeRoute(route: TabSwipeRoute) {
    validateRouteStub(TAB_SWIPE_ROUTE)
    val register = (implementation!!.instructions.first() as OneRegisterInstruction).registerA
    replaceInstruction(0, "const-string v$register, \"$route\"")
}
