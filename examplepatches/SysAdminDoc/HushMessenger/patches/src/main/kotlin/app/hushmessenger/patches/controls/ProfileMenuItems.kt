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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The menu on someone's picture beside their message in a chat (#201). One static builder lists its rows: it asks each
 * row for its title, adds the titles to a popup's menu, makes the listener that runs a row by its position, stores that
 * listener on the popup and shows it.
 *
 * Hide profile menu items hands the popup over right before the listener is stored, with every row in the menu. Rows are
 * hidden rather than taken out, so a row's position still finds the row the listener runs.
 *
 * Ask before a call also hooks the tap of that menu's audio and video rows, which start a call without going through any
 * call button.
 */
internal const val PROFILE_MENU_ITEMS = "profile_menu_items"
internal const val PROFILE_MENU_CALL = "profile_menu_call"
internal const val PROFILE_MENU_SHOWING = "Lapp/hushmessenger/extension/ProfileMenu;->showing(Ljava/lang/Object;)V"
internal const val PROFILE_MENU_ASK =
    "Lapp/hushmessenger/extension/CallConfirm;->profileCall(Ljava/lang/Object;Landroid/content/Context;Landroid/view/View;Ljava/lang/Object;I)Z"

private const val PROFILE_MENU_VIEW = "Landroid/view/View;"
private const val PROFILE_MENU_CONTEXT = "Landroid/content/Context;"
private const val PROFILE_MENU_STRING = "Ljava/lang/String;"
private const val PROFILE_MENU_TILE = "sender_tile"
/** The row tap's own registers the hook borrows: the row, the context, the view, the message and the call's kind. */
private const val PROFILE_CALL_LOCALS = 5

/** What the builder shows: its row type, the message type rows take, where the listener is stored and the popup's register. */
internal class ProfileMenuSite(val rows: String, val message: String, val at: Int, val popup: Int)

private fun MethodReference.profileMenuTypes() = parameterTypes.map { it.toString() }

private fun Instruction.profileMenuCall() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MethodReference.isMenuAdd() = name == "add" && returnType == "Landroid/view/MenuItem;" &&
    profileMenuTypes() == listOf("I", "I", "I", "Ljava/lang/CharSequence;")

/** The builder's shape, or null for any other method. */
internal fun Method.profileMenuSite(): ProfileMenuSite? {
    if (returnType != "V") return null
    val types = parameterTypes.map { it.toString() }
    if (types.size != 4 || types[0] != PROFILE_MENU_VIEW || types[1] != MIG_SCHEME || types[3] != IMMUTABLE_LIST) return null
    val message = types[2]
    val code = implementation?.instructions?.toList() ?: return null
    val asked = code.filter { it.opcode == Opcode.INVOKE_INTERFACE || it.opcode == Opcode.INVOKE_INTERFACE_RANGE }
        .mapNotNull { it.profileMenuCall() }
    val rows = asked.firstOrNull { it.returnType == PROFILE_MENU_STRING && it.profileMenuTypes() == listOf(PROFILE_MENU_CONTEXT, message) }
        ?.definingClass ?: return null
    if (asked.none { it.definingClass == rows && it.returnType == "Z" && it.profileMenuTypes() == listOf(PROFILE_MENU_CONTEXT, PROFILE_MENU_VIEW, message) }) return null
    val added = code.indexOfLast {
        (it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE) && it.profileMenuCall()?.isMenuAdd() == true
    }
    if (added < 0) return null
    val made = (added + 1 until code.size).firstOrNull { code[it].opcode == Opcode.NEW_INSTANCE } ?: return null
    val listener = (code[made] as OneRegisterInstruction).registerA
    val at = (made + 1 until code.size).firstOrNull {
        val put = code[it]
        put.opcode == Opcode.IPUT_OBJECT && (put as TwoRegisterInstruction).registerA == listener && put.registerB != listener
    } ?: return null
    if (at in jumpTargets()) return null
    return ProfileMenuSite(rows, message, at, (code[at] as TwoRegisterInstruction).registerB)
}

/**
 * Whether a row's tap places a video call, read from the last argument of the one static call that starts the call:
 * false for a literal zero, true for any other literal or a call's result. Null when the method has no such call or the
 * flag comes from anywhere else.
 */
internal fun Method.profileCallVideo(): Boolean? {
    val code = implementation?.instructions?.toList() ?: return null
    val placed = code.indices.filter { index ->
        val call = code[index].takeIf { it.opcode == Opcode.INVOKE_STATIC_RANGE }?.profileMenuCall() ?: return@filter false
        val types = call.profileMenuTypes()
        call.returnType == "V" && types.firstOrNull() == PROFILE_MENU_CONTEXT && types.lastOrNull() == "Z"
    }.singleOrNull() ?: return null
    val range = code[placed] as RegisterRangeInstruction
    var wanted = range.startRegister + range.registerCount - 1
    for (index in placed - 1 downTo 0) {
        val step = code[index]
        val written = (step as? OneRegisterInstruction)?.registerA
        when (step.opcode) {
            Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16 -> if (written == wanted) wanted = (step as TwoRegisterInstruction).registerB
            Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST -> if (written == wanted) return (step as NarrowLiteralInstruction).narrowLiteral != 0
            Opcode.MOVE_RESULT -> if (written == wanted) return true
            else -> {
                if (step.opcode.setsRegister() && written == wanted) return null
                if (step.opcode.setsWideRegister() && written != null && written + 1 == wanted) return null
            }
        }
    }
    return null
}

private fun Method.isProfileCallRow(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z") return false
    val types = parameterTypes.map { it.toString() }
    if (types.size != 3 || types[0] != PROFILE_MENU_CONTEXT || types[1] != PROFILE_MENU_VIEW || !types[2].startsWith("L")) return false
    val registers = implementation?.registerCount ?: return false
    return registers - parameterTypes.size - 1 >= PROFILE_CALL_LOCALS && profileCallVideo() != null
}

internal val profileMenuBuilders = methodCheck { _, method -> method.profileMenuSite() != null }
internal val profileCallRows = methodCheck { _, method -> method.isProfileCallRow() }

/** The builder, taken only while exactly one method has its shape. */
internal fun findProfileMenuItems(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(profileMenuBuilders.methods(classes).singleOrNull())

/** The audio and video rows' taps, in that order: one of each among the builder's rows that place a call from this menu. */
internal fun findProfileMenuCalls(
    classes: Iterable<ClassDef>,
    builders: List<Method> = findProfileMenuItems(classes),
    tables: Map<String, Map<Int, String>> = activeStringTables,
): List<Method> {
    val site = builders.singleOrNull()?.profileMenuSite() ?: return emptyList()
    val rows = profileCallRows.sites(classes).filter { (cls, method) ->
        site.rows in cls.interfaces && method.parameterTypes[2].toString() == site.message &&
            method.implementation!!.instructions.toList().indexOfAnchor(PROFILE_MENU_TILE, tables) >= 0
    }.map { it.second }
    val audio = rows.singleOrNull { it.profileCallVideo() == false } ?: return emptyList()
    val video = rows.singleOrNull { it.profileCallVideo() == true } ?: return emptyList()
    return listOf(audio, video)
}

private fun profileMenuChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the profile menu's ${method.hookId()} no longer matches the tested build")

internal fun Method.validateProfileMenuItems() {
    profileMenuSite() ?: profileMenuChanged(this)
}

internal fun Method.validateProfileMenuCall() {
    if (!isProfileCallRow()) profileMenuChanged(this)
}

/** Right before the listener is stored: the popup goes to the extension, which hands nothing back. */
internal fun MutableMethod.injectProfileMenuItems() {
    val site = profileMenuSite() ?: profileMenuChanged(this)
    addInstructions(site.at, "invoke-static/range {v${site.popup} .. v${site.popup}}, $PROFILE_MENU_SHOWING")
}

/** At the top of the row's tap: when the extension takes the tap, the row reports it handled and starts nothing. */
internal fun MutableMethod.injectProfileMenuCall() {
    validateProfileMenuCall()
    val video = if (profileCallVideo() == true) 1 else 0
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            move-object/from16 v1, p1
            move-object/from16 v2, p2
            move-object/from16 v3, p3
            const/4 v4, 0x$video
            invoke-static {v0, v1, v2, v3, v4}, $PROFILE_MENU_ASK
            move-result v0
            if-eqz v0, :stock_behavior
            const/4 v0, 0x1
            return v0
        """.trimIndent(),
        ExternalLabel("stock_behavior", getInstruction(0)),
    )
}
