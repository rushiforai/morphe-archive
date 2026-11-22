package app.finni.patches.telegraph.signature

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.logging.Logger

/** Forces the boolean checked by the last matched `if-nez` to true, so the check always passes. */
private fun Match.forceIfNezTrue() {
    val ifIndex = instructionMatches.first { it.instruction.opcode == Opcode.IF_NEZ }.index
    val register = method.getInstruction<OneRegisterInstruction>(ifIndex).registerA
    method.addInstruction(ifIndex, "const/4 v$register, 0x1")
}

/** Decoy manifest declarations: name the decoder sees -> name Android uses. */
private val DECOY_ACTIVITIES = mapOf("x.FileViewerActivity" to "x.SettingsActivity")

@Suppress("unused")
val disableSignatureCheckPatch = patch(
    name = "Disable signature check",
    description = "Required. Disables p2021's self signature check (\"Your Telegraph Messenger is modified\") " +
        "and the hidden package name check that closes the app, so the re-signed app starts.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)

    execute {
        SignatureCheckFingerprint.match().forceIfNezTrue()

        val packageCheck = PackageCheckFingerprint.matchOrNull()
        if (packageCheck != null) {
            packageCheck.forceIfNezTrue()
        } else {
            Logger.getLogger(this::class.java.name).warning("Package check not found, skipping it")
        }

        // The p2021 manifest carries an MT-style decoy: <activity android:name="x.SettingsActivity"
        // android:name="x.FileViewerActivity"> (both with the same attribute id). Android takes the first value,
        // but the resource decoder keeps the last one, so once the manifest is re-encoded SettingsActivity
        // (the mod settings screen) would vanish and FileViewerActivity would be declared twice.
        // Restore the real name on the first of the duplicated declarations.
        resourceXml("AndroidManifest.xml").use { manifest ->
            DECOY_ACTIVITIES.forEach { (decoy, real) ->
                val activities = manifest.elements("activity").toList()
                val duplicates = activities.filter { it.attribute("android:name") == decoy }
                val realDeclared = activities.any { it.attribute("android:name") == real }
                val realClass = "L" + real.replace('.', '/') + ";"
                if (duplicates.size > 1 && !realDeclared && classDefByOrNull(realClass) != null) {
                    duplicates.first().setAttribute("android:name", real)
                    Logger.getLogger(this::class.java.name).info("Restored decoy activity declaration $real")
                }
            }
        }
    }
}
