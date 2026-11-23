package patches.eclipse

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patches.shared.relinkExtensionResourceIds

/** Packages whose presence the host-side template apps must be able to query on Android 11+. */
private val QUERIED_PACKAGES = listOf(
    "com.google.android.projection.gearhead",
    "com.google.android.apps.automotive.templates.host",
    "app.johninnl.drivedeck",
)

@Suppress("unused")
val eclipseTemplatedMedia = bytecodePatch(
    name = "Android Auto templated media app",
    description = "Adds a Car App Library media app to Eclipse Music: a single root page with Home laid out like the phone's " +
        "(Umbra DJ, Made For You, mixes, linked playlists, Your Shows, Radio; no See all), Discover and Library, collections, " +
        "search through the provider selected on the phone with All, Tracks, Albums, Artists and Playlists filters, " +
        "an editable Up Next and the host's now-playing template. Confirmed on API 9 hosts (DriveDeck); " +
        "API 8 hosts are shown the same pages without API 9 components and are not yet confirmed. " +
        "Every host is allowed; Eclipse's own player, queue and session stay authoritative, " +
        "and the car screens refresh when the app's queue changes.",
    default = true,
) {
    compatibleWith(eclipse)
    val linker = eclipseResources()
    val resources = resourcePatch {
        dependsOn(eclipseBase)
        execute {
            linker.link(this)
            document("AndroidManifest.xml").use { doc ->
                val root = doc.documentElement
                val app = doc.getElementsByTagName("application").item(0) as Element
                fun androidElement(tag: String, vararg attrs: Pair<String, String>) = doc.createElement(tag).apply {
                    attrs.forEach { (key, value) -> setAttributeNS(AUTO_ANDROID, "android:$key", value) }
                }
                root.appendChild(androidElement("uses-permission", "name" to "androidx.car.app.MEDIA_TEMPLATES"))
                app.appendChild(androidElement("meta-data", "name" to "androidx.car.app.minCarApiLevel", "value" to "8"))
                app.appendChild(androidElement("meta-data", "name" to "androidx.car.app.theme", "resource" to AUTO_THEME))
                app.appendChild(androidElement("service", "name" to "nl.johninnl.eclipse.auto.EclipseCarAppService", "exported" to "true").apply {
                    appendChild(doc.createElement("intent-filter").apply {
                        appendChild(androidElement("action", "name" to "androidx.car.app.CarAppService"))
                        appendChild(androidElement("action", "name" to "androidx.car.app.media.action.SHOW_MEDIA_PLAYBACK"))
                        appendChild(androidElement("category", "name" to "androidx.car.app.category.MEDIA"))
                    })
                })
                // The app already declares one <queries> block; extend it rather than add a second.
                val queries = doc.getElementsByTagName("queries").item(0) ?: doc.createElement("queries").also(root::appendChild)
                val queried = queries.childNodes.let { children -> (0 until children.length).mapNotNull {
                    (children.item(it) as? Element)?.takeIf { node -> node.tagName == "package" }
                        ?.getAttributeNS(AUTO_ANDROID, "name")
                }.toMutableSet() }
                QUERIED_PACKAGES.filter { queried.add(it) }
                    .forEach { queries.appendChild(androidElement("package", "name" to it)) }
                val metadata = doc.getElementsByTagName("meta-data")
                val descriptor = (0 until metadata.length).map { metadata.item(it) as Element }
                    .single { it.getAttributeNS(AUTO_ANDROID, "name") == "com.google.android.gms.car.application" }
                    .getAttributeNS(AUTO_ANDROID, "resource")
                check(descriptor.startsWith("@xml/")) { "Unsupported Eclipse Music automotive descriptor" }
                document("res/xml/${descriptor.substringAfter('/')}.xml").use { auto ->
                    val uses = auto.getElementsByTagName("uses")
                    val supported = (0 until uses.length).map { (uses.item(it) as Element).getAttribute("name") }
                    check("media" in supported) { "Eclipse Music classic media descriptor changed" }
                    if ("template" !in supported) auto.documentElement.appendChild(auto.createElement("uses").apply { setAttribute("name", "template") })
                }
            }
        }
    }

    // The extension (merged once, link-checked, with the queue signals) is shared with the browse upgrade.
    dependsOn(eclipseBase, eclipseAutoExtension, resources)
    execute {
        // Only our separately packaged classes are relinked, never original app bytecode.
        relinkExtensionResourceIds(eclipseExtensionBundle.types, linker.ids)
    }
}
