/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Where the Upgrades and Also from Meta sections of Facebook's Menu come from, on the 577 and 580
 * builds.
 *
 * The Menu (the bookmarks screen, opened from the Menu tab or from the Profile tab's corner) is a
 * list of Litho sections under a root section. Every group below the shortcuts is typed by one
 * enum, kept under its own names: FEATURED, PROFILE, PRODUCTS, HELP, SETTINGS, LOGOUT,
 * PRODUCTS_FROM_FACEBOOK, COMMUNITY_RESOURCES, UPSELL and a dozen more. For each group the root
 * adds two sections. One is the native section Facebook draws itself, with the group's collapsible
 * header ("Upgrades, header. Section is expanded.", the "%1$s, header" string its header component
 * formats) and its rows. The other carries whatever the server sends to go above the group, in its
 * place or below it (positions ABOVE_NATIVE, REPLACE_NATIVE and BELOW_NATIVE). Upgrades is the
 * UPSELL group, whose builder tags its section `upsell_bookmark_section_test_key`, and Also from
 * Meta is PRODUCTS_FROM_FACEBOOK, tagged `products_from_facebook_test_key`. Their titles and cards
 * come from the server, so nothing in the app spells them out.
 *
 * The native section's children builder is the one method in either build that loads
 * `upsell_bookmarks_key`; it reads its group from its model through the one call in it that
 * answers the enum. The server section's children builder is the one that loads all three
 * positions, and it reads its group from a field of its own. Both hand back an empty list of
 * children on some paths of their own, which is what the hooks hand back for a hidden group. The
 * classes and every member are Redex names (the native section is `9KE` on 580 and `8o2` on 577),
 * so they're found by those strings and by the enum's kept names.
 */
internal const val PATCH = "Hide Menu promotions"

/** The native section's children builder tags the Upgrades group's list with this key. */
internal const val NATIVE_SECTION_KEY = "upsell_bookmarks_key"

/** Where the server's part of a group goes, loaded by its section's children builder. */
internal val SERVER_POSITIONS = listOf("ABOVE_NATIVE", "REPLACE_NATIVE", "BELOW_NATIVE")

/** The enum names of the two groups the patch hides. */
internal const val UPGRADES = "UPSELL"
internal const val ALSO_FROM_META = "PRODUCTS_FROM_FACEBOOK"

/**
 * Names the Menu's group enum carries. The two hidden groups, and the ones the Menu keeps, so an
 * enum that only happens to name the first two isn't taken for it.
 */
internal val SECTION_NAMES = listOf(UPGRADES, ALSO_FROM_META, "COMMUNITY_RESOURCES", "HELP", "SETTINGS", "LOGOUT")

/** The builder tags of the two groups' native sections, set where the root adds each group. */
internal const val UPGRADES_TEST_KEY = "upsell_bookmark_section_test_key"
internal const val ALSO_FROM_META_TEST_KEY = "products_from_facebook_test_key"

private fun Method.isInstanceWithBody(): Boolean =
    implementation != null && !AccessFlags.STATIC.isSet(accessFlags) && !AccessFlags.ABSTRACT.isSet(accessFlags)

/** A section's children builder: an instance method taking the section context and handing back an object. */
private fun isChildrenBuilder(method: Method): Boolean =
    method.isInstanceWithBody() && method.parameterTypes.size == 1 && method.returnType.startsWith("L")

/** The native group section's children builder: loads [NATIVE_SECTION_KEY]. */
internal fun isNativeSectionChildren(method: Method): Boolean =
    isChildrenBuilder(method) && holdsString(method, NATIVE_SECTION_KEY)

/** The server group section's children builder: loads each of [SERVER_POSITIONS]. */
internal fun isServerSectionChildren(method: Method): Boolean =
    isChildrenBuilder(method) && SERVER_POSITIONS.all { holdsString(method, it) }

/**
 * Where a method puts its section's group: the instruction that writes it, the register it goes to
 * and the group enum's type.
 */
internal data class GroupRead(val index: Int, val register: Int, val type: String)

private fun Method.instructionList(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

/**
 * The native section's group: the `move-result-object` after the one call in [method] that answers
 * a type [isGroupEnum] takes. Null unless there's exactly one such call and its answer is kept.
 */
internal fun nativeGroupRead(method: Method, isGroupEnum: (String) -> Boolean): GroupRead? {
    val instructions = method.instructionList()
    val calls = instructions.indices.filter { index ->
        val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[index].opcode.name.startsWith("invoke-") && call != null && isGroupEnum(call.returnType)
    }
    val call = calls.singleOrNull() ?: return null
    val result = instructions.getOrNull(call + 1) ?: return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val type = (((instructions[call] as ReferenceInstruction).reference) as MethodReference).returnType
    return GroupRead(call + 1, (result as OneRegisterInstruction).registerA, type)
}

/**
 * The server section's group: the one `iget-object` in [method] of a field its own class declares
 * with a type [isGroupEnum] takes. Null unless there's exactly one.
 */
internal fun serverGroupRead(method: Method, isGroupEnum: (String) -> Boolean): GroupRead? {
    val instructions = method.instructionList()
    val reads = instructions.indices.filter { index ->
        val field = (instructions[index] as? ReferenceInstruction)?.reference as? FieldReference
        instructions[index].opcode == Opcode.IGET_OBJECT && field != null &&
            field.definingClass == method.definingClass && isGroupEnum(field.type)
    }
    val read = reads.singleOrNull() ?: return null
    val field = (instructions[read] as ReferenceInstruction).reference as FieldReference
    return GroupRead(read, (instructions[read] as OneRegisterInstruction).registerA, field.type)
}

/**
 * The children list builder a section hands its children back through: the class [method] creates
 * with a no-argument constructor, and the field of that class, of [method]'s return type, it reads
 * the finished list from.
 */
internal data class ChildrenList(val builder: String, val children: String)

private val DIRECT_INVOKES = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)

/**
 * [method]'s [ChildrenList], or null unless exactly one field of a class it creates and
 * constructs with no arguments is read for its return type.
 */
internal fun childrenList(method: Method): ChildrenList? {
    val instructions = method.instructionList()
    val created = instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }
        .toSet()
    val constructed = instructions.filter { it.opcode in DIRECT_INVOKES }
        .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
        .filter { it.name == "<init>" && it.parameterTypes.isEmpty() && it.definingClass in created }
        .map { it.definingClass }
        .toSet()
    val fields = instructions.filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.definingClass in constructed && it.type == method.returnType }
        .map { "${it.definingClass}->${it.name}:${it.type}" }
        .toSet()
    val field = fields.singleOrNull() ?: return null
    return ChildrenList(field.substringBefore("->"), field)
}
