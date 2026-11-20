package id.ikuradachi.patches.crunchyroll.player.subtitles

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val SUBTITLE_STYLE_HELPER_TYPE =
    "Lid/ikuradachi/kageroll/extension/crunchyroll/SubtitleStyleHelper;"

object SubtitlesRendererLoadTrackFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/subtitles/SubtitlesRendererImpl;",
    name = "loadTrack",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "J",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("subtitlesText"),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            type = "Ljava/nio/charset/Charset;",
        ),
        methodCall(
            definingClass = "Lcom/crunchyroll/subtitles/SubtitlesRendererImpl;",
            name = "loadTrack",
            parameters = listOf("[B", "I"),
            returnType = "J",
        ),
    ),
)

object SubtitlesControllerSetFrameSizeFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/subtitles/presentation/SubtitlesControllerImpl;",
    name = "setFrameSize",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "I"),
    filters = listOf(
        literal(1.7777778f),
        methodCall(
            definingClass = "Lcom/crunchyroll/subtitles/SubtitlesRenderer;",
            name = "setFrameSize",
            parameters = listOf("I", "I"),
            returnType = "V",
        ),
    ),
)

object SubtitlesPlayerViewResizeInvokeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        checkCast("Lcom/crunchyroll/player/presentation/playerview/InternalPlayerViewLayout;"),
        methodCall(
            definingClass = "Ljava/lang/Integer;",
            name = "intValue",
            parameters = listOf(),
        ),
        methodCall(
            definingClass = "Landroidx/media3/ui/PlayerView;",
            name = "setResizeMode",
            parameters = listOf("I"),
        ),
    ),
)

object SubtitleHelperDefaultFontScaleFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "getDefaultFontScale",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "F",
    parameters = listOf(),
)

object SubtitleHelperScaleInlineFsFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "isScaleInlineFsTagsDefault",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
)

object SubtitleHelperDefaultAssMarginVOffsetFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "getDefaultAssMarginVOffset",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf(),
)

object SubtitleHelperDefaultBottomSafeMarginDpFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "getDefaultBottomSafeMarginDp",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf(),
)

object SubtitleHelperDefaultOutlineWidthFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "getDefaultOutlineWidth",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "F",
    parameters = listOf(),
)

object SubtitleHelperDefaultShadowDepthFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "getDefaultShadowDepth",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "F",
    parameters = listOf(),
)

object SubtitleHelperDefaultPrimaryColorFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "getDefaultPrimaryColor",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

object SubtitleHelperDefaultOutlineColorFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "getDefaultOutlineColor",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

object SubtitleHelperAdaptResizeModeFingerprint : Fingerprint(
    definingClass = SUBTITLE_STYLE_HELPER_TYPE,
    name = "isAdaptMarginsToResizeModeDefault",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
)
