package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.yydarlinker.patches.shared.CaptionResourceType
import app.yydarlinker.patches.shared.captionResourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val YOUTUBE_MAIN_ACTIVITY =
    "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;"

/** Stable enum identity used by YouTube's regular-player state callback. */
internal object PlayerTypeEnumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    strings = listOf(
        "WATCH_WHILE_PICTURE_IN_PICTURE",
        "NONE",
        "HIDDEN",
        "WATCH_WHILE_MINIMIZED",
        "WATCH_WHILE_MAXIMIZED",
        "WATCH_WHILE_FULLSCREEN",
        "WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN",
        "WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED",
        "WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED",
        "INLINE_MINIMAL",
        "VIRTUAL_REALITY_FULLSCREEN",
    ),
)

/** Exact Timed Text Cronet fingerprint used by Morphe v1.39.1. */
internal object TimedTextUrlFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = $$"Lorg/chromium/net/CronetEngine;->newUrlRequestBuilder(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/UrlRequest$Builder;",
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            smali = "Lorg/chromium/net/UploadDataProviders;->create(Ljava/nio/ByteBuffer;)Lorg/chromium/net/UploadDataProvider;",
        )
    )
)

/** YouTube's main player Activity. Used only to attach the resource-free caption overlay. */
internal object YouTubeActivityOnCreateFingerprint : Fingerprint(
    definingClass = YOUTUBE_MAIN_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Stable Morphe fingerprint for the player method that forwards the current position as a long.
 * The first matched invoke-direct/range targets the actual (J)V time callback, which is normally
 * called about once per second by YouTube.
 */
internal object PlayerTimeReferenceFingerprint : Fingerprint(
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.INVOKE_DIRECT_RANGE,
        Opcode.IGET_OBJECT,
    ),
    strings = listOf("Media progress reported outside media playback: "),
)

/** Parent and callback used by Morphe's stable current-video ID hook. */
private object CurrentVideoIdParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "[L",
    parameters = listOf("L"),
    filters = listOf(literal(524288L)),
)

/** Called for the video currently visible in the regular player or Shorts. */
internal object CurrentVideoIdFingerprint : Fingerprint(
    classFingerprint = CurrentVideoIdParentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, returnType = "Ljava/lang/String;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        methodCall(
            smali = "Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            location = MatchAfterWithin(6),
        ),
        opcode(Opcode.RETURN_VOID, location = MatchAfterImmediately()),
    ),
)

/**
 * Exact Morphe player-CC controller identity, kept standalone by a tiny local resource mapper.
 * This preserves the official fingerprint's two caption-resource literals rather than weakening
 * matching to generic ImageView methods that could hit an unrelated overlay control.
 */
internal object SubtitleButtonControllerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Lcom/google/android/libraries/youtube/common/ui/TouchImageView;"
        ),
        captionResourceLiteral(
            CaptionResourceType.STRING,
            "accessibility_captions_unavailable"
        ),
        captionResourceLiteral(
            CaptionResourceType.STRING,
            "accessibility_captions_button_name"
        ),
    )
)
