package gcam.edgetpu

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PreFilteringPipelineInitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/nio/ByteBuffer;", "Ljava/nio/ByteBuffer;", "L"),
    filters = listOf(
        methodCall(
            name = "nativeCreate",
            parameters = listOf("Ljava/nio/ByteBuffer;", "Ljava/nio/ByteBuffer;", "[B"),
            returnType = "J"
        ),
        opcode(Opcode.MOVE_RESULT_WIDE),
        opcode(Opcode.IPUT_WIDE)
    )
)

object AllInConfigConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "L", "L"),
    filters = listOf(
        methodCall(
            definingClass = "Lj$/util/Objects;",
            name = "requireNonNullElse",
            parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
            returnType = "Ljava/lang/Object;"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT),
        opcode(Opcode.CHECK_CAST),
        opcode(Opcode.IPUT_OBJECT)
    )
)

/**
 * Matches the static initializer of the All-In device enum (`Laadq;`).
 *
 *   new-instance v0, Laadq;
 *   const-string v1, "DEVICE_UNSPECIFIED"
 *   ...
 *   invoke-direct {v0, v1, ...}, Laadq;-><init>(...)V
 *   sput-object v0, Laadq;->a:Laadq;   <- match index 2: the DEVICE_UNSPECIFIED field
 */
object AllInDeviceEnumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("DEVICE_UNSPECIFIED"),
        methodCall(
            opcode = Opcode.INVOKE_DIRECT,
            name = "<init>",
            location = MatchAfterWithin(3)
        ),
        opcode(Opcode.SPUT_OBJECT, location = MatchAfterImmediately())
    )
)