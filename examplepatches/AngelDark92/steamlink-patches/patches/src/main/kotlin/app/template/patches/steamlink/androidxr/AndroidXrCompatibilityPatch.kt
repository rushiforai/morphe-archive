package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
import app.template.patches.steamlink.binary.disablePermissionPromptNativePatch
import org.w3c.dom.Document
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

internal fun upsertManifestFeature(
    doc: Document,
    manifest: Element,
    app: Element,
    name: String,
    required: Boolean,
    version: String?,
) {
    val matches = doc.getElementsByTagName("uses-feature").asSequence()
        .filterIsInstance<Element>()
        .filter { it.getAttribute("android:name") == name }
        .toList()
    val feature = matches.firstOrNull() ?: doc.createElement("uses-feature").also {
        it.setAttribute("android:name", name)
        manifest.insertBefore(it, app)
    }
    feature.setAttribute("android:required", required.toString())
    version?.let { feature.setAttribute("android:version", it) }
        ?: feature.removeAttribute("android:version")
    matches.drop(1).forEach { duplicate -> duplicate.parentNode.removeChild(duplicate) }
}

internal fun removeDirectApplicationProperty(app: Element, name: String) {
    app.childNodes.asSequence()
        .filterIsInstance<Element>()
        .filter { it.tagName == "property" && it.getAttribute("android:name") == name }
        .toList()
        .forEach { app.removeChild(it) }
}

// ---------------------------------------------------------------------------
// Sub-patch 1: inject native bridge libraries
// ---------------------------------------------------------------------------

private val androidXrLibPatch = rawResourcePatch {
    dependsOn(disablePermissionPromptNativePatch)

    execute {
        // Native-XR builds own a complete Android XR path. Preserve their native permission
        // routine, runtime loaders, and hand/controller config instead of installing the legacy bridge.
        if (isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) return@execute

        val libDir = get("lib/arm64-v8a/libvrlink_scene.so").parentFile!!
        // OpenXR runtime bridge native library for Galaxy XR platform integration
        File(libDir, "libgxr_xr_bridge.so").writeBytes(loadResource("libgxr_xr_bridge.so"))

        val xrBridgeManifest = get(
            "assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_xr_bridge.json",
        )
        xrBridgeManifest.parentFile!!.mkdirs()
        xrBridgeManifest.writeBytes(loadResource("XR_APILAYER_local_GalaxyXR_xr_bridge.json"))

        // res/drawable-anydpi/ic_launcher_background.xml — replaces stock Valve solid-blue background
        get("res/drawable-anydpi/ic_launcher_background.xml")
            .writeBytes(loadResource("ic_launcher_background.xml"))
        // res/drawable-anydpi/ic_launcher_background_gradient.xml — new gradient drawable (resource id 0x7f010000)
        get("res/drawable-anydpi/ic_launcher_background_gradient.xml")
            .writeBytes(loadResource("ic_launcher_background_gradient.xml"))
        // res/values/public.xml — assigns stable resource IDs for ic_launcher_background_gradient (0x7f010000) and ic_launcher (0x7f010001/0x7f030000)
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
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())
    dependsOn(androidXrLibPatch, androidXrUiExtensionPatch, xrDirectInputFixPatch)
}

@Suppress("unused")
val xrDeviceConfigBaselinePatch = rawResourcePatch(
    name = "XR Device Config Baseline",
    description = "Installs baseline Galaxy XR HMD/controller/default config payloads and dashboard bootstrap assets.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())
    dependsOn(xrCoreRuntimePatch)

    execute {
        // Native-XR stock requests XR_EXT_hand_interaction and defines hand grip/aim poses.
        // The legacy controller_config.json has neither, so replacing it disables native hands.
        if (isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) return@execute

        get("assets/config/hmd_config.json").writeBytes(loadResource("hmd_config.json"))
        get("assets/config/controller_config.json").writeBytes(loadResource("controller_config.json"))
        // assets/config/default_config.json — preflight.ignore_microphone_muted=false
        get("assets/config/default_config.json").writeBytes(loadResource("default_config.json"))
        // assets/webui/dash/index.html — Steam Link dashboard HTML bootstrap
        get("assets/webui/dash/index.html").writeBytes(loadResource("index.html"))
    }
}

@Suppress("unused")
val xrManifestCapabilityPackPatch = resourcePatch(
    name = "XR Manifest Capability Pack",
    description = "Adds Android XR/OpenXR permissions, features, runtime queries, and app-level XR properties.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())
    dependsOn(xrCoreRuntimePatch)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            // Preserve native builds' target SDK, vendor declarations, required hand feature,
            // loader selection, and permission flow. This pack exists for legacy builds only.
            if (isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) return@use

            val manifest = doc.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as Element

            // uses-sdk: minSdkVersion=29 (Android 10) + targetSdkVersion=36 (Android XR platform)
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

            // Strip all Oculus/Meta/Pico/HTC platform declarations; Android XR uses different namespaces
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
            // libopenxr_forwardloader.oculus.so is Meta's proprietary forwarding loader; not present on Android XR
            removeMatching("uses-native-library") {
                it.getAttribute("android:name") == "libopenxr_forwardloader.oculus.so"
            }
            removeMatching("category") {
                val name = it.getAttribute("android:name")
                // Oculus 2D/VR intent categories — not recognised on Android XR
                name == "com.oculus.intent.category.VR" ||
                    name == "com.oculus.intent.category.2D"
            }

            val newPerms = listOf(
                // OpenXR runtime and system service binding permissions (Khronos OpenXR 1.1 spec)
                "org.khronos.openxr.permission.OPENXR",
                "org.khronos.openxr.permission.OPENXR_SYSTEM",
                // Location permissions required by OpenXR spatial anchor APIs on Android XR
                "android.permission.ACCESS_COARSE_LOCATION",
                "android.permission.ACCESS_FINE_LOCATION",
                // Android XR platform permissions for XR_ANDROID_hand_tracking and XR_ANDROID_eye_gaze
                "android.permission.HAND_TRACKING",
                "android.permission.EYE_TRACKING_FINE",
                "android.permission.FACE_TRACKING",
                "android.permission.BLUETOOTH_CONNECT",
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
                // android.hardware.vr.headtracking v1: 6-DOF HMD tracking hardware feature declaration
                FeatureDef("android.hardware.vr.headtracking", true, "1"),
                // android.software.xr.api.openxr v0x10001: OpenXR 1.1 platform runtime feature
                FeatureDef("android.software.xr.api.openxr", true, "0x10001"),
                // Input device capabilities; optional so app installs without controller/eye hardware
                FeatureDef("android.hardware.xr.input.controller", false),
                FeatureDef("android.hardware.xr.input.hand_tracking", false),
                FeatureDef("android.hardware.xr.input.eye_tracking", false),
            )
            for (f in newFeatures) {
                upsertManifestFeature(doc, manifest, app, f.name, f.required, f.version)
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
                // <queries> block: allows runtime discovery of OpenXR broker providers and service intents
                val queries = doc.createElement("queries")
                val provider = doc.createElement("provider")
                // org.khronos.openxr.runtime_broker / system_runtime_broker: OpenXR runtime discovery authorities
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

            // libopenxr.google.so: Android XR's OpenXR loader; optional so non-XR builds aren't blocked
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

            // android.window.PROPERTY_XR_BOUNDARY_TYPE_RECOMMENDED: hints spatial OS to use large boundary for full-space apps
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

internal fun upsertVrLinkUnmanagedFullSpace(doc: Document, app: Element): Boolean {
    val propertyName = "android.window.PROPERTY_XR_ACTIVITY_START_MODE"
    val activities = app.getElementsByTagName("activity").asSequence()
        .filterIsInstance<Element>()
        .toList()
    val vrLink = activities.firstOrNull {
        it.getAttribute("android:name") == "com.valvesoftware.steamlink.VRLink"
    } ?: activities.firstOrNull { activity ->
        activity.getAttribute("android:name") == "android.app.NativeActivity" &&
            activity.getElementsByTagName("meta-data").asSequence()
                .filterIsInstance<Element>()
                .any {
                    it.getAttribute("android:name") == "android.app.lib_name" &&
                        it.getAttribute("android:value") == "vrlink_scene"
                }
    }
        ?: return false
    removeDirectApplicationProperty(app, propertyName)
    val matches = vrLink.childNodes.asSequence()
        .filterIsInstance<Element>()
        .filter { it.tagName == "property" && it.getAttribute("android:name") == propertyName }
        .toList()
    val property = matches.firstOrNull() ?: doc.createElement("property").also {
        vrLink.insertBefore(it, vrLink.firstChild)
    }
    property.setAttribute("android:name", propertyName)
    property.setAttribute("android:value", "XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED")
    matches.drop(1).forEach { duplicate -> vrLink.removeChild(duplicate) }
    return true
}

/**
 * Minimal permission/settings launcher used by patches that remain valid on native-XR builds.
 *
 * This deliberately does not depend on XR Core/Manifest/Device Config and does not add a
 * FULL_SPACE_UNMANAGED override. Valve's stock native manifest, permission routine, controller
 * config, and XR_EXT_hand_interaction routing must remain authoritative.
 */
internal val xrPermissionSettingsBootstrapPatch = resourcePatch {
    dependsOn(androidXrMinimalUiExtensionPatch, xrResolutionProbePatch)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.documentElement.getElementsByTagName("application").item(0) as Element
            val gxrActivityName = "com.valvesoftware.steamlink.GalaxyXRPermissionActivity"
            val hasGxrActivity = app.getElementsByTagName("activity").asSequence()
                .filterIsInstance<Element>()
                .any { it.getAttribute("android:name") == gxrActivityName }

            if (!hasGxrActivity) {
                val activity = doc.createElement("activity")
                activity.setAttribute("android:name", gxrActivityName)
                activity.setAttribute("android:exported", "true")
                activity.setAttribute("android:screenOrientation", "landscape")
                activity.setAttribute("android:theme", "@android:style/Theme.Black.NoTitleBar.Fullscreen")

                val filter = doc.createElement("intent-filter")
                doc.createElement("action").also {
                    it.setAttribute("android:name", "android.intent.action.MAIN")
                    filter.appendChild(it)
                }
                doc.createElement("category").also {
                    it.setAttribute("android:name", "android.intent.category.LAUNCHER")
                    filter.appendChild(it)
                }
                activity.appendChild(filter)

                doc.createElement("layout").also {
                    it.setAttribute("android:defaultWidth", "1280.0px")
                    it.setAttribute("android:defaultHeight", "800.0px")
                    activity.appendChild(it)
                }

                app.insertBefore(activity, app.getElementsByTagName("activity").item(0))
            }

            // Route launcher starts through the permission/settings activity without changing
            // Valve's native VRLink XR start mode or SteamLink panel dimensions.
            app.getElementsByTagName("activity").asSequence()
                .filterIsInstance<Element>()
                .firstOrNull {
                    it.getAttribute("android:name") == "com.valvesoftware.steamlink.SteamLink"
                }
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
                }
        }
    }
}

@Suppress("unused")
val xrLauncherBootstrapPatch = resourcePatch(
    name = "XR Launcher Bootstrap (Home Space)",
    description = "Installs GalaxyXRPermissionActivity as launcher and configures the Steam Link VR activity XR startup wiring.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())
    // Keep the legacy launcher self-contained: its manifest activity needs the helper-only DEX,
    // and the lifecycle probe supplies the historical overlay activation hook. These same
    // dependencies are deduplicated when a supported patch also uses the minimal bootstrap.
    dependsOn(
        xrManifestCapabilityPackPatch,
        androidXrMinimalUiExtensionPatch,
        xrResolutionProbePatch,
    )

    finalize {
        document("AndroidManifest.xml").use { doc ->
            // Current Managers exclude this patch for native-XR builds. Manager 1.7 cannot distinguish
            // build codes sharing versionName 2.0.22, so also make accidental execution harmless.
            if (isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) return@use

            val app = doc.documentElement.getElementsByTagName("application").item(0) as Element
            val xrStartMode = "android.window.PROPERTY_XR_ACTIVITY_START_MODE"

            // Build 5002313 declares this at application scope. Replace it with the direct
            // activity property required by the OpenXR VRLink activity.
            upsertVrLinkUnmanagedFullSpace(doc, app)

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

                // android:defaultWidth/Height 1280×800px: initial 2D panel size for Home Space display
                val gxrLayout = doc.createElement("layout")
                gxrLayout.setAttribute("android:defaultWidth", "1280.0px")
                gxrLayout.setAttribute("android:defaultHeight", "800.0px")
                activity.appendChild(gxrLayout)

                val firstActivity = app.getElementsByTagName("activity").item(0)
                app.insertBefore(activity, firstActivity)
            }

            app.getElementsByTagName("activity").asSequence()
                .filterIsInstance<Element>()
                .firstOrNull { activity ->
                    activity.getAttribute("android:name") == "com.valvesoftware.steamlink.VRLink" ||
                        activity.getAttribute("android:name") == "android.app.NativeActivity" &&
                        activity.getElementsByTagName("meta-data").asSequence()
                            .filterIsInstance<Element>()
                            .any {
                                it.getAttribute("android:name") == "android.app.lib_name" &&
                                    it.getAttribute("android:value") == "vrlink_scene"
                            }
                }
                ?.let { vrLink ->
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
                        // org.khronos.openxr.intent.category.IMMERSIVE_HMD: marks VRLink as an OpenXR HMD entry point
                        cat.setAttribute("android:name", immersiveHmd)
                        filter.appendChild(cat)
                    }
                }

            val steamLinkName = "com.valvesoftware.steamlink.SteamLink"
            app.getElementsByTagName("activity").asSequence()
                .filterIsInstance<Element>()
                .firstOrNull { it.getAttribute("android:name") == steamLinkName }
                ?.let { steamLink ->
                    steamLink.setAttribute("android:resizeableActivity", "true")

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

                    val existingSteamStartMode = steamLink.getElementsByTagName("property").asSequence()
                        .filterIsInstance<Element>()
                        .firstOrNull { it.getAttribute("android:name") == xrStartMode }
                    if (existingSteamStartMode != null) {
                        existingSteamStartMode.setAttribute("android:value", "XR_ACTIVITY_START_MODE_FULL_SPACE_MANAGED")
                    } else {
                        val steamModeProp = doc.createElement("property")
                        steamModeProp.setAttribute("android:name", xrStartMode)
                        // Keep SteamLink picker in managed full-space panel mode.
                        steamModeProp.setAttribute("android:value", "XR_ACTIVITY_START_MODE_FULL_SPACE_MANAGED")
                        steamLink.insertBefore(steamModeProp, steamLink.firstChild)
                    }

                    val layouts = steamLink.getElementsByTagName("layout")
                    val layout = if (layouts.length > 0) {
                        layouts.item(0) as Element
                    } else {
                        doc.createElement("layout").also {
                            steamLink.insertBefore(it, steamLink.firstChild)
                        }
                    }
                    // exp6 panel sizing baseline from handoff bundle.
                    layout.setAttribute("android:defaultWidth", "1536.0px")
                    layout.setAttribute("android:defaultHeight", "960.0px")
                }
        }
    }
}

@Suppress("unused")
val xrInputRoutingConfigPatch = rawResourcePatch(
    name = "XR Input Routing Config",
    description = "Installs ui_config.json mappings for XR pointer/button routing in launcher UI flows.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())
    dependsOn(xrLauncherBootstrapPatch)

    execute {
        if (isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) return@execute
        get("assets/config/ui_config.json").writeBytes(loadResource("ui_config.json"))
    }
}
