package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK
import app.template.patches.steamlink.binary.disablePermissionPromptNativePatch
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import java.io.File

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

private fun loadResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: error("Missing bundled resource: steamlink/androidxr/$name"))
        .use { it.readBytes() }

/** Iterate a [NodeList] as a [Sequence]. */
private fun NodeList.asSequence(): Sequence<org.w3c.dom.Node> = sequence {
    for (i in 0 until length) yield(item(i))
}

// ---------------------------------------------------------------------------
// Sub-patch 1: inject native bridge libraries
// ---------------------------------------------------------------------------

private val androidXrLibPatch = rawResourcePatch {
    dependsOn(disablePermissionPromptNativePatch)

    execute {
        val libDir = get("lib/arm64-v8a/libvrlink_scene.so").parentFile!!
        File(libDir, "libgxr_xr_bridge.so").writeBytes(loadResource("libgxr_xr_bridge.so"))

        get("res/drawable-anydpi/ic_launcher_background.xml")
            .writeBytes(loadResource("ic_launcher_background.xml"))
        get("res/drawable-anydpi/ic_launcher_background_gradient.xml")
            .writeBytes(loadResource("ic_launcher_background_gradient.xml"))
        get("res/values/public.xml").writeBytes(loadResource("public.xml"))

        // arslib ResourceIdProcessor requires ids.xml; APKs without <item type="id"> resources omit it.
        // "res/" paths resolve against the decoded package dir, not the raw apk root, so use get() directly.
        val idsFile = get("res/values/ids.xml")
        if (!idsFile.exists()) {
            idsFile.parentFile!!.mkdirs()
            idsFile.writeText("""<?xml version="1.0" encoding="utf-8"?><resources/>""")
        }
    }
}

@Suppress("unused")
val xrCoreRuntimePatch = bytecodePatch(
    name = "XR Core Runtime",
    description = "Installs the Galaxy XR runtime bridge resources and extension DEX foundation used by other XR patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)
    dependsOn(androidXrLibPatch, androidXrUiExtensionPatch)
}

@Suppress("unused")
val xrDeviceConfigBaselinePatch = rawResourcePatch(
    name = "XR Device Config Baseline",
    description = "Installs baseline Galaxy XR HMD/controller/default config payloads and dashboard bootstrap assets.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)
    dependsOn(xrCoreRuntimePatch)

    execute {
        get("assets/config/hmd_config.json").writeBytes(loadResource("hmd_config.json"))
        get("assets/config/controller_config.json").writeBytes(loadResource("controller_config.json"))
        get("assets/config/default_config.json").writeBytes(loadResource("default_config.json"))
        get("assets/webui/dash/index.html").writeBytes(loadResource("index.html"))
    }
}

@Suppress("unused")
val xrManifestCapabilityPackPatch = resourcePatch(
    name = "XR Manifest Capability Pack",
    description = "Adds Android XR/OpenXR permissions, features, runtime queries, and app-level XR properties.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)
    dependsOn(xrCoreRuntimePatch)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as Element

            // Make SDK targeting explicit for Android XR so installs are not flagged as legacy-targeted.
            manifest.setAttribute("android:minSdkVersion", "29")
            manifest.setAttribute("android:targetSdkVersion", "36")
            manifest.removeAttribute("android:maxSdkVersion")

            val usesSdkNodes = manifest.getElementsByTagName("uses-sdk")
            val usesSdk = if (usesSdkNodes.length > 0) {
                usesSdkNodes.item(0) as Element
            } else {
                doc.createElement("uses-sdk").also { manifest.insertBefore(it, app) }
            }
            usesSdk.setAttribute("android:minSdkVersion", "29")
            usesSdk.setAttribute("android:targetSdkVersion", "36")
            usesSdk.removeAttribute("android:maxSdkVersion")

            // Keep only one uses-sdk node if upstream manifests include duplicates.
            if (usesSdkNodes.length > 1) {
                for (i in usesSdkNodes.length - 1 downTo 1) {
                    usesSdkNodes.item(i)?.let { node ->
                        node.parentNode?.removeChild(node)
                    }
                }
            }

            fun exists(tag: String, name: String): Boolean =
                doc.getElementsByTagName(tag).asSequence()
                    .filterIsInstance<Element>()
                    .any { it.getAttribute("android:name") == name }

            fun addBeforeApp(el: Element) = manifest.insertBefore(el, app)

            fun removeMatching(tag: String, predicate: (Element) -> Boolean) {
                doc.getElementsByTagName(tag).asSequence()
                    .filterIsInstance<Element>()
                    .filter(predicate)
                    .toList()
                    .forEach { it.parentNode.removeChild(it) }
            }

            removeMatching("uses-permission") {
                val name = it.getAttribute("android:name")
                name.startsWith("com.oculus.permission.") ||
                    name.startsWith("com.picovr.permission.")
            }
            removeMatching("uses-feature") {
                val name = it.getAttribute("android:name")
                name.startsWith("oculus.software.") ||
                    name.startsWith("com.oculus.feature.")
            }
            removeMatching("meta-data") {
                val name = it.getAttribute("android:name")
                name.startsWith("com.oculus.") ||
                    name.startsWith("com.htc.vr.") ||
                    name.startsWith("pvr.") ||
                    name.startsWith("pxr.") ||
                    name.startsWith("picovr.")
            }
            removeMatching("uses-native-library") {
                it.getAttribute("android:name") == "libopenxr_forwardloader.oculus.so"
            }
            removeMatching("category") {
                val name = it.getAttribute("android:name")
                name == "com.oculus.intent.category.VR" ||
                    name == "com.oculus.intent.category.2D"
            }

            val newPerms = listOf(
                "org.khronos.openxr.permission.OPENXR",
                "org.khronos.openxr.permission.OPENXR_SYSTEM",
                "android.permission.ACCESS_COARSE_LOCATION",
                "android.permission.ACCESS_FINE_LOCATION",
                "android.permission.HAND_TRACKING",
                "android.permission.EYE_TRACKING_FINE",
            )
            for (perm in newPerms) {
                if (!exists("uses-permission", perm)) {
                    val el = doc.createElement("uses-permission")
                    el.setAttribute("android:name", perm)
                    addBeforeApp(el)
                }
            }

            data class FeatureDef(val name: String, val required: Boolean, val version: String? = null)
            val newFeatures = listOf(
                FeatureDef("android.hardware.vr.headtracking", true, "1"),
                FeatureDef("android.software.xr.api.openxr", true, "0x10001"),
                FeatureDef("android.hardware.xr.input.controller", false),
                FeatureDef("android.hardware.xr.input.hand_tracking", false),
                FeatureDef("android.hardware.xr.input.eye_tracking", false),
            )
            for (f in newFeatures) {
                if (!exists("uses-feature", f.name)) {
                    val el = doc.createElement("uses-feature")
                    el.setAttribute("android:name", f.name)
                    el.setAttribute("android:required", f.required.toString())
                    f.version?.let { el.setAttribute("android:version", it) }
                    addBeforeApp(el)
                }
            }

            val existingQueries = manifest.getElementsByTagName("queries")
            val hasOpenXrQuery = (0 until existingQueries.length)
                .map { existingQueries.item(it) as Element }
                .any { q ->
                    q.getElementsByTagName("provider").let { pList ->
                        (0 until pList.length).any {
                            (pList.item(it) as Element)
                                .getAttribute("android:authorities")
                                .contains("openxr.runtime_broker")
                        }
                    }
                }
            if (!hasOpenXrQuery) {
                val queries = doc.createElement("queries")
                val provider = doc.createElement("provider")
                provider.setAttribute(
                    "android:authorities",
                    "org.khronos.openxr.runtime_broker;org.khronos.openxr.system_runtime_broker",
                )
                queries.appendChild(provider)
                listOf(
                    "org.khronos.openxr.OpenXRRuntimeService",
                    "org.khronos.openxr.OpenXRApiLayerService",
                ).forEach { action ->
                    val intent = doc.createElement("intent")
                    val act = doc.createElement("action")
                    act.setAttribute("android:name", action)
                    intent.appendChild(act)
                    queries.appendChild(intent)
                }
                manifest.insertBefore(queries, app)
            }

            val nativeLibName = "libopenxr.google.so"
            val hasNativeLib = app.getElementsByTagName("uses-native-library").let { nl ->
                (0 until nl.length).any {
                    (nl.item(it) as Element).getAttribute("android:name") == nativeLibName
                }
            }
            if (!hasNativeLib) {
                val nativeLib = doc.createElement("uses-native-library")
                nativeLib.setAttribute("android:name", nativeLibName)
                nativeLib.setAttribute("android:required", "false")
                app.insertBefore(nativeLib, app.firstChild)
            }

            val xrBoundaryMeta = "android.window.PROPERTY_XR_BOUNDARY_TYPE_RECOMMENDED"
            val hasBoundaryMeta = app.getElementsByTagName("property").let { pl ->
                (0 until pl.length).any {
                    (pl.item(it) as Element).getAttribute("android:name") == xrBoundaryMeta
                }
            }
            if (!hasBoundaryMeta) {
                val prop = doc.createElement("property")
                prop.setAttribute("android:name", xrBoundaryMeta)
                prop.setAttribute("android:value", "XR_BOUNDARY_TYPE_LARGE")
                app.insertBefore(prop, app.firstChild)
            }
        }
    }
}

@Suppress("unused")
val xrLauncherBootstrapPatch = resourcePatch(
    name = "XR Launcher Bootstrap (Home Space)",
    description = "Installs GalaxyXRPermissionActivity as launcher and configures Steam Link/VRLink activity XR startup wiring.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)
    dependsOn(xrManifestCapabilityPackPatch)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.documentElement.getElementsByTagName("application").item(0) as Element

            val gxrActivityName = "com.valvesoftware.steamlink.GalaxyXRPermissionActivity"
            val hasGxrActivity = app.getElementsByTagName("activity").let { al ->
                (0 until al.length).any {
                    (al.item(it) as Element).getAttribute("android:name") == gxrActivityName
                }
            }
            if (!hasGxrActivity) {
                val activity = doc.createElement("activity")
                activity.setAttribute("android:name", gxrActivityName)
                activity.setAttribute("android:exported", "true")
                activity.setAttribute("android:label", "Steam Link")
                activity.setAttribute("android:screenOrientation", "landscape")
                activity.setAttribute("android:theme", "@android:style/Theme.Black.NoTitleBar.Fullscreen")

                val filter = doc.createElement("intent-filter")
                val mainAction = doc.createElement("action")
                mainAction.setAttribute("android:name", "android.intent.action.MAIN")
                val launcherCat = doc.createElement("category")
                launcherCat.setAttribute("android:name", "android.intent.category.LAUNCHER")
                filter.appendChild(mainAction)
                filter.appendChild(launcherCat)
                activity.appendChild(filter)

                val gxrLayout = doc.createElement("layout")
                gxrLayout.setAttribute("android:defaultWidth", "1280.0px")
                gxrLayout.setAttribute("android:defaultHeight", "800.0px")
                activity.appendChild(gxrLayout)

                val firstActivity = app.getElementsByTagName("activity").item(0)
                app.insertBefore(activity, firstActivity)
            }

            val vrLinkName = "com.valvesoftware.steamlink.VRLink"
            app.getElementsByTagName("activity").asSequence()
                .filterIsInstance<Element>()
                .firstOrNull { it.getAttribute("android:name") == vrLinkName }
                ?.let { vrLink ->
                    val xrStartMode = "android.window.PROPERTY_XR_ACTIVITY_START_MODE"
                    val hasMode = vrLink.getElementsByTagName("property").let { pl ->
                        (0 until pl.length).any {
                            (pl.item(it) as Element).getAttribute("android:name") == xrStartMode
                        }
                    }
                    if (!hasMode) {
                        val prop = doc.createElement("property")
                        prop.setAttribute("android:name", xrStartMode)
                        prop.setAttribute("android:value", "XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED")
                        vrLink.insertBefore(prop, vrLink.firstChild)
                    }

                    val immersiveHmd = "org.khronos.openxr.intent.category.IMMERSIVE_HMD"
                    val hasImmersiveHmd = vrLink.getElementsByTagName("category").let { cl ->
                        (0 until cl.length).any {
                            (cl.item(it) as Element).getAttribute("android:name") == immersiveHmd
                        }
                    }
                    if (!hasImmersiveHmd) {
                        val filters = vrLink.getElementsByTagName("intent-filter")
                        val filter = if (filters.length > 0) {
                            filters.item(0) as Element
                        } else {
                            val f = doc.createElement("intent-filter")
                            vrLink.appendChild(f)
                            f
                        }
                        val cat = doc.createElement("category")
                        cat.setAttribute("android:name", immersiveHmd)
                        filter.appendChild(cat)
                    }
                }

            val steamLinkName = "com.valvesoftware.steamlink.SteamLink"
            app.getElementsByTagName("activity").asSequence()
                .filterIsInstance<Element>()
                .firstOrNull { it.getAttribute("android:name") == steamLinkName }
                ?.let { steamLink ->
                    steamLink.getElementsByTagName("intent-filter").asSequence()
                        .filterIsInstance<Element>()
                        .filter { filter ->
                            filter.getElementsByTagName("category").asSequence()
                                .filterIsInstance<Element>()
                                .any {
                                    it.getAttribute("android:name") ==
                                        "android.intent.category.LAUNCHER"
                                }
                        }
                        .toList()
                        .forEach { steamLink.removeChild(it) }

                    val layouts = steamLink.getElementsByTagName("layout")
                    val layout = if (layouts.length > 0) {
                        layouts.item(0) as Element
                    } else {
                        doc.createElement("layout").also {
                            steamLink.insertBefore(it, steamLink.firstChild)
                        }
                    }
                    layout.setAttribute("android:defaultWidth", "1280.0px")
                    layout.setAttribute("android:defaultHeight", "800.0px")
                }
        }
    }
}

@Suppress("unused")
val xrInputRoutingConfigPatch = rawResourcePatch(
    name = "XR Input Routing Config",
    description = "Installs ui_config.json mappings for XR pointer/button routing in launcher UI flows.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)
    dependsOn(xrLauncherBootstrapPatch)

    execute {
        get("assets/config/ui_config.json").writeBytes(loadResource("ui_config.json"))
    }
}
