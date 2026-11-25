package patches.magicearth

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element
import patches.shared.androidAutoHostVisibility

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val CAR_SERVICE = "com.generalmagic.magicearth.car_connectivity_plugin.AndroidAutoService"

internal fun allowCustomCarHostBinding(manifest: Document) {
    val services = manifest.getElementsByTagName("service")
    val service = (0 until services.length).map { services.item(it) as Element }
        .single { it.getAttributeNS(ANDROID, "name") == CAR_SERVICE }
    check(service.getAttributeNS(ANDROID, "exported") == "true") { "Magic Earth car service is not exported" }
    check(service.getAttributeNS(ANDROID, "permission") == "androidx.car.app.ACCESS_SURFACE") {
        "Magic Earth car binding permission changed or patch already applied"
    }
    val actions = service.getElementsByTagName("action")
    check((0 until actions.length).map { actions.item(it) as Element }
        .any { it.getAttributeNS(ANDROID, "name") == "androidx.car.app.CarAppService" }) {
        "Magic Earth car service discovery changed"
    }
    // This attribute gates incoming bind requests before HostValidator is reached.
    // Keep uses-permission declarations and the library's caller-UID handshake checks.
    service.removeAttributeNS(ANDROID, "permission")
}

@Suppress("unused")
val allowCustomCarHosts = resourcePatch(
    name = "Allow custom Android Auto hosts",
    description = "Removes Magic Earth's service binding permission so compatible custom HUD hosts can reach its existing allow-all host validator. Keeps navigation discovery and caller-UID validation.",
) {
    compatibleWith(magicEarth)
    dependsOn(originalInput, androidAutoHostVisibility)
    execute { document("AndroidManifest.xml").use { allowCustomCarHostBinding(it) } }
}
