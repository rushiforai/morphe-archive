package app.template.patches.shared.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import app.template.patches.opera.OPERA_GX_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "Lapp/template/extension/extension/SignatureHookApp;"
private const val EXTENSION_COMPANION_CLASS = "Lapp/template/extension/extension/SignatureHookApp\$Companion;"

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
 * Targets the initializer of [SignatureHookApp] in the bundled extension,
 * which contains the two placeholder const-string instructions
 * ("<package-name>", "<signature>") that this patch rewrites.
 *
 * v1.2.3: the companion of the rewritten extension carries state, so the
 * initializer may compile into either the outer class's `<clinit>` (where
 * kotlinc places it today) or the Companion's constructor - the fingerprint
 * accepts both shapes and requires the placeholders, which exist exactly
 * once in the whole extension dex.
 */
internal val SignatureHookAppStaticInitFingerprint = Fingerprint(
    custom = { method, classDef ->
        (classDef.type == EXTENSION_CLASS || classDef.type == EXTENSION_COMPANION_CLASS) &&
            method.implementation?.instructions
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

// ============================================================================
// Call-site redirect engine.
//
// Rewrites `invoke-virtual ... <framework-method>` call sites in the app's
// own bytecode into `invoke-static ... SignatureHookApp-><helper>` calls that
// post-process the result (receiver register becomes the first parameter, so
// registers and exception behavior at the call site are unchanged).
//
// Ported from kveld9/morphe-patches `UniversalSpoofSignaturePatch.kt`
// (GPLv3 with Morphe Section 7 terms, MorpheApp/morphe-patches PR #2470
// lineage), with one improvement: `invoke-virtual/range` call sites are
// rewritten to `invoke-static/range`, which supports any register index, so
// they are never skipped; only non-range call sites that use registers
// above v15 (which cannot be expressed as invoke-static 35c) are skipped
// and counted.
// ============================================================================

private data class CallSiteRedirect(
    val tag: String,
    val definingClass: String,
    val name: String,
    val returnType: String,
    val parameterTypes: List<String>,
    val targetDescriptor: String,
)

private data class PendingCallSiteRewrite(
    val tag: String,
    val instructionIndex: Int,
    val newInvoke: String,
)

private fun isVirtualInvoke(opcode: Opcode): Boolean =
    opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE

private fun extractInstructionRegisters(instruction: Instruction): List<Int>? {
    return when (instruction) {
        is FiveRegisterInstruction -> listOf(
            instruction.registerC,
            instruction.registerD,
            instruction.registerE,
            instruction.registerF,
            instruction.registerG,
        ).take(instruction.registerCount)
        is RegisterRangeInstruction ->
            (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
        else -> null
    }
}

private fun isRedirectCandidateMatch(candidate: CallSiteRedirect, ref: MethodReference): Boolean {
    if (candidate.definingClass != ref.definingClass) return false
    if (candidate.name != ref.name) return false
    if (candidate.returnType != ref.returnType) return false
    return candidate.parameterTypes == ref.parameterTypes
}

/** Extension/Morphe classes must never be redirected (self-recursion guard). */
private fun isExtensionClass(type: String): Boolean =
    type.startsWith("Lapp/template/extension/") || type.startsWith("Lapp/morphe/")

/**
 * One full scan of the app dex (immutable class defs only - classes are
 * materialized lazily below, keeping peak memory in the range documented in
 * the README's "Memory usage" section).
 */
private fun applySignatureRedirects(redirects: List<CallSiteRedirect>): Map<String, Int> {
    val redirected = mutableMapOf<String, Int>()
    var skippedHighRegisters = 0

    classDefForEach { classDef ->
        if (isExtensionClass(classDef.type)) return@classDefForEach

        // Scan the immutable class; collect rewrites per method index.
        val mutations = mutableListOf<Pair<Int, List<PendingCallSiteRewrite>>>()
        classDef.methods.forEachIndexed { methodIndex, method ->
            val rewrites = scanMethodCallSites(method, redirects) { skippedHighRegisters++ }
            if (rewrites.isNotEmpty()) {
                mutations.add(methodIndex to rewrites)
            }
        }
        if (mutations.isEmpty()) return@classDefForEach

        val mutableClass = mutableClassDefBy(classDef)
        val mutableMethods = mutableClass.methods.toList()
        for ((methodIndex, rewrites) in mutations) {
            if (methodIndex >= mutableMethods.size) {
                throw PatchException("Class ${classDef.type} method index drifted during materialization")
            }
            val mutableMethod = mutableMethods[methodIndex]
            // Defensive: the dexlib2 mutable view preserves method order, but
            // verify by name before touching anything.
            if (mutableMethod.name != classDef.methods.toList()[methodIndex].name) {
                throw PatchException("Class ${classDef.type} method order drifted during materialization")
            }
            for (rewrite in rewrites.sortedByDescending { it.instructionIndex }) {
                mutableMethod.replaceInstruction(rewrite.instructionIndex, rewrite.newInvoke)
            }
            for (rewrite in rewrites) {
                redirected[rewrite.tag] = (redirected[rewrite.tag] ?: 0) + 1
            }
        }
    }

    if (skippedHighRegisters > 0) {
        redirected["skipped (registers > v15)"] = skippedHighRegisters
    }
    return redirected
}

private fun scanMethodCallSites(
    method: Method,
    redirects: List<CallSiteRedirect>,
    onSkippedHighRegister: () -> Unit,
): List<PendingCallSiteRewrite> {
    val implementation = method.implementation ?: return emptyList()
    val rewrites = mutableListOf<PendingCallSiteRewrite>()

    var index = 0
    for (instruction in implementation.instructions) {
        val current = index
        index++

        if (!isVirtualInvoke(instruction.opcode)) continue
        if (instruction !is ReferenceInstruction) continue
        val reference = instruction.reference as? MethodReference ?: continue

        val redirect = redirects.firstOrNull { isRedirectCandidateMatch(it, reference) } ?: continue

        val registers = extractInstructionRegisters(instruction)
        if (registers == null || registers.isEmpty()) {
            onSkippedHighRegister()
            continue
        }
        // invoke-static (format 35c) addresses at most v15; /range has no
        // such limit, so range call sites are always expressible.
        if (instruction !is RegisterRangeInstruction && registers.any { it > 15 }) {
            onSkippedHighRegister()
            continue
        }

        val newInvoke = if (instruction is RegisterRangeInstruction) {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, ${redirect.targetDescriptor}"
        } else {
            val joined = registers.joinToString(", ") { "v$it" }
            "invoke-static {$joined}, ${redirect.targetDescriptor}"
        }
        rewrites.add(PendingCallSiteRewrite(redirect.tag, current, newInvoke))
    }

    return rewrites
}

/** The framework reads that reveal an app's signature to itself. */
private val SIGNATURE_REDIRECTS = listOf(
    CallSiteRedirect(
        tag = "getPackageInfo(String,int)",
        definingClass = "Landroid/content/pm/PackageManager;",
        name = "getPackageInfo",
        returnType = "Landroid/content/pm/PackageInfo;",
        parameterTypes = listOf("Ljava/lang/String;", "I"),
        targetDescriptor =
            "$EXTENSION_CLASS->getPackageInfo(Landroid/content/pm/PackageManager;Ljava/lang/String;I)Landroid/content/pm/PackageInfo;",
    ),
    CallSiteRedirect(
        tag = "getPackageInfo(String,flags)",
        definingClass = "Landroid/content/pm/PackageManager;",
        name = "getPackageInfo",
        returnType = "Landroid/content/pm/PackageInfo;",
        parameterTypes = listOf("Ljava/lang/String;", "Landroid/content/pm/PackageManager\$PackageInfoFlags;"),
        targetDescriptor =
            "$EXTENSION_CLASS->getPackageInfo(Landroid/content/pm/PackageManager;Ljava/lang/String;" +
                "Landroid/content/pm/PackageManager\$PackageInfoFlags;)Landroid/content/pm/PackageInfo;",
    ),
    CallSiteRedirect(
        tag = "hasSigningCertificate",
        definingClass = "Landroid/content/pm/PackageManager;",
        name = "hasSigningCertificate",
        returnType = "Z",
        parameterTypes = listOf("Ljava/lang/String;", "[B", "I"),
        targetDescriptor =
            "$EXTENSION_CLASS->hasSigningCertificate(Landroid/content/pm/PackageManager;Ljava/lang/String;[BI)Z",
    ),
    CallSiteRedirect(
        tag = "getApkContentsSigners",
        definingClass = "Landroid/content/pm/SigningInfo;",
        name = "getApkContentsSigners",
        returnType = "[Landroid/content/pm/Signature;",
        parameterTypes = emptyList(),
        targetDescriptor =
            "$EXTENSION_CLASS->getApkContentsSigners(Landroid/content/pm/SigningInfo;)[Landroid/content/pm/Signature;",
    ),
    CallSiteRedirect(
        tag = "getSigningCertificateHistory",
        definingClass = "Landroid/content/pm/SigningInfo;",
        name = "getSigningCertificateHistory",
        returnType = "[Landroid/content/pm/Signature;",
        parameterTypes = emptyList(),
        targetDescriptor =
            "$EXTENSION_CLASS->getSigningCertificateHistory(Landroid/content/pm/SigningInfo;)[Landroid/content/pm/Signature;",
    ),
    CallSiteRedirect(
        tag = "hasMultipleSigners",
        definingClass = "Landroid/content/pm/SigningInfo;",
        name = "hasMultipleSigners",
        returnType = "Z",
        parameterTypes = emptyList(),
        targetDescriptor =
            "$EXTENSION_CLASS->hasMultipleSigners(Landroid/content/pm/SigningInfo;)Z",
    ),
)

/**
 * Makes the patched app see Opera's ORIGINAL signing certificate instead of
 * the Morphe signing key.
 *
 * Implementation (v1.2.3, two independent layers):
 *
 *  1. Every signature-reading framework call site in the app's own bytecode
 *     (`PackageManager.getPackageInfo`, `PackageManager.hasSigningCertificate`,
 *     `SigningInfo.getApkContentsSigners/getSigningCertificateHistory/
 *     hasMultipleSigners`) is redirected to the bundled extension's static
 *     helpers, which post-process the result and swap in the original
 *     certificate. Deterministic, reflection-free, and independent of any
 *     Android hardening. (Ported from the Morphe universal "Spoof signature"
 *     pattern; see the redirect engine above.)
 *  2. The bundled extension's [SignatureHookApp] is merged into the app and
 *     re-parents every direct `Application` subclass so its static
 *     initializer swaps `PackageInfo.CREATOR` with a proxy that rewrites the
 *     signature fields of any PackageInfo parcel of this package - covering
 *     reads that do not go through a rewritten call site.
 *
 * The hook runs before any application code, so signature checks in SDKs and
 * in Opera's first-run engine setup all observe the original certificate.
 */
@Suppress("unused")
val operaSpoofAppSignaturePatch = bytecodePatch(
    name = "Spoof app signature",
    description = "Makes the app see the original Opera signing certificate " +
        "after Morphe re-signs it. Opera's code reads its own signature in " +
        "several places (preinstall partner checks, the MoMi SDK, metrics), " +
        "and a patched build would answer those reads with the Morphe key. " +
        "Signature-reading call sites are redirected to a helper that " +
        "presents the vendor certificate, with a PackageInfo.CREATOR parcel " +
        "proxy as a second, independent layer. Does not bypass Play " +
        "Integrity hardware attestation.",
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

        // Layer 1: redirect the app's signature-reading call sites.
        val redirected = applySignatureRedirects(SIGNATURE_REDIRECTS)
        val callSiteCount = redirected.entries.filter { it.key != "skipped (registers > v15)" }.sumOf { it.value }
        if (callSiteCount == 0) {
            println(
                "Opera signature spoof: WARNING - no signature-reading call sites were found; " +
                    "relying on the CREATOR proxy layer only",
            )
        }

        // The patcher copies any extension dex whose classes were not all
        // modified verbatim into the output APK - which would duplicate the
        // rewritten initializer (with the original <signature> placeholder!)
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

        val callSiteSummary = redirected.entries.joinToString(", ") { "${it.key} x${it.value}" }
        println(
            "Opera signature spoof: package=$packageName, cert=${signature.take(24)}…, " +
                "hook attached to $reParented Application subclass(es), " +
                "redirected call sites: $callSiteSummary",
        )
    }
}
