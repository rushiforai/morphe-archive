package ch.broillet.veloce.patches.homeassistant

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import ch.broillet.veloce.patches.shared.hostPackageName
import ch.broillet.veloce.patches.shared.hostPackageOption
import ch.broillet.veloce.patches.shared.certificateDigest
import ch.broillet.veloce.patches.shared.hostCertificateOption
import org.w3c.dom.Element

val customCarHostPatch = resourcePatch(
    name = "Allow Veloce car host",
    description = "Trust Veloce (or a custom host package and signing certificate) in Home Assistant full. Preserves validation of other hosts. Car telemetry requires host support.",
) {
    compatibleWith(Compatibility(packageName = "io.homeassistant.companion.android", name = "Home Assistant full",
        targets = listOf(AppTarget(version = null, isExperimental = true,
            description = "Verified patch application on 2026.10.1-full; requires HaCarAppService and hosts_allowlist."))))
    val hostCertificate by hostCertificateOption()
    val hostPackage by hostPackageOption()

    execute {
        document("AndroidManifest.xml").use { document ->
            val android = "http://schemas.android.com/apk/res/android"
            val services = document.getElementsByTagName("service")
            val service = (0 until services.length).map { services.item(it) as Element }.singleOrNull {
                it.getAttributeNS(android, "name") in setOf("io.homeassistant.companion.android.vehicle.HaCarAppService", ".vehicle.HaCarAppService")
            } ?: throw PatchException("This Home Assistant APK does not declare HaCarAppService. Use the full build.")
            if (service.getAttributeNS(android, "exported") != "true") throw PatchException("HaCarAppService is not exported")
        }
        document("res/values/arrays.xml").use { document ->
            val arrays = document.documentElement.childNodes
            val array = (0 until arrays.length).mapNotNull { arrays.item(it) as? Element }.singleOrNull {
                it.getAttribute("name") == "hosts_allowlist"
            } ?: throw PatchException("Home Assistant's hosts_allowlist was not found")
            val entry = "${certificateDigest(checkNotNull(hostCertificate))},${hostPackageName(checkNotNull(hostPackage))}"
            if ((0 until array.childNodes.length).none { array.childNodes.item(it).textContent.replace(" ", "") == entry }) {
                array.appendChild(document.createElement("item").apply { textContent = entry })
            }
        }
    }
}
