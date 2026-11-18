// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.integrity

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * The signing certificate of the store build, base64 encoded.
 *
 * This is public data taken from the stock APK, not a secret: every installation
 * carries it, and its SHA-256 is the value [AnghamiApp] uses to recognise the
 * stock build. A unit test decodes it and compares the digest, so a corrupted
 * literal fails the build instead of producing requests the server refuses.
 */
internal const val STOCK_CERTIFICATE_BASE64 =
    "MIIDSjCCAjKgAwIBAgIEUH/rrjANBgkqhkiG9w0BAQUFADBnMQswCQYDVQQGEwJM" +
        "QjEQMA4GA1UECBMHVW5rbm93bjEQMA4GA1UEBxMHVW5rbm93bjEQMA4GA1UEChMH" +
        "QW5naGFtaTEQMA4GA1UECxMHVW5rbm93bjEQMA4GA1UEAxMHVW5rbm93bjAeFw0x" +
        "MjEwMTgxMTQ0NDZaFw00MDAzMDUxMTQ0NDZaMGcxCzAJBgNVBAYTAkxCMRAwDgYD" +
        "VQQIEwdVbmtub3duMRAwDgYDVQQHEwdVbmtub3duMRAwDgYDVQQKEwdBbmdoYW1p" +
        "MRAwDgYDVQQLEwdVbmtub3duMRAwDgYDVQQDEwdVbmtub3duMIIBIjANBgkqhkiG" +
        "9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu/RpDhkZgcxSq5zzULLFnTR17VK7KdUhDdKu" +
        "t0S1SC7E9BN1tzQ3fg8JrvSUHcdgyZWJXbUeXFjuxkgTfGjhTiuXVdid06GGPlNY" +
        "3kOZ8MdFJ+oNKXojn3e0yKnpleCXm+Q8qo1g58tv/GwyFE5pANv/hKVi0NhNjilp" +
        "nKPiylqcNAmAyAU9QlZ2eqYl8aPy4PdLG/GYpR/sqATNWQMHrnXMkAi+OaZxejHb" +
        "hs/ivSUoNMVtG2e5gMWrJ3Zu0cQblPoP+UsgFGVHhp14+twJIkRFcXEvjBAJnBfu" +
        "GAOR7t8S1r+lO610SYj9N5Z/dEXSEAcIZ17hTQmPegJxtXlNHwIDAQABMA0GCSqG" +
        "SIb3DQEBBQUAA4IBAQCqtazGb00a96vlHAgcHDjWb4lKDBn2UNozoVs0JXNr7kzk" +
        "9O65caipjRMTJW37GfWh2QU9KwXObKBDonuThAM1vBXjok/amc9hn2jyJPNWVVmN" +
        "8AdhKQMVx1q1TK6nD2k5Eb23RlHGrftGtesmxYFrF23QjSksLl+dvSLOpQt1SQnd" +
        "/h8UjQhxgQ8DiFQziamoMg7Oku/SA1KrG6Vvx09Eif+EBAiO8Id9ql0K7OzeKrxV" +
        "8CByRoJjnYnSFbW6+h1cOSr9Yg0tTGAq0CPVkXLGtRAQCjUa14mw7goHDtOn0ACT" +
        "HtYOnOCfBfG+yYkKFV9TSzkkzkFiB30CgaohZsMs"

/** The field that holds the installed application's signers. */
private const val SIGNERS_FIELD =
    "Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;"

/** The call that extracts the certificate bytes from the first signer. */
private const val CERTIFICATE_BYTES_CALL = "Landroid/content/pm/Signature;->toByteArray()[B"

/** The call that feeds those bytes to the digest. */
private const val DIGEST_UPDATE_CALL = "Ljava/security/MessageDigest;->update([B)V"

/**
 * The only method that derives a request value from the installed signature.
 *
 * It reads the first signer, hashes it, appends the per-request salt and hashes
 * the request body on top. Both request headers that carry a signature come from
 * this one answer, so it is the narrowest place to supply the stock certificate.
 */
private object RequestSignatureFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/utils/SignatureUtils;",
    name = "getAppSignature",
    isStatic = true,
    returnType = "Ljava/lang/String;",
    parameters = listOf(
        "Ljava/lang/String;",
        "[B",
    ),
)

/**
 * Replaces the certificate byte read with the stock certificate.
 *
 * The call that follows the first signer read is what turns the signer into the
 * bytes that are hashed. Answering it with the stock certificate leaves the rest
 * of the derivation — the salt, the request body, the hex encoding — running
 * exactly as written, so the value produced for a given request is the value the
 * stock build produces.
 *
 * The replacement writes its result into the same register the original call's
 * result was moved into, and uses one local that the method does not read again
 * before writing it, so the surrounding code is untouched.
 */
private fun MutableMethod.useStockCertificateBytes() {
    val signersRead = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IGET_OBJECT &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == SIGNERS_FIELD
    }

    check(signersRead >= 0) {
        "No signer read in $definingClass->$name$returnType; the code changed."
    }

    val certificateRead = (signersRead until instructions.size).firstOrNull { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == CERTIFICATE_BYTES_CALL
    }

    checkNotNull(certificateRead) {
        "No certificate read after the signer read in " +
            "$definingClass->$name$returnType; the code changed."
    }

    val result = instructions[certificateRead + 1]
    check(result.opcode == Opcode.MOVE_RESULT_OBJECT) {
        "The certificate read is not followed by its result move in " +
            "$definingClass->$name$returnType; the code changed."
    }
    val destination = (result as OneRegisterInstruction).registerA

    val parameterRegisters = parameterTypes.sumOf { type ->
        when (type.firstOrNull()) {
            'J', 'D' -> 2
            else -> 1
        }
    }
    val locals = checkNotNull(implementation) {
        "$definingClass->$name has no implementation to inspect."
    }.registerCount - parameterRegisters

    val scratch = (0 until locals).lastOrNull { it != destination }
    checkNotNull(scratch) {
        "$definingClass->$name has no second local register for the decode flag."
    }

    val replacement = """
        const-string v$destination, "$STOCK_CERTIFICATE_BASE64"
        const/4 v$scratch, 0x0
        invoke-static {v$destination, v$scratch}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    """.trimIndent()
    val inserted = replacement.lines().count { line -> line.isNotBlank() }

    // Insert before the certificate read, so the result move that follows takes
    // the decoded bytes, then remove the read itself. The framework's
    // replaceInstructions removes as many instructions as it inserts, which here
    // would swallow the result move and the digest update along with the read.
    addInstructions(certificateRead, replacement)
    removeInstruction(certificateRead + inserted)

    // Check the shape the derivation depends on: the result move must take the
    // decoded bytes, and the digest must still be updated with them. A silent
    // slip here produces a well-formed method that signs the wrong data, which
    // the compile step cannot catch.
    val patched = instructions
    check(patched[certificateRead + inserted].opcode == Opcode.MOVE_RESULT_OBJECT) {
        "The certificate read is not followed by its result move in " +
            "$definingClass->$name$returnType; the code changed."
    }
    val update = patched[certificateRead + inserted + 1]
    check(
        update.opcode == Opcode.INVOKE_VIRTUAL &&
            (update as? ReferenceInstruction)?.reference?.toString() == DIGEST_UPDATE_CALL,
    ) {
        "The certificate bytes are not fed to the digest in " +
            "$definingClass->$name$returnType; the code changed."
    }
}

/**
 * Keeps the signature claim in outgoing requests identical to the store build's.
 *
 * The application signs requests with a value derived from its own signing
 * certificate. A repackaged build is signed with a different key, so the derived
 * value changes and the server can tell the two apart. This patch supplies the
 * stock certificate to that derivation, so the value matches while the installed
 * application stays repackaged.
 *
 * This is the only behaviour in the bundle that asserts an identity claim to a
 * remote service, and it is the only one that presents a value the installed
 * application does not actually have. Everything else here changes local
 * decisions; this changes what a server is told. It is documented as such, and it
 * is rated high risk.
 *
 * Nothing else about the request changes: the salt, the body, the headers and the
 * transport are untouched, and the certificate is not used anywhere else in the
 * build.
 */
@Suppress("unused")
val stockSignatureAssertionPatch = bytecodePatch(
    name = "Stock signature assertion",
    description = "Derives the request signature from the store build's certificate instead of the installed one.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.ENTITLEMENT.label)

    execute {
        RequestSignatureFingerprint.method.useStockCertificateBytes()
    }
}
