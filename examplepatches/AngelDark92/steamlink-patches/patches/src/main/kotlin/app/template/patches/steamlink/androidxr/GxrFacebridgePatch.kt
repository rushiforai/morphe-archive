package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import org.w3c.dom.Element
import java.io.File

private fun facebridgeResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: error("Missing bundled resource: steamlink/androidxr/$name"))
        .use { it.readBytes() }

private val gxrFacebridgeLibPatch = rawResourcePatch {
    execute {
        val libDir = get("lib/arm64-v8a/libvrlink_scene.so").parentFile!!
        // OpenXR implicit API layer: bridges XR_FB_face_tracking2 (Meta) → XR_ANDROID_face_tracking
        File(libDir, "libgxr_face_bridge.so").writeBytes(facebridgeResource("libgxr_face_bridge.so"))

        // Layer manifest key: api_layer.name="XR_APILAYER_local_GalaxyXR_face_bridge", disable_env=GXR_DISABLE_FACE_BRIDGE
        val layerManifest = get(
            "assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_face_bridge.json",
        )
        layerManifest.parentFile!!.mkdirs()
        layerManifest.writeBytes(facebridgeResource("XR_APILAYER_local_GalaxyXR_face_bridge.json"))

        // arslib ResourceIdProcessor requires ids.xml; APKs without <item type="id"> resources omit it.
        // "res/" paths resolve against the decoded package dir, not the raw apk root, so use get() directly.
        val idsFile = get("res/values/ids.xml")
        if (!idsFile.exists()) {
            idsFile.parentFile!!.mkdirs()
            idsFile.writeText("""<?xml version="1.0" encoding="utf-8"?><resources/>""")
        }
    }
}

private val gxrFacebridgeManifestPatch = resourcePatch {
    dependsOn(gxrFacebridgeLibPatch)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as Element
            // Android XR platform permission for XR_ANDROID_face_tracking access
            val perm = "android.permission.FACE_TRACKING"
            val alreadyPresent = (0 until doc.getElementsByTagName("uses-permission").length)
                .map { doc.getElementsByTagName("uses-permission").item(it) as Element }
                .any { it.getAttribute("android:name") == perm }
            if (!alreadyPresent) {
                val el = doc.createElement("uses-permission")
                el.setAttribute("android:name", perm)
                manifest.insertBefore(el, app)
            }
        }
    }
}

@Suppress("unused")
val gxrFacebridgePatch = rawResourcePatch(
    name = "GXR face bridge",
    description = "Installs libgxr_face_bridge.so (XR_FB_face_tracking2 → XR_ANDROID_face_tracking API layer) and adds android.permission.FACE_TRACKING to the manifest. See the [GXR Face Bridge source](https://github.com/compdoge/gxr-face-bridge) and matching [Galaxy XR VRCFT module](https://github.com/compdoge/LinkFT).",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())
    // Keep the complete legacy launcher foundation while using only the minimal
    // permission/settings activity on native-XR builds. The activity requests FACE_TRACKING.
    dependsOn(
        xrLauncherBootstrapPatch,
        xrPermissionSettingsBootstrapPatch,
        gxrFacebridgeManifestPatch,
    )

    execute { /* all work done by sub-patches */ }
}
