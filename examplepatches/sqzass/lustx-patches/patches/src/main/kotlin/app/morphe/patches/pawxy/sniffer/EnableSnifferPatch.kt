/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.pawxy.sniffer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val TOOL_ACTION_CLASS = "Lcom/pawxy/browser/ui/element/options/Tool\$Action;"

@Suppress("unused")
val enableMediaSnifferPatch = bytecodePatch(
    name = "Enable media sniffer",
    description = "Restores Pawxy's hidden video/media sniffer to the default tool menu. " +
        "The toolbar builder excludes Tool\$Action.SNIFFER from the default list; this " +
        "patch removes that exclusion so the sniffer appears like any other tool.",
) {
    compatibleWith(
        Compatibility(
            name = "Pawxy - Fast VPN & Web Browser",
            packageName = "com.pawxy.browser",
            apkFileType = ApkFileType.APKS_REQUIRED,
            appIconColor = 0x00E4FF,
            targets = listOf(
                AppTarget(version = "1.15.1", versionCode = 104, minSdk = 26),
            ),
        ),
    )

    execute {
        val mc = mutableClassDefByOrNull("Lcom/pawxy/browser/ui/element/options/z;")
            ?: return@execute

        // The toolbar-order builder: reads "tool-order-v2" prefs and holds the
        // SNIFFER exclusion. Matching on both markers avoids any other method.
        val target = mc.methods
            .filterIsInstance<MutableMethod>()
            .firstOrNull { m ->
                val ins = m.implementation?.instructions ?: return@firstOrNull false
                ins.any { i ->
                    i.opcode == Opcode.CONST_STRING &&
                        i.getReference<StringReference>()?.string == "tool-order-v2"
                } &&
                    ins.any { i ->
                        i.opcode == Opcode.SGET_OBJECT &&
                            i.getReference<FieldReference>()?.let { r ->
                                r.definingClass == TOOL_ACTION_CLASS && r.name == "SNIFFER"
                            } == true
                    }
            }
            ?: return@execute

        val list = target.instructions
        val sgetIndex = list.indexOfFirst { i ->
            i.opcode == Opcode.SGET_OBJECT &&
                i.getReference<FieldReference>()?.let { r ->
                    r.definingClass == TOOL_ACTION_CLASS && r.name == "SNIFFER"
                } == true
        }
        if (sgetIndex < 0) return@execute

        // sget-object SNIFFER → invoke-virtual equals → move-result vX → if-nez skip.
        // Forcing the result to 0 makes the exclusion branch dead.
        val moveResultIndex = (sgetIndex + 1 until minOf(sgetIndex + 4, list.size))
            .firstOrNull { list[it].opcode == Opcode.MOVE_RESULT }
            ?: return@execute

        val reg = (list[moveResultIndex] as OneRegisterInstruction).registerA
        target.replaceInstruction(moveResultIndex, "const/4 v$reg, 0x0")
    }
}
