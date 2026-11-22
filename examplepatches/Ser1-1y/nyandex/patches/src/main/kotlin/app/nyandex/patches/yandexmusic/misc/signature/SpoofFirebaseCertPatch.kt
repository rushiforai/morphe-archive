/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicFirebaseCert")

private const val HEADER_NAME = "X-Android-Cert"

/**
 * SHA-1 of the stock Yandex Music signing certificate.
 *
 * The value is public and is also embedded in the stock APK (RelayService uses the
 * SHA-256 form for its binder authentication). It is not a secret.
 */
private const val STOCK_CERT_SHA1 = "5D224274D9377C35DA777AD934C65C8CCA6E7A20"

/**
 * Firebase Installations builds its request headers in a method that contains the
 * `X-Android-Cert` literal and calls `URLConnection.addRequestProperty`. The defining
 * class is `Lfod;` in 2026.11.1 and `Lh4e;` in 2026.11.2, so match the code shape
 * instead of the obfuscated name.
 */
private object FirebaseCertificateHeaderFingerprint : Fingerprint(
    returnType = "Ljava/net/HttpURLConnection;",
    filters = listOf(
        string(HEADER_NAME),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ljava/net/URLConnection;",
            name = "addRequestProperty",
        ),
    ),
)

/**
 * Firebase Installations sends the signing certificate of the calling app in the
 * `X-Android-Cert` header. After Morphe re-signs the APK that value no longer matches
 * the certificate the Firebase project was registered with, so Firebase requests are
 * rejected. Reporting the stock fingerprint keeps Firebase Installations working.
 *
 * This does not replace the global PackageManager signature spoofing of the original
 * mod; it only fixes the documented Firebase header.
 */
val spoofFirebaseCertPatch = patch(
    name = "Подменить заголовок сертификата Firebase",
    description = "Передаёт сертификат оригинального приложения в заголовке X-Android-Cert, который " +
        "использует Firebase Installations, чтобы переподпись APK не ломала Firebase.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        val match = FirebaseCertificateHeaderFingerprint.match()
        val method = match.method

        val instructions = method.instructions.toList()
        val headerIndex = instructions.indexOfFirst { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                ?.string == HEADER_NAME
        }
        if (headerIndex < 0) {
            throw PatchException("$HEADER_NAME header was not found")
        }

        val addPropertyIndex = (headerIndex + 1 until instructions.size).firstOrNull { index ->
            val instruction = instructions[index]
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                reference?.definingClass == "Ljava/net/URLConnection;" &&
                reference.name == "addRequestProperty"
        } ?: throw PatchException("addRequestProperty call for $HEADER_NAME was not found")

        val call = instructions[addPropertyIndex] as? FiveRegisterInstruction
            ?: throw PatchException("Unexpected $HEADER_NAME invoke format")
        if (call.registerCount < 3) {
            throw PatchException("Unexpected $HEADER_NAME invoke argument count")
        }

        // Third argument of URLConnection.addRequestProperty(String, String).
        // FiveRegisterInstruction letters follow the smali register list order:
        // C = connection, D = header name, E = fingerprint.
        val certificateRegister = call.registerE
        method.addInstructions(
            addPropertyIndex,
            "const-string/jumbo v$certificateRegister, \"$STOCK_CERT_SHA1\"",
        )

        logger.info(
            "Reported the stock certificate in the $HEADER_NAME header " +
                "(${match.classDef.type}->${method.name})",
        )
    }
}
