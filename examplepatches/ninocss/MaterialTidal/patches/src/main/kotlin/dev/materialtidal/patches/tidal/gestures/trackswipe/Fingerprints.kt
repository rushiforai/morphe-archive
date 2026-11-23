package dev.materialtidal.patches.tidal.gestures.trackswipe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val TRACK_TYPE = "Lcom/aspiro/wamp/model/Track;"
internal const val MEDIA_ITEM_TYPE = "Lcom/aspiro/wamp/model/MediaItem;"
internal const val SOURCE_TYPE = "Lcom/aspiro/wamp/playqueue/source/model/Source;"
internal const val NAVIGATION_INFO_TYPE = "Lcom/tidal/android/navigation/NavigationInfo;"
internal const val CONTEXTUAL_METADATA_TYPE = "Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;"
internal const val PLAYBACK_TITLE_VIEW_TYPE = "Lcom/tidal/android/resources/widget/PlaybackTitleTextView;"
internal const val VIEW_HOLDER_TYPE = "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"
internal const val TRACK_FAVORITES_MANAGER_TYPE = "Lcom/aspiro/wamp/module/track/TrackFavoritesManager;"

// ---- Action & DI Fingerprints ----

internal object AddToPlayQueueActionFingerprint : Fingerprint(
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            parameters = listOf(SOURCE_TYPE),
            returnType = "Z",
        ),
        methodCall(name = "isExplicitContentAllowed"),
        fieldAccess(
            definingClass = "Lcom/aspiro/wamp/R\$string;",
            name = "added_to_play_queue",
        ),
    ),
    custom = { _, classDef -> classDef.fields.any { it.type == TRACK_TYPE } },
)

internal object PlayQueueAddNextFingerprint : Fingerprint(
    parameters = listOf(SOURCE_TYPE),
    returnType = "V",
    filters = listOf(
        methodCall(
            name = "addAsFirstInActives",
            parameters = listOf(SOURCE_TYPE),
        ),
    ),
)

internal object PlayQueueAddLastFingerprint : Fingerprint(
    parameters = listOf(SOURCE_TYPE),
    returnType = "Z",
    filters = listOf(
        methodCall(
            name = "addAsLastInActives",
            parameters = listOf(SOURCE_TYPE),
        ),
    ),
)

internal object TrackFavoritesManagerAddFingerprint : Fingerprint(
    definingClass = TRACK_FAVORITES_MANAGER_TYPE,
    parameters = listOf(
        TRACK_TYPE,
        CONTEXTUAL_METADATA_TYPE,
        SOURCE_TYPE,
        NAVIGATION_INFO_TYPE,
        "L",
    ),
    returnType = "V",
)

internal object TrackFavoritesManagerProviderFingerprint : Fingerprint(
    parameters = emptyList(),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(
            definingClass = TRACK_FAVORITES_MANAGER_TYPE,
            name = "<init>",
        ),
    ),
)

internal object TrackFavoriteRepoRemoveFingerprint : Fingerprint(
    parameters = listOf(TRACK_TYPE),
    returnType = "Lrx/Observable;",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/aspiro/wamp/service/UserService\$UserRestClient;",
            name = "removeFavoriteTrack",
        ),
    ),
)

internal object ShowRemoveFromFavoritesDialogFingerprint : Fingerprint(
    parameters = listOf(
        "Landroidx/fragment/app/FragmentManager;",
        "Ljava/lang/Object;",
        CONTEXTUAL_METADATA_TYPE,
        NAVIGATION_INFO_TYPE,
    ),
    returnType = "V",
    filters = listOf(
        string("removeFromFavoritesDialog"),
        opcode(Opcode.NEW_INSTANCE),
    ),
)

internal object AddToPlaylistActionFingerprint : Fingerprint(
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/aspiro/wamp/model/MediaItemParent;",
            name = "<init>",
            parameters = listOf(MEDIA_ITEM_TYPE),
        ),
        methodCall(
            parameters = listOf(NAVIGATION_INFO_TYPE),
            returnType = "V",
        ),
    ),
    custom = { _, classDef -> classDef.fields.any { it.type == TRACK_TYPE } },
)

// ---- Track Row Binding & Mapping Fingerprints ----

internal object MediaItemViewHolderBindFingerprint : Fingerprint(
    parameters = listOf(MEDIA_ITEM_TYPE),
    returnType = "V",
    filters = listOf(
        fieldAccess(
            definingClass = "this",
            opcode = Opcode.IPUT_OBJECT,
            type = MEDIA_ITEM_TYPE,
        ),
        fieldAccess(type = PLAYBACK_TITLE_VIEW_TYPE),
        methodCall(
            definingClass = MEDIA_ITEM_TYPE,
            name = "getDisplayTitle",
        ),
    ),
    custom = { _, classDef ->
        classDef.fields.any { it.type == "Lcom/aspiro/wamp/model/Availability\$MediaItem;" }
    },
)

internal object PlaylistTrackDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", VIEW_HOLDER_TYPE),
    returnType = "V",
    filters = listOf(
        checkCast("Lcom/aspiro/wamp/playlist/viewmodel/item/TrackViewModel;"),
        methodCall(
            definingClass = "Lcom/aspiro/wamp/playlist/viewmodel/item/TrackViewModel;",
            name = "getShouldHideItem",
        ),
    ),
)

internal object SuggestedTrackDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", VIEW_HOLDER_TYPE),
    returnType = "V",
    filters = listOf(
        checkCast("Lcom/aspiro/wamp/playlist/viewmodel/item/SuggestedTrackViewModel;"),
        methodCall(
            definingClass = "Lcom/aspiro/wamp/playlist/viewmodel/item/SuggestedTrackViewModel;",
            name = "getTrack",
        ),
    ),
)

internal object SearchTrackDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", VIEW_HOLDER_TYPE),
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = TRACK_TYPE,
        ),
        methodCall(
            definingClass = MEDIA_ITEM_TYPE,
            name = "getAlbum",
        ),
        fieldAccess(type = PLAYBACK_TITLE_VIEW_TYPE),
    ),
)

internal object AlbumItemMapFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/dynamicpages/modules/albumitemcollection/",
    parameters = listOf(
        MEDIA_ITEM_TYPE,
        "Lcom/aspiro/wamp/dynamicpages/data/model/collection/AlbumItemCollectionModule;",
    ),
    filters = listOf(
        methodCall(
            definingClass = TRACK_TYPE,
            name = "isPayToStream",
        ),
        newInstance("Lcom/aspiro/wamp/dynamicpages/modules/albumitemcollection/a\$a;"),
        methodCall(
            definingClass = "Lcom/aspiro/wamp/dynamicpages/modules/albumitemcollection/a\$a;",
            name = "<init>",
        ),
    ),
)

internal object AlbumTrackDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", VIEW_HOLDER_TYPE),
    returnType = "V",
    filters = listOf(
        checkCast("Lcom/aspiro/wamp/dynamicpages/modules/albumitemcollection/a\$a;"),
        fieldAccess(type = PLAYBACK_TITLE_VIEW_TYPE),
    ),
)

internal object DynamicTrackItemMapFingerprint : Fingerprint(
    parameters = listOf("Lcom/aspiro/wamp/dynamicpages/data/model/collection/TrackCollectionModule;"),
    filters = listOf(
        checkCast(TRACK_TYPE),
        methodCall(
            definingClass = TRACK_TYPE,
            name = "isDolbyAtmos",
        ),
        methodCall(
            definingClass = TRACK_TYPE,
            name = "isSpotlighted",
        ),
        opcode(Opcode.NEW_INSTANCE),
        methodCall(
            name = "<init>",
            parameters = listOf("L", "J", "L"),
        ),
    ),
)

internal object DynamicMediaItemDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", VIEW_HOLDER_TYPE),
    returnType = "V",
    filters = listOf(
        methodCall(
            parameters = emptyList(),
            location = InstructionLocation.MatchAfterWithin(4),
        ),
        methodCall(
            parameters = emptyList(),
            returnType = "Lcom/aspiro/wamp/model/Availability;",
            location = InstructionLocation.MatchAfterWithin(18),
        ),
        fieldAccess(
            type = PLAYBACK_TITLE_VIEW_TYPE,
            location = InstructionLocation.MatchBeforeAnywhere(),
        ),
        methodCall(name = "setOnCreateContextMenuListener"),
    ),
)

internal object AdapterItemCloneFingerprint : Fingerprint(
    parameters = listOf("Lcom/tidal/android/core/adapterdelegate/b;"),
    returnType = "Lcom/tidal/android/core/adapterdelegate/b;",
    filters = listOf(
        checkCast("Lcom/aspiro/wamp/dynamicpages/modules/albumitemcollection/a\$a;"),
        methodCall(
            definingClass = "Lcom/aspiro/wamp/model/AvailabilityInteractor;",
            name = "getMediaItemAvailability\$default",
        ),
    ),
)
