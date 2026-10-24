/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.publishdate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.theme.declaredVersions
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions

private const val PATCH = "Always show publish date"
private const val GRID_SORT = "Lapp/morphe/extension/tiktok/feed/GridSort;"

/** The string only the profile and Liked grid's adapter logs under. */
private const val ADAPTER_TAG = "Profile_AwemeAdapter"

/** The grid adapter's cell builder, the one method in the app that logs under [ADAPTER_TAG]. */
internal object GridAdapterTagFingerprint : Fingerprint(
    strings = listOf(ADAPTER_TAG),
)

/**
 * The profile grid adapter's `setData(List)` (#180), which gives the adapter the list it keeps
 * and draws its cells from. The class is renamed on every build, so it is found by the log tag
 * its cell builder uses, and the method by TikTok's own unobfuscated name.
 */
internal object GridAdapterSetDataFingerprint : Fingerprint(
    classFingerprint = GridAdapterTagFingerprint,
    name = "setData",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

/** Its `setDataAfterLoadMore(List)`, which a new page of the grid goes through. */
internal object GridAdapterPageFingerprint : Fingerprint(
    classFingerprint = GridAdapterTagFingerprint,
    name = "setDataAfterLoadMore",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

/**
 * Sorts the grid's loaded videos while its switch is on (#180), and says whether the hooks went
 * in. Required on a declared build, where the anchors test holds it, and left out with a note on
 * any other, so a reworked adapter there doesn't take the publish date down with it. The
 * settings row shows only when the hooks went in. Takes the version so a test can stand in for a
 * build that isn't declared.
 */
internal fun BytecodePatchContext.hookGridSortOn(versionName: String): Boolean {
    if (!hookGridSort(versionName)) return false
    SettingsStatusLoadFingerprint.method.addInstruction(
        0,
        "invoke-static {}, " +
            "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableGridSort()V",
    )
    return true
}

/**
 * The two hooks alone, without the settings flag that shows the row, so a probe patch can run
 * them. Each puts the list through the extension at the method's first instruction, where nothing
 * jumps and `p1` is the list. The page hook also hands over the adapter, which the extension
 * refreshes once TikTok's call is done, since TikTok announces a page as cells added at the end.
 */
internal fun BytecodePatchContext.hookGridSort(versionName: String): Boolean {
    val declared = versionName in declaredVersions()
    val setData = if (declared) GridAdapterSetDataFingerprint.method else GridAdapterSetDataFingerprint.methodOrNull
    val page = if (declared) GridAdapterPageFingerprint.method else GridAdapterPageFingerprint.methodOrNull
    if (setData == null || page == null) {
        println("[$PATCH] Left out the grid sort on $versionName: no profile grid adapter found.")
        return false
    }
    if (setData.definingClass != page.definingClass) {
        println("[$PATCH] Left out the grid sort on $versionName: the two grid adapter methods are in different classes.")
        return false
    }
    setData.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $GRID_SORT->data(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """,
    )
    page.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $GRID_SORT->page(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """,
    )
    return true
}
