/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.morphe.patches.threads.misc.adid

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import org.w3c.dom.Element

/** The permission Google Play services asks for before it hands an app the advertising ID. */
internal const val AD_ID_PERMISSION = "com.google.android.gms.permission.AD_ID"

/** Takes [AD_ID_PERMISSION] out of the manifest, and refuses a manifest that never asked for it. */
internal val removeAdIdManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("uses-permission")
            val adId = (0 until permissions.length).map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") == AD_ID_PERMISSION }
            if (adId.isEmpty()) throw PatchException("AndroidManifest.xml doesn't ask for $AD_ID_PERMISSION")
            adId.forEach { it.parentNode.removeChild(it) }
        }
    }
}

/**
 * Takes the advertising ID away from Threads.
 *
 * Google Play services gives an app that targets Android 13 or later a string of zeros in place of
 * the advertising ID unless its manifest asks for [AD_ID_PERMISSION]. Threads 449 targets Android
 * 16 and asks for it, so taking the request out is all it takes. Threads' code runs as before and
 * gets the zeros, which is what it gets on a phone where you've deleted your advertising ID.
 */
@Suppress("unused")
val removeAdIdPatch = bytecodePatch(
    name = "Remove the advertising ID",
    description = "Stops Threads getting your phone's advertising ID from Google Play services. " +
        "Threads gets a string of zeros in its place.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, threadsExtensionPatch, removeAdIdManifestPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        enableStatus("removeAdId")
    }
}
