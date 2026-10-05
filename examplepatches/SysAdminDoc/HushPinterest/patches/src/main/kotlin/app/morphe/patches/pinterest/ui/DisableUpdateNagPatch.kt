/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The floor build lacks this update manager and therefore claims no installed hook. */
@Suppress("unused")
val disableUpdateNagPatch = bytecodePatch(
    name = "Disable update nag",
    description = "Stops Pinterest's in-app Play Store update prompts. You can still update Pinterest yourself.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("disableUpdateNag")
        requireStatusMethod("updateNag")
        val candidates = methodsWithString("inAppUpdateManager").filter {
            it.name == "invokeSuspend" && it.parameters() == listOf("Ljava/lang/Object;") && it.returnType == "Ljava/lang/Object;"
        }
        if (candidates.isEmpty()) {
            var managerPresent = false
            classDefForEach { if (it.type.startsWith("Lcom/google/android/play/core/appupdate/")) managerPresent = true }
            if (managerPresent) throw PatchException("Play Core update manager exists but its prompt anchor is missing")
            patchLog.info("Disable update nag: this build has no Play Core in-app update manager")
            return@execute
        }
        val target = mutable(candidates.one("In-app Play Store update prompt"))
        val at = target.instructions().indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "inAppUpdateManager"
        }
        val unit = target.fields().filter { it.definingClass == "Lkotlin/Unit;" && it.type == "Lkotlin/Unit;" }
            .distinctBy { it.toString() }.one("Coroutine Unit result")
        val register = target.freeLocalsAt("Play Store update prompt", at, 1, highest = 255).single()
        // This coroutine also handles an unrelated home-feed task. Guard only its update branch.
        target.addInstructionsWithLabels(at, """
            invoke-static {}, $UI_HOOKS->disableUpdateNag()Z
            move-result v$register
            if-eqz v$register, :hush_keep_update
            sget-object v$register, $unit
            return-object v$register
        """, ExternalLabel("hush_keep_update", target.getInstruction(at)))
        enableCapability("updateNag")
        enableStatus("disableUpdateNag")
    }
}
