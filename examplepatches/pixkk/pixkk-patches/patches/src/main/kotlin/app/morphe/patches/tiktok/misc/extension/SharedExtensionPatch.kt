package app.morphe.patches.tiktok.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.addInstruction
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAIN_ACTIVITY_CLASS = "Lcom/ss/android/ugc/aweme/main/MainActivity;"
private const val HOST_APPLICATION_CLASS = "Lcom/ss/android/ugc/aweme/app/host/AwemeHostApplication;"
private const val UTILS = "Lapp/pixkk/extension/core/Utils;"
private const val SETTINGS_SCREEN = "Lapp/pixkk/extension/core/SettingsScreen;"

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object HostApplicationAttachBaseContextFingerprint : Fingerprint(
    definingClass = HOST_APPLICATION_CLASS,
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * Adds the bundle's extension and hands it the application context as early as the application
 * gets one, and again from the main activity, which also opens the settings gesture.
 */
val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/pixkk.mpe")

    // Done in finalize so the context is set before any other patch's hook can run.
    finalize {
        HostApplicationAttachBaseContextFingerprint.method.apply {
            val index = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.let { reference ->
                    reference.definingClass == "Landroid/app/Application;" &&
                        reference.name == "attachBaseContext" &&
                        reference.parameterTypes == listOf("Landroid/content/Context;")
                } == true
            } + 1
            addInstruction(index, "invoke-static/range { p1 .. p1 }, $UTILS->setContext(Landroid/content/Context;)V")
        }
        MainActivityOnCreateFingerprint.method.apply {
            addInstruction(0, "invoke-static/range { p0 .. p0 }, $UTILS->setContext(Landroid/content/Context;)V")
            addInstruction(1, "invoke-static/range { p0 .. p0 }, $SETTINGS_SCREEN->install(Landroid/app/Activity;)V")
        }
    }
}
