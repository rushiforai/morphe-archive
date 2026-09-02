package com.autocat.morphe.smartlauncher.patches.hidearchived

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.autocat.morphe.smartlauncher.shared.Constants

/**
 * Filters archived apps (Android 15+ app archiving) exclusively out of the App Drawer.
 * Scoped strictly to DrawerRepository to preserve 100% stability across desktop restoration,
 * widgets, and launcher bootstrap.
 */
@Suppress("unused")
val hideArchivedAppsPatch = bytecodePatch(
    name = "Hide archived apps",
    description = "Filters archived apps out of the app drawer.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val match = GetActivityListFingerprint.matchOrNull()
            ?: throw PatchException("Could not find App Drawer LauncherApps.getActivityList() call site")

        val method = match.method
        val insnMatch = match.instructionMatches.first()
        val invokeIndex = insnMatch.index
        val smali = try {
            val insn = method.getInstruction<FiveRegisterInstruction>(invokeIndex)
            val regA = insn.registerC
            val regB = insn.registerD
            val regC = insn.registerE
            "invoke-static {v$regA, v$regB, v$regC}, Lcom/autocat/morphe/smartlauncher/extension/ArchivedAppFilter;->getActivityList(Landroid/content/pm/LauncherApps;Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;"
        } catch (t: Throwable) {
            val insn = method.getInstruction<RegisterRangeInstruction>(invokeIndex)
            val start = insn.startRegister
            val end = start + insn.registerCount - 1
            "invoke-static/range {v$start .. v$end}, Lcom/autocat/morphe/smartlauncher/extension/ArchivedAppFilter;->getActivityList(Landroid/content/pm/LauncherApps;Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;"
        }

        method.replaceInstruction(invokeIndex, smali)
    }
}
