/*
 * NothingX Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.nothingx.misc.logk1token

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/nothingx/patches/ShowK1TokensPatch;" // keywatch:ignore
private const val ON_KEYCHAIN_ENTRY =
    "$EXTENSION_CLASS_DESCRIPTOR->onKeychainEntry(Ljava/lang/String;Ljava/lang/String;)V"

/**
 * Shows the K1 authentication token, which Gadgetbridge needs to pair the first CMF Watch Pro.
 *
 * The first generation CMF Watch Pro (D395) cannot negotiate its K1 key during pairing,
 * so the key has to come from the official Nothing X app. The app writes the key to its
 * own database and log files, never to logcat, and those files are private, so the token
 * is read inside the app process and shown in a dialog.
 *
 * On Nothing X 3.8.0 the app keeps the key in EncryptedSharedPreferences, which the file
 * and database scans cannot read, so the patch also hooks the flutter_secure_storage
 * plugin and captures the plaintext value as the app writes or reads it.
 *
 * Newer models negotiate the key themselves and need nothing from this patch.
 *
 * Equivalent smali (verified against 3.8.0):
 *
 *     invoke-static { p0 }, Lapp/morphe/extension/nothingx/patches/ShowK1TokensPatch;->showK1Tokens(Landroid/content/Context;)V keywatch:ignore
 */
@Suppress("unused")
val showK1TokensPatch = bytecodePatch(
    name = "Show K1 token(s)",
    description = "Shows the K1 authentication token(s) in a dialog and logs it to logcat for pairing with GadgetBridge without requiring root access.",
) {
    compatibleWith("com.nothing.smartcenter")
    extendWith("extensions/nothingx.mpe")

    execute {
        ApplicationOnCreateMethodFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->showK1Tokens(Landroid/content/Context;)V",
        )

        val writeMethod = FlutterSecureStorageWriteMethodFingerprint.methodOrNull
            ?: throw IllegalStateException(
                "FlutterSecureStorage.write(Ljava/lang/String;Ljava/lang/String;)V did not match. " +
                    "The flutter_secure_storage plugin changed.",
            )
        writeMethod.addInstruction(0, "invoke-static {p1, p2}, $ON_KEYCHAIN_ENTRY")

        val readMethod = FlutterSecureStorageReadMethodFingerprint.methodOrNull
            ?: throw IllegalStateException(
                "FlutterSecureStorage.read(Ljava/lang/String;)Ljava/lang/String; did not match. " +
                    "The flutter_secure_storage plugin changed.",
            )
        readMethod.injectOnKeychainEntryBeforeReturns()
    }
}

/**
 * Passes every decrypted value to `onKeychainEntry` right before it is returned.
 *
 * The plugin decrypts the value into the returned register, so the value is only
 * readable at the return. Later returns are patched first, so the earlier
 * instruction indices stay valid.
 */
private fun MutableMethod.injectOnKeychainEntryBeforeReturns() {
    val body = implementation ?: throw IllegalStateException(
        "FlutterSecureStorage.read has no body to patch.",
    )

    val returns = body.instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, instruction) -> index to (instruction as OneRegisterInstruction).registerA }

    returns.sortedByDescending { it.first }.forEach { (index, register) ->
        addInstruction(index, "invoke-static {p1, v$register}, $ON_KEYCHAIN_ENTRY")
    }
}
