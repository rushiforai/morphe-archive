package dev.brave.patches.media

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.brave.patches.core.braveCorePatch
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private const val TOOLBAR_HOOK = "Ldev/brave/extension/media/ToolbarHook;"

@Suppress("unused")
val mediaHlsDownloaderPatch = patch(
    name = "Media & HLS Downloader",
    description = "Adds a native toolbar button, HLS stream sniffer, and background MP4 remuxer to Brave Browser."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    dependsOn(braveCorePatch)

    extendWith("extensions/brave.mpe")

    execute {
        // 1. Android 14+ Security & Legacy Storage: Ensure required permissions and service are in AndroidManifest.xml
        resourceXml("AndroidManifest.xml").use { xml ->
            val existingPerms = xml.elements("uses-permission")
                .mapNotNull { it.attribute("android:name") }
                .toSet()

            if ("android.permission.FOREGROUND_SERVICE" !in existingPerms) {
                xml.root.appendChild("uses-permission") {
                    setAttribute("android:name", "android.permission.FOREGROUND_SERVICE")
                }
            }
            if ("android.permission.FOREGROUND_SERVICE_DATA_SYNC" !in existingPerms) {
                xml.root.appendChild("uses-permission") {
                    setAttribute("android:name", "android.permission.FOREGROUND_SERVICE_DATA_SYNC")
                }
            }
            if ("android.permission.POST_NOTIFICATIONS" !in existingPerms) {
                xml.root.appendChild("uses-permission") {
                    setAttribute("android:name", "android.permission.POST_NOTIFICATIONS")
                }
            }
            if ("android.permission.WRITE_EXTERNAL_STORAGE" !in existingPerms) {
                xml.root.appendChild("uses-permission") {
                    setAttribute("android:name", "android.permission.WRITE_EXTERNAL_STORAGE")
                    setAttribute("android:maxSdkVersion", "28")
                }
            }

            val application = xml.elements("application").firstOrNull()
                ?: throw IllegalStateException("No <application> element found in AndroidManifest.xml")

            val serviceExists = application.elements("service").any {
                it.attribute("android:name") == "dev.brave.extension.media.MediaDownloadService"
            }
            if (!serviceExists) {
                application.appendChild("service") {
                    setAttribute("android:name", "dev.brave.extension.media.MediaDownloadService")
                    setAttribute("android:exported", "false")
                    setAttribute("android:foregroundServiceType", "dataSync")
                }
            }
        }

        // 2. Hook ToolbarPhone.onFinishInflate to insert media button (invoke-static/range)
        ToolbarPhoneInflateFingerprint.method.apply {
            val superIdx = instructions.indices.indexOfFirst { instructions[it].opcode == Opcode.INVOKE_SUPER }
            if (superIdx < 0) {
                throw IllegalStateException("Could not find invoke-super in ${definingClass}->$name")
            }
            addInstructions(
                superIdx + 1,
                "invoke-static/range {p0 .. p0}, $TOOLBAR_HOOK->onToolbarInflated(Landroid/view/ViewGroup;)V"
            )
        }

        // 3. Hook ToggleTabStackButton.i(I)V to dynamically extract ColorStateList destination register (per-window)
        ToolbarTintFingerprint.method.apply {
            val callIdx = instructions.indices.indexOfFirst { idx ->
                val inst = instructions[idx]
                if (inst.opcode != Opcode.INVOKE_STATIC) return@indexOfFirst false
                val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return@indexOfFirst false
                ref.returnType == "Landroid/content/res/ColorStateList;"
            }
            if (callIdx < 0 || callIdx + 1 >= instructions.size || instructions[callIdx + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw IllegalStateException("Could not find ColorStateList return & move-result-object in ${definingClass}->$name")
            }
            val moveInst = instructions[callIdx + 1] as OneRegisterInstruction
            val colorReg = moveInst.registerA
            val totalRegs = implementation?.registerCount ?: 16
            // Non-static method with 1 int param (p0=this, p1=int): p0 register index is totalRegs - 2
            val p0Reg = totalRegs - 2

            if (p0Reg in 0..15 && colorReg in 0..15) {
                addInstructions(
                    callIdx + 2,
                    "invoke-static {p0, v$colorReg}, $TOOLBAR_HOOK->onTintChanged(Landroid/view/View;Landroid/content/res/ColorStateList;)V"
                )
            } else {
                addInstructions(
                    callIdx + 2,
                    "invoke-static/range {v$colorReg .. v$colorReg}, $TOOLBAR_HOOK->onTintChanged(Landroid/content/res/ColorStateList;)V"
                )
            }
        }

        // 4. Hook ToolbarPhone.d3(Z)V to toggle button visibility per-window during Omnibox typing animation
        ToolbarUrlFocusFingerprint.method.apply {
            addInstructions(
                0,
                "invoke-static/range {p0 .. p1}, $TOOLBAR_HOOK->onUrlFocusChanged(Landroid/view/ViewGroup;Z)V"
            )
        }

        // 5. Hook ToolbarPhone.dispatchDraw(Canvas)V during GPU texture snapshot capture
        // so our custom download button is drawn into the composited toolbar bitmap and
        // scrolls in/out at 120fps in exact lockstep with native toolbar buttons (zero pop-in).
        ToolbarPhoneDispatchDrawFingerprint.method.apply {
            val tabStackFieldIdx = instructions.indices.indexOfFirst { idx ->
                val inst = instructions[idx]
                if (inst.opcode != Opcode.IGET_OBJECT) return@indexOfFirst false
                val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference ?: return@indexOfFirst false
                ref.type == "Lorg/chromium/chrome/browser/toolbar/top/ToggleTabStackButton;"
            }
            if (tabStackFieldIdx < 0) {
                throw IllegalStateException("Could not find ToggleTabStackButton iget-object in ToolbarPhone.dispatchDraw")
            }
            // Walk back to the parent IGET_OBJECT (Lcr2;->F:Ldmk;) immediately preceding the ToggleTabStackButton check
            var dmkIdx = -1
            for (i in tabStackFieldIdx - 1 downTo 0) {
                val inst = instructions[i]
                if (inst.opcode == Opcode.IGET_OBJECT) {
                    val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
                    if (ref != null && ref.definingClass == "Lcr2;") {
                        dmkIdx = i
                        break
                    }
                }
            }
            if (dmkIdx < 0) {
                throw IllegalStateException("Could not find Lcr2;->F iget-object in ToolbarPhone.dispatchDraw")
            }
            addInstructions(
                dmkIdx + 1,
                "invoke-static/range {p0 .. p1}, $TOOLBAR_HOOK->drawCustomButtonForSnapshot(Landroid/view/ViewGroup;Landroid/graphics/Canvas;)V"
            )
        }
    }
}
