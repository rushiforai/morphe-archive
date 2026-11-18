package id.ikuradachi.patches.crunchyroll.player.autoskip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val AUTO_SKIP_HELPER_CLASS =
    "Lid/ikuradachi/kageroll/extension/crunchyroll/AutoSkipHelper;"

object AutoSkipHelperMaskFingerprint : Fingerprint(
    definingClass = AUTO_SKIP_HELPER_CLASS,
    name = "getEnabledSegmentMask",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = emptyList(),
)

object VideoSkipEventToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("VideoSkipEvent(endMs="),
        string(", startMs="),
        opcode(Opcode.IGET_WIDE),
        opcode(Opcode.IGET_WIDE),
        string(", skipEventType="),
        opcode(Opcode.IGET_OBJECT),
    ),
)

object VideoMetaContentToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("VideoMetaContent(id="),
        opcode(Opcode.IGET_OBJECT),
    ),
)

object SkipSegmentViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L", "L", "L", "L"),
    filters = listOf(
        string("playerController"),
        string("skipSegmentAnalytics"),
    ),
)

object FloatingPlayerControllerConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L", "L", "L", "L"),
    filters = listOf(
        string("xrPlayer"),
        string("skipSegmentAnalytics"),
    ),
)

private val ON_SKIP_SEGMENT_CLICK_FILTERS = listOf(
    opcode(Opcode.IGET_OBJECT),
    methodCall(name = "getState", location = InstructionLocation.MatchAfterImmediately()),
    opcode(Opcode.MOVE_RESULT_OBJECT, InstructionLocation.MatchAfterImmediately()),
    methodCall(
        name = "getValue",
        returnType = "Ljava/lang/Object;",
        location = InstructionLocation.MatchAfterImmediately(),
    ),
    opcode(Opcode.MOVE_RESULT_OBJECT, InstructionLocation.MatchAfterImmediately()),
    opcode(Opcode.CHECK_CAST, InstructionLocation.MatchAfterImmediately()),
    opcode(Opcode.IGET_OBJECT, InstructionLocation.MatchAfterImmediately()),
)

object SkipSegmentOnClickFingerprint : Fingerprint(
    classFingerprint = SkipSegmentViewModelConstructorFingerprint,
    name = "onSkipSegmentClick",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = ON_SKIP_SEGMENT_CLICK_FILTERS,
)

object FloatingPlayerOnClickFingerprint : Fingerprint(
    classFingerprint = FloatingPlayerControllerConstructorFingerprint,
    name = "onSkipSegmentClick",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = ON_SKIP_SEGMENT_CLICK_FILTERS,
)

fun createFlowMapEmitterFingerprint(
    viewModelType: String,
    skipEventTypeEnumType: String,
) = Fingerprint(
    name = "emit",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;", "L"),
    filters = listOf(
        string("call to 'resume' before 'invoke' with coroutine"),
        opcode(Opcode.CMP_LONG),
        opcode(Opcode.CMP_LONG),
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = skipEventTypeEnumType),
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = viewModelType),
        methodCall(name = "emit", returnType = "Ljava/lang/Object;"),
    ),
)
