/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library/pull/61
 * See the included NOTICE file for §7(c) terms that apply to this code.
 * Modified for gmaps-patches: original Maps validation, getter injection and all supported invoke forms.
 */
package app.morphe.patches.maps

import app.morphe.patcher.apk.ApkSignatureScheme
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.security.MessageDigest
import java.util.Base64
import java.util.logging.Logger

internal const val MAPS_SIGNATURE_EXTENSION = "Lapp/morphe/extension/maps/patches/MapsSignatureSpoof;"
private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"
private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"
private val allowedCertificateHashes = setOf(
    "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83",
    "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053",
)

internal fun BytecodePatchContext.patchMapsSignatureSpoof() {
    fun fail(reason: String): Nothing = throw PatchException("Maps signature spoof: $reason")
    if (packageMetadata.packageName != "com.google.android.apps.maps") fail("original Maps input required")
    val certificates = packageMetadata.signingCertificates.filterValues { it.isNotEmpty() }
    fun priority(scheme: ApkSignatureScheme) = when (scheme) {
        ApkSignatureScheme.V31 -> 3
        ApkSignatureScheme.V3 -> 2
        ApkSignatureScheme.V2 -> 1
        else -> -1
    }
    val selected = certificates.keys.maxByOrNull { priority(it) } ?: fail("no input certificate")
    if (priority(selected) < 1) fail("input has no supported signing scheme")
    val chain = certificates.getValue(selected)
    val issuers = chain.map { it.issuerX500Principal }.toSet()
    val cert = chain.firstOrNull { it.subjectX500Principal !in issuers } ?: chain.first()
    fun digest(algorithm: String) = MessageDigest.getInstance(algorithm).digest(cert.encoded)
        .joinToString("") { "%02x".format(it) }
    val sha256 = digest("SHA-256")
    if (sha256 !in allowedCertificateHashes) fail("input certificate is not an accepted Google Maps signer")
    val sha1 = digest("SHA-1")
    val values = mapOf(
        "originalPackage" to ("MAPS_ORIGINAL_PACKAGE_PLACEHOLDER" to packageMetadata.packageName),
        "patchedPackage" to ("MAPS_PATCHED_PACKAGE_PLACEHOLDER" to "app.morphe.android.apps.maps"),
        "originalCertificate" to ("MAPS_ORIGINAL_CERTIFICATE_PLACEHOLDER" to Base64.getEncoder().encodeToString(cert.encoded)),
        "originalSha1" to ("MAPS_ORIGINAL_SHA1_PLACEHOLDER" to sha1),
    )
    val extension = mutableClassDefBy(MAPS_SIGNATURE_EXTENSION)
    values.forEach { (name, replacement) ->
        val method = extension.methods.filter { it.name == name }.singleOrNull() ?: fail("missing getter $name")
        val implementation = method.implementation ?: fail("missing getter body $name")
        val code = implementation.instructions.toList()
        val register = (code.firstOrNull() as? OneRegisterInstruction)?.registerA ?: fail("getter register $name")
        if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes.isNotEmpty() ||
            method.returnType != "Ljava/lang/String;" || implementation.registerCount != 1 ||
            implementation.tryBlocks.isNotEmpty() || code.size != 2 ||
            code[0].opcode !in listOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) ||
            code[0].getReference<StringReference>()?.string != replacement.first ||
            code[1].opcode != Opcode.RETURN_OBJECT || (code[1] as? OneRegisterInstruction)?.registerA != register
        ) fail("unrecognized metadata getter $name")
        method.replaceInstruction(0, "const-string v$register, \"${replacement.second}\"")
    }

    data class Site(val method: com.android.tools.smali.dexlib2.iface.Method, val index: Int, val ref: MethodReference,
                    val registers: List<Int>, val range: Boolean)
    val sites = mutableListOf<Site>()
    classDefForEach { cls ->
        if (!cls.type.startsWith("Lapp/morphe/extension/")) cls.methods.forEach { method ->
            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                val ref = instruction.getReference<MethodReference>()
                if (ref?.definingClass == PACKAGE_MANAGER && ref.name == "getPackageInfo") {
                    val params = ref.parameterTypes.map { it.toString() }
                    if (ref.returnType != PACKAGE_INFO || params !in listOf(
                            listOf("Ljava/lang/String;", "I"),
                            listOf("Ljava/lang/String;", "Landroid/content/pm/PackageManager\$PackageInfoFlags;"),
                        ) || instruction.opcode !in listOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)
                    ) fail("unsupported PackageManager call $ref")
                    val args = identityInvokeRegisters(instruction)
                    if (args.size != 3) fail("PackageManager invoke register count")
                    sites += Site(method, index, ref, args, instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE)
                }
            }
        }
    }
    if (sites.isEmpty()) fail("no PackageManager calls")
    sites.forEach { site ->
        val mutable = mutableClassDefBy(site.method.definingClass).methods.single {
            it.name == site.method.name && it.parameterTypes == site.method.parameterTypes && it.returnType == site.method.returnType
        }
        val descriptor = "$MAPS_SIGNATURE_EXTENSION->getPackageInfo($PACKAGE_MANAGER" +
            site.ref.parameterTypes.joinToString("") + ")$PACKAGE_INFO"
        val call = if (site.range) "invoke-static/range { v${site.registers.first()} .. v${site.registers.last()} }, $descriptor"
            else "invoke-static { ${site.registers.joinToString(", ") { "v$it" }} }, $descriptor"
        mutable.replaceInstruction(site.index, call)
    }
    Logger.getLogger("app.morphe.patches.maps.MapsSignatureSpoof").info(
        "Signature spoof (adapted ref): scheme=$selected sha1=$sha1 sha256=$sha256; ${sites.size} PackageManager calls; own names only",
    )
}
