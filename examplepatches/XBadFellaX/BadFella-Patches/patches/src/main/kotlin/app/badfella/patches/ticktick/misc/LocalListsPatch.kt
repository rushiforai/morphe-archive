package app.badfella.patches.ticktick.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.badfella.patches.ticktick.shared.Constants.COMPATIBILITY_TICKTICK
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val SETTINGS_ACTIVITY = "app.badfella.extension.ticktick.BadFellaSettingsActivity"

private object MoreSettingsOnCreatePreferencesFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/activity/preference/MoreSettingsPreferencesFragment;",
    name = "onCreatePreferences",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/preference/h;",
            name = "addPreferencesFromResource",
        ),
        methodCall(
            definingClass = "Lcom/ticktick/task/activity/preference/MoreSettingsPreferencesFragment;",
            name = "initLanguageSettings",
        ),
        methodCall(
            definingClass = "Lcom/ticktick/task/activity/preference/MoreSettingsPreferencesFragment;",
            name = "initShareWorkPreference",
        ),
    ),
)

private object DrawerCreateListFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/activity/fragment/slidemenu/TickTickSlideMenuFragment;",
    name = "performCreateList",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Lcom/ticktick/task/manager/AccountLimitManager;", name = "handleProjectNumberLimit"),
        methodCall(definingClass = "Landroid/content/Intent;", name = "putExtra"),
    ),
)

/**
 * Adds the BadFella Settings entry after the stock preference screen has been
 * created. The extension owns the activity, the organizer database and the
 * backup code; TickTick's task/project tables are not modified.
 */
private val localListsEntryPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val method = MoreSettingsOnCreatePreferencesFingerprint.method
        val instructions = method.implementation!!.instructions
        val last = instructions.last()
        check(last.opcode == Opcode.RETURN_VOID) {
            "Unexpected MoreSettingsPreferencesFragment.onCreatePreferences ending: ${last.opcode}"
        }
        method.addInstructions(instructions.size - 1, """
            invoke-static {p0}, Lapp/badfella/extension/ticktick/LocalListsSettingsHook;->install(Ljava/lang/Object;)V
        """)
        DrawerCreateListFingerprint.method.addInstructions(0, """
            invoke-static {p0}, Lapp/badfella/extension/ticktick/LocalListsSettingsHook;->openListCreator(Ljava/lang/Object;)V
            return-void
        """)
    }
}

@Suppress("unused")
val localListsPatch = resourcePatch(
    name = "Local lists and backups",
    description = "Adds BadFella Settings with 299 or 900 local lists, local task assignments, and " +
        "manual or scheduled local backups of organization and supported task snapshots. Cloud lists and task ownership " +
        "stay in TickTick; attachment file contents are not included.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TICKTICK)
    dependsOn(localListsEntryPatch)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val activities = application.getElementsByTagName("activity")
            val alreadyPresent = (0 until activities.length)
                .map { activities.item(it) as Element }
                .any { it.getAttributeNS(ANDROID, "name") == SETTINGS_ACTIVITY }
            if (!alreadyPresent) {
                val activity = manifest.createElement("activity")
                activity.setAttributeNS(ANDROID, "android:name", SETTINGS_ACTIVITY)
                activity.setAttributeNS(ANDROID, "android:exported", "false")
                activity.setAttributeNS(ANDROID, "android:label", "BadFella Settings")
                activity.setAttributeNS(
                    ANDROID,
                    "android:theme",
                    "@android:style/Theme.Material.Light.NoActionBar",
                )
                activity.setAttributeNS(
                    ANDROID,
                    "android:configChanges",
                    "orientation|screenSize|keyboardHidden",
                )
                application.appendChild(activity)
            }
            val serviceName = "app.badfella.extension.ticktick.LocalBackupJobService"
            val services = application.getElementsByTagName("service")
            if ((0 until services.length).none {
                    (services.item(it) as Element).getAttributeNS(ANDROID, "name") == serviceName
                }) {
                val service = manifest.createElement("service")
                service.setAttributeNS(ANDROID, "android:name", serviceName)
                service.setAttributeNS(ANDROID, "android:exported", "false")
                service.setAttributeNS(ANDROID, "android:permission", "android.permission.BIND_JOB_SERVICE")
                application.appendChild(service)
            }
            val permission = "android.permission.RECEIVE_BOOT_COMPLETED"
            val permissions = manifest.getElementsByTagName("uses-permission")
            if ((0 until permissions.length).none {
                    (permissions.item(it) as Element).getAttributeNS(ANDROID, "name") == permission
                }) {
                val node = manifest.createElement("uses-permission")
                node.setAttributeNS(ANDROID, "android:name", permission)
                application.parentNode.insertBefore(node, application)
            }
        }
    }
}
