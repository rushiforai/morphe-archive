package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

// The UI density is chosen in Maps' own Settings screen instead of a patch
// option. The AAOS Settings screen builds its rows in code: a text row (title, click Runnable,
// logging VE, subtitle) is wrapped in a list item and added to a list builder; About & help is the
// last row. A "UI density" row is built the same way, with About's row and item types, VE and
// builder, right before About. Required: without the row the density cannot be changed.
// "BYD battery" (when its patch is included) and "Report a problem" rows follow it, built the same way.
// The rows are skipped while SafeMode turns them off, so a tester can check whether they break
// Maps' Settings on a car.

private const val CONTEXT_GET_STRING = "Landroid/content/Context;->getString(I)Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private const val VIEW_GROUP = "Landroid/view/ViewGroup;"
private val settingsLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.UiDensitySettingsPatch")

// About & help, from its title's Context.getString(id) to the builder add of its list item.
private class AboutRow(
    val start: Int,
    val end: Int,
    val contextRegister: Int,
    val rowInit: MethodReference,
    val veField: FieldReference,
    val itemInit: MethodReference,
    val itemKind: Int,
    val builderRegister: Int,
    val add: MethodReference,
    val addOpcode: Opcode,
)

private fun Instruction.writes(register: Int) =
    opcode.setsRegister() && (this as OneRegisterInstruction).registerA == register

private fun Instruction.methodReference() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MethodReference.parameters() = parameterTypes.map { it.toString() }

private fun aboutRow(method: Method, aboutTitle: Long): AboutRow {
    val instructions = method.implementation!!.instructions.toList()
    fun unexpected(reason: String): Nothing = throw PatchException("Unexpected About & help row in $method: $reason")

    // About's title: const <id>, then Context.getString(id).
    val start = instructions.indices.firstOrNull {
        (instructions[it] as? NarrowLiteralInstruction)?.narrowLiteral?.toLong() == aboutTitle
    } ?: unexpected("no title id")
    val getString = instructions.getOrNull(start + 1) as? FiveRegisterInstruction
    if (getString == null || memberKey(getString) != CONTEXT_GET_STRING ||
        getString.registerD != (instructions[start] as OneRegisterInstruction).registerA
    ) {
        unexpected("title is not read with Context.getString")
    }

    // The text row: new Row(title, Runnable, VE, subtitle), with the VE from a static field.
    val window = start until minOf(instructions.size, start + 30)
    val rowIndex = window.firstOrNull { index ->
        val reference = instructions[index].methodReference()
        instructions[index].opcode == Opcode.INVOKE_DIRECT && reference?.name == "<init>" &&
            reference.parameters().let {
                it.size == 4 && it[0] == CHAR_SEQUENCE && it[1] == RUNNABLE && it[3] == CHAR_SEQUENCE
            }
    } ?: unexpected("no text row")
    val rowCall = instructions[rowIndex] as FiveRegisterInstruction
    val rowInit = rowCall.methodReference()!!
    val veWrite = (rowIndex - 1 downTo start).firstOrNull { instructions[it].writes(rowCall.registerF) }
        ?: unexpected("VE not set")
    val veField = (instructions[veWrite] as? ReferenceInstruction)?.reference as? FieldReference
    if (instructions[veWrite].opcode != Opcode.SGET_OBJECT || veField?.type != rowInit.parameters()[2]) {
        unexpected("VE is not a static field of the row's VE type")
    }

    // The list item: new Item(<int kind>, row).
    val itemIndex = (rowIndex + 1 until minOf(instructions.size, rowIndex + 6)).firstOrNull { index ->
        val reference = instructions[index].methodReference()
        instructions[index].opcode == Opcode.INVOKE_DIRECT && reference?.name == "<init>" &&
            reference.parameters().size == 2 && reference.parameters()[0] == "I" &&
            (instructions[index] as FiveRegisterInstruction).registerE == rowCall.registerC
    } ?: unexpected("row not wrapped in a list item")
    val itemCall = instructions[itemIndex] as FiveRegisterInstruction
    val kindWrite = (itemIndex - 1 downTo rowIndex + 1).firstOrNull { instructions[it].writes(itemCall.registerD) }
    val itemKind = kindWrite?.let { (instructions[it] as? NarrowLiteralInstruction)?.narrowLiteral }
        ?: unexpected("item kind is not a constant")

    // The builder add: builder.add(item), used for the other rows too.
    val addIndex = itemIndex + 1
    val addCall = instructions.getOrNull(addIndex) as? FiveRegisterInstruction ?: unexpected("no builder add")
    val add = addCall.methodReference()
    if (addCall.opcode !in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_INTERFACE) || add == null ||
        add.parameters() != listOf("Ljava/lang/Object;") || add.returnType != "V" ||
        addCall.registerCount != 2 || addCall.registerD != itemCall.registerC
    ) {
        unexpected("item is not added to a builder")
    }
    val builderAdds = instructions.count {
        it.opcode == addCall.opcode && memberKey(it) == memberKey(addCall) &&
            (it as FiveRegisterInstruction).registerC == addCall.registerC
    }
    if (builderAdds < 3) unexpected("builder add used $builderAdds times")

    return AboutRow(
        start, addIndex, getString.registerC, rowInit, veField, itemCall.methodReference()!!, itemKind,
        addCall.registerC, add, addCall.opcode,
    )
}

// [settingsRowClasses]: the extension classes whose getSettingsTitle/Summary/Action build one row each,
// in this order.
internal fun BytecodePatchContext.addSettingsRows(settingsRowClasses: List<String>) {
    val settingsTitle = resourceId(ResourceType.STRING, "CAR_SETTINGS_TITLE")
    val aboutTitle = resourceId(ResourceType.STRING, "CAR_ABOUT_AND_HELP")

    val screens = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            val literals = method.implementation?.instructions?.mapNotNullTo(HashSet()) {
                (it as? NarrowLiteralInstruction)?.narrowLiteral?.toLong()
            } ?: return@forEach
            if (settingsTitle in literals && aboutTitle in literals) screens += method
        }
    }
    val screen = screens.singleOrNull()
        ?: throw PatchException("Expected one Settings screen with its title and About & help, found ${screens.joinToString()}")
    val about = aboutRow(screen, aboutTitle)

    val method = mutableMethodOf(screen)
    val instructions = method.implementation!!.instructions
    // Before About when that point is only reached from the previous instruction; otherwise right
    // after About's builder add, if the context and builder still hold there.
    val insertAt = when {
        instructions[about.start].location.labels.isEmpty() -> about.start
        instructions.getOrNull(about.end + 1)?.location?.labels?.isEmpty() == true &&
            (about.start..about.end).none {
                instructions[it].writes(about.contextRegister) || instructions[it].writes(about.builderRegister)
            } -> about.end + 1
        else -> throw PatchException("No straight-line point for the added Settings rows in $screen")
    }

    // The Settings container view, a parameter of the screen method, can give the activity.
    // Parameters occupy the last registers of the frame.
    val viewGroupIndex = screen.parameterTypes.indexOfFirst { it.toString() == VIEW_GROUP }
    val viewGroupRegister = if (viewGroupIndex < 0) null else {
        val sizes = screen.parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
        method.implementation!!.registerCount - sizes.sum() + sizes.take(viewGroupIndex).sum()
    }

    val excluded = listOfNotNull(about.contextRegister, about.builderRegister, viewGroupRegister).toIntArray()
    val needed = 5 + listOf(about.contextRegister, about.builderRegister).count { it >= 16 }
    val free = method.getFreeRegisterProvider(insertAt, needed, *excluded)
    val title = free.getFreeRegister4Bit()
    val summary = free.getFreeRegister4Bit()
    val action = free.getFreeRegister4Bit()
    val value = free.getFreeRegister4Bit()
    val row = free.getFreeRegister4Bit()
    val context = if (about.contextRegister < 16) about.contextRegister else free.getFreeRegister4Bit()
    val builder = if (about.builderRegister < 16) about.builderRegister else free.getFreeRegister4Bit()
    val kindConst = if (about.itemKind in -8..7) "const/4" else "const/16"
    val add = if (about.addOpcode == Opcode.INVOKE_INTERFACE) "invoke-interface" else "invoke-virtual"
    val afterRows = instructions[insertAt]

    method.addInstructionsWithLabels(
        insertAt,
        buildString {
            if (context != about.contextRegister) appendLine("move-object/from16 v$context, v${about.contextRegister}")
            if (builder != about.builderRegister) appendLine("move-object/from16 v$builder, v${about.builderRegister}")
            appendLine("invoke-static { v$context }, $SAFE_MODE_CLASS->settingsRows(Landroid/content/Context;)Z")
            appendLine("move-result v$value")
            appendLine("if-eqz v$value, :morphe_settings_rows_end")
            settingsRowClasses.forEach { extension ->
                appendLine("invoke-static { v$context }, $extension->getSettingsTitle(Landroid/content/Context;)Ljava/lang/String;")
                appendLine("move-result-object v$title")
                appendLine("invoke-static { v$context }, $extension->getSettingsSummary(Landroid/content/Context;)Ljava/lang/String;")
                appendLine("move-result-object v$summary")
                if (viewGroupRegister == null) appendLine("const/4 v$value, 0x0")
                else appendLine("move-object/from16 v$value, v$viewGroupRegister")
                appendLine(
                    "invoke-static { v$context, v$value }, $extension->getSettingsAction(" +
                        "Landroid/content/Context;Landroid/view/View;)Ljava/lang/Runnable;",
                )
                appendLine("move-result-object v$action")
                appendLine("sget-object v$value, ${about.veField}")
                appendLine("new-instance v$row, ${about.rowInit.definingClass}")
                appendLine("invoke-direct { v$row, v$title, v$action, v$value, v$summary }, ${about.rowInit}")
                appendLine("new-instance v$title, ${about.itemInit.definingClass}")
                appendLine("$kindConst v$summary, ${about.itemKind}")
                appendLine("invoke-direct { v$title, v$summary, v$row }, ${about.itemInit}")
                appendLine("$add { v$builder, v$title }, ${about.add}")
            }
        }.trimEnd(),
        ExternalLabel("morphe_settings_rows_end", afterRows),
    )
    settingsLogger.info(
        "Added ${settingsRowClasses.size} rows (${settingsRowClasses.joinToString { it.substringAfterLast('/').removeSuffix(";") }}) " +
            "behind SafeMode.settingsRows to Settings $screen at $insertAt " +
            "(About at ${about.start}; row ${about.rowInit.definingClass}, item ${about.itemInit.definingClass} " +
            "kind ${about.itemKind}, VE ${about.veField})",
    )
}
