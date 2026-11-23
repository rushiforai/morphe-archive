package dev.materialtidal.patches.tidal.layout.mediapages

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val FADING_TOOLBAR_TYPE = "Lcom/aspiro/wamp/dynamicpages/ui/widget/FadingToolbar;"
private const val ALBUM_HEADER_STATE_TYPE = "Lcom/aspiro/wamp/dynamicpages/modules/albumheader/a;"
private const val ANIMATED_ALBUM_COVER_TYPE = "Lcom/aspiro/wamp/albumcover/view/animatedcover/AnimatedAlbumCoverView;"
private const val ICON_AND_TEXT_BUTTON_TYPE = "Lcom/aspiro/wamp/widgets/IconAndTextButton;"
private const val SECONDARY_ACTION_BUTTON_TYPE = "Lcom/aspiro/wamp/widgets/SecondaryActionButton;"
private const val DOWNLOAD_SECONDARY_BUTTON_TYPE = "Lcom/aspiro/wamp/widgets/DownloadSecondaryActionButton;"
private const val FAVORITE_TRACKS_FRAGMENT_TYPE =
    "Lcom/aspiro/wamp/mycollection/subpages/favoritetracks/FavoriteTracksFragment;"
private const val OFFLINE_TOGGLE_BUTTON_TYPE = "Lcom/aspiro/wamp/widgets/OfflineToggleButton;"
private const val MY_ALBUMS_VIEW_TYPE =
    "Lcom/aspiro/wamp/mycollection/subpages/albums/myalbums/MyAlbumsView;"
private const val MY_ARTISTS_VIEW_TYPE =
    "Lcom/aspiro/wamp/mycollection/subpages/artists/myartists/MyArtistsView;"

// ---- DynamicPage (Album, Artist, Contributor, Mix) Base Fragment ----

internal object DynamicPageOnViewCreatedFingerprint : Fingerprint(
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
    strings = listOf("_recycler_view_saved_state", "displayStateManager"),
)

internal object DynamicPageOnDestroyViewFingerprint : Fingerprint(
    name = "onDestroyView",
    parameters = emptyList(),
    returnType = "V",
    strings = listOf("_recycler_view_saved_state"),
)

// ---- FadingToolbar ----

internal object FadingToolbarInitFingerprint : Fingerprint(
    definingClass = FADING_TOOLBAR_TYPE,
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    returnType = "V",
)

internal object FadingToolbarSetAlphaFingerprint : Fingerprint(
    definingClass = FADING_TOOLBAR_TYPE,
    parameters = listOf("F"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setAlpha",
            parameters = listOf("F"),
        ),
        methodCall(
            definingClass = "Landroid/graphics/drawable/Drawable;",
            name = "setAlpha",
            parameters = listOf("I"),
        ),
    ),
)

// ---- Album & Artist Header Adapter Delegates ----

internal object AlbumHeaderDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"),
    returnType = "V",
    filters = listOf(
        checkCast(ALBUM_HEADER_STATE_TYPE),
        fieldAccess(type = ANIMATED_ALBUM_COVER_TYPE),
    ),
)

internal object ArtistHeaderDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"),
    returnType = "V",
    filters = listOf(
        fieldAccess(type = ICON_AND_TEXT_BUTTON_TYPE),
        fieldAccess(type = SECONDARY_ACTION_BUTTON_TYPE),
        methodCall(
            definingClass = SECONDARY_ACTION_BUTTON_TYPE,
            name = "setButtonActivated",
            parameters = listOf("Z"),
        ),
        fieldAccess(
            definingClass = "Lcom/aspiro/wamp/R\$dimen;",
            name = "module_header_playback_control_height",
        ),
    ),
    custom = { method, _ ->
        val insns = method.implementation?.instructions?.toList().orEmpty()
        var secondaryFields = 0
        var hasForbiddenType = false
        for (insn in insns) {
            val fieldRef = (insn as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            if (fieldRef.type == SECONDARY_ACTION_BUTTON_TYPE) {
                secondaryFields++
            } else if (fieldRef.type == ANIMATED_ALBUM_COVER_TYPE || fieldRef.type == DOWNLOAD_SECONDARY_BUTTON_TYPE) {
                hasForbiddenType = true
                break
            }
        }
        !hasForbiddenType && secondaryFields >= 4
    },
)

// ---- My Tracks (FavoriteTracksFragment) ----

internal object FavoriteTracksOnViewCreatedFingerprint : Fingerprint(
    definingClass = FAVORITE_TRACKS_FRAGMENT_TYPE,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

internal object FavoriteTracksOnDestroyViewFingerprint : Fingerprint(
    definingClass = FAVORITE_TRACKS_FRAGMENT_TYPE,
    name = "onDestroyView",
    parameters = emptyList(),
    returnType = "V",
)

internal object FavoriteTracksOnCreateOptionsMenuFingerprint : Fingerprint(
    definingClass = FAVORITE_TRACKS_FRAGMENT_TYPE,
    name = "onCreateOptionsMenu",
    parameters = listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;"),
    returnType = "V",
)

internal object FavoriteTracksUpdateMenuVisibilityFingerprint : Fingerprint(
    definingClass = FAVORITE_TRACKS_FRAGMENT_TYPE,
    parameters = listOf("Z"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/appcompat/widget/Toolbar;",
            name = "getMenu",
        ),
    ),
)

internal object FavoriteTracksShowHeaderFingerprint : Fingerprint(
    definingClass = FAVORITE_TRACKS_FRAGMENT_TYPE,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        checkCast("Landroidx/constraintlayout/widget/ConstraintLayout;"),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setVisibility",
            parameters = listOf("I"),
        ),
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            insn.opcode == Opcode.CONST_4 && (insn as? NarrowLiteralInstruction)?.narrowLiteral == 0
        } == true
    },
)

internal object FavoriteTracksSetOfflineCheckedFingerprint : Fingerprint(
    definingClass = FAVORITE_TRACKS_FRAGMENT_TYPE,
    parameters = listOf("Z"),
    returnType = "V",
    filters = listOf(
        checkCast(OFFLINE_TOGGLE_BUTTON_TYPE),
        methodCall(
            definingClass = "Landroidx/appcompat/widget/SwitchCompat;",
            name = "setChecked",
            parameters = listOf("Z"),
        ),
    ),
)

// ---- My Albums & My Artists Collection Pages ----

internal object MyAlbumsViewOnViewCreatedFingerprint : Fingerprint(
    definingClass = MY_ALBUMS_VIEW_TYPE,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

internal object MyArtistsViewOnViewCreatedFingerprint : Fingerprint(
    definingClass = MY_ARTISTS_VIEW_TYPE,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

// ---- Compose Profile / Artist Page v2 ----

private const val PROFILE_SCREEN_KT_TYPE = "Lcom/tidal/android/feature/profile/ui/v2/ProfileScreenKt;"
private const val PROFILE_HEADER_VIEW_KT_TYPE =
    "Lcom/tidal/android/feature/profile/ui/v2/composables/ProfileHeaderViewKt;"

internal object ProfileHeaderViewFingerprint : Fingerprint(
    definingClass = PROFILE_HEADER_VIEW_KT_TYPE,
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.profile.ui.v2.composables.ProfileHeaderView (ProfileHeaderView.kt:99)"),
    ),
)

internal object ProfileCircularActionFingerprint : Fingerprint(
    definingClass = PROFILE_HEADER_VIEW_KT_TYPE,
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.profile.ui.v2.composables.CircularAction (ProfileHeaderView.kt:729)"),
    ),
)

internal object ProfileScreenContentFingerprint : Fingerprint(
    definingClass = PROFILE_SCREEN_KT_TYPE,
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.profile.ui.v2.ProfileScreen (ProfileScreen.kt:96)"),
    ),
)

internal object ProfileTopBarFingerprint : Fingerprint(
    definingClass = PROFILE_SCREEN_KT_TYPE,
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.profile.ui.v2.ProfileTopBar (ProfileScreen.kt:230)"),
    ),
)

internal object ProfileTabsRowLambdaFingerprint : Fingerprint(
    name = "invoke",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("com.tidal.android.feature.profile.ui.v2.composables.ProfileTabsRow.<anonymous> (ProfileTabsRow.kt:42)"),
    ),
)

// ---- Compose Collection Screen (MyCollectionScreenKt) ----

private const val MY_COLLECTION_SCREEN_KT_TYPE =
    "Lcom/aspiro/wamp/mycollectionscreen/presentation/MyCollectionScreenKt;"

internal object MyCollectionItemsFingerprint : Fingerprint(
    definingClass = MY_COLLECTION_SCREEN_KT_TYPE,
    returnType = "V",
    filters = listOf(
        string("com.aspiro.wamp.mycollectionscreen.presentation.MyCollectionItems (MyCollectionScreen.kt:301)"),
    ),
)

internal object MyCollectionAppBarIconFingerprint : Fingerprint(
    definingClass = MY_COLLECTION_SCREEN_KT_TYPE,
    returnType = "V",
    filters = listOf(
        string("com.aspiro.wamp.mycollectionscreen.presentation.AppBarIcon (MyCollectionScreen.kt:499)"),
    ),
)
