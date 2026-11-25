/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package patches.aliexpress


import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.formatter.DexFormatter
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.security.MessageDigest
import java.security.cert.X509Certificate
import java.util.Base64
import org.w3c.dom.Document
import org.w3c.dom.Element

internal fun descriptor(method: MethodReference): String = DexFormatter.INSTANCE.getMethodDescriptor(method)

internal fun descriptor(field: FieldReference): String = DexFormatter.INSTANCE.getFieldDescriptor(field)

internal fun MutableClass.addStaticMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    smali: String,
): String = descriptor(
    ImmutableMethod(
        type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(registers),
    ).toMutable().also { method ->
        method.addInstructionsWithLabels(0, smali)
        methods.add(method)
    },
)

internal fun MutableClass.replaceStub(name: String, registers: Int, smali: String) {
    val stub = methods.single { it.name == name }
    methods.remove(stub)
    addStaticMethod(name, stub.parameterTypes.map(CharSequence::toString), stub.returnType, registers, smali)
}

internal fun Document.putApplicationMetaData(name: String, value: String) {
    val application = getElementsByTagName("application").item(0) as Element
    val declared = (0 until application.childNodes.length)
        .map { application.childNodes.item(it) }
        .filterIsInstance<Element>()
        .firstOrNull { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
    val metadata = declared ?: createElement("meta-data").also {
        it.setAttribute("android:name", name)
        application.appendChild(it)
    }
    metadata.removeAttribute("android:resource")
    metadata.setAttribute("android:value", value)
}

internal const val SPOOF_SIGNATURE_CLASS = "Lnl/johninnl/aliexpress/SpoofSignature;"

private const val ANDROID_APPLICATION_CLASS = "Landroid/app/Application;"
private const val PACKAGE_NAME_PLACEHOLDER = "<package-name>"
private const val CERTIFICATE_PLACEHOLDER = "<certificate>"

internal fun BytecodePatchContext.spoofSignature(
    applicationClass: String,
    hostClass: String = SPOOF_SIGNATURE_CLASS,
) {
    val certificate = packageMetadata.stockSigningCertificate()

    mutableClassDefBy(hostClass)
        .methods.single { it.name == "<clinit>" }
        .apply {
            replaceString(PACKAGE_NAME_PLACEHOLDER, packageMetadata.packageName)
            replaceString(
                CERTIFICATE_PLACEHOLDER,
                Base64.getEncoder().encodeToString(certificate.encoded),
            )
        }

    applicationRoot(applicationClass).setSuperClass(hostClass)
}

internal fun PackageMetadata.stockSigningCertificate(): X509Certificate {
    val certificates = signingCertificates.values.flatten()
        .distinctBy { Base64.getEncoder().encodeToString(it.encoded) }
    if (certificates.isEmpty()) {
        throw PatchException("The app being patched is not signed")
    }
    if (certificates.size != 1) {
        throw PatchException("The app being patched has an unexpected signing certificate set")
    }
    val certificate = certificates.single()
    val certificateSha256 = MessageDigest.getInstance("SHA-256").digest(certificate.encoded)
        .joinToString("") { "%02x".format(it) }
    if (certificateSha256 !in ALIEXPRESS.signatures.orEmpty()) {
        throw PatchException(
            "The app being patched is not signed with the $packageName developer certificate " +
                "($certificateSha256). Patch a stock APK instead.",
        )
    }
    return certificate
}

internal fun MutableMethod.replaceString(placeholder: String, value: String) {
    val index = instructions.indexOfFirst { instruction ->
        (instruction as? ReferenceInstruction)?.reference
            .let { it as? StringReference }?.string == placeholder
    }
    if (index < 0) {
        throw PatchException("Missing string placeholder $placeholder")
    }
    val register = getInstruction<OneRegisterInstruction>(index).registerA
    replaceInstruction(index, "const-string v$register, \"$value\"")
}

private fun BytecodePatchContext.applicationRoot(applicationClass: String): MutableClass {
    var classDef = mutableClassDefBy(applicationClass)
    val walked = mutableSetOf(classDef.type)

    while (classDef.superclass != ANDROID_APPLICATION_CLASS) {
        val superclass = classDef.superclass
            ?: throw PatchException("Application hierarchy ended before android.app.Application")
        if (!walked.add(superclass)) {
            throw PatchException("Application hierarchy loops at $superclass")
        }
        classDef = mutableClassDefBy(superclass)
    }

    if (classDef.type == SPOOF_SIGNATURE_CLASS) {
        throw PatchException("Application hierarchy already extends $SPOOF_SIGNATURE_CLASS")
    }

    return classDef
}
