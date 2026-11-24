package app.hoitruyenchu.patches.itruyenchu.misc.settings

import app.hoitruyenchu.patches.itruyenchu.misc.extension.sharedExtensionPatch
import app.hoitruyenchu.patches.itruyenchu.shared.AsyncStorageMultiSetFingerprint
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_PATCH_FLAGS
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_SETTINGS
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.SETTINGS_ACTIVITY
import app.hoitruyenchu.patches.itruyenchu.shared.READABLE_ARRAY
import app.hoitruyenchu.patches.itruyenchu.shared.ReactInstanceLoadJSBundleFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode

/** Version of the patches (gradle.properties), written into the jar by the build. */
private val PATCHES_VERSION: String = try {
    object {}.javaClass.getResourceAsStream("/app/hoitruyenchu/patches/version.txt")
        ?.use { it.readBytes().toString(Charsets.UTF_8).trim() } ?: ""
} catch (e: Throwable) {
    ""
}

/** Makes HtcPatches.[flag]() return true: the settings screen shows that patch. Call it in execute. */
internal fun enablePatchFlag(flag: String) {
    mutableClassDefBy(EXTENSION_PATCH_FLAGS).methods.first { it.name == flag }.returnEarly(true)
}

private val settingsActivityPatch = patch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
                ?: return@use
            val activities = document.getElementsByTagName("activity")
            val declared = (0 until activities.length).any {
                activities.item(it).attributes.getNamedItem("android:name")?.nodeValue == SETTINGS_ACTIVITY
            }
            if (!declared) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", SETTINGS_ACTIVITY)
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:label", "Cài đặt HoiTruyenChu")
                activity.setAttribute("android:configChanges", "orientation|screenSize|screenLayout|keyboardHidden")
                application.appendChild(activity)
            }
        }
    }
}

/**
 * The settings screen of all patches ("Cài đặt HoiTruyenChu" in the account tab). Every patch depends
 * on it, so it is in the app whenever one of them is.
 */
val settingsPatch = patch(
    description = "Adds the \"Cài đặt HoiTruyenChu\" screen with the options of all patches, and a " +
            "floating settings button (top right, red dot when a new release is out).",
) {
    dependsOn(sharedExtensionPatch, settingsActivityPatch)

    execute {
        // Version shown in the settings screen and compared with the latest release.
        mutableClassDefBy(EXTENSION_PATCH_FLAGS).methods.first { it.name == "version" }
            .returnEarly(PATCHES_VERSION)

        // Commands of the scripts (open the screen, sleep timer) written to AsyncStorage.
        AsyncStorageMultiSetFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_SETTINGS->onStorageSet($READABLE_ARRAY)V",
        )

        // Settings script: entry in the account tab, settings for the other scripts.
        ReactInstanceLoadJSBundleFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_VOID }
                .forEach { index ->
                    addInstruction(
                        index,
                        "invoke-static { p0 }, $EXTENSION_SETTINGS->afterMainBundle(Ljava/lang/Object;)V",
                    )
                }
        }
    }
}
