/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.DOWNLOAD_ASSETS
import app.fakh.patches.github.shared.Constants.DOWNLOAD_FOLDER
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ASSETS_DOWNLOAD = "Lapp/fakh/extension/github/AssetsDownload;"

/**
 * The lambda that handles the release asset overflow menu ("download" and "share"). Both branches are in the same
 * method and are not obfuscated away because the action strings and Android intent actions are literals.
 */
private object AssetsDownloadFingerprint : Fingerprint(
    strings = listOf("download", "android.intent.action.VIEW", "android.intent.action.SEND"),
)

/**
 * The OkHttp auth interceptor that adds `"Authorization: token <oauth>"` to GitHub API requests.
 */
private object ApiAuthHeaderFingerprint : Fingerprint(
    strings = listOf("Copilot-Integration-Id", "Authorization", "token "),
)

@Suppress("unused")
val assetsDownloadPatch = patch(
    name = "Download assets",
    description = "Downloads release assets directly with the system download manager instead of opening the browser.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(DOWNLOAD_ASSETS, DOWNLOAD_FOLDER)
        val method = AssetsDownloadFingerprint.method
        val instructions = method.implementation!!.instructions

        val downloadAt = instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "download"
        }
        if (downloadAt < 0) throw PatchException("Release asset download branch not found")

        val viewAt = (downloadAt until instructions.size).firstOrNull { index ->
            ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                "android.intent.action.VIEW"
        } ?: throw PatchException("Release asset VIEW action not found")

        val assetUrlAt = (downloadAt until viewAt).lastOrNull { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.IGET_OBJECT &&
                ((instruction as ReferenceInstruction).reference as? FieldReference)?.type == "Ljava/lang/String;"
        } ?: throw PatchException("Release asset URL field read not found")

        val createChooserAt = (viewAt until instructions.size).firstOrNull { index ->
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/content/Intent;" && ref.name == "createChooser"
        } ?: throw PatchException("Release asset createChooser call not found")

        val startActivityAt = (createChooserAt + 1 until instructions.size).firstOrNull { index ->
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.returnType == "V" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Intent;")
        } ?: throw PatchException("Release asset startActivity call not found")

        val assetRegister = (instructions[assetUrlAt] as TwoRegisterInstruction).registerB
        val chooserRegister = (instructions[startActivityAt] as FiveRegisterInstruction).registerD
        method.replaceInstruction(
            startActivityAt,
            "invoke-static { v$chooserRegister }, $ASSETS_DOWNLOAD->download(Landroid/content/Intent;)V",
        )
        method.addInstruction(
            assetUrlAt,
            "invoke-static { v$assetRegister }, $ASSETS_DOWNLOAD->prepare(Ljava/lang/Object;)V",
        )

        val authMethod = ApiAuthHeaderFingerprint.method
        val authInstructions = authMethod.implementation!!.instructions
        val tokenAt = authInstructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "token "
        }
        if (tokenAt < 0) throw PatchException("API token prefix not found")
        val headerAt = (tokenAt + 1 until authInstructions.size).firstOrNull { index ->
            val ref = (authInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            authInstructions[index].opcode == Opcode.INVOKE_VIRTUAL && ref != null &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Ljava/lang/String;")
        } ?: throw PatchException("Authorization header call not found")
        val valueRegister = (authInstructions[headerAt] as FiveRegisterInstruction).registerE
        authMethod.addInstruction(
            headerAt,
            "invoke-static { v$valueRegister }, $ASSETS_DOWNLOAD->captureAuth(Ljava/lang/String;)V",
        )
    }
}
