package io.github.david419kr.niconicoyt.patches.youtube.niconicocomments

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.InstructionLocation.MatchFirst
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import io.github.david419kr.niconicoyt.patches.shared.ResourceType
import io.github.david419kr.niconicoyt.patches.shared.resourceLiteral

internal object YoutubeLayoutConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        literal(159962),
        resourceLiteral(ResourceType.ID, "player_control_previous_button_touch_area"),
        resourceLiteral(ResourceType.ID, "player_control_next_button_touch_area"),
        methodCall(parameters = listOf("Landroid/view/View;", "I")),
    ),
)

internal object NiconicoCommentsOverlayFingerprint : Fingerprint(
    classFingerprint = YoutubeLayoutConstructorFingerprint,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        resourceLiteral(ResourceType.ID, "inset_overlay_view_layout"),
        checkCast("Landroid/widget/FrameLayout;", MatchAfterWithin(20)),
    ),
)

private object PlayerBottomButtonParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "time_bar_live_label"),
    ),
)

internal object NiconicoCommentsBottomButtonFingerprint : Fingerprint(
    classFingerprint = PlayerBottomButtonParentFingerprint,
    filters = listOf(
        resourceLiteral(ResourceType.ID, "fullscreen_button"),
        opcode(Opcode.MOVE_RESULT_OBJECT),
    ),
)

private object VideoIdParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "[L",
    parameters = listOf("L"),
    filters = listOf(literal(524288L)),
)

internal object VideoIdFingerprint : Fingerprint(
    classFingerprint = VideoIdParentFingerprint,
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

internal object VideoStateEnumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(),
    strings = listOf(
        "NEW",
        "PLAYING",
        "PAUSED",
        "RECOVERABLE_ERROR",
        "UNRECOVERABLE_ERROR",
        "ENDED",
    ),
)

internal object ControlsStateToStringFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("videoState"),
        string("isBuffering"),
    ),
)

internal object VideoTimeReferenceFingerprint : Fingerprint(
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.INVOKE_DIRECT_RANGE,
        Opcode.IGET_OBJECT,
    ),
    strings = listOf("Media progress reported outside media playback: "),
)

private object PlaybackSpeedOnItemClickParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "L",
    parameters = listOf("L", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(name = "getSupportFragmentManager", location = MatchFirst()),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        methodCall(
            returnType = "L",
            parameters = listOf("Ljava/lang/String;"),
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()),
        opcode(Opcode.CHECK_CAST, location = MatchAfterImmediately()),
    ),
    custom = { _, classDef -> classDef.methods.count() == 8 },
)

internal object PlaybackSpeedOnItemClickFingerprint : Fingerprint(
    classFingerprint = PlaybackSpeedOnItemClickParentFingerprint,
    name = "onItemClick",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "L", "I", "J"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET, type = "F"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("F"),
            returnType = "V",
        ),
    ),
)

private object PlaybackRateApplierParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("Playback rate: %f"),
        literal(0.25f),
        literal(4.0f),
    ),
)

internal object PlaybackRateApplierFingerprint : Fingerprint(
    classFingerprint = PlaybackRateApplierParentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        literal(0.25f),
        literal(4.0f),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            parameters = listOf("F"),
            returnType = "V",
        ),
    ),
    custom = { method, _ -> method.parameterTypes.firstOrNull() == "F" },
)
