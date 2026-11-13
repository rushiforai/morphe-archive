package app.flip.patches.voice

import app.flip.patches.voice.Constants.COMPATIBILITY_GOOGLE_VOICE
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RECORDER = "Lapp/flip/callrecord/CallRecorder;"
private const val CONNECTION_SERVICE =
    "Lcom/google/android/apps/voice/voip/telephony/connectionservice/selfmanaged/VoipConnectionService;"

private val callRecordingManifestPatch = patch {
    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val packageName = manifest.root.attribute("package")!!
            manifest.elements("application").first().appendChild("provider") {
                setAttribute("android:name", "app.flip.callrecord.CallRecorder")
                setAttribute("android:authorities", "$packageName.callrecord")
                setAttribute("android:exported", "false")
            }
        }
    }
}

@Suppress("unused")
val callRecordingPatch = bytecodePatch(
    name = "Call recording",
    description = "Automatically records every incoming and outgoing Voice call (both sides) to " +
        "Recordings/Voice calls. Works for calls made over Wi-Fi or mobile data, not calls Voice " +
        "routes through the carrier.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_VOICE)

    dependsOn(callRecordingManifestPatch)

    extendWith("extensions/callrecord.mpe")

    execute {
        // region Copy the call audio in Voice's WebRTC audio threads.

        var hooked = 0
        fun hookThreads(threadName: String, owner: String, name: String, parameters: String, wrapper: String) {
            classDefByStrings(threadName).forEach { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                    instructions.forEachIndexed { index, instruction ->
                        if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                        val ref = (instruction as ReferenceInstruction).reference as MethodReference
                        if (ref.definingClass != owner || ref.name != name ||
                            ref.parameterTypes.joinToString("") != parameters
                        ) return@forEachIndexed
                        val i = instruction as FiveRegisterInstruction
                        val registers = listOf(i.registerC, i.registerD, i.registerE, i.registerF, i.registerG)
                            .take(i.registerCount).joinToString(", ") { "v$it" }
                        method.replaceInstruction(index, "invoke-static { $registers }, $RECORDER->$wrapper")
                        hooked++
                    }
                }
            }
        }

        hookThreads(
            "AudioRecordJavaThread",
            "Landroid/media/AudioRecord;", "read", "Ljava/nio/ByteBuffer;I",
            "read(Landroid/media/AudioRecord;Ljava/nio/ByteBuffer;I)I",
        )
        hookThreads(
            "AudioTrackJavaThread",
            "Landroid/media/AudioTrack;", "write", "Ljava/nio/ByteBuffer;II",
            "write(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;II)I",
        )
        if (hooked < 2) throw IllegalStateException("Call audio threads not found ($hooked hooks)")

        // endregion

        // region Remember each call's connection (number, direction) for the file name.

        mutableClassDefBy(CONNECTION_SERVICE).methods.forEach { method ->
            val hook = when (method.name) {
                "onCreateIncomingConnection" -> "onIncoming"
                "onCreateOutgoingConnection" -> "onOutgoing"
                else -> return@forEach
            }
            val instructions = method.implementation!!.instructions.toList()
            instructions.indices.reversed().forEach { index ->
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.RETURN_OBJECT) return@forEach
                val r = (instruction as OneRegisterInstruction).registerA
                method.addInstruction(index, "invoke-static/range { v$r .. v$r }, $RECORDER->$hook(Ljava/lang/Object;)V")
            }
        }

        // endregion
    }
}
