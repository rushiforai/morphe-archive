package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Targets for the LRCLIB lyrics fallback (Anghami 8.0.28, versionCode 8000280).
 *
 * Details:
 * - `LA7/F;->onNext(Ljava/lang/Object;)V` is the GETlyrics.view API callback:
 *   logs "LyricsHelper:  loadAsync() onNext called with response not null",
 *   then calls `LA7/E;->b(song, response, false, callback)` (renders teaser
 *   when truncated) and `LA5/A;->d(response)` (saveLyrics, refuses truncated).
 * - `LA7/E;->b` logs "LyricsHelper:  onLyricsLoadSuccess() called for songId: ".
 * - `com.anghami.ui.view.A` extends FrameLayout and implements the `A7/E$a`
 *   render callback, so the callback object doubles as the long-press anchor.
 *
 * No accessFlags anywhere (exact-int match lesson, REPORT 10.5): class +
 * name + signature + content filters already pin each method.
 */
object LyricsApiOnNextFingerprint : Fingerprint(
    definingClass = "LA7/F;",
    name = "onNext",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("LyricsHelper:  loadAsync() onNext called with response not null"),
        methodCall(
            definingClass = "LA7/E;",
            name = "b",
        ),
    )
)

object LyricsSuccessFingerprint : Fingerprint(
    definingClass = "LA7/E;",
    name = "b",
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/ghost/pojo/Song;",
        "Lcom/anghami/ghost/api/response/LyricsResponse;",
        "Z",
        "LA7/E\$a;",
    ),
    filters = listOf(
        string("LyricsHelper:  onLyricsLoadSuccess() called for songId: "),
    )
)

/**
 * `com.anghami.ui.view.A.h(Z)`: the lyrics-view load entry. With
 * `update=true` it goes straight to the API (`i()`); otherwise it first
 * tries the native StoredLyrics DB (`A7/D`) and falls back to the API on
 * miss (`c()` -> `i()`). Anchor for the instant-cached-paint insert at
 * entry — a miss is a no-op and native proceeds untouched. No
 * accessFlags (class + name + signature + content pin it).
 */
object LyricsViewLoadFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/view/A;",
    name = "h",
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        string("loadLyrics: update = "),
        string("loadLyricsListForSong() called with: song = "),
    )
)

/**
 * `PlayerFragment.W0(Song)`: the per-song lyrics-button gate. Renders the
 * button enabled (alpha 1.0) only when `Song.hasLyrics` is true and automix
 * is off; otherwise alpha 0.3 + `setEnabled(false)` on the button and its
 * container. Anchor for the hasLyrics force-insert at entry — the native
 * branch then enables the button itself. No accessFlags (class + name +
 * signature + content pin it).
 */
object LyricsButtonGateFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/l;",
    name = "W0",
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/pojo/Song;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/Song;->hasLyrics:Z"
        ),
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueueManager;",
            name = "isAutoMix",
        ),
    )
)

/**
 * `A7/F.onError`: the GETlyrics.view failure path (song has nothing usable
 * on the server). Trampoline calls `maybeFetchNoResponse`, so these songs
 * enter the same placeholder -> waterfall -> manual-picker flow.
 */
object LyricsApiOnErrorFingerprint : Fingerprint(
    definingClass = "LA7/F;",
    name = "onError",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;"),
    filters = listOf(
        string("LyricsHelper:  loadAsync() onError called with null response"),
    )
)

/**
 * `PlayerFragment.a1(mode, ...)`: the player-mode observer. Reads the
 * current song via `I0()` and reverts lyrics mode when `!Song.hasLyrics`
 * (podcasts always revert). Anchor for the hasLyrics force-insert right
 * after the `I0()` move-result — the podcast guard is untouched and no
 * branches are nopped.
 */
object LyricsModeRevertFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/l;",
    name = "a1",
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/player/ui/PlayerFragmentViewModel\$c;",
        "Z",
    ),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/pojo/Song;->hasLyrics:Z"
        ),
        methodCall(
            definingClass = "Lcom/anghami/player/ui/PlayerFragmentViewModel;",
            name = "getLastBoundSongId",
        ),
    )
)

/**
 * `PlayerFragment.l$c.onLongClick(View)`: the play/pause button's native
 * long-press — shows the sleep-timer bottom sheet (`L6/b.h0`, the
 * TimerBottomSheetDialogFragment). The lyrics-options patch early-returns
 * here with our dialog instead. No accessFlags (class + name + signature +
 * content pin it).
 */
object PlayPauseLongPressFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/l\$c;",
    name = "onLongClick",
    returnType = "Z",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/player/ui/l;",
            name = "N0",
        ),
        methodCall(
            definingClass = "LL6/b;",
            name = "h0",
        ),
    )
)
