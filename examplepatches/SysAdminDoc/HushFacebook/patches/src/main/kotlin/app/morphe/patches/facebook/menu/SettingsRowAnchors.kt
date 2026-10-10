/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.patches.facebook.feed.namesString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Where a row in Facebook's Menu comes from, for the Hushfacebook row, on the 577 to 582 builds.
 *
 * The Menu's Settings and privacy group (see MenuSectionAnchors.kt for the groups) is drawn by the
 * native group section from a list of plain row items: a title, the address a tap opens, the
 * address of an icon, one or two icon resources, and the row's id. On 582 the section builds that
 * list itself and keeps it in a field ([settingsListStores]). Its Help group items are built the
 * same way by Facebook's own code (Scam protection center passes its address first and its icon
 * resource after), which is how a row with no server behind it is made.
 *
 * A tap on a row goes to one static handler taking the view, the user session, the row's helpers
 * and the row item, which loads the `bookmarks_menu` trace (582 asks the `LX/6zX;` string table for
 * it) and picks what to open by the row's id. Two more static methods of the same class take the
 * row item: they log the row being seen, by its id (582's 32-bit build has dropped both). The item
 * class and every member are Redex names (`cTt` on 582, `9KG` on 580, `8oK` on 577, which has one
 * icon resource where 580 has two), so they're found by these shapes and by the trace.
 */
internal const val ROW_PATCH = "Hushfacebook in the Menu"

/** The trace the Menu row tap handler loads. */
internal const val ROW_TAP_TRACE = "bookmarks_menu"

/** The static helpers the patch adds to the row item class, named for the extension to find. */
internal const val ROW_FACTORY = "hushfacebookRow"
internal const val ROW_ID_READER = "hushfacebookRowId"

internal const val VIEW = "Landroid/view/View;"
internal const val USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
internal const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"
internal const val IMMUTABLE_LIST_BUILDER = "Lcom/google/common/collect/ImmutableList\$Builder;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val STRING = "Ljava/lang/String;"

private fun Method.parameters(): List<String> = parameterTypes.map { it.toString() }
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

private val STATIC_INVOKES = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)

/** A static call that turns an ImmutableList builder into its list (`LX/193;->A0P` on 582). */
private fun isListFinish(instruction: Instruction): Boolean {
    if (instruction.opcode !in STATIC_INVOKES) return false
    val call = (instruction as ReferenceInstruction).reference as? MethodReference ?: return false
    return call.returnType == IMMUTABLE_LIST && call.parameterTypes.map { it.toString() } == listOf(IMMUTABLE_LIST_BUILDER)
}

/**
 * Where the native group section picks up the finished Settings and privacy rows, by the index of
 * the `move-result-object`. 582 builds them in the section, into an ImmutableList builder, and
 * stores the list in a field of the group's state (`LX/8wr;->A01`, `LX/902;->A01` on the 32-bit
 * build) that the next draw reads back before building again. So it's a list finished from a
 * builder and stored straight into an ImmutableList field the section also reads. Up to 581 a
 * builder method made this list, and 582's one (`LX/cTu;->A02`) only makes Community resources
 * and Also from Meta. The patch wants exactly one.
 */
internal fun settingsListStores(method: Method): List<Int> {
    val list = method.implementation?.instructions?.toList().orEmpty()
    val read = list.filter { it.opcode == Opcode.IGET_OBJECT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
    return (1 until list.size - 1).filter { index ->
        val result = list[index]
        val store = list[index + 1]
        val field = (store as? ReferenceInstruction)?.reference as? FieldReference
        result.opcode == Opcode.MOVE_RESULT_OBJECT && isListFinish(list[index - 1]) &&
            store.opcode == Opcode.IPUT_OBJECT && field?.type == IMMUTABLE_LIST && field in read &&
            (store as TwoRegisterInstruction).registerA == (result as OneRegisterInstruction).registerA
    }
}

/**
 * The Menu row tap handler: shaped like one ([isRowTapShape]) and naming [ROW_TAP_TRACE], loading
 * it or, as on 582, asking a string table [resolve] finds for it ([namesString]).
 */
internal fun isRowTap(method: Method, resolve: (MethodReference) -> Method? = { null }): Boolean =
    isRowTapShape(method) && namesString(method, ROW_TAP_TRACE, resolve)

/** Static, returning nothing, taking the view, the user session and four more. Its fourth argument is the row item. */
internal fun isRowTapShape(method: Method): Boolean {
    val parameters = method.parameters()
    return method.implementation != null && method.isStatic() && method.returnType == "V" &&
        parameters.size == 6 && parameters[0] == VIEW && parameters[1] == USER_SESSION &&
        parameters[3].startsWith("L")
}

/** The row item type [tap] takes. */
internal fun rowItemType(tap: Method): String = tap.parameterTypes[3].toString()

/** The other static methods of the tap handler's class that take the row item: the row's loggers. */
internal fun rowLoggers(owner: ClassDef, tap: Method, item: String): List<Method> = owner.methods.filter {
    it !== tap && it.name != tap.name && it.implementation != null && it.isStatic() && it.returnType == "V" &&
        item in it.parameters()
}

/**
 * The row item's full constructor: the title, the address a tap opens, the icon's address, one or
 * more icon resources and the id, in that order.
 */
internal fun fullConstructor(item: ClassDef): Method? = item.methods.filter { method ->
    val parameters = method.parameters()
    method.name == "<init>" && method.implementation != null && parameters.size >= 5 &&
        parameters[0] == CHAR_SEQUENCE && parameters[1] == STRING && parameters[2] == STRING &&
        parameters.last() == "J" && parameters.subList(3, parameters.size - 1).all { it == "I" }
}.singleOrNull()

/** The row item's id: its one instance field of type long. */
internal fun idField(item: ClassDef): FieldReference? =
    item.fields.filter { it.type == "J" && !AccessFlags.STATIC.isSet(it.accessFlags) }.singleOrNull()

private fun CharSequence.width() = if (toString() == "J" || toString() == "D") 2 else 1

/**
 * The field each argument of [constructor] is stored in, by argument index, or null unless every
 * argument goes straight into a field of its own class.
 */
internal fun constructorFields(constructor: Method): List<FieldReference>? {
    val implementation = constructor.implementation ?: return null
    val types = constructor.parameterTypes
    val self = implementation.registerCount - 1 - types.sumOf { it.width() }
    val registers = types.indices.map { index -> self + 1 + types.take(index).sumOf { it.width() } }
    val stores = implementation.instructions
        .filter { it.opcode.name.startsWith("iput") }
        .mapNotNull { instruction ->
            val field = (instruction as ReferenceInstruction).reference as FieldReference
            val store = instruction as TwoRegisterInstruction
            if (store.registerB == self && field.definingClass == constructor.definingClass) {
                (instruction as OneRegisterInstruction).registerA to field
            } else {
                null
            }
        }
    val fields = registers.map { register -> stores.filter { it.first == register }.map { it.second }.singleOrNull() }
    if (fields.any { it == null }) return null
    return fields.map { it!! }.takeIf { mapped -> mapped.map { it.name }.toSet().size == mapped.size }
}

/**
 * The body of the row factory added to the row item class: `(template, title, id)` makes a new row
 * item with [title] and [id], no address to open, and the template's icon. The new item is built
 * in v0 and its arguments in v1 and up, so the constructor call takes one range; the template is
 * the first parameter, just past them.
 */
internal fun rowFactorySmali(item: String, constructor: Method, fields: List<FieldReference>): String {
    val types = constructor.parameterTypes.map { it.toString() }
    val lines = mutableListOf("check-cast p0, $item", "new-instance v0, $item")
    var register = 1
    types.forEachIndexed { index, type ->
        lines += when {
            index == 0 -> "move-object/from16 v$register, p1"
            index == 1 -> "const/4 v$register, 0x0"
            index == 2 -> "iget-object v$register, p0, ${reference(fields[index])}"
            type == "I" -> "iget v$register, p0, ${reference(fields[index])}"
            else -> "move-wide/from16 v$register, p2"
        }
        register += if (type == "J") 2 else 1
    }
    lines += "invoke-direct/range { v0 .. v${register - 1} }, $item-><init>(${types.joinToString("")})V"
    lines += "return-object v0"
    return lines.joinToString("\n")
}

/** How many locals [rowFactorySmali] uses: the new item and every argument register. */
internal fun rowFactoryLocals(constructor: Method): Int = 1 + constructor.parameterTypes.sumOf { it.width() }

internal fun reference(field: FieldReference) = "${field.definingClass}->${field.name}:${field.type}"
