/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/CameraMicIndicator;"
private data class MediaAccessSite(val owner: ClassDef, val method: Method, val index: Int, val type: String)

@Suppress("unused")
val cameraMicIndicatorPatch = bytecodePatch(
    name = "Camera and microphone indicator",
    description = "Shows a small colored dot when TikTok accesses the camera or microphone. Green for camera, orange for microphone. Stays visible until the access ends.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val cameraTargets = setOf(
            "Landroid/hardware/Camera;->open()Landroid/hardware/Camera;",
            "Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;",
        )
        val micTargets = setOf(
            "Landroid/media/AudioRecord;->startRecording()V",
            "Landroid/media/MediaRecorder;->start()V",
        )
        val sites = mutableListOf<MediaAccessSite>()
        classDefForEach { owner ->
            if (owner.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
            owner.methods.forEach { method ->
                method.implementation?.instructions?.forEachIndexed { index, instruction ->
                    val ref = instruction.getReference<MethodReference>()?.toString() ?: return@forEachIndexed
                    if (ref in cameraTargets && (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_VIRTUAL)) {
                        sites += MediaAccessSite(owner, method, index, "camera")
                    } else if (ref in micTargets && instruction.opcode == Opcode.INVOKE_VIRTUAL) {
                        sites += MediaAccessSite(owner, method, index, "mic")
                    }
                }
            }
        }
        // Inserted before the call, never after it. Camera.open returns a Camera and its
        // move-result-object has to stay adjacent to the invoke that produced it; putting
        // anything between the two makes the verifier reject the whole class
        // (copyRes1 vN <- result0 type=Conflict), which killed the app at attachBaseContext.
        // Walking in reverse keeps the earlier indices of a method valid as each one shifts.
        sites.asReversed().forEach { site ->
            val mutable = mutableClassDefBy(site.owner).findMutableMethodOf(site.method)
            val call = if (site.type == "camera") "onCameraAccess()V" else "onMicAccess()V"
            mutable.addInstruction(site.index, "invoke-static {}, $EXTENSION->$call")
        }
        println("[Camera/mic indicator] Instrumented ${sites.size} media access sites (${sites.count { it.type == "camera" }} camera, ${sites.count { it.type == "mic" }} mic).")
    }
}
