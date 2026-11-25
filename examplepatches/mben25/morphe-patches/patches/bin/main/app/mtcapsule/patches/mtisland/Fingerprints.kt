package app.mtcapsule.patches.mtisland

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Anchor fingerprint. Matches the static `SecretKey getOrCreateSecretKey()` of the
 * "pro version" repository class (`Lfo1;` in 15.7).
 *
 * Everything else in [unlockProPatch] is resolved relative to the class this matches in,
 * so this is the only fingerprint that has to search the whole app.
 */
object GetOrCreateSecretKeyFingerprint : Fingerprint(
    returnType = "Ljavax/crypto/SecretKey;",
    parameters = listOf(),
    strings = listOf("AndroidKeyStore", "pro_version_key", "AES", "CBC", "PKCS7Padding")
)

/**
 * Matches `static String decrypt(String, SecretKey)` of the same class (`Lfo1;->a()` in 15.7).
 */
object DecryptProStatusFingerprint : Fingerprint(
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

/**
 * Matches `Flow<Boolean> proStatusFlow()` (`Lfo1;->d()` in 15.7), which compiles to:
 *
 * ```
 * new-instance      v1, <lambda>
 * const/4           v2, 0x1        # missing in a debug build
 * invoke-direct     {v1, v0, p0, v2}, <lambda>-><init>(Flow, this, int)V
 * invoke-static     {v1}, <FlowKt>->distinctUntilChanged(Flow)Flow
 * move-result-object p0
 * return-object     p0
 * ```
 *
 * The lambda class is taken from the `invoke-direct` (filter index 2).
 */
object ProStatusFlowFingerprint : Fingerprint(
    parameters = listOf(),
    returnType = "L",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        opcode(Opcode.NEW_INSTANCE), // filter 0
        literal(0x1, opcodes = listOf(Opcode.CONST_4), MatchAfterImmediately()), // filter 1
        opcode(Opcode.INVOKE_DIRECT, MatchAfterImmediately()), // filter 2
        opcode(Opcode.INVOKE_STATIC, MatchAfterWithin(1)),
        opcode(Opcode.RETURN_OBJECT, MatchAfterWithin(1))
    )
)
