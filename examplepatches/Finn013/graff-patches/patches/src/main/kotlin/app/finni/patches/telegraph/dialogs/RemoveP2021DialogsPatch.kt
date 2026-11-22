package app.finni.patches.telegraph.dialogs

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.finni.patches.telegraph.signature.disableSignatureCheckPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import java.util.logging.Logger

/** com.x.XtremeDialog.sD(Activity): "P2021_MODS / JOIN US" dialog shown from LaunchActivity on start. */
internal object XtremeDialogShowFingerprint : Fingerprint(
    definingClass = "/XtremeDialog;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
)

/** x.SettingsActivity.maybeShowChannelJoinDialog(): the same subscribe dialog inside the mod settings. */
internal object SettingsChannelJoinDialogFingerprint : Fingerprint(
    definingClass = "/SettingsActivity;",
    name = "maybeShowChannelJoinDialog",
    returnType = "V",
    parameters = emptyList(),
)

@Suppress("unused")
val removeP2021DialogsPatch = patch(
    name = "Remove P2021 dialogs",
    description = "Removes the \"P2021_MODS - Subscribe / JOIN US\" channel dialogs " +
        "(on app start and in the mod settings).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)
    dependsOn(disableSignatureCheckPatch)

    execute {
        val found = listOf(XtremeDialogShowFingerprint, SettingsChannelJoinDialogFingerprint).count { fingerprint ->
            val method = fingerprint.methodOrNull
            if (method == null) {
                Logger.getLogger(this::class.java.name).warning("Not found: $fingerprint")
                false
            } else {
                method.returnEarly()
                true
            }
        }
        if (found == 0) throw PatchException("No P2021 dialogs found")
    }
}
