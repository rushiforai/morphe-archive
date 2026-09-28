/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Where a row in Facebook's Menu comes from, for the Hushfacebook row, on the 577 and 580 builds.
 *
 * The Menu's Settings and privacy group (see MenuSectionAnchors.kt for the groups) is drawn by the
 * native group section from a list of plain row items: a title, the address a tap opens, the
 * address of an icon, one or two icon resources, and the row's id. The native section gets that
 * list from one builder, the only call it makes that takes the user session, a list and a flag and
 * hands back an ImmutableList. Its Help group items are built the same way by Facebook's own code
 * (Scam protection center passes its address first and its icon resource after), which is how a
 * row with no server behind it is made.
 *
 * A tap on a row goes to one static handler taking the view, the user session, the row's helpers
 * and the row item, which loads the `bookmarks_menu` trace and picks what to open by the row's id.
 * Two more static methods of the same class take the row item: they log the row being seen, by its
 * id. The item class and every member are Redex names (`9KG` on 580, `8oK` on 577, which has one
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
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val STRING = "Ljava/lang/String;"

private fun Method.parameters(): List<String> = parameterTypes.map { it.toString() }
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

/** The call in the native group section that builds a group's row list from the server's. */
internal fun isRowListBuild(call: MethodReference): Boolean =
    call.returnType == IMMUTABLE_LIST &&
        call.parameterTypes.map { it.toString() } == listOf(USER_SESSION, "Ljava/util/List;", "Z")

/** The row list builds [method] calls. The patch wants exactly one. */
internal fun rowListBuilds(method: Method): List<MethodReference> =
    method.implementation?.instructions?.toList().orEmpty()
        .filter { it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
        .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
        .filter(::isRowListBuild)
        .distinctBy { "${it.definingClass}->${it.name}" }

/**
 * The Menu row tap handler: static, returning nothing, taking the view, the user session and four
 * more, and loading [ROW_TAP_TRACE]. Its fourth argument is the row item.
 */
internal fun isRowTap(method: Method): Boolean {
    val parameters = method.parameters()
    return method.implementation != null && method.isStatic() && method.returnType == "V" &&
        parameters.size == 6 && parameters[0] == VIEW && parameters[1] == USER_SESSION &&
        parameters[3].startsWith("L") && holdsString(method, ROW_TAP_TRACE)
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
