package app.template.patches.shared.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import app.template.patches.opera.OPERA_GX_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "Lapp/template/extension/extension/SignatureHookApp;"

/**
 * Base64 DER of Opera's official "Opera Software" code-signing certificate
 * (subject/issuer CN=Opera Software, C=NO; self-signed, valid 2010-2037),
 * extracted from the v2/v3 signing block of the official
 * `Opera_103_3_5234_91185_Generic_Opera_arm8_LZMA.apk` published on
 * ftp.opera.com (fingerprint written to evidence/ANALYSIS.md §6).
 *
 * SHA-256 of the DER-encoded certificate:
 * 5d6afbf87f652af04647ada0df634cf22370900b164b09d50bd23aa2cb5285b8
 *
 * Play and get.opera.com builds of Opera / Opera Beta / Opera GX carry this
 * certificate, so presenting it makes the Morphe re-signed APK
 * indistinguishable from a vendor build to in-app signature checks.
 */
private const val OPERA_CERTIFICATE_BASE64 = "MIIDEjCCAs+gAwIBAgIES4002zALBgcqhkjOOAQDBQAwbDELMAkGA1UEBhMCTk8xEDAOBgNVBAgTB1Vua25vd24xEDAOBgNVBAcTB1Vua25vd24xDjAMBgNVBAoTBU9wZXJhMRAwDgYDVQQLEwdVbmtub3duMRcwFQYDVQQDEw5PcGVyYSBTb2Z0d2FyZTAeFw0xMDAzMDIxNTU1MDdaFw0zNzA3MTgxNTU1MDdaMGwxCzAJBgNVBAYTAk5PMRAwDgYDVQQIEwdVbmtub3duMRAwDgYDVQQHEwdVbmtub3duMQ4wDAYDVQQKEwVPcGVyYTEQMA4GA1UECxMHVW5rbm93bjEXMBUGA1UEAxMOT3BlcmEgU29mdHdhcmUwggG3MIIBLAYHKoZIzjgEATCCAR8CgYEA/X9TgR11EilS30qcLuzk5/YRt1I870QAwx4/gLZRJmlFXUAiUftZPY1Y+r/F9bow9subVWzXgTuAHTRv8mZgt2uZUKWkn5/oBHsQIsJPu6nX/rfGG/g7V+fGqKYVDwT7g/bTxR7DAjVUE1oWkTL2dfOuK2HXKu/yIgMZndFIAccCFQCXYFCPFSMLzLKSuYKi64QL8Fgc9QKBgQD34aCF1ps93su8q1w2uFe5eZSvu/o66oL5V0wLPQeCZ1FZV4661FlP5nEHEIGAtEkWcSPoTCgWE7fPCTKMyKbhPBZ6i1R8jSjgo64eK7OmdZFuo38L+iE1YvH7YnoBJDvMpPG+qFGQiaiD3+Fa5Z8GkotmXoB7VSVkAUw7/s9JKgOBhAACgYBJYGjbuifHQTrmnSPFwhiFfZJBJAhMxrvsmaPvjZz9aZDzwxFVhKAa18hBjkjiq4po8Tqla93aFkgW6T2gZD88EpYyYMZ9TsHcVtGug+oN6eilCikR+96YLngljbjYTzcqCJHJFIGdKSQqJnEtwzHmbJLCpsHgafzEYHQfaJFhODALBgcqhkjOOAQDBQADMAAwLQIVAI1qwSHrMY8QkHMxVybAV5snANq7AhRRJtGLa3iVRAOHut7dkHbo4o/5gA=="

/**
 * Targets the static initializer of [SignatureHookApp] in the bundled
 * extension, which contains the two placeholder const-string instructions
 * ("<package-name>", "<signature>") that this patch rewrites.
 */
internal val SignatureHookAppStaticInitFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == EXTENSION_CLASS && method.implementation?.instructions
            ?.filterIsInstance<Instruction21c>()
            ?.count { (it.reference as? StringReference)?.string in setOf("<package-name>", "<signature>") } == 2
    },
)

/** Package name extracted from AndroidManifest.xml by [extractPackageNamePatch]. */
internal var extractedPackageName: String = ""

/**
 * Reads the package name from the decoded manifest so the hook compares
 * against the right package even if the user renamed it.
 */
internal val extractPackageNamePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            extractedPackageName = (doc.getElementsByTagName("manifest").item(0) as Element)
                .getAttribute("package")
        }
    }
}

/**
 * Makes the patched app see Opera's ORIGINAL signing certificate instead of
 * the Morphe signing key.
 *
 * Implementation: the bundled extension's [SignatureHookApp] (ported from
 * rushiranpise/morphe-patches, ApkSignatureKillerEx lineage) is merged into
 * the app and re-parents every direct `Application` subclass so its static
 * initializer swaps `PackageInfo.CREATOR` with a proxy that rewrites the
 * signature fields of any PackageInfo parcel of this package. The hook runs
 * before any application code, so signature checks in SDKs and in Opera's
 * first-run engine setup all observe the original certificate.
 */
@Suppress("unused")
val operaSpoofAppSignaturePatch = bytecodePatch(
    name = "Spoof app signature",
    description = "Makes the app see the original Opera signing certificate " +
        "after Morphe re-signs it. Opera's code reads its own signature in " +
        "several places (preinstall partner checks, the MoMi SDK, metrics), " +
        "and a patched build would answer those reads with the Morphe key. A " +
        "PackageInfo.CREATOR parcel proxy presents the vendor certificate, so " +
        "those code paths keep their vendor-build behavior. Does not bypass " +
        "Play Integrity hardware attestation.",
    default = true,
) {
    compatibleWith(OPERA_COMPATIBILITY, OPERA_DIRECT_COMPATIBILITY, OPERA_BETA_COMPATIBILITY, OPERA_GX_COMPATIBILITY)

    val packageNameOption by stringOption(
        key = "packageName",
        default = null,
        title = "Package name override (optional)",
        description = "Leave blank to read the package name from the app manifest.",
        required = false,
    ) { it == null || it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) }

    val signatureOption by stringOption(
        key = "signature",
        default = null,
        title = "Base64 DER certificate override (optional)",
        description = "Leave blank to use the bundled official Opera certificate. " +
            "Only set this if you are patching a build signed with a different " +
            "vendor key. Get it with: apksigner verify --print-certs app.apk",
        required = false,
    ) { it == null || it.isNotBlank() }

    dependsOn(extractPackageNamePatch)

    extendWith("extensions/extension.mpe")

    execute {
        val packageName = packageNameOption?.takeIf { it.isNotBlank() }
            ?: extractedPackageName.ifEmpty { throw PatchException("Could not read package name from the manifest") }

        val signature = signatureOption?.takeIf { !it.isNullOrBlank() }
            ?: OPERA_CERTIFICATE_BASE64

        // Rewrite the two placeholder const-strings, preserving the registers
        // the Kotlin compiler chose for them.
        val hookMethod = SignatureHookAppStaticInitFingerprint.method
        var packageNameIndex = -1
        var signatureIndex = -1
        hookMethod.implementation?.instructions?.forEachIndexed { index, ins ->
            val string = (ins as? Instruction21c)?.reference as? StringReference ?: return@forEachIndexed
            when (string.string) {
                "<package-name>" -> packageNameIndex = index
                "<signature>" -> signatureIndex = index
            }
        }
        if (packageNameIndex < 0 || signatureIndex < 0) {
            throw PatchException("Signature hook placeholders not found in the extension")
        }
        val hookInstructions = hookMethod.implementation!!.instructions.toList()
        val packageNameRegister = (hookInstructions[packageNameIndex] as Instruction21c).registerA
        val signatureRegister = (hookInstructions[signatureIndex] as Instruction21c).registerA
        hookMethod.replaceInstruction(packageNameIndex, "const-string v$packageNameRegister, \"$packageName\"")
        hookMethod.replaceInstruction(signatureIndex, "const-string v$signatureRegister, \"${signature.trim()}\"")

        // Re-parent every direct Application subclass so the hook's static
        // initializer runs before any app code. OperaApplication and
        // LeanplumApplication both qualify; the extension class itself is
        // excluded (it becomes their new common superclass).
        val hookClass = SignatureHookAppStaticInitFingerprint.originalClassDef
        var reParented = 0
        classDefForEach { classDef ->
            if (classDef != hookClass && classDef.superclass == "Landroid/app/Application;") {
                mutableClassDefBy(classDef).setSuperClass(hookClass.type)
                reParented++
            }
        }
        if (reParented == 0) {
            throw PatchException("No Application subclass found to attach the signature hook to")
        }

        // The patcher copies any extension dex whose classes were not all
        // modified verbatim into the output APK - which would duplicate the
        // rewritten Companion (with the original <signature> placeholder!)
        // next to the patched one. Touch the remaining extension classes
        // with a harmless nop so every extension class counts as modified
        // and the verbatim copy is skipped.
        val extensionPrefix = "Lapp/template/extension/extension/"
        classDefForEach { classDef ->
            if (classDef.type.startsWith(extensionPrefix)) {
                val mutable = mutableClassDefBy(classDef)
                val target = mutable.methods.firstOrNull { it.implementation != null }
                    ?: throw PatchException("Extension class ${classDef.type} has no code to touch")
                target.addInstructions(0, "nop")
            }
        }

        println(
            "Opera signature spoof: package=$packageName, cert=${signature.take(24)}…, " +
                "hook attached to $reParented Application subclass(es)",
        )
    }
}
