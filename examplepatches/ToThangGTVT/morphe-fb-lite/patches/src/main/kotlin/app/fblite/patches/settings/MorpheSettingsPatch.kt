package app.fblite.patches.settings

import app.fblite.patches.font.AttachBaseContextFingerprint
import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val SETTINGS_ACTIVITY = "app.fblite.extension.settings.SettingsActivity"
private const val EXTENSION_CLASS = "Lapp/fblite/extension/settings/MorpheSettings;"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Labels of the shortcut, by values folder. */
private val LABELS = mapOf(
    "values" to ("Morphe" to "Morphe settings"),
    "values-vi" to ("Morphe" to "Cài đặt Morphe"),
)

/**
 * Declares the settings activity and adds it as a static shortcut of the launcher activity, so it is
 * in the app icon's long-press menu. Facebook Lite's own settings are drawn by the server and cannot
 * get extra entries.
 */
private val settingsActivityPatch = resourcePatch {
    execute {
        var packageName = ""
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            packageName = manifest.getAttribute("package")
            val application = document.getElementsByTagName("application").item(0) as Element

            application.appendChild(document.createElement("activity").apply {
                setAttribute("android:name", SETTINGS_ACTIVITY)
                setAttribute("android:exported", "false")
                setAttribute("android:label", "@string/morphe_settings_long")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:taskAffinity", "$packageName.morphe")
            })

            val activities = document.getElementsByTagName("activity")
            val launcher = (0 until activities.length).map { activities.item(it) as Element }.firstOrNull { activity ->
                val categories = activity.getElementsByTagName("category")
                (0 until categories.length).any {
                    (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
                }
            } ?: throw PatchException("No launcher activity found")
            launcher.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", "android.app.shortcuts")
                setAttribute("android:resource", "@xml/morphe_shortcuts")
            })
        }

        LABELS.forEach { (folder, labels) ->
            document("res/$folder/strings.xml").use { document ->
                val resources = document.documentElement
                listOf("morphe_settings_short" to labels.first, "morphe_settings_long" to labels.second).forEach { (name, text) ->
                    resources.appendChild(document.createElement("string").apply {
                        setAttribute("name", name)
                        textContent = text
                    })
                }
            }
        }

        get("res/xml/morphe_shortcuts.xml", false).writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <shortcuts xmlns:android="$ANDROID_NS">
                <shortcut
                    android:shortcutId="morphe_settings"
                    android:enabled="true"
                    android:icon="@mipmap/ic_launcher"
                    android:shortcutShortLabel="@string/morphe_settings_short"
                    android:shortcutLongLabel="@string/morphe_settings_long">
                    <intent
                        android:action="android.intent.action.VIEW"
                        android:targetPackage="$packageName"
                        android:targetClass="$SETTINGS_ACTIVITY" />
                </shortcut>
            </shortcuts>
            """.trimIndent()
        )
    }
}

@Suppress("unused")
val morpheSettingsPatch = bytecodePatch(
    name = "Morphe settings",
    description = "Adds a settings screen to the app icon's long-press menu, with a font size slider.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE)

    dependsOn(settingsActivityPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Facebook Lite sends the font scale of its application context to the server, which lays
        // the app out for it, so the base context gets the chosen font scale before anything reads it.
        // attachBaseContext has 31 locals, so p1 is above v15 and needs the range form.
        AttachBaseContextFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->wrapBaseContext(Landroid/content/Context;)Landroid/content/Context;
                move-result-object p1
            """
        )
    }
}
