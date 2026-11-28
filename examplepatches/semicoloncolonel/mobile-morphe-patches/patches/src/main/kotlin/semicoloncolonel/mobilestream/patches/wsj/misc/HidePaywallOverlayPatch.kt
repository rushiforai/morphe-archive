package semicoloncolonel.mobilestream.patches.wsj.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants

// WSJ phone (Play build).
//
// Full-screen paywall when opening an article is driven by
// DjPaywallRoadblock.subscribeToPaywallState. That method runs the
// content-access decision and triggers the Compose paywall UI.
//
// Strategy: invoke the "allow / continue" callback (first Function0),
// then return so the paywall UI path never runs.
//
// Article text may still be limited by the server (Piano / decision API).
// This only skips the local roadblock UI.

internal object SubscribeToPaywallStateFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/paywall/content_access/roadblock/DjPaywallRoadblock;",
    name = "subscribeToPaywallState",
    returnType = "V",
    parameters = listOf(
        "Lcom/dowjones/paywall/content_access/data/domain/ArticleMetaData;",
        "Lcom/dowjones/paywall/content_access/data/domain/PaywallDecisionRequest;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
    ),
)

// Optional safety net: main Compose entry points (dialog / screens).
// Harmless if the roadblock never reaches them.

private const val DIALOG_KT =
    "Lcom/dowjones/paywall/android/ui/dialog/PaywallDialogKt;"
private const val LOGIN_OR_SUBSCRIBE_KT =
    "Lcom/dowjones/paywall/android/ui/screen/LoginOrSubscribeLayoutKt;"
private const val PAYWALL_SCREEN_KT =
    "Lcom/dowjones/paywall/android/ui/screen/PaywallScreenKt;"
private const val SUBSCRIBE_LAYOUT_KT =
    "Lcom/dowjones/paywall/android/ui/screen/SubscribeLayoutKt;"

internal object PaywallDialogFingerprint : Fingerprint(
    definingClass = DIALOG_KT,
    name = "PaywallDialog",
    returnType = "V",
)

internal object PaywallDialogWithStateFingerprint : Fingerprint(
    definingClass = DIALOG_KT,
    name = "PaywallDialogWithState",
    returnType = "V",
)

internal object VideoPaywallOverlayFingerprint : Fingerprint(
    definingClass = DIALOG_KT,
    name = "VideoPaywallOverlay",
    returnType = "V",
)

internal object LoginOrSubscribeLayoutFingerprint : Fingerprint(
    definingClass = LOGIN_OR_SUBSCRIBE_KT,
    name = "LoginOrSubscribeLayout",
    returnType = "V",
)

internal object PaywallScreenFingerprint : Fingerprint(
    definingClass = PAYWALL_SCREEN_KT,
    name = "PaywallScreen-NywbWXI",
    returnType = "V",
)

internal object SubscribeLayoutFingerprint : Fingerprint(
    definingClass = SUBSCRIBE_LAYOUT_KT,
    name = "SubscribeLayout",
    returnType = "V",
)

@Suppress("unused")
val hidePaywallOverlayPatch = bytecodePatch(
    name = "Hide paywall overlay",
    description = "Skips the article paywall roadblock and suppresses Compose paywall UI.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val roadblock = SubscribeToPaywallStateFingerprint.method
            ?: throw PatchException("DjPaywallRoadblock.subscribeToPaywallState not found")

        // p0 = this
        // p1 = ArticleMetaData
        // p2 = PaywallDecisionRequest
        // p3 = Function0  (allow / continue reading)
        // p4..p6 = Function1 (paywall / other paths)
        roadblock.addInstructions(
            0,
            """
                invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
                return-void
            """.trimIndent(),
        )

        // Safety net: if anything still reaches the Compose UI, no-op it.
        fun returnEarly(fp: Fingerprint) {
            fp.methodOrNull?.addInstructions(0, "return-void")
        }

        returnEarly(PaywallDialogFingerprint)
        returnEarly(PaywallDialogWithStateFingerprint)
        returnEarly(VideoPaywallOverlayFingerprint)
        returnEarly(LoginOrSubscribeLayoutFingerprint)
        returnEarly(PaywallScreenFingerprint)
        returnEarly(SubscribeLayoutFingerprint)
    }
}