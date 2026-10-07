/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val PATCH = "Remove ad tracking permissions"

/** Google's advertising ID permission and the Privacy Sandbox ad services permissions. */
internal val AD_TRACKING_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
)

/** The application property naming the app's Privacy Sandbox ad services configuration. */
internal const val AD_SERVICES_CONFIG = "android.adservices.AD_SERVICES_CONFIG"

private val PERMISSION_TAGS = setOf("uses-permission", "uses-permission-sdk-23")

private fun Node.childElements(): List<Element> = childNodes.let { nodes -> (0 until nodes.length).mapNotNull { nodes.item(it) as? Element } }

/**
 * Removes every [AD_TRACKING_PERMISSIONS] request and the application's [AD_SERVICES_CONFIG]
 * property. Everything else stays as it is. A manifest with none of them refuses before any edit.
 */
internal fun removeAdTrackingDeclarations(document: Document) {
    val manifest = document.documentElement
    val permissions = manifest.childElements().filter {
        it.tagName in PERMISSION_TAGS && it.getAttribute("android:name") in AD_TRACKING_PERMISSIONS
    }
    val properties = manifest.childElements().filter { it.tagName == "application" }.flatMap { it.childElements() }
        .filter { it.tagName == "property" && it.getAttribute("android:name") == AD_SERVICES_CONFIG }
    val removed = permissions + properties
    if (removed.isEmpty()) {
        throw PatchException("$PATCH: AndroidManifest.xml declares none of " +
            (AD_TRACKING_PERMISSIONS + AD_SERVICES_CONFIG).joinToString())
    }
    removed.forEach { it.parentNode.removeChild(it) }
}

/** Checks the status flag first, so a broken extension refuses before the manifest is changed. */
internal val adTrackingPreflightPatch = bytecodePatch {
    dependsOn(settingsPatch, pinterestExtensionPatch)
    execute { requireStatusMethod("removeAdTrackingPermissions") }
}

internal val removeAdTrackingManifestPatch = resourcePatch {
    dependsOn(adTrackingPreflightPatch)
    execute { document("AndroidManifest.xml").use(::removeAdTrackingDeclarations) }
}

@Suppress("unused")
val removeAdTrackingPermissionsPatch = bytecodePatch(
    name = PATCH,
    description = "Removes Google's advertising ID permission and Android's Privacy Sandbox ad services " +
        "from Pinterest. It can't be turned back on in settings, only by patching again without it. " +
        "While it's in, Hide advertising ID's switch can't hand back the real ID, because Google Play " +
        "services answers with zeros.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, pinterestExtensionPatch, removeAdTrackingManifestPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        enableStatus("removeAdTrackingPermissions")
    }
}
