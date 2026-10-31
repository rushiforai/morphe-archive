package app.morphe.patches.cromite.misc.fullscreen

import app.morphe.patches.cromite.layout.theme.cromiteAmoledBrightnessPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// Restored from HideSettingsStatusBarPatchKt.class in patches-1.50.0.mpp.
private val settingsActivityFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/settings/SettingsActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

@Suppress("unused")
val hideSettingsStatusBarPatch = bytecodePatch(
    name = "Hide status bar in Settings",
    description = "Synchronizes Settings status bar visibility with native Force Tablet Mode when window focus returns.",
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    dependsOn(cromiteAmoledBrightnessPatch)

    execute {
        val settingsClass = settingsActivityFingerprint.classDef
        check(settingsClass.methods.none {
            it.name == "onWindowFocusChanged" &&
                it.parameterTypes == listOf("Z") &&
                it.returnType == "V"
        }) {
            "Cromite 153.0.8010.37 SettingsActivity already overrides onWindowFocusChanged"
        }

        val instructions = """
            invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V
            if-eqz p1, :morphe_settings_status_done
            invoke-static {p0}, Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyTabletStatusBar(Landroid/app/Activity;)V
            :morphe_settings_status_done
            return-void
        """.trimIndent().toInstructions()

        settingsClass.methods.add(
            ImmutableMethod(
                settingsClass.type,
                "onWindowFocusChanged",
                listOf(ImmutableMethodParameter("Z", null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null,
                null,
                ImmutableMethodImplementation(3, instructions, null, null),
            ).toMutable(),
        )
    }
}
