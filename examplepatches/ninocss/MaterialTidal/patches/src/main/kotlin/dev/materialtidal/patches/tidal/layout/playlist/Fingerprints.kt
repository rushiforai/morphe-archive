package dev.materialtidal.patches.tidal.layout.playlist

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall

private const val PLAYLIST_FRAGMENT_TYPE = "Lcom/aspiro/wamp/playlist/ui/fragment/PlaylistFragment;"
private const val PLAYLIST_PRESENTER_TYPE = "Lcom/aspiro/wamp/playlist/ui/fragment/PlaylistPresenter;"
private const val ICON_AND_TEXT_BUTTON_TYPE = "Lcom/aspiro/wamp/widgets/IconAndTextButton;"
private const val SECONDARY_ACTION_BUTTON_TYPE = "Lcom/aspiro/wamp/widgets/SecondaryActionButton;"
private const val DOWNLOAD_SECONDARY_BUTTON_TYPE = "Lcom/aspiro/wamp/widgets/DownloadSecondaryActionButton;"
private const val TRACK_VIEW_MODEL_TYPE = "Lcom/aspiro/wamp/playlist/viewmodel/item/TrackViewModel;"

internal object PlaylistFragmentOnViewCreatedFingerprint : Fingerprint(
    definingClass = PLAYLIST_FRAGMENT_TYPE,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

internal object PlaylistFragmentOnDestroyViewFingerprint : Fingerprint(
    definingClass = PLAYLIST_FRAGMENT_TYPE,
    name = "onDestroyView",
    parameters = emptyList(),
    returnType = "V",
)

internal object PlaylistFragmentOnCreateOptionsMenuFingerprint : Fingerprint(
    definingClass = PLAYLIST_FRAGMENT_TYPE,
    name = "onCreateOptionsMenu",
    parameters = listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;"),
    returnType = "V",
)

internal object PlaylistFragmentUpdateButtonsFingerprint : Fingerprint(
    definingClass = PLAYLIST_FRAGMENT_TYPE,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = ICON_AND_TEXT_BUTTON_TYPE,
            name = "setUseLightTheme",
        ),
    ),
)

internal object PlaylistFragmentDisablePlayButtonsFingerprint : Fingerprint(
    definingClass = PLAYLIST_FRAGMENT_TYPE,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        fieldAccess(type = ICON_AND_TEXT_BUTTON_TYPE),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setEnabled",
            parameters = listOf("Z"),
        ),
    ),
)

internal object PlaylistFragmentDisableEditButtonFingerprint : Fingerprint(
    definingClass = PLAYLIST_FRAGMENT_TYPE,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = SECONDARY_ACTION_BUTTON_TYPE,
            name = "setEnabled",
            parameters = listOf("Z"),
        ),
    ),
)

internal object PlaylistFragmentUpdateCreatorsFingerprint : Fingerprint(
    definingClass = PLAYLIST_FRAGMENT_TYPE,
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/widget/TextView;",
            name = "setCompoundDrawableTintList",
        ),
    ),
)

internal object PlaylistFragmentShowEmptyFingerprint : Fingerprint(
    definingClass = PLAYLIST_FRAGMENT_TYPE,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        fieldAccess(type = "Landroid/widget/TextView;"),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setVisibility",
        ),
    ),
    custom = { method, _ ->
        val count = method.implementation?.instructions?.count() ?: 999
        count <= 10
    },
)

internal object PlaylistPresenterLoadArtworkFingerprint : Fingerprint(
    definingClass = PLAYLIST_PRESENTER_TYPE,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/aspiro/wamp/model/Playlist;",
            name = "getCustomImageUrl",
        ),
    ),
)

internal object PlaylistPresenterUpdateHeaderFingerprint : Fingerprint(
    definingClass = PLAYLIST_PRESENTER_TYPE,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/appcompat/widget/Toolbar;",
            name = "setTitle",
        ),
    ),
)

internal object PlaylistOffsetChangedFingerprint : Fingerprint(
    name = "onOffsetChanged",
    parameters = listOf("Lcom/google/android/material/appbar/AppBarLayout;", "I"),
    returnType = "V",
    filters = listOf(
        checkCast("Lcom/aspiro/wamp/playlist/ui/fragment/PlaylistFragment\$a;"),
    ),
)

internal object SecondaryActionButtonRefreshFingerprint : Fingerprint(
    definingClass = SECONDARY_ACTION_BUTTON_TYPE,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = SECONDARY_ACTION_BUTTON_TYPE,
            name = "setIconResource",
        ),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setSelected",
        ),
    ),
)

internal object DownloadSecondaryActionButtonPaintFingerprint : Fingerprint(
    definingClass = DOWNLOAD_SECONDARY_BUTTON_TYPE,
    returnType = "Landroid/graphics/Paint;",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/graphics/Paint;",
            name = "setColor",
        ),
    ),
)

internal object DownloadSecondaryActionButtonOnDrawFingerprint : Fingerprint(
    definingClass = DOWNLOAD_SECONDARY_BUTTON_TYPE,
    name = "onDraw",
    parameters = listOf("Landroid/graphics/Canvas;"),
    returnType = "V",
)

internal object DownloadSecondaryActionButtonSetPercentageFingerprint : Fingerprint(
    definingClass = DOWNLOAD_SECONDARY_BUTTON_TYPE,
    name = "setDownloadedPercentage",
    parameters = listOf("Ljava/lang/Integer;"),
    returnType = "V",
)

internal object DownloadSecondaryActionButtonSetDownloadingFingerprint : Fingerprint(
    definingClass = DOWNLOAD_SECONDARY_BUTTON_TYPE,
    name = "setDownloading",
    parameters = listOf("Z"),
    returnType = "V",
)

internal object PlaylistTrackRowBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"),
    returnType = "V",
    filters = listOf(
        checkCast(TRACK_VIEW_MODEL_TYPE),
        methodCall(
            definingClass = TRACK_VIEW_MODEL_TYPE,
            name = "getShouldHideItem",
        ),
    ),
)
