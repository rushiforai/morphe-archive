package biz.kushan.ltkey.patches

import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import biz.kushan.ltkey.patches.shared.Constants.COMPATIBILITY_SMARTTHINGS
import org.w3c.dom.Element
import org.w3c.dom.Node

/**
 * Opt-in fix for installing the patched app on Samsung phones.
 *
 * SmartThings' manifest *declares* several custom permissions that are already owned by Samsung's
 * own pre-installed apps — e.g. `com.sec.android.permission.PERSONAL_MEDIA`
 * (`com.samsung.android.allshare.service.mediashare`) and
 * `com.android.systemui.qs.permission.ST_QUICK_CONTROL` (SystemUI). Android refuses to install a
 * differently-signed APK that re-declares a permission another package already owns
 * (`INSTALL_FAILED_DUPLICATE_PERMISSION`), so the patched build will not install on a Samsung phone.
 * Non-Samsung phones do not ship those apps, so they install fine without this patch.
 *
 * This removes the foreign `<permission>` *declarations* (every one whose name is not in the app's
 * own `com.samsung.android.oneconnect` namespace). The app can still `<uses-permission>` them — using
 * a permission another package defines is allowed; only re-defining one is not. The app's own
 * permissions are left untouched, since redeclaring the same package's permissions never conflicts.
 *
 * Off by default: only Samsung-phone users need it, and it changes the manifest.
 */
@Suppress("unused")
val samsungInstallPatch = patch(
    name = "Allow install on Samsung phones",
    description = "Removes duplicate permission declarations that block installing the patched app " +
        "on Samsung phones (INSTALL_FAILED_DUPLICATE_PERMISSION). Enable this only if the install " +
        "fails on a Samsung device; it is unnecessary on non-Samsung phones.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SMARTTHINGS)

    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("permission")

            // Collect first: the NodeList is live, so removing during iteration would shift it.
            val foreign = ArrayList<Node>()
            for (i in 0 until permissions.length) {
                val element = permissions.item(i) as? Element ?: continue
                val name = element.getAttribute("android:name")
                if (name.isNotEmpty() && !name.startsWith("com.samsung.android.oneconnect")) {
                    foreign.add(element)
                }
            }

            foreign.forEach { it.parentNode?.removeChild(it) }
        }
    }
}
