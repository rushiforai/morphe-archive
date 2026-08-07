package app.heinrich26.patches.mtisland

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.*
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * See:
 * https://github.com/MorpheApp/morphe-patcher/blob/main/docs
 * https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md
 *
 * Declaring fingerprints as classes is not required, but if a fingerprint fails
 * to match then the exception stack trace will include the fingerprint name.
 */
object GetOrCreateSecretKeyFingerprint : Fingerprint(
    // accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Ljavax/crypto/SecretKey;",
    parameters = listOf(),
    strings = listOf("AndroidKeyStore", "pro_version_key", "AES", "CBC", "PKCS7Padding")
)

object DecodeFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;", "Ljavax/crypto/SecretKey;"),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        methodCall(smali = "Landroid/util/Base64;->decode(Ljava/lang/String;I)[B"),

        string("AES/CBC/PKCS7Padding"),
        methodCall(
            smali = "Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;",
            location = MatchAfterImmediately()
        )
    )
)

object GetProStatusFlowFingerprint : Fingerprint(
    parameters = listOf(),
    returnType = "L",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        opcode(Opcode.NEW_INSTANCE), // filter 0
        // missing in the debug build
        literal(0x1, opcodes = listOf(Opcode.CONST_4), MatchAfterImmediately()),
        opcode(Opcode.INVOKE_DIRECT, MatchAfterImmediately()), // filter 2
        // debug has a cast here
        opcode(Opcode.INVOKE_STATIC, MatchAfterWithin(1)),
        opcode(Opcode.RETURN_OBJECT, MatchAfterWithin(1))
    )
)

/*

object GetProStatusFlowLambdaFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
)*/
