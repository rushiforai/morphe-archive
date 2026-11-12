package app.zdrgon.patches.pikaspot.misc

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.pikaspot.shared.Constants.COMPATIBILITY_PIKASPOT
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

// Must match the class in the extensions module.
private const val SPOOF_CLASS = "Lapp/template/extension/pikaspot/AdvertiseSpoof;"

/**
 * Pika Spot — Spoof app signature.
 *
 * The first thing the loading screen does is a device login
 * (POST /auth/android/device) whose request body carries a device
 * bean built by xf/b.a(). The bean's "advertise" field is a token
 * from the native SignatureUtils.getSignature: a timestamp, an
 * AES-encrypted "androidId:timestamp:random" segment, and the
 * SHA1 of the APK signing certificate, "#"-joined (full algorithm
 * in Fingerprints.kt and in the extension class). The backend
 * validates that SHA1 against the stock signing certificate, so
 * ANY re-signed build is rejected at the login — Morphe's build
 * included, with or without the other patches — and the client
 * maps the rejection to its generic network-error dialog: the
 * loading screen stops at 30% with "Can not connect to server,
 * please check network configuration", on phone and emulator,
 * with nothing in logcat (the request is well-formed; the answer
 * is simply "no").
 *
 * Fix, at the single production point: SignatureUtils has exactly
 * one caller in the app, the device-param builder. This patch
 * swaps that one invoke-virtual for an invoke-static to the
 * extension's AdvertiseSpoof.getSignature, which runs the
 * identical algorithm (same timestamp source, same AES key/IV
 * derivation, same Base64 flavour) with the stock certificate's
 * SHA1 pinned — the value is a public constant of the stock APK,
 * harvested from its signature block. The token a patched build
 * sends is then indistinguishable from a genuine install's, and
 * the device login succeeds. The native library and method are
 * left untouched; the native path simply becomes unreachable.
 */
@Suppress("unused")
val spoofAppSignaturePatch = bytecodePatch(
    name = "Spoof app signature",
    description = "Fixes the 'Can not connect to server' stop at 30% on launch: the app's first server login carries a token derived from the APK signing certificate, and a re-signed build computes it from the wrong certificate, so the server rejects the login. Recomputes the token with the stock signing certificate. Needs the stock Pika! Spot 1.4.5 XAPK.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PIKASPOT)

    // Merge the extension DEX (AdvertiseSpoof) into the patched app.
    extendWith("extensions/extension.mpe")

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val method = DeviceParamFingerprint.method
        val insns = method.instructionsOrNull?.toList()
            ?: throw PatchException("Pika Spot: device-param builder has no instructions to patch.")

        val index = insns.indexOfFirst { insn ->
            if (insn.opcode != Opcode.INVOKE_VIRTUAL) return@indexOfFirst false
            val reference = insn.getReference<MethodReference>() ?: return@indexOfFirst false
            reference.definingClass == "Lcom/pika/dynamicisland/utils/SignatureUtils;" &&
                reference.name == "getSignature"
        }
        if (index < 0) {
            throw PatchException("Pika Spot: SignatureUtils.getSignature call site not found in this version.")
        }

        // invoke-virtual {vC = SignatureUtils.a, vD = context, vE = androidId}
        // becomes a static call on the same two argument registers;
        // the sget-object that loaded SignatureUtils.a is left as
        // dead code, and the following move-result-object consumes
        // the extension's return value unchanged.
        val invoke = insns[index] as Instruction35c
        method.replaceInstruction(
            index,
            "invoke-static {v${invoke.registerD}, v${invoke.registerE}}, " +
                "$SPOOF_CLASS->getSignature(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;"
        )
        logger.info("Pika Spot: advertise token spoofed — device login now presents the stock signing certificate.")
    }
}
