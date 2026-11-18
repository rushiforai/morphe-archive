package io.github.kirby1997.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Tinder's upsell/paywall popups are DialogFragments that share one disable
// strategy: at the top of onCreateView, dismiss the fragment and return a null
// view so nothing renders and the transaction is torn down. Each patch below is a
// distinct, independently selectable patch; they are colocated because they share
// DISMISS_DIALOG_FRAGMENT rather than because they are one unit.
private const val DISMISS_DIALOG_FRAGMENT = """
    invoke-virtual {p0}, Landroidx/fragment/app/q;->dismissAllowingStateLoss()V
    const/4 p1, 0x0
    return-object p1
"""

// "Be Seen Faster / Upgrade Likes" Platinum upsell popup.
object PlatinumLikesUpsellOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/mylikes/ui/dialog/PlatinumLikesUpsellDialogFragment;",
    name = "onCreateView",
)

@Suppress("unused")
val disablePlatinumLikesUpsellPatch = bytecodePatch(
    name = "Disable Platinum Likes upsell",
    description = "Suppresses the \"Be Seen Faster / Upgrade Likes\" Tinder Platinum popup.",
) {
    compatibleWith(Constants.TINDER)

    execute {
        PlatinumLikesUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
    }
}

// "You've liked amazing people! Be Seen faster with Tinder Platinum" upsell.
object MyLikesUpsellOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/mylikes/ui/dialog/MyLikesUpsellDialogFragment;",
    name = "onCreateView",
)

@Suppress("unused")
val disableMyLikesUpsellPatch = bytecodePatch(
    name = "Disable MyLikes upsell",
    description = "Suppresses the \"You've liked amazing people\" Tinder Platinum popup on the Likes Sent tab.",
) {
    compatibleWith(Constants.TINDER)

    execute {
        MyLikesUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
    }
}

// Standard Boost upsell popup ("Get Tinder Plus / Gold / Platinum" when out of Boosts).
object BoostUpsellOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/boost/ui/upsell/BoostUpsellDialogFragment;",
    name = "onCreateView",
)

@Suppress("unused")
val disableBoostUpsellPatch = bytecodePatch(
    name = "Disable Boost upsell",
    description = "Suppresses the standard Boost upsell popup (\"Get Tinder Plus / Gold / Platinum\" prompt that surfaces when out of Boosts).",
) {
    compatibleWith(Constants.TINDER)

    execute {
        BoostUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
    }
}

// HeadlessPurchaseUpsellDialogFragment — mid-flow one-tap purchase confirmation.
object HeadlessPurchaseUpsellOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/headlesspurchaseupsell/internal/view/HeadlessPurchaseUpsellDialogFragment;",
    name = "onCreateView",
)

@Suppress("unused")
val disableHeadlessPurchaseUpsellPatch = bytecodePatch(
    name = "Disable headless purchase upsell",
    description = "Suppresses the headless-purchase confirmation upsell popup.",
) {
    compatibleWith(Constants.TINDER)

    execute {
        HeadlessPurchaseUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
    }
}

// PrimetimeBoostUpsellDialogFragment — Primetime Boost variant of the Boost upsell.
object PrimetimeBoostUpsellOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/primetimeboostupsell/internal/view/PrimetimeBoostUpsellDialogFragment;",
    name = "onCreateView",
)

@Suppress("unused")
val disablePrimetimeBoostUpsellPatch = bytecodePatch(
    name = "Disable Primetime Boost upsell",
    description = "Suppresses the Primetime Boost upsell popup.",
) {
    compatibleWith(Constants.TINDER)

    execute {
        PrimetimeBoostUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
    }
}

// SecretAdmirerUpsellDialogFragment — Secret Admirer (Gold) upsell.
object SecretAdmirerUpsellOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/feature/secretadmirer/internal/view/SecretAdmirerUpsellDialogFragment;",
    name = "onCreateView",
)

@Suppress("unused")
val disableSecretAdmirerUpsellPatch = bytecodePatch(
    name = "Disable Secret Admirer upsell",
    description = "Suppresses the Secret Admirer (Gold) upsell popup.",
) {
    compatibleWith(Constants.TINDER)

    execute {
        SecretAdmirerUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
    }
}

// PaywallDialogFragment — dynamic server-driven paywall sheet LaunchPaywallFlow shows
// for most upgrade prompts. Many non-popup entry points surface this same fragment,
// so disabling it also removes the legitimate upgrade UI — default-off.
object DynamicPaywallOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/dynamicpaywall/PaywallDialogFragment;",
    name = "onCreateView",
)

@Suppress("unused")
val disableDynamicPaywallPatch = bytecodePatch(
    name = "Disable dynamic paywall sheet",
    description = "Suppresses the generic server-driven paywall sheet (PaywallDialogFragment) that LaunchPaywallFlow renders for most upgrade prompts.",
    default = true,
) {
    compatibleWith(Constants.TINDER)

    execute {
        DynamicPaywallOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
    }
}
