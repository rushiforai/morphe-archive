package app.salaat.patches.location

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.salaat.patches.integrity.neutralizeSignatureCheckPatch
import app.salaat.patches.shared.Constants.COMPATIBILITY_SALAAT
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * `GMSLocationProvider.getCurrentLocation(client, …)` asks for a one-shot fix with
 * `LocationRequest.create().setExpirationDuration(10m)`, keeping create()'s defaults:
 * BALANCED priority and a 1 hour interval. Google Play services answers that with an immediate
 * fused fix; microG honours the interval and schedules its next low-power scan up to an hour
 * later, so the setup wizard sits on "locating" until the 10 minutes run out.
 */
private object GetCurrentLocationFingerprint : Fingerprint(
    definingClass = "Lorg/hicham/salaat/geolocation/GMSLocationProvider;",
    name = "getCurrentLocation",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(
            smali = "Lcom/google/android/gms/location/LocationRequest;->" +
                "setExpirationDuration(J)Lcom/google/android/gms/location/LocationRequest;",
        ),
    ),
)

@Suppress("unused")
val fixMicrogLocationPatch = bytecodePatch(
    name = "Fix Location Detection on microG",
    description = "Makes the one-shot current-location request ask for a high-accuracy fix " +
        "within seconds instead of the hourly balanced-power default. On microG the default " +
        "never returns a fix, so the setup wizard and \"use my location\" stay stuck on " +
        "\"locating\". No effect on how often the app refreshes location in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SALAAT)

    dependsOn(neutralizeSignatureCheckPatch)

    execute {
        GetCurrentLocationFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val callIndex = fingerprint.instructionMatches.first().index
            val call = method.getInstruction<FiveRegisterInstruction>(callIndex)
            val request = method.getInstruction<OneRegisterInstruction>(callIndex + 1).registerA
            // The wide pair only carried the expiration constant, so it is free to reuse.
            val wide = call.registerD

            method.addInstructions(
                callIndex + 2,
                """
                    const/16 v$wide, 0x64
                    invoke-virtual {v$request, v$wide}, Lcom/google/android/gms/location/LocationRequest;->setPriority(I)Lcom/google/android/gms/location/LocationRequest;
                    const-wide/16 v$wide, 0x1388
                    invoke-virtual {v$request, v$wide, v${wide + 1}}, Lcom/google/android/gms/location/LocationRequest;->setInterval(J)Lcom/google/android/gms/location/LocationRequest;
                    const-wide/16 v$wide, 0x3e8
                    invoke-virtual {v$request, v$wide, v${wide + 1}}, Lcom/google/android/gms/location/LocationRequest;->setFastestInterval(J)Lcom/google/android/gms/location/LocationRequest;
                """,
            )
        }
    }
}
