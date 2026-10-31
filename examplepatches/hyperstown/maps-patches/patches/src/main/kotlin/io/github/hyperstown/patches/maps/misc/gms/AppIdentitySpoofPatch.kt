/*
 * Adapted from gmaps-patches by fangkampanat, https://github.com/fangkampanat/gmaps-patches,
 * which adapts the signature spoofing of Morphe, https://github.com/MorpheApp/morphe-patches-library/pull/61
 * See the included NOTICE file for the GPLv3 section 7 terms that apply to this code.
 */

package io.github.hyperstown.patches.maps.misc.gms

import app.morphe.patcher.apk.ApkSignatureScheme
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.hyperstown.patches.maps.shared.Constants.EXTENSION_PACKAGE
import io.github.hyperstown.patches.maps.shared.Constants.MAPS_CERTIFICATE_SHA256
import io.github.hyperstown.patches.maps.shared.Constants.MAPS_CERTIFICATE_SHA256_ANDROID_13
import io.github.hyperstown.patches.maps.shared.Constants.MAPS_PACKAGE_NAME
import io.github.hyperstown.patches.util.invokeStaticWithSameRegisters
import io.github.hyperstown.patches.util.signatureEquals
import io.github.hyperstown.patches.util.stringOrNull
import java.security.MessageDigest
import java.security.cert.X509Certificate
import java.util.Base64
import java.util.logging.Logger

private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}SignatureSpoof;"
private const val PACKAGE_MANAGER_CLASS = "Landroid/content/pm/PackageManager;"
private const val PACKAGE_INFO_CLASS = "Landroid/content/pm/PackageInfo;"

private val logger = Logger.getLogger("io.github.hyperstown.patches.maps.misc.gms")

/**
 * Google's servers only accept the Maps API key from the original package and signing certificate.
 * The patched app is renamed and signed with another key, so without an account map tiles, search and
 * place details fail. Maps is made to see its original signature, and to send its original package name
 * and certificate in the X-Android-Package and X-Android-Cert request headers.
 */
internal val appIdentitySpoofPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)

    execute {
        spoofSignature()
        spoofIdentityHeaders()
    }
}

private fun BytecodePatchContext.spoofSignature() {
    fun fail(reason: String): Nothing = throw PatchException("Signature spoof: $reason")

    if (packageMetadata.packageName != MAPS_PACKAGE_NAME) fail("the original Google Maps APK is required")
    val certificate = originalCertificate() ?: fail("the APK is not signed with a Google Maps certificate")

    // The extension holds placeholder getters that are filled in with the original identity.
    val values = mapOf(
        "originalPackage" to MAPS_PACKAGE_NAME,
        "patchedPackage" to packageNameOption.value!!,
        "originalCertificate" to Base64.getEncoder().encodeToString(certificate.encoded),
        "originalSha1" to certificate.digest("SHA-1"),
    )
    val extension = mutableClassDefBy(EXTENSION_CLASS)
    values.forEach { (getter, value) ->
        val method = extension.methods.singleOrNull { it.name == getter } ?: fail("missing getter $getter")
        val code = method.implementation?.instructions?.toList() ?: fail("missing getter body $getter")
        if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes.isNotEmpty() ||
            code.size != 2 || code[0].stringOrNull == null || code[1].opcode != Opcode.RETURN_OBJECT
        ) {
            fail("unrecognized getter $getter")
        }
        method.replaceInstruction(0, "const-string v${(code[0] as OneRegisterInstruction).registerA}, \"$value\"")
    }

    // Maps reads its own signature through PackageManager.getPackageInfo.
    val calls = mutableListOf<Pair<Method, Int>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                if (instruction.isGetPackageInfo()) calls += method to index
            }
        }
    }
    if (calls.isEmpty()) fail("no PackageManager.getPackageInfo calls")

    calls.forEach { (method, index) ->
        val mutableMethod = mutableClassDefBy(method.definingClass).methods.single { it.signatureEquals(method) }
        val instruction = mutableMethod.implementation!!.instructions[index]
        val call = instruction.getReference<MethodReference>()!!

        mutableMethod.replaceInstruction(
            index,
            invokeStaticWithSameRegisters(
                instruction,
                "$EXTENSION_CLASS->getPackageInfo($PACKAGE_MANAGER_CLASS${call.parameterTypes.joinToString("")})" +
                    PACKAGE_INFO_CLASS,
            ),
        )
    }

    logger.info("Signature spoof: SHA-1 ${values["originalSha1"]}, ${calls.size} PackageManager calls")
}

/**
 * The certificate Android reports for the original app. With key rotation that is
 * the newest signer, which the v3.1 scheme carries for Android 13 and newer.
 */
private fun BytecodePatchContext.originalCertificate(): X509Certificate? {
    fun ApkSignatureScheme.priority() = when (this) {
        ApkSignatureScheme.V31 -> 3
        ApkSignatureScheme.V3 -> 2
        ApkSignatureScheme.V2 -> 1
        else -> 0
    }

    val chain = packageMetadata.signingCertificates
        .filter { (scheme, certificates) -> scheme.priority() > 0 && certificates.isNotEmpty() }
        .maxByOrNull { (scheme, _) -> scheme.priority() }?.value ?: return null

    // The signer is the leaf of the chain, the certificate that issued no other.
    val issuers = chain.map { it.issuerX500Principal }.toSet()
    val certificate = chain.firstOrNull { it.subjectX500Principal !in issuers } ?: chain.first()

    return certificate.takeIf {
        it.digest("SHA-256") in setOf(MAPS_CERTIFICATE_SHA256, MAPS_CERTIFICATE_SHA256_ANDROID_13)
    }
}

private fun X509Certificate.digest(algorithm: String) =
    MessageDigest.getInstance(algorithm).digest(encoded).joinToString("") { "%02x".format(it) }

private fun Instruction.isGetPackageInfo(): Boolean {
    val call = getReference<MethodReference>() ?: return false
    if (call.definingClass != PACKAGE_MANAGER_CLASS || call.name != "getPackageInfo") return false

    val parameters = call.parameterTypes.map { it.toString() }
    if (call.returnType != PACKAGE_INFO_CLASS || opcode !in listOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) ||
        parameters !in listOf(
            listOf("Ljava/lang/String;", "I"),
            listOf("Ljava/lang/String;", "Landroid/content/pm/PackageManager\$PackageInfoFlags;"),
        )
    ) {
        throw PatchException("Signature spoof: unsupported PackageManager call $call")
    }

    return true
}

/**
 * Each header write gets a bridge method that passes the original value instead,
 * so the caller's registers, the header key, return value and exceptions stay the same.
 */
private fun BytecodePatchContext.spoofIdentityHeaders() {
    val classes = mutableListOf<ClassDef>()
    classDefForEach { if (!it.type.startsWith(EXTENSION_PACKAGE)) classes += it }

    val writes = IdentityHeaderScanner(classes).inspect()
    writes.forEachIndexed { ordinal, write ->
        val owner = mutableClassDefBy(write.method.definingClass)
        val name = "\$identity\$${write.kind.name.lowercase()}$ordinal"
        if (owner.methods.any { it.name == name }) throw PatchException("Bridge already exists: ${owner.type}->$name")

        val parameters = listOf(write.target.definingClass) + write.target.parameterTypes.map { it.toString() }
        val bridge = MutableMethod(
            ImmutableMethod(
                owner.type,
                name,
                parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
                write.target.returnType,
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
                emptySet(),
                emptySet(),
                // v0 for the value, p0 to p2 for the receiver, the header key and the original value.
                ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
            ),
        )

        val value = when (write.kind) {
            IdentityHeaderKind.PACKAGE -> "invoke-static {}, $EXTENSION_CLASS->packageHeaderValue()Ljava/lang/String;"
            IdentityHeaderKind.CERT ->
                "invoke-static { p2 }, $EXTENSION_CLASS->certificateHeaderValue(Ljava/lang/Object;)Ljava/lang/String;"
        }
        val invoke = if (write.opcode in listOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)) {
            "invoke-interface"
        } else {
            "invoke-virtual"
        }
        val result = if (write.target.returnType == "V") {
            "return-void"
        } else {
            "move-result-object v0\nreturn-object v0"
        }
        bridge.addInstructions(
            0,
            """
                $value
                move-result-object v0
                $invoke { p0, p1, v0 }, ${write.target}
                $result
            """,
        )
        owner.methods.add(bridge)

        val caller = owner.methods.single { it.signatureEquals(write.method) }
        val bridgeDescriptor = "${owner.type}->$name(${parameters.joinToString("")})${write.target.returnType}"
        caller.replaceInstruction(
            write.index,
            invokeStaticWithSameRegisters(caller.implementation!!.instructions[write.index], bridgeDescriptor),
        )
    }

    logger.info(
        "Identity headers: ${writes.count { it.kind == IdentityHeaderKind.PACKAGE }} package and " +
            "${writes.count { it.kind == IdentityHeaderKind.CERT }} certificate header writes",
    )
}
