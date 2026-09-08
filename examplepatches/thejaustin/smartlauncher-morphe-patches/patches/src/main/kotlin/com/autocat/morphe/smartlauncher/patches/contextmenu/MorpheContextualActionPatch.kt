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

object AppPopupListFingerprint : Fingerprint(
    strings = listOf(
        "ginlemon.iconpackstudio",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            if (insn is ReferenceInstruction) {
                val ref = insn.reference
                ref is MethodReference &&
                    (ref.name == "d" || ref.name.length <= 2) &&
                    ref.parameterTypes.let { it.size == 1 && it[0].toString() == "Ljava/util/List;" } &&
                    ref.returnType == "V"
            } else false
        } ?: false
    },
)

object WidgetPopupListFingerprint : Fingerprint(
    strings = listOf(
        "contextualMenuPopup",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            if (insn is ReferenceInstruction) {
                val ref = insn.reference
                ref is MethodReference &&
                    (ref.name == "d" || ref.name.length <= 2) &&
                    ref.parameterTypes.let { it.size == 1 && it[0].toString() == "Ljava/util/List;" } &&
                    ref.returnType == "V"
            } else false
        } ?: false
    },
)

object PopupShowFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.size == 1 &&
            method.parameterTypes[0].toString() == "Ljava/util/List;" &&
            method.implementation?.let { impl ->
                val insns = impl.instructions.toList()
                insns.size <= 10 && insns.any { insn ->
                    if (insn is ReferenceInstruction) {
                        val ref = insn.reference
                        ref is MethodReference && ref.name == "setValue"
                    } else false
                }
            } ?: false
    },
)

// Retain alias for backwards compatibility
val PopupListFingerprint = WidgetPopupListFingerprint

object ComposeStringResourceFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    filters = listOf(
        methodCall(
            smali = "Landroid/content/res/Resources;->getString(I)Ljava/lang/String;",
        ),
    ),
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
            method.parameterTypes[0].toString() == "I" &&
            (method.implementation?.instructions?.count() ?: 0) <= 12
    },
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
        // Applies to both app-icon long-press popups (AppPopupListFingerprint) and
        // widget/desktop contextual popups (WidgetPopupListFingerprint).
        //
        // IMPORTANT: replaceInstruction preserves the method's bytecode size and does not
        // shift any jump offsets or try-catch handler addresses. addInstruction would corrupt
        // the state-machine switch table and cause ART class-verification failure
        // (instant crash at startup). The replacement calls injectAndShow(), which injects
        // the archive item and then drives the original popup-show call via reflection.
        listOfNotNull(
            AppPopupListFingerprint.matchOrNull(),
            WidgetPopupListFingerprint.matchOrNull(),
        ).forEach { match ->
            val method = match.method
            val instructions = method.implementation?.instructions ?: return@forEach

            // Locate the popup show invoke: method named "d" (or short obfuscated name) with single List param and void return.
            // Dynamically matching by signature avoids fragile hardcoding of obfuscated class names
            // (e.g. "Lrj;" in build 017, "Lnk;" in build 018).
            var showInsnIndex = -1
            for ((idx, insn) in instructions.withIndex()) {
                if (insn is ReferenceInstruction) {
                    val ref = insn.reference
                    if (ref is MethodReference &&
                        (ref.name == "d" || ref.name.length <= 2) &&
                        ref.parameterTypes.let { it.size == 1 && it[0].toString() == "Ljava/util/List;" } &&
                        ref.returnType == "V"
                    ) {
                        showInsnIndex = idx
                        break
                    }
                }
            }
            if (showInsnIndex >= 0) {
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
                    "invoke-static {$regPopup, $regList}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->injectAndShow(Ljava/lang/Object;Ljava/util/List;)V",
                )
            }
        }

        // Central popup injection: hooks the master popup show method (e.g. Lrj;->d in build 017).
        // This universally covers ALL contextual popup menus across the launcher (app drawer categories, search, dock, home screen).
        PopupShowFingerprint.matchOrNull()?.let { match ->
            val method = match.method
            val instructions = method.implementation?.instructions ?: return@let
            var setValueInsnIndex = -1
            for ((idx, insn) in instructions.withIndex()) {
                if (insn is ReferenceInstruction) {
                    val ref = insn.reference
                    if (ref is MethodReference && ref.name == "setValue") {
                        setValueInsnIndex = idx
                        break
                    }
                }
            }
            if (setValueInsnIndex >= 0) {
                val (regState, regList) = try {
                    val insn = method.getInstruction<FiveRegisterInstruction>(setValueInsnIndex)
                    Pair("v${insn.registerC}", "v${insn.registerD}")
                } catch (t: Throwable) {
                    val insn = method.getInstruction<RegisterRangeInstruction>(setValueInsnIndex)
                    val start = insn.startRegister
                    Pair("v$start", "v${start + 1}")
                }

                method.replaceInstruction(
                    setValueInsnIndex,
                    "invoke-static {$regState, $regList}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->injectAndSetPopupValue(Ljava/lang/Object;Ljava/util/List;)V",
                )
            }
        }

        // 2. Intercept Compose stringResource calls to dynamically resolve Morphe strings
        (ComposeStringResourceFingerprint.matchAllOrNull() ?: emptyList()).forEach { match ->
            val method = match.method
            for (insnMatch in match.instructionMatches) {
                val matchIndex = insnMatch.index
                val (regRes, regId) = try {
                    val insn = method.getInstruction<FiveRegisterInstruction>(matchIndex)
                    Pair("v${insn.registerC}", "v${insn.registerD}")
                } catch (t: Throwable) {
                    val insn = method.getInstruction<RegisterRangeInstruction>(matchIndex)
                    val start = insn.startRegister
                    Pair("v$start", "v${start + 1}")
                }

                method.replaceInstruction(
                    matchIndex,
                    "invoke-static {$regRes, $regId}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->getString(Landroid/content/res/Resources;I)Ljava/lang/String;",
                )
            }
        }

        // 3. Intercept Uninstall action handler for smart prompt
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
