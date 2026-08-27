package io.github.liongalahad.nuviotv.patches.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

private const val STORAGE_SETTINGS_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.storage_path"
private const val STORAGE_SETTINGS_CATEGORY =
    "io.github.liongalahad.nuviotv.extension.settings.MorpheStorageSettingsCategory"
private const val STORAGE_PICKER =
    "io.github.liongalahad.nuviotv.extension.settings.MorpheStorageFolderPickerActivity"
private const val STORAGE_INTERNAL_PICKER =
    "io.github.liongalahad.nuviotv.extension.settings.MorpheStorageInternalFolderPickerActivity"

/** Registers shared storage UI once when any storage-consuming patch is installed. */
fun registerSharedStorageSettings(document: Document, application: Element) {
    listOf(
        STORAGE_PICKER to "@android:style/Theme.Translucent.NoTitleBar",
        STORAGE_INTERNAL_PICKER to "@android:style/Theme.Material.NoActionBar"
    ).forEach { (name, theme) ->
        val present = (0 until application.getElementsByTagName("activity").length).any { index ->
            (application.getElementsByTagName("activity").item(index) as Element)
                .getAttribute("android:name") == name
        }
        if (!present) application.appendChild(document.createElement("activity").apply {
            setAttribute("android:name", name)
            setAttribute("android:exported", "false")
            setAttribute("android:excludeFromRecents", "true")
            setAttribute("android:theme", theme)
        })
    }

    val providerPresent = (0 until application.getElementsByTagName("meta-data").length).any { index ->
        (application.getElementsByTagName("meta-data").item(index) as Element)
            .getAttribute("android:name") == STORAGE_SETTINGS_METADATA
    }
    if (!providerPresent) application.appendChild(document.createElement("meta-data").apply {
        setAttribute("android:name", STORAGE_SETTINGS_METADATA)
        setAttribute("android:value", STORAGE_SETTINGS_CATEGORY)
    })
}
