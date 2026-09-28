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
    returnType = "Lz/vF;",
    parameters = emptyList(),
)

/** Matches ZenSMS' existing body-to-OTP extractor. */
object ZenSmsOtpExtractorFingerprint : Fingerprint(
    definingClass = "Lz/Md;",
    name = "s",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    custom = { method, _ ->
        AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            AccessFlags.STATIC.isSet(method.accessFlags)
    },
)

/** Matches ZenSMS' existing per-candidate OTP validator. */
object ZenSmsOtpCandidateValidatorFingerprint : Fingerprint(
    definingClass = "Lz/Md;",
    name = "C",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lz/an;"),
    strings = listOf("order", "tracking", "transaction", "invoice", "no."),
)
