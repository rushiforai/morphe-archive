package fr.josselinonduty.snapchat.location

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.resourcePatch
import fr.josselinonduty.shared.disableComponents
import fr.josselinonduty.shared.removeUsesPermissions
import fr.josselinonduty.shared.returnNull
import fr.josselinonduty.snapchat.SNAPCHAT
import fr.josselinonduty.snapchat.snapBytecodePatch

// Anchor (14.33.1.0: Lxu1;->a()Ljava/lang/String;): picks "fused"/"gps"/"network"
// from LocationManager.getAllProviders(). Both callers (last-known read and
// requestLocationUpdates) short-circuit to "no provider" on null, so returning
// null stops Java location reads and update registration without throwing.
// Spec: S3.1.
object LocationProviderFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("fused", "gps", "network"),
    filters = listOf(
        methodCall(definingClass = "Landroid/location/LocationManager;", name = "getAllProviders"),
    ),
)

// Spec: S3.1, S3.3. Anchors: <uses-permission> and Loda component names (not obfuscated).
// LodaDaemonService has foregroundServiceType="location": it would throw SecurityException
// without FOREGROUND_SERVICE_LOCATION, so the Loda components are disabled too.
private val removeLocationPermissionsPatch = resourcePatch {
    compatibleWith(SNAPCHAT)
    execute {
        document("AndroidManifest.xml").use {
            it.removeUsesPermissions(
                setOf(
                    "android.permission.ACCESS_FINE_LOCATION",
                    "android.permission.ACCESS_COARSE_LOCATION",
                    "android.permission.ACCESS_BACKGROUND_LOCATION",
                    "android.permission.ACCESS_MEDIA_LOCATION",
                    "android.permission.FOREGROUND_SERVICE_LOCATION",
                ),
            )
            it.disableComponents(
                setOf(
                    "com.snap.location.loda.bindings.LodaDaemonService",
                    "com.snap.location.loda.bindings.LodaMainAppMailboxService",
                    "com.snap.location.loda.bindings.GeofenceBroadcastReceiver",
                ),
            )
        }
    }
}

val disableLocationPatch = snapBytecodePatch(
    name = "Disable location",
    description = "Removes location permissions and reports no usable location provider.",
) {
    dependsOn(removeLocationPermissionsPatch)
    execute { LocationProviderFingerprint.method.returnNull() }
}
