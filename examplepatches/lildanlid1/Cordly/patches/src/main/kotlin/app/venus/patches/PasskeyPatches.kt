package app.venus.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

internal const val SECURITY_KEY_MODULE = "Lcom/discord/security_key/SecurityKeyManagerModule;"

/** Google Play Services' wording for error 50152, in both the passkey and the security key flow. */
internal const val RP_ID_ERROR = "RP ID cannot be validated"

/** Shown instead, because the real reason can't be fixed by any patch. */
internal const val PASSKEY_HINT = "Passkeys and security keys only work in Discord signed by Discord, " +
    "so they can't work in patched Discord. Tap Verify with something else to use an authenticator app, " +
    "SMS or a backup code."

/** Instructions [explainPasskeyError] adds before Discord's own reject code, counting the nop its label lands on. */
internal const val PASSKEY_HINT_GUARD_SIZE = 12

/**
 * Every passkey and security key failure goes through this one SecurityKeyManagerModule.reject(code, message, cause).
 * Google refuses error 50152 because the patched app isn't signed with Discord's certificate, which
 * discord.com/.well-known/assetlinks.json requires. Nothing can fake that, so only the message changes:
 * the error code, the cause and everything else Discord does are untouched. 6 registers, 4 of them parameters: v0-v1 are free.
 */
internal fun explainPasskeyError(method: MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("Security key reject has no code")
    if (method.definingClass != SECURITY_KEY_MODULE || method.name != "reject" || method.returnType != "V" ||
        method.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Throwable;") ||
        implementation.registerCount - 4 < 2)
        throw PatchException("SecurityKeyManagerModule.reject ABI changed")
    requireUnpatched(method, "Passkeys and security keys")
    method.addInstructions(0, """
        move-object v0, p2
        if-nez v0, :venus_passkey_message
        if-eqz p3, :venus_passkey_reject
        invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :venus_passkey_reject
        :venus_passkey_message
        const-string v1, "$RP_ID_ERROR"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v1
        if-eqz v1, :venus_passkey_reject
        const-string p2, "$PASSKEY_HINT"
        :venus_passkey_reject
        nop
    """)
}

/** Hidden helper: every Cordly and privacy patch pulls it in, so anyone who patches gets the clear message. */
internal val passkeyErrorHint = bytecodePatch {
    execute {
        explainPasskeyError(Fingerprint(
            definingClass = SECURITY_KEY_MODULE,
            name = "reject",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Throwable;")
        ).method)
    }
}
