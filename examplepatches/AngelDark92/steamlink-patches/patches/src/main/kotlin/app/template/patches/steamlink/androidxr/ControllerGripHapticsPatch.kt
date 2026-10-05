package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL
import app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
import app.template.patches.shared.PatchCategories
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val CONTROLLER_GRIP_HAPTICS_LIBRARY = "libgxr_haptic_main.so"
internal const val CONTROLLER_GRIP_HAPTICS_MANIFEST = "XR_APILAYER_local_GalaxyXR_haptic_main.json"
internal const val CONTROLLER_GRIP_HAPTICS_EXTENSION = "extensions/controller-grip-haptics.mpe"
internal const val CONTROLLER_GRIP_HAPTICS_PROVIDER = "gxr.haptic.HapticProvider"

private const val SHIZUKU_PACKAGE = "moe.shizuku.privileged.api"
private const val SHIZUKU_PERMISSION = "moe.shizuku.manager.permission.API_V23"
private const val SHIZUKU_V3_SUPPORT = "moe.shizuku.client.V3_SUPPORT"

// The layer hooks only xrApplyHapticFeedback/xrStopHapticFeedback, which every supported base
// calls the same way, so it is not tied to one native layout.
internal fun isControllerGripHapticsBuild(version: String, versionCode: String): Boolean =
    isLegacyXrFoundationSteamLinkBuild(version, versionCode) ||
        isNativeXrSteamLinkBuild(version, versionCode)

internal fun controllerGripHapticsResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/$name")
        ?: throw PatchException("Missing bundled resource: $name"))
        .use { it.readBytes() }

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

/**
 * Declares what Shizuku needs to hand its binder to the app. Shizuku looks the provider up by the
 * authority "<package>.shizuku", so it is derived from the manifest's current package.
 */
internal fun addControllerGripHapticsManifestEntries(document: Document) {
    val manifest = document.documentElement
    val application = document.elements("application").single()

    if (document.elements("uses-permission").none { it.getAttribute("android:name") == SHIZUKU_PERMISSION }) {
        val permission = document.createElement("uses-permission")
        permission.setAttribute("android:name", SHIZUKU_PERMISSION)
        manifest.insertBefore(permission, application)
    }

    if (document.elements("package").none { it.getAttribute("android:name") == SHIZUKU_PACKAGE }) {
        val queries = document.createElement("queries")
        val shizuku = document.createElement("package")
        shizuku.setAttribute("android:name", SHIZUKU_PACKAGE)
        queries.appendChild(shizuku)
        manifest.insertBefore(queries, application)
    }

    if (document.elements("meta-data").none { it.getAttribute("android:name") == SHIZUKU_V3_SUPPORT }) {
        val support = document.createElement("meta-data")
        support.setAttribute("android:name", SHIZUKU_V3_SUPPORT)
        support.setAttribute("android:value", "true")
        application.appendChild(support)
    }

    val provider = document.elements("provider")
        .firstOrNull { it.getAttribute("android:name") == CONTROLLER_GRIP_HAPTICS_PROVIDER }
        ?: document.createElement("provider").also { application.appendChild(it) }
    provider.setAttribute("android:name", CONTROLLER_GRIP_HAPTICS_PROVIDER)
    provider.setAttribute("android:authorities", "${manifest.getAttribute("package")}.shizuku")
    provider.setAttribute("android:enabled", "true")
    provider.setAttribute("android:exported", "true")
    provider.setAttribute("android:multiprocess", "false")
    provider.setAttribute("android:permission", "android.permission.INTERACT_ACROSS_USERS_FULL")
}

// gxr.haptic.* and the Shizuku API classes; no fragment of an existing Steam Link class.
private val controllerGripHapticsExtensionPatch = bytecodePatch {
    extendWith(CONTROLLER_GRIP_HAPTICS_EXTENSION)
}

private val controllerGripHapticsManifestPatch = resourcePatch {
    execute {
        if (isControllerGripHapticsBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            ensureIdsXml(get("res/values/ids.xml"))
        }
    }
    finalize {
        if (!isControllerGripHapticsBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@finalize
        }
        document("AndroidManifest.xml").use { document ->
            addControllerGripHapticsManifestEntries(document)
        }
    }
}

@Suppress("unused")
val controllerGripHapticsPatch = rawResourcePatch(
    name = "Controller grip haptics through Shizuku (experimental)",
    description = "Sends controller vibration to the vibrator in the grip instead of the one at the trigger. Galaxy XR routes every OpenXR vibration to the trigger vibrator; the grip one is reachable only with shell rights, so this needs Shizuku running and its permission granted to Steam Link. Without Shizuku vibration stays as it is.",
    default = false,
) {
    category(PatchCategories.EXPERIMENTS)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.toTypedArray())
    dependsOn(
        controllerGripHapticsExtensionPatch,
        controllerGripHapticsManifestPatch,
    )

    execute {
        // Morphe dependencies do not re-check compatibility before execution.
        if (!isControllerGripHapticsBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }

        val library = get("lib/arm64-v8a/$CONTROLLER_GRIP_HAPTICS_LIBRARY")
        library.parentFile!!.mkdirs()
        library.writeBytes(
            controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_LIBRARY"),
        )

        val manifest = get("assets/openxr/1/api_layers/implicit.d/$CONTROLLER_GRIP_HAPTICS_MANIFEST")
        manifest.parentFile!!.mkdirs()
        manifest.writeBytes(
            controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_MANIFEST"),
        )
    }
}
