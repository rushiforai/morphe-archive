package patches.shared

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"
internal const val PROJECTED_HARDWARE = "nl.johninnl.carports.AdaptiveCarHardwareManager"
internal const val PORT_PHONE_ACTIVITY = "nl.johninnl.carports.PortLaunchActivity"
internal const val HARDWARE_METADATA = "androidx.car.app.CarAppMetadataHolderService.CAR_HARDWARE_MANAGER"
private val PROJECTED_RESOURCES = listOf(
    "string" to "nl_projected_car_help",
    "xml" to "nl_projected_car_app",
    "raw" to "nl_projected_car_license",
)

private fun Element.elements(tag: String) = (0 until childNodes.length)
    .map { childNodes.item(it) }.filterIsInstance<Element>().filter { it.tagName == tag }
private fun Element.android(name: String) = getAttributeNS(ANDROID, name)
private fun Element.setAndroid(name: String, value: String) = setAttributeNS(ANDROID, "android:$name", value)

/** The native resource encoder needs public IDs before it can encode newly added entries. */
internal fun registerProjectedResourceIds(public: Document) {
    val entries = public.documentElement.elements("public")
    val names = entries.map { it.getAttribute("type") to it.getAttribute("name") }.toSet()
    check(PROJECTED_RESOURCES.none { it in names }) { "Projected car resource IDs already exist" }
    val last = entries.groupBy { it.getAttribute("type") }.mapValues { (_, values) ->
        values.maxOf { it.getAttribute("id").removePrefix("0x").toLong(16) }
    }.toMutableMap()
    check(last.isNotEmpty() && last.values.all { it ushr 24 == 0x7fL }) { "Unexpected application resource package" }
    var nextType = (last.values.maxOf { (it ushr 16) and 0xff } + 1).toInt()
    val planned = PROJECTED_RESOURCES.map { (type, name) ->
        val previous = last[type]
        val id = if (previous != null) previous + 1 else {
            check(nextType < 256) { "Android resource type IDs exhausted" }
            0x7f000000L or (nextType++.toLong() shl 16)
        }
        check(previous == null || id and 0xffff != 0L) { "Android resource entry IDs exhausted" }
        last[type] = id
        Triple(type, name, id)
    }
    planned.forEach { (type, name, id) ->
        public.documentElement.appendChild(public.createElement("public").apply {
            setAttribute("type", type)
            setAttribute("name", name)
            setAttribute("id", "0x${id.toString(16)}")
        })
    }
}

/** Convert only the discovery/backend declarations; the original templated service stays native. */
internal fun declareProjectedCarApp(
    manifest: Document,
    serviceName: String,
    category: String,
    phoneSetup: String?,
    carPermissions: Set<String>,
    title: String? = null,
) {
    val root = manifest.documentElement
    val app = root.elements("application").single()
    val features = listOf("android.hardware.type.automotive", "android.software.car.templates_host")
        .map { name -> root.elements("uses-feature").single { it.android("name") == name } }
    check(features.all { it.android("required") == "true" }) { "Automotive feature contract changed or patch already applied" }
    val service = app.elements("service").single { it.android("name") == serviceName }
    check(service.android("exported") == "true" && service.android("enabled") != "false") { "Car service is not discoverable" }
    val filter = service.elements("intent-filter").single { f ->
        f.elements("action").any { it.android("name") == "androidx.car.app.CarAppService" }
    }
    check(filter.elements("category").any { it.android("name") == category }) { "Car service category changed" }
    val holder = app.elements("service").single { it.android("name") == "androidx.car.app.CarAppMetadataHolderService" }
    val hardware = holder.elements("meta-data").single { it.android("name") == HARDWARE_METADATA }
    check(hardware.android("value") == "androidx.car.app.hardware.AutomotiveCarHardwareManager") { "Car hardware backend changed" }
    check(app.elements("meta-data").none { it.android("name") == "com.google.android.gms.car.application" }) { "Projected discovery already exists" }
    check(app.elements("activity").none { it.android("name") == PORT_PHONE_ACTIVITY }) { "Phone entry point already exists" }
    val launcher = app.elements("activity").single { it.android("name") == "androidx.car.app.activity.CarAppActivity" }
    check(launcher.elements("intent-filter").any { f ->
        f.elements("action").any { it.android("name") == "android.intent.action.MAIN" } &&
            f.elements("category").any { it.android("name") == "android.intent.category.LAUNCHER" }
    }) { "Original car launcher changed" }
    if (phoneSetup != null) {
        check(app.elements("activity").any { it.android("name") == phoneSetup }) { "Phone setup activity is missing" }
        check(app.elements("meta-data").none { it.android("name") == "nl.johninnl.carports.PHONE_ACTIVITY" })
    }

    // All original-input checks above complete before the first edit.
    features.forEach { it.setAndroid("required", "false") }
    if (title != null) {
        app.setAndroid("label", title)
        launcher.setAndroid("label", title)
    }
    hardware.setAndroid("value", PROJECTED_HARDWARE)
    app.appendChild(manifest.createElement("meta-data").apply {
        setAndroid("name", "com.google.android.gms.car.application")
        setAndroid("resource", "@xml/nl_projected_car_app")
    })
    app.appendChild(manifest.createElement("activity").apply {
        setAndroid("name", PORT_PHONE_ACTIVITY)
        setAndroid("exported", "false")
        setAndroid("theme", "@android:style/Theme.DeviceDefault.NoActionBar")
    })
    if (phoneSetup != null) app.appendChild(manifest.createElement("meta-data").apply {
        setAndroid("name", "nl.johninnl.carports.PHONE_ACTIVITY")
        setAndroid("value", phoneSetup)
    })
    val existing = root.elements("uses-permission").map { it.android("name") }.toSet()
    for (permission in carPermissions - existing) root.insertBefore(manifest.createElement("uses-permission").apply {
        setAndroid("name", permission)
    }, app)
}

internal fun projectedCarResources(
    preflight: Patch<*>, serviceName: String, category: String, phoneSetup: String?, carPermissions: Set<String>, title: String,
) = resourcePatch {
    dependsOn(preflight)
    execute {
        val description = get("res/xml/nl_projected_car_app.xml")
        check(!description.exists()) { "Projected car description already exists" }
        val license = checkNotNull(ProjectedCarResources::class.java
            .getResourceAsStream("/car-app-ports/LICENSE.androidx-car-app.txt")) { "Projected client license is missing" }
            .use { it.readBytes() }
        val licenseFile = get("res/raw/nl_projected_car_license.txt")
        check(!licenseFile.exists()) { "Projected client license already exists" }
        document("res/values/public.xml").use { registerProjectedResourceIds(it) }
        document("AndroidManifest.xml").use {
            declareProjectedCarApp(it, serviceName, category, phoneSetup, carPermissions, title)
        }
        description.apply {
            parentFile.mkdirs()
            writeText("""<?xml version="1.0" encoding="utf-8"?><automotiveApp><uses name="template"/></automotiveApp>""")
        }
        val translations = mapOf(
            "res/values/string.xml" to "Open this app from Android Auto or another compatible car host. You can sign in on the car screen.",
            "res/values-nl/string.xml" to "Open deze app vanuit Android Auto of een andere compatibele autohost. Je kunt je aanmelden op het autoscherm.",
        )
        translations.forEach { (path, text) ->
            // Singular typed files follow the existing Car App Library linker contract;
            // do not rewrite the publisher's plural values files.
            get(path).apply { parentFile.mkdirs(); if (!exists()) writeText("<resources/>") }
            document(path).use { values ->
                check(values.documentElement.elements("string").none { it.getAttribute("name") == "nl_projected_car_help" }) {
                    "Projected car help string already exists"
                }
                values.documentElement.appendChild(values.createElement("string").apply {
                    setAttribute("name", "nl_projected_car_help")
                    textContent = text
                })
            }
        }
        licenseFile.apply { parentFile.mkdirs(); writeBytes(license) }
    }
}

private object ProjectedCarResources
