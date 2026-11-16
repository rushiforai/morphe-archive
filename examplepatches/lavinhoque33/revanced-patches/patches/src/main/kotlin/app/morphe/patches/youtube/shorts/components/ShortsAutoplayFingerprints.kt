package app.morphe.patches.youtube.shorts.components

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.youtube.utils.navigation.YOUTUBE_MAIN_ACTIVITY_CLASS_TYPE
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object ReelEnumConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("REEL_LOOP_BEHAVIOR_UNKNOWN"),
        string("REEL_LOOP_BEHAVIOR_SINGLE_PLAY"),
        string("REEL_LOOP_BEHAVIOR_REPEAT"),
        string("REEL_LOOP_BEHAVIOR_END_SCREEN"),
        opcode(Opcode.RETURN_VOID)
    )
)

private object ReelPlaybackRepeatParentFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall("Lj$/time/Instant;->toEpochMilli()J"),
        string("r_tr")
    )
)

context(_: BytecodePatchContext)
internal fun reelPlaybackRepeatFingerprint() = Fingerprint(
    classFingerprint = ReelPlaybackRepeatParentFingerprint,
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        anyInstruction(
            methodCall(smali = "Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z"),
            methodCall(smali = "Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;")
        )
    ),
    custom = { method, _ ->
        // Newer stock uses Optional.ofNullable in another event handler in this class.
        val repeatEnumType = ReelEnumConstructorFingerprint.originalClassDef.type
        method.indexOfFirstInstruction {
            getReference<MethodReference>()?.returnType == repeatEnumType
        } >= 0
    }
)

internal object ReelPlaybackFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("J"),
    filters = listOf(
        fieldAccess(
            definingClass = "Ljava/util/concurrent/TimeUnit;",
            name = "MILLISECONDS"
        ),
        anyInstruction(
            methodCall(
                name = "<init>",
                parameters = listOf("I", "L", "L"),
            ),
            methodCall(
                name = "<init>",
                parameters = listOf("I", "L", "L", "Z"), // 21.45+
            ),
            location = MatchAfterWithin(15)
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("L"),
            returnType = "I",
            location = MatchAfterWithin(5)
        )
    )
)

internal object YouTubeActivityOnCreateFingerprint : Fingerprint(
    definingClass = YOUTUBE_MAIN_ACTIVITY_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
