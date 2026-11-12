package arpit.morphe.patches.macrofactor.diet.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import arpit.morphe.patches.macrofactor.diet.shared.Constants.COMPATIBILITY_MACROFACTOR_DIET
import arpit.morphe.patches.macrofactor.premium.BuildCustomerInfoFingerprint
import arpit.morphe.patches.macrofactor.premium.extensionPatch
import arpit.morphe.patches.macrofactor.signature.signatureHashSpoofPatch
import arpit.morphe.util.requireRootMount

private const val EXTENSION_CLASS = "Larpit/morphe/extension/macrofactor/diet/UnlockPremiumPatch;"

/**
 * MacroFactor (`com.sbs.diet`) premium unlock.
 *
 * Same RevenueCat boundary as the Workouts patch: every `CustomerInfo` is built by the
 * 5-arg `CustomerInfoFactory.buildCustomerInfo` overload, so rewriting the subscriber
 * JSON there covers the online, offline and cached parse paths.
 *
 * Verified against 5.8.11 (versionCode 883):
 * - `CustomerInfoFactory.buildCustomerInfo(JSONObject, Date, VerificationResult,
 *   CustomerInfoOriginalSource, Z)` in `classes6`, `.registers 20`, `public final`,
 *   filter order `subscriber` → `getJSONObject` → `non_subscriptions` → `subscriptions`
 *   → `entitlements` (filters are shared with the Workouts patch).
 * - `AndroidUtilsLight.getPackageCertificateHashBytes` in `classes4`, `.registers 3`.
 * - `FlutterFragmentActivity.onCreate(Bundle)` in `classes6`, `.registers 3`.
 *
 * The app keeps Firebase App Check (Play Integrity provider) and Play Billing, so a
 * re-signed sideload still fails attestation — root mount only.
 */
@Suppress("unused")
val unlockPremiumDietPatch = bytecodePatch(
    name = "Unlock Premium (Root)",
    description = "Unlocks all premium features. Requires root: the patched build must " +
        "be mounted over the genuine Play-signed install — a re-signed sideload " +
        "will not work.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MACROFACTOR_DIET)

    availability(requireRootMount)

    dependsOn(
        // Shared extension module (context hook + both app extension classes).
        extensionPatch,
        // Computes the original cert SHA-1 from the input APK, so it works with this
        // app's own signing key (com.sbs.diet uses a different key than com.sbs.train).
        signatureHashSpoofPatch,
        changePackageInstallerPatch()
    )

    execute {
        // p1 is the JSONObject body; invoke-static writes no registers, so index 0 is safe.
        BuildCustomerInfoFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, ${EXTENSION_CLASS}->updateCustomerInfo(Lorg/json/JSONObject;)V
            """
        )
    }
}
