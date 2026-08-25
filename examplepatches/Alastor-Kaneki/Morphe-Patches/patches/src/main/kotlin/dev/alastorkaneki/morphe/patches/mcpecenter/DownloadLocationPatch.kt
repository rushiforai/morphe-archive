package dev.alastorkaneki.morphe.patches.mcpecenter

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import dev.alastorkaneki.morphe.patches.mcpecenter.Constants.MCPE_CENTER
import org.w3c.dom.Element

private const val DOWNLOAD_ACTIVITY =
    "dev.alastorkaneki.morphe.extension.mcpecenter.DownloadLocationActivity"
private const val DOWNLOAD_MANAGER_CLASS =
    "Ldev/alastorkaneki/morphe/extension/mcpecenter/DownloadLocationManager;"

@Suppress("unused")
internal val addDownloadLocationActivityPatch = resourcePatch(
    description = "Registers the native download-location settings screen."
) {
    compatibleWith(MCPE_CENTER)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val alreadyPresent =
                (0 until application.getElementsByTagName("activity").length)
                    .map { application.getElementsByTagName("activity").item(it) as Element }
                    .any { it.getAttribute("android:name") == DOWNLOAD_ACTIVITY }

            if (!alreadyPresent) {
                application.appendChild(document.createElement("activity").apply {
                    setAttribute("android:name", DOWNLOAD_ACTIVITY)
                    setAttribute("android:exported", "true")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:label", "Download location")
                    setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                })
            }
        }
    }
}

/**
 * Mirrors completed add-on files into a user-selected Storage Access Framework directory while
 * leaving the original working file in place long enough for the app's Minecraft import flow.
 */
@Suppress("unused")
val customDownloadLocationPatch = bytecodePatch(
    name = "Custom download folder",
    description =
        "Adds a native Android folder picker, a Download folder app shortcut and automatic saving of downloaded add-ons to the selected folder.",
    default = true
) {
    compatibleWith(MCPE_CENTER)
    dependsOn(addDownloadLocationActivityPatch)
    extendWith("extensions/extension.mpe")

    execute {
        ConfigureFlutterEngineFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $DOWNLOAD_MANAGER_CLASS->initialize(Landroid/app/Activity;)V"
        )

        // This is the app's existing addons/detail MethodChannel callback. The original install
        // and open-with behavior continues immediately after our side-effect hook.
        AddonMethodChannelFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $DOWNLOAD_MANAGER_CLASS->onMethodCall(Landroid/app/Activity;Ljava/lang/Object;)V"
        )
    }
}
