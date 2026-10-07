package app.twoeno.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.twoeno.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/MuteAudioAdsPatch;"
private const val SET_METADATA =
    "$EXTENSION_CLASS->setMetadata(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V"

private fun Instruction.isSetMetadataCall(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = getReference<MethodReference>() ?: return false
    return reference.definingClass == "Landroid/media/session/MediaSession;" &&
        reference.name == "setMetadata" &&
        reference.parameterTypes.map { it.toString() } == listOf("Landroid/media/MediaMetadata;")
}

private fun Method.callsSetMetadata() = implementation?.instructions?.any { it.isSetMetadataCall() } == true

@Suppress("unused")
val muteAudioAdsPatch = bytecodePatch(
    name = "Mute audio ads",
    description = "Mutes the music stream while an audio ad plays and restores the volume afterwards. " +
        "Enabling \"Device broadcast status\" in the Spotify settings improves the ad detection.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    execute {
        // Every media session update goes through MediaSession.setMetadata,
        // usually called by the bundled androidx media library. Route these calls through the extension.
        val callingClasses = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
            if (classDef.methods.any { it.callsSetMetadata() }) callingClasses += classDef
        }
        if (callingClasses.isEmpty()) throw PatchException("Could not find any MediaSession.setMetadata call")

        callingClasses.forEach { classDef ->
            mutableClassDefBy(classDef).methods.filter { it.callsSetMetadata() }.forEach { method ->
                method.implementation!!.instructions.withIndex()
                    .filter { (_, instruction) -> instruction.isSetMetadataCall() }
                    .forEach { (index, instruction) ->
                        val replacement = when (instruction) {
                            is FiveRegisterInstruction ->
                                "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, $SET_METADATA"

                            is RegisterRangeInstruction ->
                                "invoke-static/range { v${instruction.startRegister} .. " +
                                    "v${instruction.startRegister + 1} }, $SET_METADATA"

                            else -> throw PatchException("Unexpected instruction: $instruction")
                        }
                        method.replaceInstruction(index, replacement)
                    }
            }
        }
    }
}
