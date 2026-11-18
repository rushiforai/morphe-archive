package app.morphe.patches.moviebox

import app.morphe.patcher.Fingerprint

// ============================================================================
// PREMIUM, AD REMOVAL & RESOLUTION FINGERPRINTS
// ============================================================================

/**
 * Targets Lcom/transsion/memberapi/MembershipDetailType$a;->a(Lcom/transsion/memberapi/MemberInfo;)Lcom/transsion/memberapi/MembershipDetailType;
 */
object MembershipDetailTypeFingerprint : Fingerprint(
    definingClass = "Lcom/transsion/memberapi/MembershipDetailType\$a;",
    name = "a",
    returnType = "Lcom/transsion/memberapi/MembershipDetailType;",
    parameters = listOf("Lcom/transsion/memberapi/MemberInfo;")
)

/**
 * Targets Lcom/transsion/member/premium/PremiumProvider$b;->e(Lcom/transsion/memberapi/MemberDetail;)V
 */
object PremiumProviderCallbackFingerprint : Fingerprint(
    definingClass = "Lcom/transsion/member/premium/PremiumProvider\$b;",
    name = "e",
    returnType = "V",
    parameters = listOf("Lcom/transsion/memberapi/MemberDetail;")
)

/**
 * Targets Lhi/b;->c(Z)V
 */
object AdFreeToggleFingerprint : Fingerprint(
    definingClass = "Lhi/b;",
    name = "c",
    returnType = "V",
    parameters = listOf("Z")
)

/**
 * Targets Lcom/transsion/subroom/activity/MainDialogAdManager$loadAd$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
 */
object MainDialogAdFingerprint : Fingerprint(
    definingClass = "Lcom/transsion/subroom/activity/MainDialogAdManager\$loadAd\$1;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

/**
 * Targets Lco/h;->setVipResolution(ZI)V
 */
object LongVideoVipResolutionFingerprint : Fingerprint(
    definingClass = "Lco/h;",
    name = "setVipResolution",
    returnType = "V",
    parameters = listOf("Z", "I")
)

/**
 * Targets Lcom/transsnet/downloader/adapter/r; VIP resolution check
 */
object DownloaderVipResolutionFingerprint : Fingerprint(
    definingClass = "Lcom/transsnet/downloader/adapter/r;",
    strings = listOf(" --> vipResolutionRatio = ")
)
