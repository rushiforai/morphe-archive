// SPDX-License-Identifier: GPL-3.0-only
package app.template.patches.brave

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Fixes INSTALL_FAILED_NO_MATCHING_ABIS ("Failed to extract native
 * libraries, res=-113") when a patched Brave APK is installed on 16 KB
 * page-size devices (Android 15 / 16).
 *
 * Root cause: the stock Brave APK stores its native libraries uncompressed
 * at 16 KB zip offsets and maps them directly from the APK
 * (`android:extractNativeLibs="false"`). The patcher re-creates the APK and
 * places the libraries at 4 KB offsets, which a 16 KB page device cannot
 * map, so the package manager fails the whole install before any patched
 * code even runs. Setting `android:extractNativeLibs="true"` makes the
 * system extract the libraries to disk at install time, where the APK entry
 * layout does not matter.
 *
 * Wiring: this patch is a dependency of every Brave patch in this bundle,
 * so any patched Brave build installs on 16 KB devices. Harmless on 4 KB
 * devices (libraries are extracted to disk, the historical default).
 *
 * Same approach as kveld9/kveld-morphe-patches (GPL-3.0), revision
 * 8afd78f0b57964b9ae9a0a387bdd4ae157345707 (BraveNativeExtractionPatch).
 */

private val braveNativeExtractionPatch = resourcePatch() {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as? Element
            if (application == null) {
                println("[Brave Compatibility] Skipped: no <application> element in AndroidManifest.xml")
                return@execute
            }
            application.setAttribute("android:extractNativeLibs", "true")
            println("[Brave Compatibility] Set android:extractNativeLibs=true in AndroidManifest.xml")
        }
    }
}

@JvmSynthetic
internal fun braveNativeExtractionDependency() = braveNativeExtractionPatch
