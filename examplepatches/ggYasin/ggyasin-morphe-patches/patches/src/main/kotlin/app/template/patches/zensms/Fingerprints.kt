package app.template.patches.zensms

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** Matches PremiumManager.hasPremium(): boolean. */
object HasPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/zensms/app/domain/premium/PremiumManager;",
    name = "hasPremium",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("last_verified_time", "Premium verification stale ("),
)

/** Matches PremiumManager.isPremium(): StateFlow<Boolean>. */
object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/zensms/app/domain/premium/PremiumManager;",
    name = "isPremium",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    custom = { method, _ -> method.returnType in setOf("Lz/vF;", "Lz/NP;") },
)

/** Matches ZenSMS' existing body-to-OTP extractor. */
object ZenSmsOtpExtractorFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf(
        "body", "toUpperCase(...)",
        """(?i)\bPIN\s*(?:is|:)\s*(\d{4,6})\b""",
        """(?i)\b(?:passcode|password)\s*(?:is|:)\s*(\d{4,8})\b""",
    ),
    custom = { method, _ ->
        (method.definingClass to method.name) in setOf("Lz/Md;" to "s", "Lz/lY;" to "t") &&
            AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            AccessFlags.STATIC.isSet(method.accessFlags)
    },
)

/** Matches ZenSMS' existing per-candidate OTP validator. */
object ZenSmsOtpCandidateValidatorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    strings = listOf("order", "tracking", "transaction", "invoice", "no."),
    custom = { method, _ ->
        (method.definingClass to method.name) in setOf("Lz/Md;" to "C", "Lz/lY;" to "K") &&
            method.parameterTypes.map { it.toString() } in listOf(
                listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lz/an;"),
                listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lz/uq;"),
            )
    },
)
