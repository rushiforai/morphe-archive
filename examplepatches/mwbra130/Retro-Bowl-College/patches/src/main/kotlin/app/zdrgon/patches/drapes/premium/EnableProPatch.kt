package app.zdrgon.patches.drapes.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.drapes.shared.Constants.COMPATIBILITY_DRAPES

/**
 * Enables Drapes Pro by pinning the app's single entitlement
 * computation to PRO.
 *
 * The billing manager's state method scans the Play purchase list for
 * the "drapes_pro" product and returns an enum (LOADING / FREE / PRO);
 * the refresh coroutine stores that value into the state holder that
 * every feature gate reads — ads, image effects, auto wallpapers, and
 * favorites sync all compare the stored state against PRO. Pinning the
 * computation makes every refresh store PRO. No purchase object,
 * token, or server reply is fabricated; the purchase flow itself is
 * untouched.
 *
 * Requires "Bypass PairIP license check" (declared as a dependency
 * below): Drapes carries PairIP's license check, which blocks
 * re-signed builds before the app can start.
 *
 * Verified against Drapes 3.9.3 by dex read (see recon): the state
 * method's only caller is the refresh coroutine, and the PRO enum
 * constant it must return is the third declared constant of the enum.
 */
@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables Drapes Pro: no advertisements, image effects (blur, grayscale, " +
        "dimming), auto wallpapers, and favorites sync. Requires 'Bypass PairIP license " +
        "check'. Drapes 3.9.3 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DRAPES)

    dependsOn(bypassPairIpLicenseCheckPatch)

    execute {
        EntitlementStateFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Llb6;->c:Llb6;
                return-object v0
            """,
        )
    }
}
