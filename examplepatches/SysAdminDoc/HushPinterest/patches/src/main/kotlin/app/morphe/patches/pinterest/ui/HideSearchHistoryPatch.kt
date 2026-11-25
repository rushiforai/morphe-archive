/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide search history"

/**
 * The row of the screen tapping the search bar opens. Pinterest draws a recent search and a
 * suggestion for typed text with the same row. Obfuscation leaves its name alone.
 */
internal const val TYPEAHEAD_ROW = "Lcom/pinterest/feature/search/typeahead/view/SearchTypeaheadTextCell;"

/** The recent-search pill, which shares the typing-screen row's interface for recent searches. */
internal const val RECENT_SEARCH_PILL = "Lcom/pinterest/feature/search/typeahead/view/SearchTypeaheadRecentSearchPillView;"

internal const val RECENT_ROW_HOOK = "$UI_HOOKS->recentSearchRow(Landroid/view/View;Z)V"
internal const val RECENT_ROW_MEASURE_HOOK = "$UI_HOOKS->recentSearchRowMeasureSpec(Landroid/view/View;I)I"

internal const val SEARCH_LANDING_ID = "search_landing_recycler_container"
internal const val SEARCH_LANDING_HOOK = "$INTERFACE_CONTROLS->searchLanding(Landroid/view/View;)V"

internal val RECENT_ROW_BIND = listOf("Ljava/lang/String;", "Z")

internal class RecentSearchRows(val row: MutableClass, val bind: MutableMethod)

/**
 * The typing-screen row and its (String, boolean) bind, found and checked before anything changes.
 * Pinterest calls that bind every time it binds the row, with the row's text and whether the row
 * gets a clear button, which only a recent search gets. It's the one method of that shape the row's
 * interfaces shared with the recent-search pill declare. Pinterest adds the row straight to a
 * RecyclerView, which lays out a GONE child at its measured size, so hiding it takes a zero
 * measure as well. 14.40.0 gives the row no onMeasure of its own.
 */
internal fun BytecodePatchContext.recentSearchRows(): RecentSearchRows {
    if (classDefByOrNull(TYPEAHEAD_ROW) == null) throw PatchException("$PATCH: no typing-screen row $TYPEAHEAD_ROW")
    val pill = classDefByOrNull(RECENT_SEARCH_PILL) ?: throw PatchException("$PATCH: no recent-search pill $RECENT_SEARCH_PILL")
    val row = mutableClassDefBy(TYPEAHEAD_ROW)
    val declared = row.interfaces.filter { it in pill.interfaces }.mapNotNull { classDefByOrNull(it) }
        .filter { AccessFlags.INTERFACE.isSet(it.accessFlags) }
        .flatMap { face ->
            face.methods.filter {
                AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.returnType == "V" && it.parameters() == RECENT_ROW_BIND
            }
        }.one("$PATCH: recent search bind on the row's interface")
    val bind = row.methods.filter {
        it.name == declared.name && it.returnType == "V" && it.parameters() == RECENT_ROW_BIND &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    }.one("$PATCH: the row's recent search bind")
    if (!isFrameworkView(row)) throw PatchException("$PATCH: the typing-screen row ${row.type} is not an Android view")
    requireOverride(row, "onMeasure", listOf("I", "I"))
    if (row.methods.any { it.name == "onMeasure" && it.parameters() == listOf("I", "I") }) {
        throw PatchException("$PATCH: the typing-screen row ${row.type} measures itself, so its own onMeasure would need a different hook")
    }
    return RecentSearchRows(row, bind)
}

/** The search page's recent-search cell, which keeps its name through obfuscation. */
internal val RECENT_SEARCH_CELL = SEARCH_HISTORY_VIEWS.single { it.endsWith("/SlpRecentSearchCell;") }

/** Pinterest's text view, which the Recent searches block holds its heading in. */
internal const val GESTALT_TEXT = "Lcom/pinterest/gestalt/text/GestaltText;"

/**
 * The search page's Recent searches block, the view holding the heading and the recent-search
 * cells under it, found and checked before anything changes. Obfuscation renames it every build.
 * The one method that builds those cells keeps them in a list on the block, so the block is the
 * Android view whose ArrayList that method reads, and it has to hold the heading text, or it could be
 * some wider view that happens to keep a list. Folding only the cells leaves the heading alone
 * on the page. Pinterest adds the block straight to a RecyclerView, so it folds by measure like the
 * cells do. 14.40.0 gives it no onMeasure of its own.
 */
internal fun BytecodePatchContext.recentSearchBlock(): MutableClass {
    if (classDefByOrNull(RECENT_SEARCH_CELL) == null) throw PatchException("$PATCH: no recent-search cell $RECENT_SEARCH_CELL")
    val builders = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT) || owner.type == RECENT_SEARCH_CELL) return@classDefForEach
        owner.methods.filterTo(builders) { method ->
            method.instructions().any {
                it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == RECENT_SEARCH_CELL
            }
        }
    }
    val builder = builders.one("$PATCH: the method that builds recent-search cells")
    val type = builder.fields().filter { it.type == "Ljava/util/ArrayList;" }.map { it.definingClass }.distinct()
        .filter { owner -> classDefByOrNull(owner)?.let { isFrameworkView(it) } == true }
        .one("$PATCH: the recent searches block whose cell list the builder reads")
    if (type in SEARCH_HISTORY_VIEWS) throw PatchException("$PATCH: the recent searches block $type is already a folded view")
    val block = mutableClassDefBy(type)
    if (block.fields.none { it.type == GESTALT_TEXT && !AccessFlags.STATIC.isSet(it.accessFlags) }) {
        throw PatchException("$PATCH: the recent searches block $type holds no heading text, so it may be a wider view")
    }
    requireOverride(block, "setVisibility", listOf("I"))
    requireOverride(block, "onMeasure", listOf("I", "I"))
    if (block.methods.any { it.name == "onMeasure" && it.parameters() == listOf("I", "I") }) {
        throw PatchException("$PATCH: the recent searches block ${block.type} measures itself, so its own onMeasure would need a different hook")
    }
    return block
}

/**
 * The Search tab's page, the one fragment that reads the id of the landing list. It gets its root
 * view first thing in onViewCreated, which goes on to reuse both parameter registers.
 */
private fun BytecodePatchContext.blankSearchPage() {
    val pages = mutableListOf<String>()
    classDefForEach { owner ->
        if (owner.methods.any { method -> method.fields().any { it.name == SEARCH_LANDING_ID && it.type == "I" } }) {
            pages += owner.type
        }
    }
    val created = mutableClassDefBy(pages.distinct().one("The Search page")).methods.filter {
        it.name == "onViewCreated" && it.returnType == "V" &&
            it.parameters() == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
    }.one("The Search page's onViewCreated")
    created.addInstructions(0, "invoke-static/range { p1 .. p1 }, $SEARCH_LANDING_HOOK")
    enableCapability("searchLanding")
}

/** The JSON key Pinterest reads the row under the search bar from. */
internal const val ONE_BAR_MODULES = "one_bar_modules"

internal const val SEARCH_SUGGESTION_HOOK = "$EXTENSION_PACKAGE/ui/SearchSuggestions;->drop(Ljava/lang/Object;)Z"

/** Where the row's parser takes each module: the hook goes in at [index] on [module], and a yes goes back to [next]. */
internal class SuggestionSite(val method: Method, val index: Int, val module: Int, val next: Int)

/**
 * The parser of the row under the search bar (#48): the one static `(X)ArrayList` every reader of
 * [ONE_BAR_MODULES] calls next. It walks the modules with an iterator and casts each to Pinterest's
 * JSON object before reading it into its model, so the hook goes right after that cast and a yes
 * goes back to the iterator's hasNext, the way the loop's own goto does.
 */
internal fun BytecodePatchContext.searchSuggestionSite(): SuggestionSite {
    val parsers = mutableSetOf<String>()
    classDefForEach { owner ->
        for (method in owner.methods) {
            val body = method.instructions()
            body.indices.filter { body[it].loadsString(ONE_BAR_MODULES) }.forEach { at ->
                val parse = body.drop(at + 1).firstOrNull { instruction ->
                    val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                        called?.returnType == "Ljava/util/ArrayList;" && called.parameterTypes.size == 1
                }
                if (parse != null) parsers += ((parse as ReferenceInstruction).reference as MethodReference).toString()
            }
        }
    }
    val parser = parsers.toList().one("$PATCH: the parser of the row under the search bar")
    val owner = parser.substringBefore("->")
    val method = (classDefByOrNull(owner) ?: throw PatchException("$PATCH: $owner is missing")).methods
        .filter { it.toString() == parser }.one("$PATCH: $parser")
    val body = method.instructions()
    val next = body.indices.filter { at ->
        body[at].opcode == Opcode.INVOKE_INTERFACE &&
            (body[at] as ReferenceInstruction).reference.toString() == "Ljava/util/Iterator;->next()Ljava/lang/Object;"
    }.one("$PATCH: the row parser's next module")
    val taken = body.getOrNull(next + 1)
    val cast = body.getOrNull(next + 2)
    if (taken?.opcode != Opcode.MOVE_RESULT_OBJECT || cast?.opcode != Opcode.CHECK_CAST ||
        (cast as OneRegisterInstruction).registerA != (taken as OneRegisterInstruction).registerA
    ) {
        throw PatchException("$PATCH: the row parser no longer casts each module right after taking it")
    }
    val hasNext = body.indices.filter { at ->
        body[at].opcode == Opcode.INVOKE_INTERFACE &&
            (body[at] as ReferenceInstruction).reference.toString() == "Ljava/util/Iterator;->hasNext()Z"
    }.one("$PATCH: the row parser's loop")
    if (hasNext > next) throw PatchException("$PATCH: the row parser's loop doesn't start at hasNext")
    return SuggestionSite(method, next + 3, (taken as OneRegisterInstruction).registerA, hasNext)
}

internal fun BytecodePatchContext.hideSearchSuggestions() {
    val site = searchSuggestionSite()
    val answer = site.method.freeLocalsAt("$PATCH: the row parser", site.index, 1, highest = 255).single()
    val method = mutable(site.method)
    val m = site.module
    method.addInstructionsWithLabels(site.index, """
        invoke-static/range { v$m .. v$m }, $SEARCH_SUGGESTION_HOOK
        move-result v$answer
        if-nez v$answer, :hush_next_module
    """, ExternalLabel("hush_next_module", method.getInstruction(site.next)))
    enableCapability("searchSuggestions")
}

private fun Instruction.loadsString(text: String) =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        ((this as ReferenceInstruction).reference as? StringReference)?.string == text

/** Display-only: vendor search requests and account history are unchanged. */
@Suppress("unused")
val hideSearchHistoryPatch = bytecodePatch(
    name = PATCH,
    description = "Hides your recent searches on the search screen of this phone. It doesn't delete your account's " +
        "search history. A second switch leaves only the search bar on the Search page, and a third hides the " +
        "colored suggested searches under the search bar on search results. All start off. Turn them on in " +
        "HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideSearchHistory")
        requireStatusMethod("searchHistory")
        requireStatusMethod("recentSearchRows")
        requireStatusMethod("recentSearchHeading")
        requireStatusMethod("searchLanding")
        requireStatusMethod("searchSuggestions")
        val views = SEARCH_HISTORY_VIEWS.map { mutableClassDefBy(it) }
        views.forEach { view ->
            requireOverride(view, "setVisibility", listOf("I"))
            requireOverride(view, "onMeasure", listOf("I", "I"))
        }
        val rows = recentSearchRows()
        val block = recentSearchBlock()
        (views + block).forEach { collapseView(it, "searchHistory") }
        rows.bind.addInstructions(0, "invoke-static { p0, p2 }, $RECENT_ROW_HOOK")
        addOverride(rows.row, "onMeasure", listOf("I", "I"), """
            invoke-static { p0, p1 }, $RECENT_ROW_MEASURE_HOOK
            move-result p1
            invoke-static { p0, p2 }, $RECENT_ROW_MEASURE_HOOK
            move-result p2
        """)
        optionalTarget(PATCH, "Blank Search page") { blankSearchPage() }
        optionalTarget(PATCH, "Hide suggested searches") { hideSearchSuggestions() }
        enableCapability("searchHistory")
        enableCapability("recentSearchRows")
        enableCapability("recentSearchHeading")
        enableStatus("hideSearchHistory")
    }
}
