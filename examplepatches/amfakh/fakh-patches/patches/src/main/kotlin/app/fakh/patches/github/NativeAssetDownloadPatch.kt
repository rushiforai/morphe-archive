/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.DOWNLOAD_ASSETS_NATIVELY
import app.fakh.patches.github.shared.Constants.DOWNLOAD_LOCATION
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ASSETS_DOWNLOAD = "Lapp/fakh/extension/github/NativeAssetDownload;"

/**
 * The lambda that handles the release asset overflow menu ("download" and "share"). Both branches are in the same
 * method and are not obfuscated away because the action strings and Android intent actions are literals.
 */
private object NativeAssetDownloadFingerprint : Fingerprint(
    strings = listOf("download", "android.intent.action.VIEW", "android.intent.action.SEND"),
)

/**
 * The OkHttp interceptor that adds `Authorization: Bearer <token>` to the requests an account sends to its own API
 * hosts, which it keeps in a set.
 */
private object ApiAuthHeaderFingerprint : Fingerprint(
    strings = listOf("Authorization", "Bearer "),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/util/Set;" && ref.name == "contains"
        } == true
    },
)

/** Hands the extension the account's API token each time the app signs a request with it. */
internal val apiTokenPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val method = ApiAuthHeaderFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val bearerAt = instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "Bearer "
        }
        val headerAt = (bearerAt + 1 until instructions.size).firstOrNull { index ->
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[index].opcode == Opcode.INVOKE_VIRTUAL && ref != null &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Ljava/lang/String;")
        } ?: throw PatchException("Authorization header call not found")
        // The method starts by reading the request from the chain and the address from the request.
        val reads = instructions.filter { it.opcode == Opcode.IGET_OBJECT }.take(2)
            .map { (it as ReferenceInstruction).reference as FieldReference }
        val chain = method.parameterTypes.single().toString()
        if (reads.size < 2 || reads[0].definingClass != chain || reads[1].definingClass != reads[0].type) {
            throw PatchException("API request address not found")
        }
        val header = instructions[headerAt] as FiveRegisterInstruction
        // The register of the prefix is free once the header's value is built.
        val scratch = (instructions[bearerAt] as OneRegisterInstruction).registerA
        if (scratch in listOf(header.registerC, header.registerD, header.registerE)) {
            throw PatchException("No free register at the Authorization header")
        }
        method.addInstructions(
            headerAt,
            """
                iget-object v$scratch, p1, ${reads[0].smali}
                iget-object v$scratch, v$scratch, ${reads[1].smali}
                invoke-static { v${header.registerE}, v$scratch }, $ASSETS_DOWNLOAD->captureAuth(Ljava/lang/String;Ljava/lang/Object;)V
            """,
        )
    }
}

@Suppress("unused")
val downloadAssetsNativelyPatch = patch(
    name = "Download assets natively",
    description = "Downloads release assets directly with the system download manager instead of opening the browser.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, apiTokenPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(DOWNLOAD_ASSETS_NATIVELY, DOWNLOAD_LOCATION)
        val method = NativeAssetDownloadFingerprint.method
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
    }
}
