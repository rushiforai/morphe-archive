/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.requireStub
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.ui.calls
import app.morphe.patches.pinterest.ui.fields
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.methodsWithString
import app.morphe.patches.pinterest.ui.mutable
import app.morphe.patches.pinterest.ui.one
import app.morphe.patches.pinterest.ui.parameters
import app.morphe.patches.pinterest.ui.strings
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SAVED_PINS = "$EXTENSION_PACKAGE/ads/SavedPins;"
private const val HOME_MODEL = "Lcom/pinterest/feature/home/model/"
private const val DYNAMIC_FEED = "Lcom/pinterest/legacy/feeds/DynamicFeed;"
private const val HOME_POST_TEST = "android_hf_api_request_get_to_post"
private const val COMPRESSED_FIELDS = "compressed_fields"
private const val HOME_FIELD_SET = "DYNAMIC_GRID_FEED_WITH_BOARD_FIELDS"

/** Where Home's request has just read its field list, and the register the list is in. */
internal class HomeFields(val request: Method, val after: Int, val register: Int)

/**
 * Home's request names an enum of field sets and asks one static method for the list that set spells
 * out, once, before it picks how to send it. Null when the build has no such request. Throws when it
 * has one this can't read.
 */
internal fun BytecodePatchContext.homeFieldsOrNull(): HomeFields? {
    val requests = methodsWithString(HOME_POST_TEST).filter {
        it.definingClass.startsWith(HOME_MODEL) && COMPRESSED_FIELDS in it.strings()
    }
    if (requests.isEmpty()) return null
    val request = requests.one("Home's request")
    val set = request.fields().firstOrNull { it.name == HOME_FIELD_SET }?.type
        ?: throw PatchException("Home's request doesn't name $HOME_FIELD_SET")
    val body = request.instructions()
    val read = body.withIndex().filter { (_, instruction) ->
        val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_STATIC && called?.returnType == "Ljava/lang/String;" && called.parameters() == listOf(set)
    }.one("Home's field list").index
    val result = body.getOrNull(read + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction
        ?: throw PatchException("Home's field list isn't kept where it's read")
    return HomeFields(request, read + 2, result.registerA)
}

/** Both Filter feed and Download pins want this, and it goes in once either way. */
internal fun BytecodePatchContext.installHomeFields(fields: HomeFields) = with(fields) {
    val method = mutable(request)
    if (method.calls().any { it.definingClass == SAVED_PINS && it.name == "homeFields" }) return@with
    method.addInstructions(after, """
        invoke-static/range { v$register .. v$register }, $SAVED_PINS->homeFields(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$register
    """)
}

/** Where Home's callback has a page in hand as the feed's own type, and how to read the page's items. */
internal class HomePage(val callback: Method, val after: Int, val register: Int, val items: Method)

/** Null when the build has no such callback. Throws when it has one this can't read. */
internal fun BytecodePatchContext.homePageOrNull(): HomePage? {
    // A logging callback casts the page too, then drops it. The one that matters hands it back.
    fun casts(method: Method): List<IndexedValue<Instruction>> {
        val body = method.instructions()
        val returned = body.filter { it.opcode == Opcode.RETURN_OBJECT }.map { (it as OneRegisterInstruction).registerA }
        return body.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.CHECK_CAST && (instruction as ReferenceInstruction).reference.toString() == DYNAMIC_FEED &&
                (instruction as OneRegisterInstruction).registerA in returned
        }
    }
    // Other feeds' callbacks cast and return their page too. Home's hands the page to Home's own model
    // first. Up to 14.42.0 the callback sat in Home's model package; 14.43.0 merged it into a shared
    // lambda class elsewhere, so the call is the anchor, not the package.
    fun handsToHome(method: Method) = method.calls().any { call ->
        call.definingClass.startsWith(HOME_MODEL) && call.parameterTypes.any { it.toString() == DYNAMIC_FEED }
    }
    val callbacks = mutableListOf<Method>()
    classDefForEach { owner ->
        owner.methods.filterTo(callbacks) { it.name == "invoke" && it.implementation != null && casts(it).isNotEmpty() && handsToHome(it) }
    }
    if (callbacks.isEmpty()) return null
    val callback = callbacks.one("Home's page callback")
    val cast = casts(callback).one("Home's page in its callback")
    val page = classDefByOrNull(DYNAMIC_FEED) ?: throw PatchException("Home's page class isn't in the app")
    if (!AccessFlags.PUBLIC.isSet(page.accessFlags)) throw PatchException("Home's page class is private")
    val items = page.methods.filter { method ->
        method.returnType == "Ljava/util/List;" && method.parameterTypes.isEmpty() &&
            AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags)
    }.one("Home's page items")
    requireStub(SAVED_PINS, "pageItems")
    return HomePage(callback, cast.index + 1, (cast.value as OneRegisterInstruction).registerA, items)
}

internal fun BytecodePatchContext.installHomePage(page: HomePage) = with(page) {
    writeStub(SAVED_PINS, "pageItems", 2, """
        check-cast p0, $DYNAMIC_FEED
        invoke-virtual { p0 }, $items
        move-result-object v0
        return-object v0
    """)
    mutable(callback).addInstructions(after, "invoke-static/range { v$register .. v$register }, $SAVED_PINS->homePage(Ljava/lang/Object;)V")
}

private const val SEARCH_FIELD_SET = "SEARCH_PIN_FEED"
private const val RELATED_FIELD_SET = "RELATED_PIN_FIELDS"
private const val RELATED_FILTER = "Lcom/pinterest/feature/pin/closeup/datasource/RelatedModulesModelFilter;"
private const val LIST = "Ljava/util/List;"

/** One place a request has just asked for the list a field set spells out, and the register it keeps it in. */
internal class FieldListRead(val method: Method, val after: Int, val register: Int)

/**
 * Search's requests and the methods its results list takes each page in, and More to explore's
 * requests and the filter its list asks about each item it loads. Either half can be missing.
 */
internal class SavedElsewhere(
    val searchFields: List<FieldListRead>,
    val searchPages: List<Method>,
    val relatedFields: List<FieldListRead>,
    val relatedFilter: Method?,
) {
    val search get() = searchFields.isNotEmpty() && searchPages.isNotEmpty()
    val related get() = relatedFields.isNotEmpty() && relatedFilter != null
}

/**
 * Home's, search's and More to explore's requests each name a field set from one enum and ask one
 * static method for the list it spells out. Search's results list is the one class reading the
 * search set that takes each page as (List, boolean) and hands it on to its parent; More to explore's
 * list asks RelatedModulesModelFilter about each item. Throws when a part is there but can't be read.
 */
internal fun BytecodePatchContext.savedElsewhere(): SavedElsewhere {
    val none = SavedElsewhere(emptyList(), emptyList(), emptyList(), null)
    val sets = classDefByStrings(SEARCH_FIELD_SET).filter { owner ->
        owner.fields.any { AccessFlags.STATIC.isSet(it.accessFlags) && it.name == SEARCH_FIELD_SET && it.type == owner.type }
    }
    if (sets.isEmpty()) return none
    val set = sets.one("The request field sets").type
    val searchReaders = mutableListOf<Method>()
    val relatedReaders = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type == set) return@classDefForEach
        for (method in owner.methods) {
            if (method.implementation == null) continue
            val read = method.fields().filter { it.definingClass == set && it.type == set }.map { it.name }
            if (read.isEmpty() || fieldReads(method, set, setOf(SEARCH_FIELD_SET, RELATED_FIELD_SET)).isEmpty()) continue
            if (SEARCH_FIELD_SET in read) searchReaders += method
            if (RELATED_FIELD_SET in read) relatedReaders += method
        }
    }
    val searchOwners = searchReaders.map { it.definingClass }.distinct().mapNotNull { classDefByOrNull(it) }
        .filter { owner -> owner.methods.any(::takesPage) }
    val search = if (searchOwners.isEmpty()) null else searchOwners.one("Search's results list")
    val relatedFilter = classDefByOrNull(RELATED_FILTER)?.methods?.filter { method ->
        method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" &&
            method.parameterTypes.size == 1 && method.parameterTypes[0].toString() != "Ljava/lang/String;"
    }?.one("More to explore's item filter")
    return SavedElsewhere(
        searchReaders.filter { it.definingClass == search?.type }.flatMap { fieldReads(it, set, setOf(SEARCH_FIELD_SET)) },
        search?.methods?.filter(::takesPage).orEmpty(),
        relatedReaders.flatMap { fieldReads(it, set, setOf(RELATED_FIELD_SET)) },
        relatedFilter,
    )
}

/**
 * Each call in [method] asking for the list one of the [wanted] field sets of [set] spells out, where
 * its answer is kept. The set handed over is the one last read into the call's register, so search's
 * board and people requests, which ask the same method for their own sets, stay out.
 */
private fun fieldReads(method: Method, set: String, wanted: Set<String>): List<FieldListRead> {
    val body = method.instructions()
    return body.indices.mapNotNull { at ->
        val instruction = body[at]
        if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@mapNotNull null
        val called = (instruction as ReferenceInstruction).reference as? MethodReference ?: return@mapNotNull null
        if (called.returnType != "Ljava/lang/String;" || called.parameters() != listOf(set)) return@mapNotNull null
        val handed = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> return@mapNotNull null
        }
        val loaded = (at - 1 downTo 0).map { body[it] }.firstOrNull {
            it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == handed
        }
        val named = (loaded as? ReferenceInstruction)?.reference as? FieldReference
        if (loaded?.opcode != Opcode.SGET_OBJECT || named?.definingClass != set || named.name !in wanted) return@mapNotNull null
        val kept = body.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction
            ?: return@mapNotNull null
        FieldListRead(method, at + 2, kept.registerA)
    }
}

/** A results list's page method: (List, boolean), handing the page on to its parent's own. */
private fun takesPage(method: Method) = method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) &&
    method.returnType == "V" && method.parameterTypes.map(CharSequence::toString) == listOf(LIST, "Z") &&
    method.calls().any { it.name == method.name && it.parameters() == listOf(LIST, "Z") } &&
    method.instructions().any { it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE }

/**
 * Asks each request for the saved field, then hands each search page to the extension before the
 * list takes it, and lets the extension drop a saved pin before More to explore's filter judges it.
 * A half that wasn't found goes in not at all. Goes in once.
 */
internal fun BytecodePatchContext.installSavedElsewhere(found: SavedElsewhere, what: String) = with(found) {
    val reads = (if (search) searchFields else emptyList()) + (if (related) relatedFields else emptyList())
    reads.groupBy { it.method }.forEach { (method, sites) ->
        val target = mutable(method)
        if (target.calls().any { it.definingClass == SAVED_PINS && it.name == "elsewhereFields" }) return@forEach
        // From the last read back, so each read's place is still where it was found.
        sites.distinctBy { it.after }.sortedByDescending { it.after }.forEach { site ->
            target.addInstructions(site.after, """
                invoke-static/range { v${site.register} .. v${site.register} }, $SAVED_PINS->elsewhereFields(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v${site.register}
            """)
        }
    }
    if (search) searchPages.forEach { page ->
        val target = mutable(page)
        if (target.calls().any { it.definingClass == SAVED_PINS }) return@forEach
        target.addInstructions(0, """
            invoke-static/range { p1 .. p1 }, $SAVED_PINS->searchPage(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
    }
    val filter = relatedFilter
    if (related && filter != null) {
        val target = mutable(filter)
        if (target.calls().any { it.definingClass == SAVED_PINS }) return@with
        val answer = filter.freeLocalsAt(what, 0, 1).single()
        target.addInstructionsWithLabels(0, """
            invoke-static/range { p1 .. p1 }, $SAVED_PINS->dropRelated(Ljava/lang/Object;)Z
            move-result v$answer
            if-eqz v$answer, :hush_keep_related
            return v$answer
        """, ExternalLabel("hush_keep_related", target.getInstruction(0)))
    }
}
