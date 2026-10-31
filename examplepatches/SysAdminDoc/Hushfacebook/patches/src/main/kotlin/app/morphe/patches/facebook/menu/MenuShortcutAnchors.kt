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
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Where the Menu's shortcut rows read their list of bookmarks, on 582.
 *
 * The rows above See more (Feeds, Marketplace, Reels, Groups and Meta AI on a phone checked
 * 2026-10-15) are one Litho section, BookmarksFolderSection (582 `8x5`), which the PRODUCTS group's
 * section adds with the group's bookmarks. None of it passes through the group section hooks, and
 * the rows aren't drawn by the bookmark component the Muse card hook is in. The section's children
 * builder (582 `A2F`) reads the list from a field of its own as it starts, then splits off the rows
 * shown above See more; the rest open under See more.
 *
 * The class is a Redex name, so the builder is found by the "BookmarksFolderSection" tag it gives
 * its event handlers and the "see_more_test_key" its See more row carries, and the read by its
 * shape: the one `iget-object` of an ImmutableList field the section's own class declares.
 *
 * 585 (`LX/0BUA;->A0o` arm64) keeps only the reads in the section: it hands the context, the list
 * (`A0A`) and every other field to a singleton's method (`LX/0BUB;->A02`, 19 parameters, context
 * first), which holds both strings and the body. The section class still loads
 * "BookmarksFolderSection" itself, so its builder is the one-parameter method of a class loading it
 * that calls such a body, and the list is read there as before.
 */
internal const val FOLDER_SECTION = "BookmarksFolderSection"

/** The builder tags its See more row with this key. */
internal const val SEE_MORE_TEST_KEY = "see_more_test_key"

/** A section's children builder: an instance method of one parameter handing back an object. */
private fun isOneParameterBuilder(method: Method): Boolean =
    method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.size == 1 && method.returnType.startsWith("L")

/** The folder section's children builder: an instance method of one parameter handing back an object, loading both strings. */
internal fun isFolderSectionChildren(method: Method): Boolean =
    isOneParameterBuilder(method) && holdsString(method, FOLDER_SECTION) && holdsString(method, SEE_MORE_TEST_KEY)

/** 585's body of the folder section: an instance method taking an object first, handing one back and loading both strings. */
private fun isFolderSectionBody(method: Method): Boolean =
    method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.firstOrNull()?.startsWith("L") == true && method.returnType.startsWith("L") &&
        holdsString(method, FOLDER_SECTION) && holdsString(method, SEE_MORE_TEST_KEY)

private fun MethodReference.folderKey() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/**
 * The folder section's children builders among [holders], the classes loading [FOLDER_SECTION]:
 * those holding both strings ([isFolderSectionChildren]), or, when none does, as on 585, the
 * one-parameter builders calling a body that does.
 */
internal fun folderSectionBuilders(holders: List<ClassDef>): List<Method> {
    val direct = holders.flatMap { holder -> holder.methods.filter(::isFolderSectionChildren) }
    if (direct.isNotEmpty()) return direct
    val bodies = holders.flatMap { holder -> holder.methods.filter(::isFolderSectionBody) }.map { it.folderKey() }.toSet()
    if (bodies.isEmpty()) return emptyList()
    // 585's section hands its build to a singleton's method, so the builder is the one calling it.
    return holders.flatMap { holder ->
        holder.methods.filter { method ->
            isOneParameterBuilder(method) && method.implementation!!.instructions.any {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.folderKey() in bodies
            }
        }
    }
}

/** Where [method] reads its bookmark list: the `iget-object` at [index], into [register]. */
internal data class BookmarkListRead(val index: Int, val register: Int)

/** The one read in [method] of an ImmutableList field its own class declares, or null unless there's exactly one. */
internal fun bookmarkListRead(method: Method): BookmarkListRead? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val reads = code.indices.filter { index ->
        val field = (code[index] as? ReferenceInstruction)?.reference as? FieldReference
        code[index].opcode == Opcode.IGET_OBJECT && field != null &&
            field.definingClass == method.definingClass && field.type == IMMUTABLE_LIST
    }
    val read = reads.singleOrNull() ?: return null
    return BookmarkListRead(read, (code[read] as OneRegisterInstruction).registerA)
}
