package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Forced-shuffle target (Anghami 8.0.28, verified in base.apk smali).
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
 * Server-driven shuffle sync points (Anghami 8.0.28, verified in base.apk smali).
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
 * Pick-a-song -> radio-queue redirect (Anghami 8.0.28, verified in base.apk
 * smali: list_fragment/c.smali:1762, sole definition, private).
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
 * Queue-screen greyed shuffle button (Anghami 8.0.28, verified in base.apk
 * smali). playerfeed/c.q0() (the `btn_shuffle` controller,
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
 * "You're shuffled" upsell dialog gate (Anghami 8.0.28, verified in base.apk
 * smali: RadioPlayQueue.smali:1415). Base `shouldShowShuffleMessage()` is
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
