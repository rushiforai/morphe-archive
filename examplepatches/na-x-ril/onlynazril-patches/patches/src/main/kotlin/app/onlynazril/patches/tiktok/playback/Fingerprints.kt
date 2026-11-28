package app.onlynazril.patches.tiktok.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.Opcode

/**
 * The feed's playback controller: the one object the feed player reports progress through.
 *
 * Real-named and carried by both supported builds (`com.ss.android.ugc.aweme.feed.controller.
 * PlayerController`). It is the class that owns the current item's id (`mCurrentAid`) and the last
 * position (`lastPosition`), so the two hooks that classify an item belong here rather than on the
 * per-cell views whose names are obfuscated and change every build.
 */
internal const val FEED_PLAYER_CONTROLLER =
    "Lcom/ss/android/ugc/aweme/feed/controller/PlayerController;"

/** The real-named source id every feed player callback carries first. */
private const val SOURCE_ID = "Ljava/lang/String;"

/**
 * The playback tick: `onPlayProgressChange(sourceId, positionMs, durationMs)`.
 *
 * The two longs were read off the method body: `lastPosition` is written from the first, and the
 * second is divided by 100 after `long-to-float` to make the progress percentage, with the first
 * divided by it, that makes the first the position and the second the duration, both in
 * milliseconds.
 *
 * Matched on the real-named class, the exact three-parameter shape and the two field accesses, not
 * on the class's position in the feed stack. The single-float overload (`onPlayProgressChange(F)V`)
 * has no body here, and the name-based match would otherwise be ambiguous with it.
 */
internal val FeedPlayProgressFingerprint = Fingerprint(
    definingClass = FEED_PLAYER_CONTROLLER,
    name = "onPlayProgressChange",
    returnType = "V",
    parameters = listOf(SOURCE_ID, "J", "J"),
    filters = listOf(
        fieldAccess(
            definingClass = "this",
            name = "lastPosition",
            type = "J",
            opcode = Opcode.IPUT_WIDE,
        ),
        fieldAccess(
            definingClass = "this",
            name = "mCurrentAid",
            type = "Ljava/lang/String;",
            opcode = Opcode.IGET_OBJECT,
        ),
    ),
)

/** The video reached its end: `(sourceId)` and the compatibility `(sourceId, reason)` overload. */
internal val FeedPlayCompletedFingerprint = Fingerprint(
    definingClass = FEED_PLAYER_CONTROLLER,
    name = "onPlayCompleted",
    returnType = "V",
    parameters = listOf(SOURCE_ID),
)

internal val FeedPlayCompletedCountFingerprint = Fingerprint(
    definingClass = FEED_PLAYER_CONTROLLER,
    name = "onPlayCompleted",
    returnType = "V",
    parameters = listOf(SOURCE_ID, "I"),
)

private const val CONTINUE_CONFIG =
    "Lcom/ss/android/ugc/aweme/feed/experiment/FeedPlayProgressContinueConfig;"

/**
 * The lambda that answers whether TikTok may resume a video at its stored position. It reads
 * `FeedPlayProgressContinueConfig.enable`; the class name of the lambda moves every build, so the
 * field read is the anchor.
 */
internal val FeedProgressContinueGateFingerprint = Fingerprint(
    name = "invoke",
    filters = listOf(fieldAccess(definingClass = CONTINUE_CONFIG, name = "enable")),
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.getReference<FieldReference>()?.let { field ->
                field.definingClass == CONTINUE_CONFIG && field.name == "enable"
            } == true
        } == true
    },
)

/**
 * The method that answers "where should this video start". It is found by its only read of the
 * config's `event_type_list`; the patch overrides the `contains` answer so feeds outside TikTok's
 * allow list still resume.
 */
internal val FeedProgressResumePositionFingerprint = Fingerprint(
    returnType = "J",
    filters = listOf(fieldAccess(definingClass = CONTINUE_CONFIG, name = "event_type_list")),
    custom = { method, _ ->
        method.parameterTypes.firstOrNull()?.toString() ==
            "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
    },
)
