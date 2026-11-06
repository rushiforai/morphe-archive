package app.navhi.patches.greatday.settings

import app.navhi.patches.greatday.location.manualLocationPatch
import app.navhi.patches.greatday.shared.addMethod
import app.navhi.patches.greatday.shared.Constants.COMPATIBILITY_GREATDAY
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ACTIVITY = "Lcom/senjuid/location/GeolocationActivity;"
private const val SETTINGS = "Lapp/navhi/extension/greatday/SettingsActivity;"
private const val MANIFEST = "AndroidManifest.xml"

private const val SETTINGS_CLASS = "app.navhi.extension.greatday.SettingsActivity"

/** The menu is useless without a registered screen behind it. */
internal val settingsActivityManifestPatch = resourcePatch(
    name = "Morphe Settings screen",
    description = "Declares the Morphe Settings screen that the menu entry opens.",
) {
    compatibleWith(COMPATIBILITY_GREATDAY)

    execute {
        val document = document(MANIFEST)
        val application = document.getElementsByTagName("application").item(0) as Element

        val existing = document.getElementsByTagName("activity")
        val present = (0 until existing.length).any {
            (existing.item(it) as Element).getAttribute("android:name") == SETTINGS_CLASS
        }

        if (!present) {
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", SETTINGS_CLASS)
            activity.setAttribute("android:label", "Morphe Settings")
            activity.setAttribute("android:exported", "false")
            application.appendChild(activity)
        }

        document.close()
    }
}

private val optionsMenuFingerprint = Fingerprint(
    definingClass = ACTIVITY,
    name = "onOptionsItemSelected",
    parameters = listOf("Landroid/view/MenuItem;"),
)

private const val MENU_ID = 0x4e56

/** "Morphe Settings" in the map screen's overflow menu. */
@Suppress("unused")
val settingsMenuPatch = bytecodePatch(
    name = "Show Morphe Settings in the menu",
    description = "Adds the pin map, the detection switches and the about section behind a menu entry.",
) {
    compatibleWith(COMPATIBILITY_GREATDAY)

    dependsOn(manualLocationPatch, settingsActivityManifestPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val activity = mutableClassDefBy(ACTIVITY)

        activity.addMethod(
            "onCreateOptionsMenu",
            listOf("Landroid/view/Menu;"),
            "Z",
            4,
            """
                const/4 v0, 0x0
                const v1, $MENU_ID
                const/4 v2, 0x0
                const-string v3, "Morphe Settings"
                invoke-interface { p1, v0, v1, v2, v3 }, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
                const/4 v0, 0x1
                return v0
            """,
        )

        optionsMenuFingerprint.let {
            it.method.addInstructions(
                0,
                """
                    invoke-interface { p1 }, Landroid/view/MenuItem;->getItemId()I
                    move-result v0
                    const v1, $MENU_ID
                    if-ne v0, v1, :not_settings
                    new-instance v0, Landroid/content/Intent;
                    const-class v1, $SETTINGS
                    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
                    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
                    const/4 v0, 0x1
                    return v0
                    :not_settings
                """,
            )
        }
    }
}
