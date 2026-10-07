package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Playlist/album header click targets (Anghami 8.0.28, verified in Anghami 8.0.28
 * `list_fragment/a`).
 *
 * The header already wires TWO separate buttons:
 * - `onPlayButtonClick()V` ("clicked play in header") ends in
 *   `c.playFromHeader(false, uuid, pageViewId)` — shuffle OFF.
 * - `onShuffleButtonClick()V` ("clicked on shuffle") ends in
 *   `_onShuffleButtonClick(uuid, pageViewId)`, and
 *   `_onShuffleButtonClick(String,String)` is a 4-instruction choke point
 *   that calls `c.playFromHeader(true, ...)` — shuffle ON.
 *
 * Only `_onShuffleButtonClick` is hooked: `onShuffleButtonClick` always
 * delegates to it, and the album presenter (`R4/t`) calls
 * `super._onShuffleButtonClick`, so one hook covers playlist + album +
 * every shuffle-button entry. (`onShuffleClicked()V` is an empty interface
 * stub — deliberately not hooked.)
 *
 * v0 is dead at index 0 in both methods (first instruction writes it), so a
 * `const/4 v0, ...` + `sput-boolean` prepend is register-safe.
 */

object PlayHeaderClickFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/a;",
    name = "onPlayButtonClick",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("clicked play in header"),
        methodCall(
            definingClass = "Lcom/anghami/app/base/list_fragment/c;",
            name = "playFromHeader",
        ),
    )
)

object ShuffleHeaderClickFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/a;",
    name = "_onShuffleButtonClick",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/app/base/list_fragment/c;",
            name = "playFromHeader",
        ),
    )
)

/**
 * Playlist header button builder (Anghami 8.0.28, verified in Anghami 8.0.28
 * `P5/b.v()Lepoxy/w`).
 *
 * Builds the full `PlaylistHeaderModel`: main from the server pref
 * (SHUFFLE for free accounts, else PLAY), secondary client-side (owned and
 * not smart -> EDIT, collab -> LEAVECOLLAB, local-songs -> ADD_MORE...,
 * nonFollowable -> null, followed -> FOLLOWED, else FOLLOW). The header
 * renders main + secondary (`setupButtons`); when secondary is null only a
 * standalone main shows. Single choke point for every playlist header.
 */

object PlaylistHeaderButtonsFingerprint : Fingerprint(
    definingClass = "LP5/b;",
    name = "v",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Lcom/airbnb/epoxy/w;",
    parameters = listOf(),
    filters = listOf(
        // NOTE: filter order must follow instruction order in the method:
        // the isPlaylistMine call (owned-flag computation) precedes the
        // local-songs const-string.
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/FollowedItems;",
            name = "isPlaylistMine",
        ),
        string("\$1234567890LOCALSONGS#"),
    )
)

/**
 * Offline-mixtape header builder (Anghami 8.0.28: `J5/a.v()Lepoxy/w`).
 * Main from the server pref (or null when never synced), secondary always
 * null (single standalone button).
 */

object MixtapeHeaderButtonsFingerprint : Fingerprint(
    definingClass = "LJ5/a;",
    name = "v",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Lcom/airbnb/epoxy/w;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
            name = "isOfflineMixtapeSyncedOnce",
        ),
    )
)

/**
 * Album secondary button (Anghami 8.0.28:
 * `AlbumHeaderModel.getSecondaryButtonType()`).
 *
 * Podcasts return SHOW_FOLLOW/SHOW_FOLLOWED (own branch, untouched);
 * everything else returns LIKED when liked, LIKE otherwise.
 */

object AlbumSecondaryButtonFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/AlbumHeaderModel;",
    name = "getSecondaryButtonType",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Lcom/anghami/model/adapter/headers/HeaderButtonType;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/model/adapter/headers/AlbumHeaderData;",
            name = "isLiked",
        ),
    )
)

/**
 * Album primary-button pref (Anghami 8.0.28:
 * `AlbumHeaderData.getHeaderButtonType()`, plain field getter, sole reader
 * is `AlbumHeaderModel.getMainButtonType`, which returns PLAY for podcasts
 * before consulting it).
 */
object AlbumPrefButtonTypeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/AlbumHeaderData;",
    name = "getHeaderButtonType",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Lcom/anghami/ghost/prefs/PreferenceHelper\$HeaderButtonType;",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/headers/AlbumHeaderData;->headerButtonType:Lcom/anghami/ghost/prefs/PreferenceHelper\$HeaderButtonType;"
        ),
    )
)

/**
 * Playlist secondary consumer (Anghami 8.0.28:
 * `PlaylistHeaderModel.getSecondaryButtonType()`, plain delegating getter).
 *
 * This is where a null secondary (nonFollowable playlists — `P5/b.v`
 * passes null through) is upgraded to SHUFFLE. It cannot be done at the
 * `P5/b.v` top const: that const also feeds the null-playlist early exit,
 * which must keep returning null. v0 is dead at index 0 (first instruction
 * writes it), so the null-check prepend is register-safe; the single label
 * lives at index 0, which is the one place inserted labels assemble
 * correctly.
 */
object PlaylistSecondaryButtonFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/PlaylistHeaderModel;",
    name = "getSecondaryButtonType",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Lcom/anghami/model/adapter/headers/HeaderButtonType;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/model/adapter/headers/PlaylistHeaderData;",
            name = "getSecondaryHeaderButtonType",
        ),
    )
)
