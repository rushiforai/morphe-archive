package app.noam.patches.blockblast.network

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST
import org.w3c.dom.Element

private const val OFFLINE_PROVIDER = "app.noam.extension.blockblast.OfflineProvider"

private val blockOnlineAccessManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val permissions = manifest.getElementsByTagName("uses-permission")
            (permissions.length - 1 downTo 0)
                .map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") == "android.permission.INTERNET" }
                .forEach { it.parentNode.removeChild(it) }

            // Created before every other provider (highest initOrder) and before Application.onCreate.
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val provider = manifest.createElement("provider")
            provider.setAttribute("android:name", OFFLINE_PROVIDER)
            provider.setAttribute("android:authorities", "com.block.juggle.bbmod.offline")
            provider.setAttribute("android:exported", "false")
            provider.setAttribute("android:initOrder", Int.MAX_VALUE.toString())
            application.appendChild(provider)
        }
    }
}

@Suppress("unused")
val blockOnlineAccessPatch = bytecodePatch(
    name = "Block online access",
    description = "Takes away the app's permission to use the internet, so nothing in it (game, ads, analytics) can go online.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(blockOnlineAccessManifestPatch, modLoaderPatch)
    extendWith("extensions/blockblast.mpe")
    // Build-time change; the Mod settings screen only reports it.
    execute { Mod.enable("offlineBuild") }
}
