package com.autocat.morphe.smartlauncher.patches.contextmenu

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.autocat.morphe.smartlauncher.shared.Constants

object PopupListFingerprint : Fingerprint(
    strings = listOf(
        "contextualMenuPopup",
        "Button ID is not valid: ",
    ),
    // No filters — MethodCallFilter's regex silently rejects short obfuscated class names
    // like "Lrj;" due to a character-class boundary mismatch. We scan instructions manually.
)

object ContextMenuFingerprint : Fingerprint(
    strings = listOf(
        "android.intent.action.DELETE",
        "android.intent.extra.USER",
    ),
    filters = listOf(
        methodCall(
            smali = "Landroid/content/Context;->startActivity(Landroid/content/Intent;)V",
        ),
    ),
)

/**
 * Injects a dedicated "Archive App" item into the long-press contextual popup menu,
 * and adds one-tap archive/restore options to the uninstall prompt.
 */
@Suppress("unused")
val morpheContextualActionPatch = bytecodePatch(
    name = "Contextual app menu actions",
    description = "Adds a dedicated Archive App entry into the long-press popup menu.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // 1. Inject dedicated Archive item into popup menu list.
        // IMPORTANT: replaceInstruction preserves the method's bytecode size and does not
        // shift any jump offsets or try-catch handler addresses. addInstruction would corrupt
        // the coroutine state-machine switch table and cause ART class-verification failure
        // (instant crash at startup). The replacement calls injectAndShow(), which injects
        // the archive item and then drives the original popup-show call via reflection.
        PopupListFingerprint.matchOrNull()?.let { match ->
            val method = match.method
            val instructions = method.implementation?.instructions ?: return@let

            // Manually locate the rj.d(List)V invoke — filters omitted because MethodCallFilter
            // fails to match obfuscated short class names like "Lrj;" at the patcher level.
            var showInsnIndex = -1
            for ((idx, insn) in instructions.withIndex()) {
                if (insn is ReferenceInstruction) {
                    val ref = insn.reference
                    if (ref is MethodReference && ref.definingClass == "Lrj;" && ref.name == "d") {
                        showInsnIndex = idx
                        break
                    }
                }
            }
            if (showInsnIndex < 0) return@let

            val (regPopup, regList) = try {
                val insn = method.getInstruction<FiveRegisterInstruction>(showInsnIndex)
                Pair("v${insn.registerC}", "v${insn.registerD}")
            } catch (t: Throwable) {
                val insn = method.getInstruction<RegisterRangeInstruction>(showInsnIndex)
                val start = insn.startRegister
                Pair("v$start", "v${start + 1}")
            }

            method.replaceInstruction(
                showInsnIndex,
                "invoke-static {$regPopup, $regList, p0}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->injectAndShow(Ljava/lang/Object;Ljava/util/List;Ljava/lang/Object;)V",
            )
        }

        // 2. Intercept Uninstall action handler for smart prompt
        ContextMenuFingerprint.matchOrNull()?.let { match ->
            val method = match.method
            val matchIndex = match.instructionMatches.first().index

            val (regContext, regIntent) = try {
                val insn = method.getInstruction<FiveRegisterInstruction>(matchIndex)
                Pair("v${insn.registerC}", "v${insn.registerD}")
            } catch (t: Throwable) {
                val insn = method.getInstruction<RegisterRangeInstruction>(matchIndex)
                val start = insn.startRegister
                Pair("v$start", "v${start + 1}")
            }

            method.replaceInstruction(
                matchIndex,
                "invoke-static {$regContext, $regIntent}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->handleUninstallOrArchive(Landroid/content/Context;Landroid/content/Intent;)V",
            )
        }
    }
}
