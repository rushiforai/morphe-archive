/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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

/** Display-only: vendor search requests and account history are unchanged. */
@Suppress("unused")
val hideSearchHistoryPatch = bytecodePatch(
    name = PATCH,
    description = "Hides your recent searches on the search screen of this phone. It doesn't delete your account's " +
        "search history. A second switch leaves only the search bar on the Search page. Starts off. Turn them on " +
        "in HushPinterest settings > Interface.",
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
        enableCapability("searchHistory")
        enableCapability("recentSearchRows")
        enableCapability("recentSearchHeading")
        enableStatus("hideSearchHistory")
    }
}
