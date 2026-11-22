package app.template.patches.amberit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_AMBERIT

/**
 * Removes AmberIT's startup location gate.
 *
 * AmberIT will not open until it has read the device location and had the
 * backend resolve a country from it. With no location permission it shows
 * a blocking permission dialog; with the wrong country it shows "Dear
 * user, this app will work only in Bangladesh." and blocks the UI. Both
 * dialogs have no way to continue.
 *
 * This patch applies the two client-side gates that produce those dialogs:
 *
 *   1. Lhb4;.f()Z -> always false
 *      "should show GPS restriction dialog". Returning false means the
 *      restriction dialog is never shown, registerForGPSService() is never
 *      called and l() never runs its permission check. This covers all 13
 *      call sites in the app, because each of them reads this one method.
 *
 *   2. HasLocationPermissionKt.hasLocationPermission(Context)Z -> always true
 *      Stops the in-chat share-location feature from requesting location.
 *
 * WHAT THIS DOES NOT DO: the country allow-list and the per-country feature
 * flags (paid call, SMS, ...) come from the backend via IP2CountryServiceApi.
 * This patch stops the app from *asking* for location; it cannot change
 * what the server decides about an account. A blocked account or region can
 * still be refused at login or at call time.
 */
@Suppress("unused")
val amberItLocationGatePatch = patch(
    name = "Disable location gate",
    description = "Stops AmberIT from requiring device location at startup. Forces hb4.f() (\"should show GPS restriction dialog\") to false, which suppresses the GPS alert and the blocking location-permission dialog app-wide, and makes the chat share-location permission check return true. The country allow-list itself is server-side and is not affected. Verified on AmberIT 1.3.2 (versionCode 103021).",
    default = true
) {
    compatibleWith(COMPATIBILITY_AMBERIT)

    execute {
        // 1) Lhb4;.f()Z -> return false.
        //
        // f() ends with `const/4 v0, 0x0` / `return v0` on the :cond_0 path.
        // Rather than rewrite that const (it is reached by two different
        // `if` branches, and editing it changes the meaning of the branches
        // in the middle of the method), insert an early return at the very
        // start of the method.
        //
        // Instruction index 0 is never a branch target in a well-formed
        // method, so a plain addInstructions there is safe -- this is the
        // same rule the SAI and BDVPN patches follow (never insert before a
        // label).
        AmberItGpsRestrictionFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("hb4.f: no implementation")
            require(instructions.isNotEmpty()) { "hb4.f: empty method" }
            it.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // 2) HasLocationPermissionKt.hasLocationPermission -> return true.
        //
        // Same approach: early return at index 0. The method's only other
        // `return` paths are behind :cond_0 and a `if-nez` chain, so index 0
        // is not a branch target.
        AmberItLocationPermissionFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("HasLocationPermissionKt.hasLocationPermission: no implementation")
            require(instructions.isNotEmpty()) {
                "HasLocationPermissionKt.hasLocationPermission: empty method"
            }
            it.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
