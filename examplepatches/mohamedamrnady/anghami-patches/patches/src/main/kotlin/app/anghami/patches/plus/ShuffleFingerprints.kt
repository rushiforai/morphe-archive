package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Forced-shuffle target (Anghami 8.0.28, verified in Anghami 8.0.28).
 *
 * PlayQueue.shuffle()V is the unconditional force-ON method: it clears
 * isShuffleMode then calls setShuffleMode(true). It is invoked automatically
 * at queue creation (app/base/list_fragment/c.postProcessPlayQueue when its
 * shuffle flag is set; k5/f$a queue builder when its flag is set).
 *
 * Safe to no-op because the USER toggle path never goes through shuffle():
 * UI buttons call PlayQueueManager.toggleShuffle() ->
 * PlayQueue.toggleShuffle() -> setShuffleMode(ZZ) directly (verified: K5/a,
 * q6/e$a, VideoWrapperView$d, E8/g$e, PlayerService$e all use toggleShuffle;
 * shuffleCurrent() has no in-app callers). So prepending return-void kills
 * auto-shuffle while keeping manual shuffle working.
 *
 * Companion: UnlockRestrictionsPatch already forces queueRestrictionsEnabled
 * and shouldForceRelatedMode off — this covers the remaining symptom where
 * playback starts shuffled regardless.
 */

object ForceShuffleFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "shuffle",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "setShuffleMode",
        ),
        opcode(Opcode.RETURN_VOID),
    )
)

/**
 * Server-driven shuffle sync points (Anghami 8.0.28, verified in Anghami 8.0.28).
 *
 * No-op'ing shuffle() is NOT enough: the server sends shuffleOn=true for free
 * accounts and two sync methods copy it straight into isShuffleMode without
 * ever calling shuffle():
 * - fillFromSyncData(ServerPlayQueue,List)V:6292
 *   `iget-boolean p2, p1, ServerPlayQueue;->shuffleOn:Z`
 * - updateFromSocketPayload(LXe/c;)V:14540 (p1 reassigned to ServerPlayQueue
 *   via playQueueFromJson at method start)
 *   `iget-boolean v7, p1, ServerPlayQueue;->shuffleOn:Z`
 *
 * The patch REPLACES each iget with const/4 (register unchanged), so the
 * server can never turn shuffle on. Manual toggle is unaffected: UI goes
 * through toggleShuffle() -> setShuffleMode(ZZ) directly, and client->server
 * toggle propagation (PlayQueue:6810 iput shuffleOn) is untouched.
 */
object FillFromSyncDataFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "fillFromSyncData",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/odin/playqueue/ServerPlayQueue;",
        "Ljava/util/List;",
    ),
    filters = listOf(
        string("infinite"),
    )
)

object SocketPayloadShuffleFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "updateFromSocketPayload",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("LXe/c;"),
    filters = listOf(
        string("told to shuffle, but something wrong with shuffled songs"),
    )
)

/**
 * Client -> server report writer (Anghami 8.0.28, verified in Anghami 8.0.28
 * PlayQueue:6722, sole definition).
 *
 * `fillSyncData(ServerPlayQueue)` builds every client->server payload
 * (`_putQueue` diff-PUTs, `reportSetPlayQueue` POSTs, and the
 * `updateFromSocketPayload` Diff baseline): `if isShuffleMode():
 * shuffleOn=true + shuffledSongs=copy(shuffledSongs)`. Nopping those two
 * iputs keeps the server from ever learning the session is shuffled —
 * which is what made it answer with radio/restricted content and enforce
 * skip limits despite the local unlocks (the 1.2.0 no-op had the same
 * server-visible behavior by never letting shuffle turn on at all).
 * Local `isShuffleMode`/`shuffledSongs` stay live, and both Diff sides are
 * built by this same method, so no phantom diffs.
 */
object SyncReportFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "fillSyncData",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/odin/playqueue/ServerPlayQueue;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "getOrderedSongs",
        ),
    )
)

/**
 * Pick-a-song -> radio-queue redirect (Anghami 8.0.28, verified in Anghami 8.0.28
 * list_fragment/c:1762, sole definition, private).
 *
 * `shouldPlayRadio(song, section)` returns true for FREE accounts
 * (`!Account.isPlus()`, itself forced true by Unlock-Local-Plus) when
 * `song.playMode == "shuffle"`, and — regardless of Plus — when
 * `section.playMode == "shuffle"`. Both callers (getPagePlayQueue:3093,
 * getPlayQueueFromSection:3498) then build a RadioPlayQueue with
 * playmode="shuffle" instead of the on-demand queue, so tapping a song
 * plays a shuffled/radio queue. P5/f (playlist) and t4/d (album) presenters
 * inherit this path. Forcing false keeps the normal
 * createPlayQueue(songs, indexOf(picked)) on-demand path.
 */
object ShouldPlayRadioFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/c;",
    name = "shouldPlayRadio",
    // NOTE: no accessFlags (private in 8.0.28; exact-int matching brittle).
    returnType = "Z",
    parameters = listOf(
        "Lcom/anghami/ghost/pojo/Song;",
        "Lcom/anghami/ghost/pojo/section/Section;",
    ),
    filters = listOf(
        string("shuffle"),
    )
)

/**
 * Tap/header -> related-queue redirect (Anghami 8.0.28, verified in Anghami 8.0.28
 * list_fragment/c:1833, sole private definition — P5/f, t4/d,
 * k5/f all inherit it).
 *
 * `shouldPlayRelated(songs, section)` returns true whenever the SERVER marks
 * content as related (`section.playMode=="related"` or the first song's
 * `playMode=="related"`), or for single-song sections when
 * `canPlaySingleSong()` is false. Both callers (`getPagePlayQueue`,
 * `getPlayQueueFromSection` — i.e. header Play AND tap-a-song) then build a
 * `SongPlayqueue` that the server expands with related songs instead of the
 * on-demand queue, so tapping e.g. a queue-screen recommendation or a
 * related-marked row "sometimes enables the radio shit" (2026-10-05).
 * (`shouldForceRelatedMode` inside is already dead via the Unlock patch's
 * `skipLimitReached=false`; the live triggers are the server markings.)
 * Forcing false keeps the `createPlayQueue(songs, index)` on-demand path
 * everywhere. `playMode=="infinite"` sections already returned false in
 * stock and are unaffected.
 */
object ShouldPlayRelatedFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/c;",
    name = "shouldPlayRelated",
    // NOTE: no accessFlags (private in 8.0.28; exact-int matching brittle).
    returnType = "Z",
    parameters = listOf(
        "Ljava/util/List;",
        "Lcom/anghami/ghost/pojo/section/Section;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueueManager;",
            name = "shouldForceRelatedMode",
        ),
    )
)

/**
 * Queue-expansion entry (Anghami 8.0.28, verified in Anghami 8.0.28:
 * PlayQueue:10706, sole definition — all subclasses inherit it).
 *
 * `maybeExpandQueue` serves TWO uses: initial data load for queues built
 * with an empty song list (e.g. `getAndPlaySearchSongPlayQueue` builds a
 * `SongPlayqueue`, removes the song, then loads it via expansion — kill
 * that and search taps break), and near-end top-ups that APPEND
 * server-picked songs to a playing queue (the skip-pollution vector:
 * `SongPlayqueue` fetches related by songId+extras, `RadioPlayQueue` is
 * endlessly expandable). The patch allows the former and blocks the
 * latter: non-empty song/radio-typed queues fail fast, everything else
 * (including empty queues and normal playlist continuation) proceeds.
 */
object QueueExpansionFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "maybeExpandQueue",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/odin/playqueue/PlayQueue\$ExpansionCallback;",
    ),
    filters = listOf(
        string("ShouldExpandQueue returns false"),
    )
)

/**
 * Queue-screen greyed shuffle button (Anghami 8.0.28, verified in Anghami 8.0.28
 *). playerfeed/c.q0() (the `btn_shuffle` controller,
 * fragment_player_feed) sets clickable/enabled/alpha(1.0f vs 0.3f) from
 * `canShuffleCurrentQueue() && Account.isPlus()`; same double-gate in
 * car-mode E8/g.g0() and bottom-sheet q6/e.y0(). `Account.isPlus()` is
 * already forced true by Unlock-Local-Plus, so the remaining false source
 * is queue type: RadioPlayQueue/LiveRadio/AutomixPlayqueue override
 * `canShuffle()` to false. Forcing the manager wrapper true enables the
 * button everywhere in one hook; `isShuffleMode()` still reports real
 * state, and `setShuffleMode` early-exits on empty song lists (live
 * radio), so toggle semantics stay safe.
 */
object CanShuffleCurrentQueueFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueueManager;",
    name = "canShuffleCurrentQueue",
    // NOTE: no accessFlags; signature pins it.
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "canShuffle",
        ),
    )
)

/**
 * "You're shuffled" upsell dialog gate (Anghami 8.0.28, verified in Anghami 8.0.28
 * RadioPlayQueue:1415). Base `shouldShowShuffleMessage()` is
 * already false; only the RadioPlayQueue override returns true (when
 * playmode=="shuffle"), arming `maybeShowShuffleMessage()` (free-only,
 * one-shot, 24h throttle) which pops the shuffle upsell dialog.
 * Forcing false disarms it. Deliberately NOT touching the
 * `canShuffle()==false` overrides on Radio/Live/Automix (model semantics
 * stay truthful; the UI gate above is fixed at the manager level).
 */
object RadioShuffleMessageFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/RadioPlayQueue;",
    name = "shouldShowShuffleMessage",
    // NOTE: no accessFlags; class + signature pin it.
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("shuffle"),
    )
)

/**
 * Client-intent shuffle writer (Anghami 8.0.28, verified in Anghami 8.0.28:
 * PlayQueue `setShuffleMode(ZZ)`, private).
 *
 * The ONLY three callers are all explicit user intent:
 * - `shuffle()` (header Shuffle tap via `c.play` v3-gate / `k5/f$a` p1-gate),
 * - `toggleShuffle()` (queue-screen/car/bottom-sheet/song-card toggles via
 *   `Manager.toggleShuffle`, itself fed by K5/a, q6/e$a, VideoWrapperView$d,
 *   E8/g$e, PlayerService$e),
 * - `setShuffle(Z)` (via `Manager.setShuffle`, no other callers — same UI).
 *
 * Server sync NEVER routes through here (`fillFromSyncData` /
 * `updateFromSocketPayload` write `isShuffleMode` via direct iput), so a
 * save-hook placed AFTER the early exits (mode-changed + non-empty songs,
 * right after the `isShuffleMode` iput) records exactly the modes the user
 * chose — never a server value, never a no-op'd live-radio toggle.
 */
object SetShuffleModeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "setShuffleMode",
    // NOTE: no accessFlags (private in 8.0.28; exact-int matching brittle).
    returnType = "V",
    parameters = listOf("Z", "Z"),
    filters = listOf(
        string("PlayQueue: setShuffleMode() called isShuffleMode : "),
    )
)

/**
 * Fresh-queue builders where the remembered mode is applied (Anghami 8.0.28,
 * verified in Anghami 8.0.28). The sync-point readers never see these queues
 * (built locally, mode default false), so each tail calls public
 * `setShuffle(sticky)` — a no-op when sticky=false, a flag flip (+ server
 * echo completing the order) when sticky=true:
 * - `c.createPlayQueue(...)` (single `return-object v0`, label-free; v0 =
 *   queue, v1 dead): covers `getPagePlayQueue` and `getPlayQueueFromSection`
 *   on-demand paths (P5/f, t4/d presenters inherit via super.play).
 * - `c.buildRelatedPlayQueue(...)` (single `return-object v2`, label-free;
 *   v2 = SongPlayqueue, v0 dead): covers related-queue taps. Its own p3
 *   gate calls `setIsHeader()`, never `shuffle()` — not a force path.
 * - `k5/f$a.onNext(Object)` (async Generic funnel; label-free
 *   `iget-boolean p1, f$a;->c` pre-gate; v0 = queue, p1 dead until the
 *   stock iget): runs before the user shuffle gate and playPlayQueue.
 * Radio/Automix queues are built elsewhere and deliberately untouched.
 */
object CreatePlayQueueFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/c;",
    name = "createPlayQueue",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Lcom/anghami/odin/playqueue/PlayQueue;",
    parameters = listOf(
        "Ljava/util/List;",
        "I",
        "Lcom/anghami/ghost/pojo/section/Section;",
        "Lcom/anghami/data/remote/proto/SiloPlayQueueProto\$PlayQueuePayload;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "fillSectionData",
        ),
    )
)

object RelatedQueueBuilderFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/c;",
    name = "buildRelatedPlayQueue",
    // NOTE: no accessFlags (private in 8.0.28; exact-int matching brittle).
    returnType = "Lcom/anghami/odin/playqueue/PlayQueue;",
    parameters = listOf(
        "Lcom/anghami/ghost/pojo/Song;",
        "Lcom/anghami/ghost/pojo/section/Section;",
        "Z",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "setIsHeader",
        ),
    )
)

object GenericQueueBuilderFingerprint : Fingerprint(
    definingClass = "Lk5/f\$a;",
    name = "onNext",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueueManager;",
            name = "playPlayQueue",
        ),
    )
)
