package patches.homeassistant

import app.morphe.patcher.patch.bytecodePatch
import patches.shared.projectedCarBytecode
import patches.shared.projectedCarResources

private val projectedResources = projectedCarResources(
    originalInput, "io.homeassistant.companion.android.vehicle.HaCarAppService",
    "androidx.car.app.category.IOT", "io.homeassistant.companion.android.launch.LaunchActivity",
    setOf("com.google.android.gms.permission.CAR_FUEL", "com.google.android.gms.permission.CAR_SPEED",
        "com.google.android.gms.permission.CAR_MILEAGE"),
    "Home Assistant (Automotive)",
)
private val projectedBytecode = projectedCarBytecode(originalInput)

@Suppress("unused")
val androidAutoPatch = bytecodePatch(
    name = "Android Auto",
    description = "Ports the Automotive build to Android Auto and compatible templated hosts. " +
        "Keeps Home Assistant's native car screens, phone sign-in and real host-provided car data, " +
        "and retains Automotive behavior on devices that provide it.",
) {
    compatibleWith(homeAssistantAutomotive)
    dependsOn(originalInput, carHostPatch, projectedResources, projectedBytecode)
}
