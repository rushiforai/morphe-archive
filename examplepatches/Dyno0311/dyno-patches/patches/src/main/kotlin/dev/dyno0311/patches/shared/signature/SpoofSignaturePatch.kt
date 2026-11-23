package dev.dyno0311.patches.shared.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.dyno0311.patches.apps.camscanner.camScannerCompatibility
import java.util.Base64

private const val HOOK_CLASS = "Ldev/dyno0311/extension/SignatureHookApp;"

/**
 * Static initializer of the injected hook, which holds two placeholder constants we swap for the
 * real package name and the original signing certificate.
 */
internal val SignatureHookAppStaticInitFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == HOOK_CLASS &&
            method.implementation?.instructions
                ?.filterIsInstance<Instruction21c>()
                ?.count { instr ->
                    (instr.reference as? StringReference)?.string in setOf("<package-name>", "<signature>")
                } == 2
    },
)

/**
 * Makes the app believe its signing certificate is unchanged after Morphe re-signs it.
 *
 * The original certificate is read from the APK being patched, then fed to a startup hook that
 * replaces `PackageInfo.CREATOR`, so every signature read returns the original certificate instead
 * of the re-signed one. That is how apps which hard-code their certificate digest — CamScanner
 * whitelists two MD5s and silently disables its editor on mismatch — keep working.
 *
 * Ported from the technique used by L-JINBIN/ApkSignatureKillerEx via rushiranpise and
 * jkennethcarino's patch sets (GPL-3.0).
 */
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof app signature",
    description = "Reports the original signing certificate to the app so tamper and licence checks pass.",
    default = false,
) {
    compatibleWith(camScannerCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        val packageName = packageMetadata.packageName
        val certificate = packageMetadata.signingCertificates.values.flatten().firstOrNull()
            ?: throw PatchException("No signing certificate found in the APK being patched.")
        val encoded = Base64.getEncoder().encodeToString(certificate.encoded)

        val hookClass = SignatureHookAppStaticInitFingerprint.originalClassDef

        val staticInit = SignatureHookAppStaticInitFingerprint.method
        val instructions = staticInit.implementation?.instructions?.toList()
            ?: throw PatchException("Hook class has no static initializer.")
        var nameIndex = -1
        var signatureIndex = -1
        instructions.forEachIndexed { index, instruction ->
            val value = ((instruction as? Instruction21c)?.reference as? StringReference)?.string
            when (value) {
                "<package-name>" -> nameIndex = index
                "<signature>" -> signatureIndex = index
            }
        }
        if (nameIndex < 0 || signatureIndex < 0) throw PatchException("Cert hook placeholders not found.")
        staticInit.replaceInstruction(nameIndex, "const-string v0, \"$packageName\"")
        staticInit.replaceInstruction(signatureIndex, "const-string v1, \"$encoded\"")

        // Any Application subclass in the app now inherits the hook, so its static initializer runs
        // before the app touches PackageManager.
        var hooked = 0
        classDefForEach { classDef ->
            if (classDef != hookClass && classDef.superclass == "Landroid/app/Application;") {
                mutableClassDefBy(classDef).setSuperClass(HOOK_CLASS)
                hooked++
            }
        }
        if (hooked == 0) throw PatchException("No Application subclass found to hook.")
    }
}
