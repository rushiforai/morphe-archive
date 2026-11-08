/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Mecanismo portado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/
 * patches/graphmessenger/misc/fix/signature/SpoofSignaturePatch.kt):
 * https://github.com/hxreborn/morphe-patches
 *
 * O Telegraph confere a própria assinatura em dois lugares independentes:
 *  1) Dentro do código nativo de libtmessages.49.so (ver NativeCertificateChecks):
 *     essa é a checagem que travava o app com SIGSEGV logo na abertura, e é
 *     corrigida aqui reescrevendo bytes do binário diretamente (rawResourcePatch).
 *  2) Através das APIs normais do Android (PackageManager/PackageInfo), que é o
 *     que o SpoofSignature.java (extensão) cobre — provavelmente a origem do
 *     aviso "Your Telegraph Messenger is modified" que ainda aparecia depois
 *     de resolver o crash.
 * As duas são necessárias; nenhuma sozinha resolve tudo.
 */
package app.morphe.patches.telegraph.signature

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.telegraph.TelegraphCompatibility
import java.security.MessageDigest

// Ajuste se, numa atualização futura, o Telegraph deixar de usar esta classe como
// a Application concreta declarada no AndroidManifest (ApplicationLoaderImpl é a
// classe que o app.morphe.extension.telegraph.SignatureHookApp antigo também usava).
private const val APPLICATION_CLASS = "Lorg/telegram/messenger/ApplicationLoaderImpl;"
private const val HOST_CLASS = "Lapp/morphe/extension/telegraph/SpoofSignature;"

// SHA-256 do certificado original do Telegraph (ir.ilmili.telegraph), extraído do
// APK oficial 12.10.6.0: CN=Masoud BH, O=ilmili.
internal const val TELEGRAPH_CERTIFICATE_SHA256 =
    "e7d5ad736aeecd2fe237679e4deaf2a40bb32fc07837fe48778a5b41c0418862"

private val spoofNativeCertificateDigestPatch = rawResourcePatch {
    execute {
        val library = get(NativeCertificateChecks.LIBRARY)
        if (!library.exists()) throw PatchException("${NativeCertificateChecks.LIBRARY} is missing")

        val stockCertificateDigest = MessageDigest.getInstance("SHA-256")
            .digest(packageMetadata.stockSigningCertificate(TELEGRAPH_CERTIFICATE_SHA256).encoded)
        val bytes = library.readBytes()
        NativeCertificateChecks.spoofCertificateDigest(bytes, stockCertificateDigest)
        library.writeBytes(bytes)
    }
}

@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof Telegraph signature",
    description = "Restores original signature verification so the app can open after being patched.",
    default = true
) {
    compatibleWith(TelegraphCompatibility.TELEGRAPH)
    extendWith("extensions/extension.mpe")

    dependsOn(spoofNativeCertificateDigestPatch)

    execute {
        spoofSignature(APPLICATION_CLASS, HOST_CLASS)
    }
}
