package io.github.sazap10.patches.sync.targetsdk

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import io.github.sazap10.patches.sync.shared.SyncCompatibility
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val TARGET_SDK = 36
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Services in the APK that call startForeground(), with the type each one needs from API 34.
 * Sync's own code never starts a foreground service. These come from bundled libraries.
 */
private val foregroundServices = mapOf(
    // WorkManager, used when a worker calls setForeground(). Already declares dataSync.
    "androidx.work.impl.foreground.SystemForegroundService" to "dataSync",
    // Play asset pack extraction. Disabled in the manifest. Typed so it cannot crash if enabled.
    "com.google.android.play.core.assetpacks.ExtractionForegroundService" to "dataSync",
)

private val foregroundServicePermissions = mapOf(
    "dataSync" to "android.permission.FOREGROUND_SERVICE_DATA_SYNC",
)

private fun Document.elements(tag: String) = getElementsByTagName(tag).let { nodes ->
    (0 until nodes.length).map { nodes.item(it) as Element }
}

@Suppress("unused")
val targetSdkPatch = patch(
    name = "Target SDK 36",
    description = "Raises targetSdkVersion to $TARGET_SDK. Adds export flags to runtime broadcast receivers, " +
        "declares foreground service types and their permissions, opts out of predictive back, and fixes the " +
        "toolbar-anchored bottom sheets under enforced edge-to-edge.",
    default = true,
) {
    compatibleWith(*SyncCompatibility.SyncForReddit)

    dependsOn(receiverExportFlagsPatch, bottomSheetEdgeToEdgePatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.elements("application").singleOrNull()
                ?: throw PatchException("AndroidManifest.xml has no single <application>")

            // region targetSdkVersion

            val usesSdk = document.elements("uses-sdk").singleOrNull()
                ?: document.createElement("uses-sdk").also { manifest.insertBefore(it, manifest.firstChild) }
            // minSdkVersion stays as it is (23).
            usesSdk.setAttributeNS(ANDROID_NS, "android:targetSdkVersion", TARGET_SDK.toString())

            // endregion

            // region Foreground service types (API 34)

            val services = document.elements("service").associateBy { it.getAttribute("android:name") }
            val usedTypes = mutableSetOf<String>()
            foregroundServices.forEach { (name, type) ->
                val service = services[name] ?: throw PatchException("Service $name not found")
                val declared = service.getAttribute("android:foregroundServiceType")
                if (declared.isEmpty()) {
                    service.setAttributeNS(ANDROID_NS, "android:foregroundServiceType", type)
                } else if (type !in declared.split('|')) {
                    throw PatchException("$name declares foregroundServiceType=$declared, expected $type")
                }
                usedTypes += type
            }

            val permissions = document.elements("uses-permission").mapTo(HashSet()) {
                it.getAttribute("android:name")
            }
            usedTypes.map(foregroundServicePermissions::getValue).filterNot(permissions::contains).forEach {
                val permission = document.createElement("uses-permission")
                permission.setAttributeNS(ANDROID_NS, "android:name", it)
                manifest.insertBefore(permission, application)
            }

            // endregion

            // region Predictive back (API 36)

            // Predictive back is on by default from target 36. While it is on, onBackPressed() and
            // KEYCODE_BACK are not delivered, and Sync relies on both for back and swipe-back.
            application.setAttributeNS(ANDROID_NS, "android:enableOnBackInvokedCallback", "false")

            // endregion
        }
    }
}
