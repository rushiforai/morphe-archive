package app.threadripper.patches.youtube.warp

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.threadripper.patches.youtube.Constants.COMPATIBILITY_YOUTUBE
import app.threadripper.patches.youtube.settings.settingsResourcePatch
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "Lapp/threadripper/extension/youtube/Warp;"
private const val VPN_SERVICE = "app.threadripper.extension.youtube.WarpVpnService"

/** Declares the extension's VpnService; Android only binds a VPN service declared like this. */
private val warpServicePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val service = document.createElement("service").apply {
                setAttribute("android:name", VPN_SERVICE)
                setAttribute("android:exported", "false")
                setAttribute("android:permission", "android.permission.BIND_VPN_SERVICE")
            }
            val filter = document.createElement("intent-filter")
            filter.appendChild(
                document.createElement("action").apply { setAttribute("android:name", "android.net.VpnService") },
            )
            service.appendChild(filter)
            application.appendChild(service)
        }
    }
}

@Suppress("unused")
val warpPatch = bytecodePatch(
    name = "Cloudflare WARP while open",
    description = "Adds an option (off by default) to route YouTube, and only YouTube, through Cloudflare " +
        "WARP while it is in the foreground, and back to the normal connection in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/youtube.mpe")
    dependsOn(settingsResourcePatch, warpServicePatch)

    execute {
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            // Range form: p0 is a high register (v24 in 21.16.256), beyond the v0-v15 of { p0 }.
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onCreate(Landroid/app/Activity;)V",
        )
    }
}
