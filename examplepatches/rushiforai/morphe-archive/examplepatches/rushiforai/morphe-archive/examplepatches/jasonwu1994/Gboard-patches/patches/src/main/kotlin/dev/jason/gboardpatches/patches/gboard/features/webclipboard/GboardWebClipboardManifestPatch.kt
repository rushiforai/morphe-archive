package dev.jason.gboardpatches.patches.gboard.features.webclipboard

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Document
import org.w3c.dom.Element

internal val gboardWebClipboardManifestPatch = resourcePatch(
    description = "注入 Web Clipboard 所需 manifest components、permissions 與 tile drawable。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesSettingsPatch)

    finalize {
        applyWebClipboardManifest()
        copyWebClipboardTileDrawable()
    }
}

context(context: ResourcePatchContext)
private fun applyWebClipboardManifest() = with(context) {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        val application = manifest.childElements("application").firstOrNull()
            ?: error("Could not find application element in AndroidManifest.xml")

        WEB_CLIPBOARD_PERMISSIONS.forEach { permissionName ->
            ensureUsesPermission(document, manifest, permissionName)
        }

        val settingsActivity = ensureActivity(
            document,
            application,
            PATCHES_SETTINGS_ACTIVITY_CLASS,
            exported = "false"
        )

        val tilePreferencesActivity = ensureActivity(
            document,
            application,
            WEB_CLIPBOARD_TILE_PREFERENCES_ACTIVITY_CLASS,
            exported = "true"
        )
        ensureSettingsTilePreferencesIntentFilter(document, tilePreferencesActivity)

        ensureService(
            document,
            application,
            CLIPBOARD_SYNC_SERVICE_CLASS,
            exported = "false",
            foregroundServiceType = "dataSync"
        )

        val tileService = ensureService(
            document,
            application,
            WEB_CLIPBOARD_TILE_SERVICE_CLASS,
            exported = "true",
            foregroundServiceType = null
        )
        tileService.setAndroidAttribute("label", "Web Clipboard")
        tileService.setAndroidAttribute("icon", "@drawable/ic_web_clipboard_tile")
        tileService.setAndroidAttribute("permission", "android.permission.BIND_QUICK_SETTINGS_TILE")
        ensureSingleActionIntentFilter(document, tileService, ACTION_QS_TILE)
        ensureMetaData(document, tileService, "android.service.quicksettings.ACTIVE_TILE", "true")
        ensureMetaData(document, tileService, "android.service.quicksettings.TOGGLEABLE_TILE", "true")

        val packageReplacedReceiver = ensureReceiver(
            document,
            application,
            WEB_CLIPBOARD_PACKAGE_REPLACED_RECEIVER_CLASS,
            exported = "false"
        )
        ensureSingleActionIntentFilter(document, packageReplacedReceiver, ACTION_MY_PACKAGE_REPLACED)
    }
}

context(context: ResourcePatchContext)
private fun copyWebClipboardTileDrawable() = with(context) {
    val resourcePath = "$WEB_CLIPBOARD_RESOURCE_ROOT/drawable/ic_web_clipboard_tile.xml"
    val bytes = object {}.javaClass.classLoader.getResourceAsStream(resourcePath)?.use { it.readBytes() }
        ?: error("Web Clipboard tile drawable resource \"$resourcePath\" not found")
    val targetFile = this["res/drawable/ic_web_clipboard_tile.xml", false]
    targetFile.parentFile?.mkdirs()
    targetFile.outputStream().use { it.write(bytes) }
}

private fun ensureUsesPermission(document: Document, manifest: Element, permissionName: String) {
    val permission = manifest.childElements("uses-permission").firstOrNull {
        it.androidAttribute("name") == permissionName
    } ?: document.createElement("uses-permission").also { createdPermission ->
        val application = manifest.childElements("application").firstOrNull()
        if (application == null) {
            manifest.appendChild(createdPermission)
        } else {
            manifest.insertBefore(createdPermission, application)
        }
    }
    permission.setAndroidAttribute("name", permissionName)
}

private fun ensureService(
    document: Document,
    application: Element,
    className: String,
    exported: String,
    foregroundServiceType: String?
): Element {
    val service = application.childElements("service").firstOrNull {
        it.androidAttribute("name") == className
    } ?: document.createElement("service").also { createdService ->
        application.appendChild(createdService)
    }
    service.setAndroidAttribute("name", className)
    service.setAndroidAttribute("exported", exported)
    if (foregroundServiceType != null) {
        service.setAndroidAttribute("foregroundServiceType", foregroundServiceType)
    }
    return service
}

private fun ensureActivity(
    document: Document,
    application: Element,
    className: String,
    exported: String
): Element {
    val activity = application.childElements("activity").firstOrNull {
        it.androidAttribute("name") == className
    } ?: document.createElement("activity").also { createdActivity ->
        application.appendChild(createdActivity)
    }
    activity.setAndroidAttribute("name", className)
    activity.setAndroidAttribute("exported", exported)
    return activity
}

private fun ensureReceiver(
    document: Document,
    application: Element,
    className: String,
    exported: String
): Element {
    val receiver = application.childElements("receiver").firstOrNull {
        it.androidAttribute("name") == className
    } ?: document.createElement("receiver").also { createdReceiver ->
        application.appendChild(createdReceiver)
    }
    receiver.setAndroidAttribute("name", className)
    receiver.setAndroidAttribute("exported", exported)
    return receiver
}

private fun ensureSettingsTilePreferencesIntentFilter(document: Document, activity: Element) {
    val intentFilter = activity.childElements("intent-filter").firstOrNull {
        val actions = it.childElements("action").mapNotNull { action ->
            action.androidAttribute("name")
        }.toSet()
        ACTION_QS_TILE_PREFERENCES in actions
    } ?: document.createElement("intent-filter").also { createdIntentFilter ->
        activity.appendChild(createdIntentFilter)
    }
    ensureAction(document, intentFilter, ACTION_QS_TILE_PREFERENCES)
    ensureCategory(document, intentFilter, "android.intent.category.DEFAULT")
}

private fun ensureSingleActionIntentFilter(
    document: Document,
    component: Element,
    actionName: String
) {
    val intentFilter = component.childElements("intent-filter").firstOrNull {
        it.childElements("action").any { action -> action.androidAttribute("name") == actionName }
    } ?: document.createElement("intent-filter").also { createdIntentFilter ->
        component.appendChild(createdIntentFilter)
    }
    ensureAction(document, intentFilter, actionName)
}

private fun ensureAction(document: Document, parent: Element, actionName: String) {
    val action = parent.childElements("action").firstOrNull {
        it.androidAttribute("name") == actionName
    } ?: document.createElement("action").also { createdAction ->
        parent.appendChild(createdAction)
    }
    action.setAndroidAttribute("name", actionName)
}

private fun ensureCategory(document: Document, parent: Element, categoryName: String) {
    val category = parent.childElements("category").firstOrNull {
        it.androidAttribute("name") == categoryName
    } ?: document.createElement("category").also { createdCategory ->
        parent.appendChild(createdCategory)
    }
    category.setAndroidAttribute("name", categoryName)
}

private fun ensureMetaData(
    document: Document,
    component: Element,
    name: String,
    value: String
) {
    val metaData = component.childElements("meta-data").firstOrNull {
        it.androidAttribute("name") == name
    } ?: document.createElement("meta-data").also { createdMetaData ->
        component.appendChild(createdMetaData)
    }
    metaData.setAndroidAttribute("name", name)
    metaData.setAndroidAttribute("value", value)
}

private fun Element.androidAttribute(localName: String): String? {
    val namespaced = getAttributeNS(ANDROID_NS, localName)
    if (namespaced.isNotBlank()) {
        return namespaced
    }
    return getAttribute("android:$localName").takeIf { it.isNotBlank() }
}

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}

private val WEB_CLIPBOARD_PERMISSIONS = listOf(
    "android.permission.INTERNET",
    "android.permission.ACCESS_NETWORK_STATE",
    "android.permission.FOREGROUND_SERVICE",
    "android.permission.FOREGROUND_SERVICE_DATA_SYNC"
)

private const val PATCHES_SETTINGS_ACTIVITY_CLASS =
    "dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsActivity"
private const val WEB_CLIPBOARD_TILE_PREFERENCES_ACTIVITY_CLASS =
    "dev.jason.gboardpatches.extension.webclipboard.WebClipboardTilePreferencesActivity"
private const val CLIPBOARD_SYNC_SERVICE_CLASS =
    "dev.jason.gboardpatches.extension.webclipboard.ClipboardSyncService"
private const val WEB_CLIPBOARD_TILE_SERVICE_CLASS =
    "dev.jason.gboardpatches.extension.webclipboard.WebClipboardTileService"
private const val WEB_CLIPBOARD_PACKAGE_REPLACED_RECEIVER_CLASS =
    "dev.jason.gboardpatches.extension.webclipboard.WebClipboardPackageReplacedReceiver"
private const val ACTION_QS_TILE = "android.service.quicksettings.action.QS_TILE"
private const val ACTION_QS_TILE_PREFERENCES =
    "android.service.quicksettings.action.QS_TILE_PREFERENCES"
private const val ACTION_MY_PACKAGE_REPLACED = "android.intent.action.MY_PACKAGE_REPLACED"
private const val WEB_CLIPBOARD_RESOURCE_ROOT = "web-clipboard-res"
