package app.tikkamasalla.stremio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tikkamasalla.stremio.introskip.Constants
import app.tikkamasalla.stremio.introskip.hookReturnObject

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val ACTIVITY_NAME = "app.tikkamasalla.stremio.ModSettingsActivity"
private const val MOD_SETTINGS = "Lapp/tikkamasalla/stremio/ModSettingsActivity;"

/**
 * TV SettingsFragment's view factory: SettingsFragment.onCreateView (1.10.x), obfuscated name `y` in
 * 1.12.0. The only method there that takes a LayoutInflater and returns a View. Absent in 1.6.12
 * (a Leanback fragment without its own factory), which keeps its preference rows.
 */
object SettingsScreenViewFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/settings/SettingsFragment;",
    returnType = "Landroid/view/View;",
    custom = { method, _ -> method.parameterTypes.firstOrNull()?.toString() == "Landroid/view/LayoutInflater;" },
)

/** Phone (2.x) launcher activity; the shortcut is installed from its onCreate. */
object PhoneMainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/android/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** Declares the Mod settings activity. It also answers the system "app settings" intent (App info > Settings). */
val modSettingsManifestPatch = resourcePatch(
    name = "Mod settings manifest",
    description = "Declares the Mod settings screen in the manifest. Runs with Mod settings.",
    default = true,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.documentElement.getElementsByTagName("application").item(0) ?: return@execute
            val activities = doc.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                if (activities.item(i).attributes?.getNamedItem("android:name")?.nodeValue == ACTIVITY_NAME) {
                    return@execute
                }
            }
            val activity = doc.createElement("activity")
            activity.setAttributeNS(ANDROID_NS, "android:name", ACTIVITY_NAME)
            activity.setAttributeNS(ANDROID_NS, "android:label", "Mod settings")
            // Exported so System settings can open it from App info; it only edits the mod's own switches.
            activity.setAttributeNS(ANDROID_NS, "android:exported", "true")
            activity.setAttributeNS(ANDROID_NS, "android:theme", "@android:style/Theme.Material.NoActionBar")
            activity.setAttributeNS(
                ANDROID_NS, "android:configChanges",
                "orientation|screenSize|smallestScreenSize|screenLayout|keyboardHidden|keyboard|uiMode",
            )
            val filter = doc.createElement("intent-filter")
            val action = doc.createElement("action")
            action.setAttributeNS(ANDROID_NS, "android:name", "android.intent.action.APPLICATION_PREFERENCES")
            val category = doc.createElement("category")
            category.setAttributeNS(ANDROID_NS, "android:name", "android.intent.category.DEFAULT")
            filter.appendChild(action)
            filter.appendChild(category)
            activity.appendChild(filter)
            application.appendChild(activity)
        }
    }
}

/**
 * One "Mod settings" screen for every setting of the patches, reachable on the Compose TV builds
 * (a row at the top of Stremio's Settings) and on phone 2.x (launcher shortcut and App info).
 * The older Preference-based rows of 1.6.12 stay where they are.
 */
val modSettingsPatch = bytecodePatch(
    name = "Mod settings",
    description = "Adds one Mod settings screen with every setting of these patches: from Stremio Settings on TV 1.10.4/1.12.0, from the launcher shortcut or App info on phone 2.x.",
    default = true,
) {
    dependsOn(modSettingsManifestPatch)
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val log = java.util.logging.Logger.getLogger("ModSettingsPatch")
        var hooked = 0
        // TV: the settings screen gets a focusable entry row on top of Stremio's own list.
        try {
            hookReturnObject(
                SettingsScreenViewFingerprint.method,
                "$MOD_SETTINGS->wrapSettingsScreen(Landroid/view/View;)Landroid/view/View;",
                replace = true,
            )
            hooked++
        } catch (_: Exception) {
            log.info("TV SettingsFragment view factory not found: no Settings entry row in this build")
        }
        // Phone: a dynamic launcher shortcut (long press the icon).
        try {
            PhoneMainActivityOnCreateFingerprint.method.addInstructions(
                0,
                "invoke-static {p0}, $MOD_SETTINGS->installShortcut(Landroid/app/Activity;)V",
            )
            hooked++
        } catch (_: Exception) {
            log.info("Phone MainActivity.onCreate not found: no launcher shortcut in this build")
        }
        if (hooked == 0) log.warning("Mod settings: no entry point found; the screen is reachable from App info only")
    }
}
