package patches.plugshare

import app.morphe.patcher.patch.bytecodePatch
import patches.shared.projectedCarBytecode
import patches.shared.projectedCarResources

private val projectedResources = projectedCarResources(
    originalInput, "com.xatori.plugshare.PlugShareCarAppService", "androidx.car.app.category.POI", null,
    setOf("com.google.android.gms.permission.CAR_FUEL"), "PlugShare (Automotive)",
)
private val projectedBytecode = projectedCarBytecode(originalInput)

@Suppress("unused")
val androidAutoPatch = bytecodePatch(
    name = "Android Auto",
    description = "Ports the Automotive build to Android Auto and compatible templated hosts, " +
        "including its charging maps, searches, bookmarks and sign-in screens. " +
        "Accepts compatible hosts without a package or signing-key allow-list and uses their real car-data capabilities.",
) {
    compatibleWith(plugShare)
    dependsOn(originalInput, carHostPatch, projectedResources, projectedBytecode)
}
