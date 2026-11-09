package app.template.patches.opera.manifest

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import app.template.patches.opera.OPERA_GX_COMPATIBILITY
import org.w3c.dom.Element
import org.w3c.dom.Node

/**
 * Strips ad-profiling and tracking permissions from AndroidManifest.xml, in
 * the spirit of the permission hygiene that modded Opera builds perform
 * (verified against the ANiK555 Opera Mini mod, which drops exactly these
 * permission families — Google Privacy Sandbox `ACCESS_ADSERVICES_*`, the
 * Google Advertising ID, Play install-referrer attribution, basic phone
 * state and vendor store junk).
 *
 * Removed (only when declared; each declared match is removed):
 *
 *  - `ACCESS_ADSERVICES_AD_ID` / `ACCESS_ADSERVICES_ATTRIBUTION` /
 *    `ACCESS_ADSERVICES_TOPICS` — Android 14 Privacy Sandbox profiling
 *    (Topics API, ad attribution). Only ad SDKs call these APIs, and
 *    "Disable ad modules" already prevents those from loading.
 *  - `com.google.android.gms.permission.AD_ID` — hands the Google
 *    Advertising ID (GAID) to any SDK that asks; pure ad profiling.
 *  - `com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE`
 *    — Play Store campaign/install attribution (marketing), no user feature.
 *  - `android.permission.READ_BASIC_PHONE_STATE` — SIM/carrier state; a
 *    browser has no need for it, and apps must already tolerate the runtime
 *    permission being denied.
 *  - `com.huawei.appmarket.service.commondata.permission.GET_COMMON_DATA` —
 *    Huawei AppGallery telemetry shim.
 *
 * Additionally the `android.adservices.AD_SERVICES_CONFIG` manifest
 * <property> (an enrollment-IDs file for the Privacy Sandbox APIs) is
 * removed when present — none of the current targets declare it, so this
 * only guards future builds.
 *
 * Every normal permission can be denied at runtime anyway, so the browser's
 * permission-handling code paths are all required to tolerate absence; the
 * patch therefore uses remove-if-present semantics and only fails when
 * NOTHING at all was removed (unsupported package/version).
 *
 * Note the tag variants: permissions may be declared as `<uses-permission>`
 * or `<uses-permission-sdk-23>`, and attribute names may surface with or
 * without the bound `android:` namespace prefix depending on how ARSCLib
 * decoded the document — both spellings are checked.
 */
@Suppress("unused")
val operaRemoveAdTrackingPermissionsPatch = resourcePatch(
    name = "Remove ad & tracking permissions",
    description = "Drops ad-profiling and tracking permissions from the manifest: " +
        "Privacy Sandbox (ACCESS_ADSERVICES_*), Google Advertising ID, Play " +
        "install-referrer attribution, basic phone state and Huawei store junk.",
    default = true,
) {
    compatibleWith(
        OPERA_COMPATIBILITY,
        OPERA_DIRECT_COMPATIBILITY,
        OPERA_BETA_COMPATIBILITY,
        OPERA_GX_COMPATIBILITY,
    )

    execute {
        val permissionNames = setOf(
            // Android 14 Privacy Sandbox (Topics / ad-ID / attribution)
            "android.permission.ACCESS_ADSERVICES_AD_ID",
            "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            "android.permission.ACCESS_ADSERVICES_TOPICS",
            // Google Advertising ID handed to ad SDKs
            "com.google.android.gms.permission.AD_ID",
            // Play Store install/campaign attribution
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
            // SIM / carrier state
            "android.permission.READ_BASIC_PHONE_STATE",
            // Huawei AppGallery telemetry shim
            "com.huawei.appmarket.service.commondata.permission.GET_COMMON_DATA",
        )
        val propertyNames = setOf(
            "android.adservices.AD_SERVICES_CONFIG",
        )

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement

            val permissionTags = setOf("uses-permission", "uses-permission-sdk-23")
            val toRemove = mutableListOf<Node>()
            val removedNames = mutableListOf<String>()

            val children = manifest.childNodes
            for (i in 0 until children.length) {
                val node = children.item(i) as? Element ?: continue
                val name = node.getAttribute("android:name")
                    .ifBlank { node.getAttributeNS(ANDROID_XML_NAMESPACE, "name") }
                when {
                    node.tagName in permissionTags && name in permissionNames -> {
                        toRemove += node
                        removedNames += name
                    }
                    node.tagName == "property" && name in propertyNames -> {
                        toRemove += node
                        removedNames += name
                    }
                }
            }

            if (removedNames.isEmpty()) {
                throw PatchException(
                    "No ad/tracking permissions found in AndroidManifest.xml. " +
                        "Is this an unsupported Opera variant?",
                )
            }

            toRemove.forEach(manifest::removeChild)
            println(
                "Opera permissions: removed ${removedNames.size} manifest entr(ies): " +
                    removedNames.joinToString(", "),
            )
        }
    }
}

private const val ANDROID_XML_NAMESPACE = "http://schemas.android.com/apk/res/android"
