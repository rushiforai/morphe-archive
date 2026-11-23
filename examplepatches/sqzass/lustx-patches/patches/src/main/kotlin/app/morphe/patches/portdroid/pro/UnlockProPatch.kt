/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.portdroid.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patches.all.shared.forceBooleanOnce
import app.morphe.patches.portdroid.tamper.bypassTamperCheckPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val SETTINGS = "Lcom/stealthcopter/portdroid/core/Settings;"
private const val IAP_STATUS = "Lcom/stealthcopter/portdroid/feature/upgrade/IAPViewModel\$IAPStatus;"

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks PortDroid Pro features (forces the pro gate and billing status).",
) {
    compatibleWith(
        Compatibility(
            name = "PortDroid - Network Analysis",
            packageName = "com.stealthcopter.portdroid",
            targets = listOf(
                AppTarget(version = "1.0.7", versionCode = 113),
                AppTarget(version = "1.3.0", versionCode = 140),
            ),
        ),
    )

    dependsOn(bypassTamperCheckPatch)

    execute {
        // Gate 1: Settings.getProVersion()Z — primary feature gate (both versions).
        val gpv = mutableClassDefByOrNull(SETTINGS)
            ?.methods?.singleOrNull {
                it.name == "getProVersion" && it.returnType == "Z" && it.parameterTypes.isEmpty()
            } ?: throw PatchException("PortDroid: Settings.getProVersion()Z not found (version drift?)")
        gpv.forceBooleanOnce(true, "Settings.getProVersion")

        // Gate 2: force the effective IAPStatus.proVersion store to 1.
        // Anchored on the iput-boolean itself (ctor signature changed 1.0.7 -> 1.3.0).
        // findMutableMethodOf gives the MutableMethod receiver the instruction extensions bind to.
        var patched = false
        classDefForEach { classDef ->
            if (classDef.type != IAP_STATUS) return@classDefForEach
            val mc = mutableClassDefByOrNull(IAP_STATUS) ?: return@classDefForEach
            classDef.methods.forEach { method ->
                if (method.name != "<init>") return@forEach
                val impl = method.implementation ?: return@forEach
                val mm = mc.findMutableMethodOf(method)
                val hits = impl.instructions.withIndex()
                    .filter { (_, ins) ->
                        ins.opcode == Opcode.IPUT_BOOLEAN &&
                            ins.getReference<FieldReference>()?.let {
                                it.definingClass == IAP_STATUS && it.name == "proVersion"
                            } == true
                    }
                    .map { it.index }
                if (hits.isEmpty()) return@forEach
                val idx = hits.last()
                val iput = mm.getInstruction(idx) as TwoRegisterInstruction
                val src = iput.registerA
                val obj = iput.registerB
                val ref = iput.getReference<FieldReference>()
                    ?: throw PatchException("PortDroid: proVersion iput has no field reference")
                val prev = if (idx > 0) mm.getInstruction(idx - 1) else null
                val already = prev is NarrowLiteralInstruction &&
                    prev is OneRegisterInstruction &&
                    prev.registerA == src &&
                    prev.narrowLiteral == 1
                if (!already) {
                    val op = if (src < 16) "const/4" else "const/16"
                    val iputSmali = "iput-boolean v$src, v$obj, ${ref.definingClass}->${ref.name}:${ref.type}"
                    mm.replaceInstruction(idx, "$op v$src, 0x1")
                    mm.addInstruction(idx + 1, iputSmali)
                }
                patched = true
            }
        }
        if (!patched) {
            throw PatchException("PortDroid: IAPStatus.proVersion assignment not found (version drift?)")
        }
    }
}
