package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_HELAKURU_LITE
import org.w3c.dom.Element

private const val BACKUP_EXTENSION =
    "Lapp/template/extension/extension/HelakuruLiteSettingsBackupExtension;"
private const val BACKUP_ACTIVITY =
    "app.template.extension.extension.HelakuruLiteSettingsBackupActivity"

private val helakuruLiteSettingsBackupResourcesPatch = resourcePatch {
    execute {
        document("res/xml/ime_preferences.xml").use { preferences ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val categories = preferences.getElementsByTagName("PreferenceCategory")
            val general = (0 until categories.length)
                .map { categories.item(it) as Element }
                .first { it.getAttributeNS(namespace, "key") == "pref1" }

            val preference = preferences.createElement("Preference") as Element
            preference.setAttributeNS(namespace, "android:key", "morphe_settings_backup")
            preference.setAttributeNS(namespace, "android:title", "Import / export keyboard settings")
            preference.setAttributeNS(
                namespace,
                "android:summary",
                "Save or restore settings added by Morphe patches"
            )
            general.appendChild(preference)
        }

        document("AndroidManifest.xml").use { manifest ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val alreadyAdded = (0 until application.childNodes.length)
                .mapNotNull { application.childNodes.item(it) as? Element }
                .any { it.tagName == "activity" && it.getAttributeNS(namespace, "name") == BACKUP_ACTIVITY }
            if (!alreadyAdded) {
                val activity = manifest.createElement("activity") as Element
                activity.setAttributeNS(namespace, "android:name", BACKUP_ACTIVITY)
                activity.setAttributeNS(namespace, "android:exported", "false")
                activity.setAttributeNS(namespace, "android:excludeFromRecents", "true")
                activity.setAttributeNS(
                    namespace,
                    "android:theme",
                    "@android:style/Theme.Translucent.NoTitleBar"
                )
                application.appendChild(activity)
            }
        }
    }
}

@Suppress("unused")
val helakuruLiteSettingsBackupPatch = patch(
    name = "Keyboard Settings Import/Export (Helakuru Lite)",
    description = "Export and import settings added by Morphe patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HELAKURU_LITE)
    dependsOn(helakuruLiteSettingsBackupResourcesPatch, helakuruLiteSettingsColorsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        prepareHelakuruLiteSettingsTheme()
        HelakuruLiteSettingsCreateFingerprint.method.addInstructions(
            helakuruLiteSettingsBindingIndex(),
            "invoke-static {p0}, $BACKUP_EXTENSION->bindSettings(Ljava/lang/Object;)V"
        )
    }
}
