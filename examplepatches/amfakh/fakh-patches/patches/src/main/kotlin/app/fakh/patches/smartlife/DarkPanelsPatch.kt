package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_TUYA_SMART
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

/**
 * The device panels are React Native screens downloaded per device, whose colors live in the panel's own code, so
 * most of them stay white in dark mode. Under `Default_Panel_Theme`, which only the panel activities use, a night
 * variant marks the theme light and allows force dark: Android then darkens the panel as it draws it. In light mode
 * the theme is unchanged. Settings gets a switch for it in the patches' group.
 */
private val forceDarkThemePatch = resourcePatch {
    execute {
        addSettingsSwitch("fakh_dark_panels")

        // Android only darkens a window whose theme is light and allows it; the app's DayNight theme is neither at
        // night, and its base theme turns force dark off.
        get("res/values-night-v29").apply { mkdirs() }.resolve("styles.xml").writeText(
            """
                <?xml version="1.0" encoding="utf-8"?>
                <resources>
                    <style name="Default_Panel_Theme" parent="@style/Base_Appshell_Public_Theme">
                        <item name="colorPrimaryDark">@color/app_status_bar_bg_L</item>
                        <item name="android:isLightTheme">true</item>
                        <item name="android:forceDarkAllowed">true</item>
                    </style>
                </resources>
            """.trimIndent(),
        )
    }
}

/** `ThingRCTSmartPanelActivity.onCreate(Bundle)`: the React Native screen of a device panel. */
private object PanelCreateFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/panel/base/activity/ThingRCTSmartPanelActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

@Suppress("unused")
val darkPanelsPatch = bytecodePatch(
    name = "Dark device panels",
    description = "Darkens device control panels that have no dark mode of their own while the phone is in dark " +
        "mode, using Android's automatic dark theme. Its switch in Settings turns it off.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Theme")
    extendWith("extensions/extension.mpe")
    dependsOn(forceDarkThemePatch, settingsSwitchesPatch)

    execute {
        // Large light pictures behind a section stay light under force dark; the extension darkens them itself.
        PanelCreateFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, Lapp/fakh/extension/smartlife/DarkPanels;->install(Landroid/app/Activity;)V",
        )
    }
}
