/*
 * YTAfterglow for Android.
 *
 * Fingerprints adapted from the video information, video id, player type and player
 * response patches of Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches,
 * GPLv3), which were forked from ReVanced patches
 * (https://github.com/ReVanced/revanced-patches, GPLv3). Modified for YTAfterglow:
 * rewritten for patcher 2.1.0 and checked one by one against YouTube 21.43.523.
 * Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

@file:Suppress("SpellCheckingInspection")

package app.afterglow.patches.video

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/*
 * Every fingerprint names what it resolves to in YouTube 21.43.523 (classes*.dex of the
 * arm64 APK), as checked against `dexdump -d`.
 */

// region Local player director

/**
 * Plays a video of a player response. Its class is the local player director: one per
 * playback, it implements YouTube's director interface `Lastr;`.
 *
 * 21.43.523: `Lastx;->bV(Lalfi;)I` (classes2.dex); `Lalfi;` is the player response model.
 */
internal object PlayerInitFingerprint : Fingerprint(
    filters = listOf(string("playVideo called on player response with no videoStreamingData.")),
)

/**
 * Seeks to an absolute time.
 *
 * 21.43.523: `Lastx;->as(JLblvl;)Z`; `Lblvl;` is the seek source enum.
 */
internal object SeekFingerprint : Fingerprint(
    classFingerprint = PlayerInitFingerprint,
    returnType = "Z",
    parameters = listOf("J", "L"),
    filters = listOf(string("currentPositionMs.")),
)

/**
 * Seeks by an offset: adds it to the current time and calls the absolute seek.
 *
 * 21.43.523: `Lastx;->aq(JLblvl;)Z`, `add-long/2addr` at 0x0036, `Lastx;->as` at 0x0037.
 */
internal object SeekRelativeFingerprint : Fingerprint(
    classFingerprint = PlayerInitFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("J", "L"),
    filters = listOf(
        opcode(Opcode.ADD_LONG_2ADDR),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, definingClass = "this", location = MatchAfterImmediately()),
    ),
)

/**
 * Reads the current time just before the literal 69. The call is the time getter.
 *
 * 21.43.523: the getter is `Lastx;->g()J`.
 */
internal object GetVideoTimeFingerprint : Fingerprint(
    classFingerprint = PlayerInitFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "this", returnType = "J", parameters = listOf()),
        literal(69, location = MatchAfterWithin(5)),
    ),
)

/**
 * Builds the progress of the playback; the constructor it calls is the progress object,
 * whose first `long` is the current time. Called about once a second while a video plays.
 *
 * 21.43.523: `Lastx;->bW(Lasxj;JJJJZII)V` calls `Lardm;-><init>(JJJJJJJZLjava/lang/String;)V`.
 */
internal object PlayerProgressFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_DIRECT_RANGE,
            name = "<init>",
            parameters = listOf("J", "J", "J", "J", "J", "J", "J", "Z", "Ljava/lang/String;"),
        ),
        string("Media progress reported outside media playback: ", StringComparisonType.CONTAINS),
    ),
)

/**
 * YouTube's player status enum.
 *
 * 21.43.523: `Lascj;-><clinit>` (NEW ... VIDEO_PLAYING, ENDED, with READY and VIDEO_REQUESTED).
 */
internal object PlayerStatusEnumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    // The merged extension has a name-for-name copy of this enum. Only hook YouTube's.
    custom = { _, classDef -> !classDef.type.startsWith("$EXTENSION_PACKAGE/") },
    strings = listOf(
        "NEW",
        "PLAYBACK_PENDING",
        "PLAYBACK_LOADED",
        "PLAYBACK_INTERRUPTED",
        "INTERSTITIAL_REQUESTED",
        "INTERSTITIAL_PLAYING",
        "VIDEO_PLAYING",
        "ENDED",
    ),
)

/**
 * Sets the director's status.
 *
 * 21.43.523: `Lastx;->aL(Lascj;)V` (24 registers, so p0 and p1 are v22 and v23).
 */
internal fun playerStatusFingerprint(playerStatusEnum: String) = Fingerprint(
    classFingerprint = PlayerInitFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(playerStatusEnum),
    filters = listOf(
        opcode(Opcode.SGET_OBJECT),
        methodCall(definingClass = "Lj\$/time/Instant;", name = "plus"),
    ),
)

// endregion

// region Casting (MDX) director

/**
 * 21.43.523: `Lanxx;->bY(ILadsy;)V` (classes6.dex), in the MDX director `Lanxx;`, which
 * implements the same director interface `Lastr;` as the local director.
 */
internal object MdxPlayerDirectorSetVideoStageFingerprint : Fingerprint(
    filters = listOf(
        string(
            "MdxDirector setVideoStage ad should be null when videoStage is not an Ad state ",
            StringComparisonType.CONTAINS,
        ),
    ),
)

// endregion

// region Player response

/**
 * Builds the player request of a video: p1 is the video id, p3 the player parameters (every
 * Short's start with "8AEB") and p13 whether the video is a Short being opened or playing.
 * Called off the main thread, also for preloaded videos.
 *
 * 21.43.523: `Lasfn;->b(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;IZILbllc;
 * Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Lanil;ZZZLj$/time/Duration;)Lasfp;`
 * (classes2.dex; 21 registers, p0 is v4).
 */
internal object PlayerParameterBuilderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf(
        "Ljava/lang/String;", // Video id.
        "[B",
        "Ljava/lang/String;", // Player parameters.
        "Ljava/lang/String;",
        "I",
        "Z",
        "I",
        "L",
        "Ljava/util/Set;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "L",
        "Z", // Short being opened or playing.
        "Z",
        "Z",
        "Lj\$/time/Duration;",
    ),
)

// endregion

// region Player type and Shorts player

/**
 * YouTube's player type enum.
 *
 * 21.43.523: `Ljkj;-><clinit>` (classes.dex).
 */
internal object PlayerTypeEnumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("NONE"),
        string("HIDDEN"),
        string("WATCH_WHILE_MINIMIZED"),
        string("WATCH_WHILE_MAXIMIZED"),
        string("WATCH_WHILE_FULLSCREEN"),
        string("WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN"),
        string("WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED"),
        string("WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED"),
        string("INLINE_MINIMAL"),
        string("VIRTUAL_REALITY_FULLSCREEN"),
        string("WATCH_WHILE_PICTURE_IN_PICTURE"),
        opcode(Opcode.APUT_OBJECT),
    ),
)

/**
 * The player view's player type listener (21.41+: the overlays layout no longer listens).
 *
 * 21.43.523: `Lcom/google/android/apps/youtube/app/player/YouTubePlayerViewNotForReflection;
 * ->i(Ljkj;)V` (3 registers).
 */
internal fun playerTypeFingerprint(playerTypeEnum: String) = Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/app/player/YouTubePlayerViewNotForReflection;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(playerTypeEnum),
)

/**
 * Inflates the Shorts player (R.id.reel_watch_player); the result is its view.
 */
internal object ReelWatchPagerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "reel_watch_player"),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterWithin(10)),
    ),
)

// endregion

// region Play/pause state

/**
 * YouTube's video state enum of the player controls.
 *
 * 21.43.523: `Larrr;`.
 */
internal object ControlsVideoStateEnumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(),
    filters = listOf(
        string("NEW"),
        string("PLAYING"),
        string("PAUSED"),
        string("RECOVERABLE_ERROR"),
        string("UNRECOVERABLE_ERROR"),
        string("ENDED"),
        opcode(Opcode.APUT_OBJECT),
    ),
)

/**
 * The player controls state (video state and buffering).
 *
 * 21.43.523: `Larrs;->toString()`; the video state is `Larrs;->a:Larrr;`.
 */
internal object ControlsStateToStringFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
    filters = listOf(string("videoState"), string("isBuffering")),
)

/**
 * Updates the play/pause button from the controls state.
 */
internal fun playPauseButtonFingerprint(controlsStateType: String, videoStateType: String) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(controlsStateType),
    filters = listOf(
        fieldAccess(definingClass = controlsStateType, type = videoStateType),
        resourceLiteral(ResourceType.STRING, "accessibility_play"),
        resourceLiteral(ResourceType.STRING, "accessibility_pause"),
    ),
)

// endregion

// region Seek bar

/** 21.43.523: `Ljsb;->onDraw(Landroid/graphics/Canvas;)V` (classes.dex), the player seek bar. */
internal object PlayerSeekbarOnDrawFingerprint : Fingerprint(
    name = "onDraw",
    returnType = "V",
    filters = listOf(string("timed_markers_width")),
)

/**
 * Lays out the seek bar; the last `cmp-long` compares the video length with 0.
 *
 * 21.43.523: `Ljsb;->hP()V`, `cmp-long v10, v13, v11` at 0x005a (length in v13 and v14),
 * a branch target.
 */
internal object VideoLengthFingerprint : Fingerprint(
    classFingerprint = PlayerSeekbarOnDrawFingerprint,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(smali = "Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V"),
        methodCall(returnType = "J"),
        methodCall(returnType = "J", location = MatchAfterWithin(5)),
        methodCall(returnType = "J", location = MatchAfterWithin(10)),
        methodCall(returnType = "J", location = MatchAfterWithin(10)),
        methodCall(returnType = "Z", parameters = listOf()),
        opcode(Opcode.CMP_LONG, location = MatchAfterWithin(8)),
    ),
)

// endregion
