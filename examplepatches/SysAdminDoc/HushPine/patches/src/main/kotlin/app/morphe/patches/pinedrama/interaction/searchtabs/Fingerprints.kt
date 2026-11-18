/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.searchtabs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags

private const val SEARCH_TAB_COMMON_CONFIG =
    "Lcom/ss/android/ugc/aweme/search/pages/result/verticalsearch/dynamictab/tabconfig/SearchTabCommonConfig;"

/**
 * The one place a search result tab gets its title. The name in a server driven tab's config is
 * read nowhere else, and this method hands it back without looking at it.
 */
internal object SearchTabTitleFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/CharSequence;",
    parameters = listOf("I", "Landroid/content/Context;"),
    filters = listOf(fieldAccess(definingClass = SEARCH_TAB_COMMON_CONFIG, name = "tabName")),
)

/** The Home screen's Drama tab label, translated and following the app's own naming tests. */
internal object DramaTabLabelFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/series/feed/tab/SeriesHomeTabProtocol;",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
)
