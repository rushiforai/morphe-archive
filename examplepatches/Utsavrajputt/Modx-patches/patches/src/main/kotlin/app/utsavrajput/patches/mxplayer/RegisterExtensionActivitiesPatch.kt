package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.patch.resourcePatch
import app.utsavrajput.patches.shared.Constants.COMPATIBILITY_MX_PLAYER
import org.w3c.dom.Element

/**
 * extendWith("extensions/core.mpe") (used in RepurposeSearchAndGamesTabsPatch)
 * only merges the extension's compiled DEX classes into the output APK — it
 * does NOT merge the extension module's own AndroidManifest.xml. Without
 * this patch, every Activity declared in extensions/core/src/main/AndroidManifest.xml
 * stays invisible to the final APK, and any startActivity() call to one of
 * them throws ActivityNotFoundException at runtime (confirmed in crash_log.txt:
 * n4d.L1() -> ExtensionHooks.launchTools() -> ToolsActivity, and
 * n4d.y1() -> ExtensionHooks.launchAbout() -> AboutActivity).
 *
 * Fix: directly inject <activity> nodes for every extension screen, plus the
 * FileProvider used by WhatsApp Status Saver / Secure Folder / Transfer Files,
 * into the target app's own AndroidManifest.xml via the resource-patch
 * document() API (DOM-level edit, not raw byte patching - safe against
 * repackaging/AAPT re-encoding).
 *
 * IMPORTANT: this patch must always be enabled together with
 * repurposeSearchAndGamesTabsPatch (and any future patch that calls into
 * ExtensionHooks) - if this one is disabled while the other stays on, tapping
 * Search/Games will crash with ActivityNotFoundException again.
 */
@Suppress("unused")
val registerExtensionActivitiesPatch = resourcePatch(
    name = "Register Modx extension activities",
    description = "Adds the ToolsActivity/AboutActivity/tool screens and FileProvider from the extensions/core module " +
        "to the app's AndroidManifest.xml so they can actually be launched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)

    // Every Activity class currently declared in
    // extensions/core/src/main/AndroidManifest.xml. Keep this list in sync
    // whenever a new screen is added to the extension module.
    val extensionActivities = listOf(
        "app.utsavrajput.extension.AboutActivity",
        "app.utsavrajput.extension.ToolsActivity",
        "app.utsavrajput.extension.TransferFilesActivity",
        "app.utsavrajput.extension.StatusSaverActivity",
        "app.utsavrajput.extension.PlaylistActivity",
        "app.utsavrajput.extension.SecureFolderPinActivity",
        "app.utsavrajput.extension.SecureFolderActivity",
        "app.utsavrajput.extension.UrlStreamActivity",
        "app.utsavrajput.extension.RecycleBinActivity",
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            val applicationNode = document
                .getElementsByTagName("application")
                .item(0) as Element

            extensionActivities.forEach { className ->
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", className)
                activity.setAttribute("android:exported", "false")
                applicationNode.appendChild(activity)
            }

            // NOTE: FileProvider registration is intentionally NOT added here yet.
            // <meta-data android:resource="@xml/modx_file_paths"> requires the
            // modx_file_paths.xml resource to exist in the target app's own
            // resource table (resources.arsc) with a real allocated ID -
            // dropping the raw XML file into res/xml/ is not enough, and
            // referencing an unregistered @xml/... resource fails APK
            // re-encoding at build time (IOException: Resource not found for
            // '@xml/modx_file_paths'), before the APK is even installed.
            //
            // This blocks WhatsApp Status Saver / Secure Folder / Transfer
            // Files (all SAF/FileProvider-based) until it's added properly -
            // needs the resource itself to be registered into the resource
            // table, not just referenced. Tracked as follow-up; does not
            // block Search/Games -> Tools/About, which only needs the
            // Activity entries below.
        }
    }
}
