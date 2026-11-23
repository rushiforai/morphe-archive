package dev.materialtidal.patches.tidal.layout.search

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val UNIFIED_SEARCH_VIEW_TYPE = "Lcom/aspiro/wamp/search/v2/UnifiedSearchView;"
private const val TIDAL_SEARCH_VIEW_TYPE = "Lcom/aspiro/wamp/widgets/TidalSearchView;"
internal const val SEARCH_FILTER_MODEL_TYPE = "Lcom/aspiro/wamp/search/v2/model/SearchFilter;"
private const val SEARCH_HIGHLIGHT_TYPE = "Lcom/aspiro/wamp/searchmodule/SearchSuggestion\$Highlight;"

private fun ClassDef.referencesLayoutInMethod(methodName: String, layoutName: String): Boolean =
    methods.any { m ->
        m.name == methodName &&
            m.implementation?.instructions?.any { insn ->
                ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                    it.definingClass == "Lcom/aspiro/wamp/R\$layout;" && it.name == layoutName
                } == true
            } == true
    }

// ---- 1. Search / Explore Landing Page (DynamicPageFragment search bar subclass) ----

internal object SearchLandingOnViewCreatedFingerprint : Fingerprint(
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
    custom = { _, classDef ->
        classDef.referencesLayoutInMethod("<init>", "dynamic_page_fragment_searchbar")
    },
)

internal object SearchLandingOnDestroyViewFingerprint : Fingerprint(
    name = "onDestroyView",
    parameters = emptyList(),
    returnType = "V",
    custom = { _, classDef ->
        classDef.referencesLayoutInMethod("<init>", "dynamic_page_fragment_searchbar")
    },
)

// ---- 2. Active Search (Default Legacy XML: UnifiedSearchView) ----

internal object UnifiedSearchOnViewCreatedFingerprint : Fingerprint(
    definingClass = UNIFIED_SEARCH_VIEW_TYPE,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

internal object UnifiedSearchOnDestroyViewFingerprint : Fingerprint(
    definingClass = UNIFIED_SEARCH_VIEW_TYPE,
    name = "onDestroyView",
    parameters = emptyList(),
    returnType = "V",
)

internal object TidalSearchViewInitFingerprint : Fingerprint(
    definingClass = TIDAL_SEARCH_VIEW_TYPE,
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    returnType = "V",
)

internal object UnifiedSearchFilterBindFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        checkCast(SEARCH_FILTER_MODEL_TYPE),
        methodCall(definingClass = "Landroid/view/View;", name = "setOnClickListener"),
    ),
    custom = { method, classDef ->
        method.parameterTypes.size == 2 &&
            method.parameterTypes[1] == "Ljava/lang/Object;" &&
            classDef.referencesLayoutInMethod("onCreateViewHolder", "unified_search_filter_item")
    },
)

internal object UnifiedSearchSuggestionBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"),
    returnType = "V",
    filters = listOf(
        checkCast(SEARCH_HIGHLIGHT_TYPE),
    ),
    custom = { _, classDef ->
        classDef.referencesLayoutInMethod("<init>", "unified_search_suggestion_list_item")
    },
)

// ---- 3. Active Search (Refactored Compose Wave 2) ----

internal object ComposeSearchBarFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.search.ui.composables.SearchBar (SearchBar.kt:40)"),
    ),
)

internal object ComposeSearchBarDecorationBoxFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("com.tidal.android.feature.search.ui.composables.SearchBar.<anonymous> (SearchBar.kt:103)"),
    ),
)

internal object ComposeSearchFilterItemCellFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.search.ui.composables.items.FilterItemCell (SearchFilterListItem.kt:67)"),
    ),
)
