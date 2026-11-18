package app.morphe.patches.localtts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object LocalTtsConstants {
    const val PACKAGE_NAME = "com.umberlab.local.tts"

    val COMPATIBILITY = Compatibility(
        name = "Local TTS",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APKS,
        targets = listOf(
            AppTarget(version = "1.2.1")
        )
    )
}

object LocalTtsProFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        opcode(Opcode.IGET_BOOLEAN),
        opcode(Opcode.IGET_BOOLEAN),
        opcode(Opcode.IGET_BOOLEAN),
        opcode(Opcode.IF_EQZ),
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "valueOf", returnType = "Ljava/lang/Boolean;"),
        opcode(Opcode.RETURN_OBJECT)
    ),
    custom = { method, _ -> method.implementation?.registerCount == 4 }
)

@Suppress("unused")
val localTtsProPatch = bytecodePatch(
    name = "Local TTS Pro",
    description = "Unlocks local Pro features (full-length reader, all voices, and audio export) by overriding the shared Pro entitlement state mapping.",
    default = true
) {
    compatibleWith(LocalTtsConstants.COMPATIBILITY)

    execute {
        LocalTtsProFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )
    }
}
