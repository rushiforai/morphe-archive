package ch.broillet.veloce.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import org.w3c.dom.Element

private val carServicePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            if (manifest.getAttribute("package") != "com.waze") throw PatchException("This patch requires Waze (com.waze)")
            val android = "http://schemas.android.com/apk/res/android"
            val services = document.getElementsByTagName("service")
            val service = (0 until services.length).map { services.item(it) as Element }.singleOrNull {
                it.getAttributeNS(android, "name") in setOf("com.waze.car_lib.WazeCarAppService", ".car_lib.WazeCarAppService")
            } ?: throw PatchException("This Waze build does not expose the expected AndroidX WazeCarAppService")
            val actions = service.getElementsByTagName("action")
            if ((0 until actions.length).none {
                (actions.item(it) as Element).getAttributeNS(android, "name") == "androidx.car.app.CarAppService"
            }) throw PatchException("WazeCarAppService has no AndroidX car-service intent filter")

            service.setAttributeNS(android, "android:exported", "true")
            service.setAttributeNS(android, "android:permission", "")
        }
    }
}

val customCarHostPatch = bytecodePatch(
    name = "Allow custom car hosts",
    description = "Allow Veloce and other custom AndroidX car hosts to connect to Waze. Disables Waze's AndroidX host allowlist.",
) {
    compatibleWith(Compatibility(
        packageName = "com.waze",
        name = "Waze",
        targets = listOf(AppTarget(version = null, isExperimental = true,
            description = "Requires WazeCarAppService and a matching AndroidX HostValidator.")),
    ))
    dependsOn(carServicePatch)

    execute {
        val validator = Fingerprint(
            isStatic = false,
            returnType = "Z",
            parameters = listOf("L"),
            filters = listOf(string("Accepted - Validator disabled, all hosts allowed")),
        ).matchAllOrNull()
        if (validator?.size != 1) throw PatchException(
            "Expected one AndroidX HostValidator, found ${validator?.size ?: 0}. Use an original Waze APK with AndroidX car support."
        )
        validator.single().method.returnEarly(true)
    }
}
