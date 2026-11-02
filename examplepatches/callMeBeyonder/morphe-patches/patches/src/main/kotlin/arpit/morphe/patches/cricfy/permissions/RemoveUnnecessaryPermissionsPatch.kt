package arpit.morphe.patches.cricfy.permissions

import app.morphe.patcher.patch.rawResourcePatch
import arpit.morphe.patches.cricfy.shared.Constants.COMPATIBILITY_CRICFY_TV
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import com.reandroid.arsc.chunk.xml.ResXmlElement
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream

/**
 * Drops the permissions the patched build cannot use: boot persistence (the only
 * receiver that asked for it is the CashRaven one, which the bandwidth-sharing patch
 * stubs), the advertising IDs (the ads are removed by the ad patch) and the
 * install-referrer / query-all-packages access the bundled trackers request.
 *
 * The manifest is edited with ARSCLib (binary AXML, no decode/encode round trip, so
 * the rest of the document is byte-identical). `resources.arsc` is not touched: the
 * app ships it STORED and manipulated, and the raw coder would repack it.
 */
@Suppress("unused")
val removeUnnecessaryPermissionsPatch = rawResourcePatch(
    name = "Remove unnecessary permissions",
    description = "Removes the boot-persistence, advertising-ID, install-referrer and " +
        "package-query permissions the patched build no longer needs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)

    execute {
        val manifestOutput = get("AndroidManifest.xml")
        val workingDir = manifestOutput.parentFile
        // The raw coder decodes the manifest next to the entry it was asked for
        // (`AndroidManifest.xml.bin`); fall back to the overlay path of other coder
        // revisions and finally to the returned file itself.
        val manifestSource = listOfNotNull(
            workingDir?.let { File(it, "AndroidManifest.xml.bin") },
            workingDir?.let { File(it, "root/AndroidManifest.xml") },
        ).firstOrNull { it.isFile } ?: manifestOutput

        val manifest = FileInputStream(manifestSource).use { AndroidManifestBlock.load(it) }

        val removals = mutableListOf<ResXmlElement>()
        val elements = manifest.manifestElement.getElements("uses-permission")
        while (elements.hasNext()) {
            val element = elements.next() as? ResXmlElement ?: continue
            if (AndroidManifestBlock.getAndroidNameValue(element) in UNNECESSARY_PERMISSIONS) {
                removals += element
            }
        }
        removals.forEach { it.removeSelf() }
        manifest.refreshFull()

        FileOutputStream(manifestSource).use { manifest.writeBytes(it) }

        // The raw coder only applies files from its `patched/other` overlay to the APK,
        // so the edited binary manifest is written there as well.
        workingDir?.parentFile?.let { File(it, "patched/other") }?.let { overlay ->
            overlay.mkdirs()
            FileOutputStream(File(overlay, "AndroidManifest.xml")).use { manifest.writeBytes(it) }
        }
    }
}

private val UNNECESSARY_PERMISSIONS = listOf(
    "android.permission.RECEIVE_BOOT_COMPLETED",
    "android.permission.FOREGROUND_SERVICE_DATA_SYNC",
    "android.permission.Ad_ID",
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "android.permission.QUERY_ALL_PACKAGES",
)
