/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Adaptado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * shared/misc/signature/SpoofSignature.kt):
 * https://github.com/hxreborn/morphe-patches
 *
 * Reescrito para não depender de utilitários privados do repositório deles
 * (app.morphe.util.*, app.morphe.patches.all.misc.fix.spoofsignature.*), que
 * não fazem parte da API pública do morphe-patcher e não resolvem no build.
 * A lógica de resultado é a mesma; só a forma de obter o certificado e de
 * localizar a instrução const-string mudou, usando apenas PackageMetadata
 * (app.morphe.patcher) e dexlib2 diretamente.
 */
package app.morphe.patches.telegraph.signature

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.security.MessageDigest
import java.security.cert.X509Certificate
import java.util.Base64

private const val ANDROID_APPLICATION_CLASS = "Landroid/app/Application;"
private const val PACKAGE_NAME_PLACEHOLDER = "<package-name>"
private const val CERTIFICATE_PLACEHOLDER = "<certificate>"

/**
 * Confere que o APK de entrada ainda carrega o certificado original do Telegraph
 * (parando cedo e com uma mensagem clara, em vez de deixar o build terminar e
 * o app falhar misteriosamente no aparelho), e devolve esse certificado.
 *
 * Todas as schemes de assinatura presentes normalmente carregam o mesmo
 * certificado; por isso qualquer uma delas serve de fonte.
 */
internal fun PackageMetadata.stockSigningCertificate(expectedSha256: String): X509Certificate {
    val certificate = signingCertificates.values.flatten().firstOrNull()
        ?: throw PatchException("The app being patched is not signed")

    val certificateSha256 = MessageDigest.getInstance("SHA-256").digest(certificate.encoded)
        .joinToString("") { "%02x".format(it) }
    if (certificateSha256 != expectedSha256) {
        throw PatchException(
            "The app being patched is not signed with the expected Telegraph developer certificate " +
                "($certificateSha256). Patch a stock APK instead.",
        )
    }

    return certificate
}

/**
 * Troca a superclasse da Application REAL do app (o topo da hierarquia, que é
 * quem de fato estende android.app.Application — não necessariamente a classe
 * declarada no AndroidManifest, que pode ser uma subclasse dela) pelo nosso
 * SpoofSignature, e grava nele o nome do pacote e o certificado original.
 */
internal fun BytecodePatchContext.spoofSignature(applicationClass: String, hostClass: String) {
    val certificate = packageMetadata.stockSigningCertificate(TELEGRAPH_CERTIFICATE_SHA256)

    mutableClassDefBy(hostClass)
        .methods.single { it.name == "<clinit>" }
        .apply {
            replaceString(PACKAGE_NAME_PLACEHOLDER, packageMetadata.packageName)
            replaceString(CERTIFICATE_PLACEHOLDER, Base64.getEncoder().encodeToString(certificate.encoded))
        }

    applicationRoot(applicationClass, hostClass).setSuperClass(hostClass)
}

private fun MutableMethod.replaceString(placeholder: String, value: String) {
    val index = implementation!!.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.CONST_STRING &&
            ((instruction as ReferenceInstruction).reference as? StringReference)?.string == placeholder
    }
    if (index < 0) throw PatchException("No const-string \"$placeholder\" found in ${definingClass}-><clinit>()V")

    val register = getInstruction<OneRegisterInstruction>(index).registerA
    replaceInstruction(index, "const-string v$register, \"$value\"")
}

private fun BytecodePatchContext.applicationRoot(applicationClass: String, hostClass: String): MutableClass {
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

    if (classDef.type == hostClass) {
        throw PatchException("Application hierarchy already extends $hostClass")
    }

    return classDef
}
