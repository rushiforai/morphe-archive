package patches.shared

import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

/** Exercise the supplied publishers' decoded manifests, without another synthetic fixture format. */
class ProjectedCarAppManifestTest {
    private val android = "http://schemas.android.com/apk/res/android"
    private fun input(app: String): Document {
        val path = System.getenv("${app}_ORIGINAL_MANIFEST")
        assumeNotNull(path)
        return DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(File(path!!))
    }
    private fun Document.elements(tag: String) = getElementsByTagName(tag).let { nodes ->
        (0 until nodes.length).map { nodes.item(it) as Element }
    }
    private fun Document.named(tag: String, name: String) = elements(tag).single { it.getAttributeNS(android, "name") == name }

    @Test fun injectedEntriesReceiveDistinctIdsWithoutChangingPublisherResources() {
        for (app in listOf("HOMEASSISTANT", "PLUGSHARE")) {
            val path = System.getenv("${app}_ORIGINAL_PUBLIC_XML")
            assumeNotNull(path)
            val public = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(File(path!!))
            val before = public.elements("public").associate {
                (it.getAttribute("type") to it.getAttribute("name")) to it.getAttribute("id")
            }
            registerProjectedResourceIds(public)
            val after = public.elements("public").associate {
                (it.getAttribute("type") to it.getAttribute("name")) to it.getAttribute("id")
            }
            assertEquals(before.size + 3, after.size)
            before.forEach { (name, id) -> assertEquals(id, after[name]) }
            val additions = after.filterKeys { it !in before }
            assertEquals(setOf("string" to "nl_projected_car_help", "xml" to "nl_projected_car_app",
                "raw" to "nl_projected_car_license"), additions.keys)
            assertEquals(3, additions.values.toSet().size)
            assertTrue(additions.values.none { it in before.values })
            val completed = public.cloneNode(true)
            assertThrows(IllegalStateException::class.java) { registerProjectedResourceIds(public) }
            assertTrue(completed.isEqualNode(public))
        }
    }

    @Test fun nativeServiceAndAutomotiveLauncherArePreservedForBothInputs() {
        for ((app, service, category) in listOf(
            Triple("HOMEASSISTANT", "io.homeassistant.companion.android.vehicle.HaCarAppService", "androidx.car.app.category.IOT"),
            Triple("PLUGSHARE", "com.xatori.plugshare.PlugShareCarAppService", "androidx.car.app.category.POI"),
        )) {
            val manifest = input(app)
            val launcher = manifest.named("activity", "androidx.car.app.activity.CarAppActivity").cloneNode(true)
            (launcher as Element).setAttributeNS(android, "android:label",
                if (app == "HOMEASSISTANT") "Home Assistant (Automotive)" else "PlugShare (Automotive)")
            val carService = manifest.named("service", service).cloneNode(true)
            val permissions = manifest.elements("uses-permission").map { it.getAttributeNS(android, "name") }.toSet()
            declareProjectedCarApp(manifest, service, category,
                if (app == "HOMEASSISTANT") "io.homeassistant.companion.android.launch.LaunchActivity" else null,
                setOf("com.google.android.gms.permission.CAR_FUEL"),
                if (app == "HOMEASSISTANT") "Home Assistant (Automotive)" else "PlugShare (Automotive)")
            assertEquals(if (app == "HOMEASSISTANT") "Home Assistant (Automotive)" else "PlugShare (Automotive)",
                (manifest.getElementsByTagName("application").item(0) as Element).getAttributeNS(android, "label"))
            assertTrue(launcher.isEqualNode(manifest.named("activity", "androidx.car.app.activity.CarAppActivity")))
            assertTrue(carService.isEqualNode(manifest.named("service", service)))
            assertEquals("false", manifest.named("uses-feature", "android.hardware.type.automotive").getAttributeNS(android, "required"))
            assertEquals("false", manifest.named("uses-feature", "android.software.car.templates_host").getAttributeNS(android, "required"))
            assertEquals(PROJECTED_HARDWARE, manifest.named("meta-data", HARDWARE_METADATA).getAttributeNS(android, "value"))
            assertEquals("@xml/nl_projected_car_app", manifest.named("meta-data", "com.google.android.gms.car.application").getAttributeNS(android, "resource"))
            assertEquals("false", manifest.named("activity", PORT_PHONE_ACTIVITY).getAttributeNS(android, "exported"))
            assertTrue(manifest.elements("uses-permission").map { it.getAttributeNS(android, "name") }.containsAll(permissions))
            assertEquals("androidx.car.app.activity.ResultManagerAutomotive",
                manifest.named("meta-data", "androidx.car.app.CarAppMetadataHolderService.RESULT_MANAGER").getAttributeNS(android, "value"))
            assertFalse(manifest.elements("category").any { it.getAttributeNS(android, "name") == "android.intent.category.CAR_LAUNCHER" })
            val after = manifest.cloneNode(true)
            assertThrows(IllegalStateException::class.java) {
                declareProjectedCarApp(manifest, service, category, null, emptySet())
            }
            assertTrue(after.isEqualNode(manifest))
        }
    }

    @Test fun foreignPhoneActivityAndChangedHardwareContractsFailBeforeAnyEdit() {
        for (foreign in listOf(true, false)) {
            val manifest = input("HOMEASSISTANT")
            if (!foreign) manifest.named("meta-data", HARDWARE_METADATA).setAttributeNS(android, "android:value", "unexpected.Backend")
            val before = manifest.cloneNode(true)
            assertThrows(IllegalStateException::class.java) {
                declareProjectedCarApp(manifest, "io.homeassistant.companion.android.vehicle.HaCarAppService",
                    "androidx.car.app.category.IOT", if (foreign) "other.app.Activity" else null, emptySet())
            }
            assertTrue(before.isEqualNode(manifest))
        }
    }
}
