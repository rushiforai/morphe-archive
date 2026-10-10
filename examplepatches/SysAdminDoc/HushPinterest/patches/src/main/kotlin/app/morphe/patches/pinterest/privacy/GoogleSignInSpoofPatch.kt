/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import java.security.MessageDigest
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val PATCH = "Spoof signature for Google sign-in"

/** The application meta-data microG-RE reads: the SHA-1 of the certificate to show Google. */
internal const val SPOOFED_SIGNATURE_METADATA = "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE"

/** The application meta-data signature spoofing modules such as XSpoofSignatures read: the certificate itself. */
internal const val FAKE_SIGNATURE_METADATA = "fake-signature"

/** SHA-1 of Pinterest's own signing certificate, the one the declared build is signed with. */
internal const val PINTEREST_CERTIFICATE_SHA1 = "b6a74dbcb894b0f73d8c485c72eb1247a8f027ca"

/**
 * Pinterest's own signing certificate (CN=Carl Rice, OU=Android, O=Pinterest Inc), DER encoded,
 * as lowercase hex. Copied from the v2 and v3 signing blocks of the declared build, and checked
 * against them by GoogleSignInSpoofManifestTest.
 */
internal const val PINTEREST_CERTIFICATE_DER =
    "3082024f308201b8a00302010202044f96d518300d06092a864886f70d0101050500306c310b3009060355040613" +
        "025553310b3009060355040813024341311230100603550407130950616c6f20416c746f31163014060355040a" +
        "130d50696e74657265737420496e633110300e060355040b1307416e64726f696431123010060355040313094361" +
        "726c2052696365301e170d3132303432343136333031365a170d3337303431383136333031365a306c310b300906" +
        "0355040613025553310b3009060355040813024341311230100603550407130950616c6f20416c746f3116301406" +
        "0355040a130d50696e74657265737420496e633110300e060355040b1307416e64726f6964311230100603550403" +
        "13094361726c205269636530819f300d06092a864886f70d010101050003818d0030818902818100bd8b325a2eb8" +
        "ade0e16e44971e75130ec98f2c37c8a477044382a1c5c18aa3078bede3c1a49776441617f3bb6711d1a7d764785e" +
        "a20bf8c694d78fdc82d575f88f340fc87b948558385636f80dba536481a9c8bf03505781adbbca1ef65b2f59281c" +
        "a92e352d9f685d04024c19cb3b4e3e14e6eb69ca113e55b55d766ea860170203010001300d06092a864886f70d01" +
        "01050500038181009e6766c1071e383b75c520221b502e4701d7a110933a9fe7e7417679be71581ad24a09c42bb5" +
        "190acfb7e487969f843a634eac015424adc4380cdc0eb21b47616b4459f11a018b4f5185bfb75764d95c1d8bd01c" +
        "21932911578a3406caf8d317bc65f2d4d5caef1b59e59ed695e235a672460b2ccff2d0a8f3c3b2604c599714"

/** The two application meta-data entries the patch adds, in the order it adds them. */
internal val SIGNATURE_SPOOF_METADATA: Map<String, String> = linkedMapOf(
    SPOOFED_SIGNATURE_METADATA to PINTEREST_CERTIFICATE_SHA1,
    FAKE_SIGNATURE_METADATA to PINTEREST_CERTIFICATE_DER,
)

/** Lowercase hex SHA-1 of [hex] read as bytes. */
internal fun sha1OfHex(hex: String): String {
    require(hex.length % 2 == 0 && hex.all { it in '0'..'9' || it in 'a'..'f' }) { "not lowercase hex" }
    val bytes = ByteArray(hex.length / 2) { hex.substring(it * 2, it * 2 + 2).toInt(16).toByte() }
    return MessageDigest.getInstance("SHA-1").digest(bytes).joinToString("") { "%02x".format(it) }
}

/**
 * Adds both [SIGNATURE_SPOOF_METADATA] entries to the application. The certificate has to hash to
 * the SHA-1 beside it, and a manifest that already names either key refuses, so nothing a
 * signature module reads is ever written twice or left half changed. The FAKE_PACKAGE_SIGNATURE
 * permission is left out of the manifest: where something else already defines it, a second
 * definition from another signer makes Android refuse the install as a duplicate permission.
 */
internal fun addSignatureSpoofMetadata(document: Document) {
    if (sha1OfHex(PINTEREST_CERTIFICATE_DER) != PINTEREST_CERTIFICATE_SHA1) {
        throw PatchException("$PATCH: the certificate doesn't match its SHA-1")
    }
    val application = document.getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("$PATCH: AndroidManifest.xml has no application element")
    val declared = application.childNodes.let { nodes -> (0 until nodes.length).mapNotNull { nodes.item(it) as? Element } }
        .filter { it.tagName == "meta-data" }.map { it.getAttribute("android:name") }
    SIGNATURE_SPOOF_METADATA.keys.firstOrNull { it in declared }?.let {
        throw PatchException("$PATCH: AndroidManifest.xml already declares $it")
    }
    for ((name, value) in SIGNATURE_SPOOF_METADATA) {
        application.appendChild(document.createElement("meta-data").apply {
            setAttribute("android:name", name)
            setAttribute("android:value", value)
        })
    }
}

/** Checks the status flag first, so a broken extension refuses before the manifest is changed. */
internal val signatureSpoofPreflightPatch = bytecodePatch {
    dependsOn(settingsPatch, pinterestExtensionPatch)
    execute { requireStatusMethod("spoofSignature") }
}

internal val signatureSpoofManifestPatch = resourcePatch {
    dependsOn(signatureSpoofPreflightPatch)
    execute { document("AndroidManifest.xml").use(::addSignatureSpoofMetadata) }
}

@Suppress("unused")
val googleSignInSpoofPatch = bytecodePatch(
    name = PATCH,
    description = "Helps Google sign-in work in the patched app by naming Pinterest's original signature. It only " +
        "helps with microG-RE or the XSpoofSignatures module. Email sign-in doesn't need it. It isn't " +
        "selected by default. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch, pinterestExtensionPatch, signatureSpoofManifestPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        enableStatus("spoofSignature")
    }
}
