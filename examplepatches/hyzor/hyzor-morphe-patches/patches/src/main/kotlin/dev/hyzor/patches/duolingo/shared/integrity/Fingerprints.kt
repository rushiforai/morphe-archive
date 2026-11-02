package dev.hyzor.patches.duolingo.shared.integrity

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * `LoginRequest$EmailLoginRequest.<init>(String, String, String, LoginSignal)` in 6.104.3.
 *
 * The class itself is not obfuscated. Its fourth parameter is the login integrity signal; the
 * patch swaps that parameter for the app's own "empty" signal instance inside the constructor,
 * which covers every construction site (the email login builder, the shared-login lambda and the
 * Kotlinx serializer).
 *
 * The signal type is obfuscated, so the fourth parameter only pins that it is a reference type
 * (`"L"` is a prefix match in Morphe's parameter matching).
 */
object EmailLoginRequestCtorFingerprint : Fingerprint(
    definingClass = "Lcom/duolingo/data/signuplogin/LoginRequest\$EmailLoginRequest;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "L"),
)

/**
 * The email login request builder (`k3o.G0(String, String)` in 6.104.3, previously
 * `LoginFragmentViewModel`). It is the only method returning `EmailLoginRequest`, and it loads
 * the empty integrity signal with a `sget-object` before constructing the request.
 *
 * The class name is obfuscated and changed between versions, so this matches on the return type
 * and parameters instead.
 */
object EmailLoginBuilderFingerprint : Fingerprint(
    returnType = "Lcom/duolingo/data/signuplogin/LoginRequest\$EmailLoginRequest;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    isStatic = false,
    filters = listOf(
        opcode(Opcode.SGET_OBJECT),
    ),
)
