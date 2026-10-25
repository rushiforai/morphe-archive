/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library/pull/61
 *
 * See the included NOTICE file for §7(c) terms that apply to this code.
 */

// Modified for Heval's Morphe Patches (2026-10-12): ported from morphe-patches-library 1.9.0-dev
// (all/misc/fix/spoofsignature) because this repo is on morphe-patches-library 1.0.4. Changes:
// a per-app builder with the original certificate hard-coded (merged split APKs often carry no
// usable signing block, so packageMetadata cannot be trusted), the values are injected by
// rewriting the extension's getters, and invoke-virtual/range call sites are handled too.
// 2026-10-18: optional app-specific dependencies (none by default, so other apps are unchanged).

package app.template.patches.shared.misc.signature

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.ByteArrayInputStream
import java.security.cert.CertificateFactory
import java.util.Base64

internal const val SIGNATURE_SPOOF_EXTENSION_CLASS = "Lapp/template/extension/signature/SignatureSpoof;"
private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"
private const val EXTENSION_PACKAGE_PREFIX = "Lapp/template/extension/"

/**
 * Builds a "Spoof signature" patch: every `PackageManager.getPackageInfo(...)` call in the app is
 * routed through the signature extension, which replaces the app's own signatures with the
 * original signing certificate. Firebase (Installations, Remote Config, FCM token requests) sends
 * that certificate's SHA-1 as `X-Android-Cert`, and API keys restricted to the original app
 * reject the re-signed one (`API_KEY_ANDROID_APP_BLOCKED`) without it.
 *
 * @param fromPackageName The package name of the original app.
 * @param certificateBase64 The original signing certificate, DER encoded, base64 without line
 *        breaks (from the APK's v2/v3 signing block or `apksigner verify --print-certs-pem`).
 * @param compatibility The app this patch applies to.
 * @param default Whether the patch is enabled by default.
 * @param description The patch description, for apps where a specific symptom is worth naming.
 * @param dependencies App-specific patches applied together with this one, for compatibility fixes
 *        that belong with the re-signed build (for example Shazam's Spotify login fallback).
 */
fun spoofSignaturePatch(
    fromPackageName: String,
    certificateBase64: String,
    compatibility: Compatibility,
    default: Boolean = false,
    description: String = "Fixes Google features that check the app's original signature.",
    dependencies: Set<Patch<*>> = emptySet(),
): BytecodePatch {
    // Fail at bundle load, not on the user's device, when the certificate is not a certificate.
    runCatching {
        CertificateFactory.getInstance("X.509")
            .generateCertificate(ByteArrayInputStream(Base64.getDecoder().decode(certificateBase64)))
    }.getOrElse { throw IllegalArgumentException("Invalid certificate for $fromPackageName", it) }

    return bytecodePatch(
        name = "Spoof signature",
        description = description,
        default = default,
    ) {
        compatibleWith(compatibility)

        if (dependencies.isNotEmpty()) dependsOn(*dependencies.toTypedArray())

        extendWith("extensions/signature.mpe")

        execute {
            mutableClassDefBy(SIGNATURE_SPOOF_EXTENSION_CLASS).methods.apply {
                single { it.name == "getSpoofedPackageName" }.returnEarly(fromPackageName)
                single { it.name == "getSpoofedCertificate" }.returnEarly(certificateBase64)
            }

            // Collect first: mutating classes while iterating them is not allowed.
            val targets = mutableListOf<ClassDef>()
            classDefForEach { classDef ->
                if (classDef.type.startsWith(EXTENSION_PACKAGE_PREFIX)) return@classDefForEach
                if (classDef.methods.any { m -> m.implementation?.instructions?.any { it.isGetPackageInfo() } == true }) {
                    targets += classDef
                }
            }
            if (targets.isEmpty()) throw PatchException("No PackageManager.getPackageInfo call found")

            for (classDef in targets) {
                for (method in mutableClassDefBy(classDef).methods) {
                    val instructions = method.implementation?.instructions?.toList() ?: continue
                    instructions.forEachIndexed { index, instruction ->
                        if (!instruction.isGetPackageInfo()) return@forEachIndexed
                        val call = (instruction as ReferenceInstruction).reference as MethodReference
                        val descriptor = "$SIGNATURE_SPOOF_EXTENSION_CLASS->getPackageInfo(" +
                            PACKAGE_MANAGER + call.parameterTypes.joinToString("") + ")" + call.returnType
                        val replacement = when (instruction) {
                            is RegisterRangeInstruction -> {
                                val last = instruction.startRegister + instruction.registerCount - 1
                                "invoke-static/range { v${instruction.startRegister} .. v$last }, $descriptor"
                            }
                            is FiveRegisterInstruction -> {
                                val registers = listOf(
                                    instruction.registerC, instruction.registerD, instruction.registerE,
                                    instruction.registerF, instruction.registerG,
                                ).take(instruction.registerCount)
                                "invoke-static { ${registers.joinToString { "v$it" }} }, $descriptor"
                            }
                            else -> throw PatchException("Unexpected invoke format ${instruction.opcode}")
                        }
                        method.replaceInstruction(index, replacement)
                    }
                }
            }
        }
    }
}

/** `invoke-virtual PackageManager.getPackageInfo(String, int | PackageInfoFlags)`. */
private fun Instruction.isGetPackageInfo(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val call = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return call.definingClass == PACKAGE_MANAGER && call.name == "getPackageInfo" &&
        call.returnType == "Landroid/content/pm/PackageInfo;" &&
        call.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;"
}
