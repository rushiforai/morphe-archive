package io.github.kirby1997.patches.hidratespark

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

object GetIfUserHasPremiumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    definingClass = "Lcom/hidrate/iap/BillingRepository;",
    name = "getIfUserHasPremium",
)

object IsPurchasedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    definingClass = "Lcom/hidrate/iap/localdb/GlowStudioEntitlement;",
    name = "isPurchased",
)

@Suppress("unused")
val disablePaymentCheckPatch = bytecodePatch(
    name = "Disable payment check",
    description = "Bypasses the premium subscription check so all features are unlocked.",
) {
    compatibleWith(Constants.HIDRATESPARK)

    execute {
        // BillingRepository.getIfUserHasPremium() → always true.
        GetIfUserHasPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // GlowStudioEntitlement.isPurchased() → always true.
        IsPurchasedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
