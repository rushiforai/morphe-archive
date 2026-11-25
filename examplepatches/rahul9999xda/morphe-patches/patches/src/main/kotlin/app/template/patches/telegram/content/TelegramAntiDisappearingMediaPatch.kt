package app.template.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.Telegram1331MessageObjectIsSecretMediaNormalFingerprint
import app.template.patches.telegram.Telegram1331MessageObjectIsSecretMediaWebFingerprint
import app.template.patches.telegram.TelegramR8MessageObjectIsSecretMediaStaticNormalFingerprint
import app.template.patches.telegram.TelegramR8MessageObjectIsSecretMediaStaticWebFingerprint
import app.template.patches.telegram.TelegramR8MessageObjectIsSecretMediaInstanceNormalFingerprint
import app.template.patches.telegram.TelegramR8MessageObjectIsSecretMediaInstanceWebFingerprint
import app.template.patches.telegram.TelegramR8MessageObjectIsSecretMediaExpiryNormalFingerprint
import app.template.patches.telegram.TelegramR8MessageObjectIsSecretMediaExpiryWebFingerprint
import app.template.patches.telegram.TelegramPlusR8MessageObjectIsSecretMediaStaticFingerprint
import app.template.patches.telegram.TelegramPlus13221R8MessageObjectIsSecretMediaStaticFingerprint
import app.template.patches.telegram.TelegramPlusR8MessageObjectIsSecretMediaInstanceFingerprint
import app.template.patches.telegram.TelegramPlus13221R8MessageObjectIsSecretMediaInstanceFingerprint
import app.template.patches.telegram.TelegramPlusR8MessageObjectIsSecretMediaExpiryFingerprint
import app.template.patches.telegram.TelegramPlus13221R8MessageObjectIsSecretMediaExpiryFingerprint
import app.template.patches.telegram.TelegramR8SecretMediaViewerCloseFingerprint
import app.template.patches.telegram.TelegramPlusR8SecretMediaViewerCloseFingerprint
import app.template.patches.telegram.TelegramPlus13221R8SecretMediaViewerCloseFingerprint

private val isSecretMediaInstanceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = emptyList(),
)

private val isSecretMediaStaticFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)

private val isSecretPhotoOrVideoFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretPhotoOrVideo",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)

private val shouldEncryptPhotoOrVideoFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "shouldEncryptPhotoOrVideo",
    returnType = "Z",
    parameters = listOf("I", "Lorg/telegram/tgnet/TLRPC\$Message;"),
)

private val isVoiceOnceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isVoiceOnce",
    returnType = "Z",
    parameters = emptyList(),
)

private val isRoundOnceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isRoundOnce",
    returnType = "Z",
    parameters = emptyList(),
)

private val needDrawBluredPreviewFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "needDrawBluredPreview",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * The current MessageObject methods are classifiers used by the actual media
 * viewer, not safe expiry kill-switches. m5()/T7() gates opening SecretMediaViewer
 * and l4()/A6() participates in view-once callback setup. Returning false from
 * those methods blocks viewer behavior. Instead, the current R8 patch guards the
 * viewer's close-time Runnable invocation using the current MessageObject's
 * secret-media predicate. It skips only the expiry/delete callback for secret
 * media, clears the callback field normally, and leaves read-state/viewer setup
 * and non-media callbacks untouched.
 */
@Suppress("unused")
val telegramAntiDisappearingMediaPatch = bytecodePatch(
    name = "Anti-disappearing media",
    description = "Keeps secret media in local storage after viewing without disabling Telegram's media viewer or read-state setup.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
    )

    execute {
        val currentR8Methods = listOf(
            Telegram1331MessageObjectIsSecretMediaNormalFingerprint,
            Telegram1331MessageObjectIsSecretMediaWebFingerprint,
            TelegramR8MessageObjectIsSecretMediaStaticNormalFingerprint,
            TelegramR8MessageObjectIsSecretMediaStaticWebFingerprint,
            TelegramR8MessageObjectIsSecretMediaInstanceNormalFingerprint,
            TelegramR8MessageObjectIsSecretMediaInstanceWebFingerprint,
            TelegramR8MessageObjectIsSecretMediaExpiryNormalFingerprint,
            TelegramR8MessageObjectIsSecretMediaExpiryWebFingerprint,
            TelegramPlus13221R8MessageObjectIsSecretMediaStaticFingerprint,
            TelegramPlusR8MessageObjectIsSecretMediaStaticFingerprint,
            TelegramPlus13221R8MessageObjectIsSecretMediaInstanceFingerprint,
            TelegramPlusR8MessageObjectIsSecretMediaInstanceFingerprint,
            TelegramPlus13221R8MessageObjectIsSecretMediaExpiryFingerprint,
            TelegramPlusR8MessageObjectIsSecretMediaExpiryFingerprint,
        ).mapNotNull { it.methodOrNull }

        val legacyMethods = listOf(
            isSecretMediaInstanceFingerprint,
            isSecretMediaStaticFingerprint,
            isSecretPhotoOrVideoFingerprint,
            shouldEncryptPhotoOrVideoFingerprint,
            isVoiceOnceFingerprint,
            isRoundOnceFingerprint,
            needDrawBluredPreviewFingerprint,
        ).mapNotNull { it.methodOrNull }

        val current1331 = currentR8Methods.size == 1 &&
            currentR8Methods.single().name == "m5" &&
            currentR8Methods.single().definingClass in setOf("Lorg/telegram/messenger/jj;", "Lorg/telegram/messenger/fj;")
        require(
            current1331 || (currentR8Methods.size == 3 && legacyMethods.isEmpty()) ||
                (currentR8Methods.isEmpty() && legacyMethods.size == 7)
        ) {
            "Could not uniquely resolve current R8 or complete legacy secret-media classifiers: " +
                "current=${currentR8Methods.size}, legacy=${legacyMethods.size}"
        }

        // Legacy named-class builds do not share the current R8 viewer close
        // layout; retain compatibility without applying an unverified edit.
        if (currentR8Methods.isEmpty()) return@execute

        val closeMethods = listOf(
            // Telegram 13.3.1 uses the same R8 e(ZZ)Z signature as the
            // existing current-R8 fingerprint. Do not register a second,
            // identical fingerprint for the same method.
            TelegramR8SecretMediaViewerCloseFingerprint,
            TelegramPlus13221R8SecretMediaViewerCloseFingerprint,
            TelegramPlusR8SecretMediaViewerCloseFingerprint,
        ).mapNotNull { it.methodOrNull }
        require(closeMethods.size == 1) {
            "Expected exactly one current R8 SecretMediaViewer close method, found ${closeMethods.size}"
        }
        val closeMethod = closeMethods.single()
        val instructions = requireNotNull(closeMethod.implementation) {
            "SecretMediaViewer close method has no implementation"
        }.instructions.toList()
        val runIndexes = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Ljava/lang/Runnable;" &&
                reference.name == "run" && reference.parameterTypes.isEmpty() && reference.returnType == "V"
        }

        val messageClassifier = if (current1331) currentR8Methods.single()
            else currentR8Methods.first { it.name == "l4" || it.name == "A6" }
        val plusClassifier = messageClassifier.definingClass in setOf("Lorg/telegram/messenger/x20;", "Lorg/telegram/messenger/z20;")
        // n0 is the animation/transition completion callback in 13.3.1.
        // The one-shot close callback remains o1 in both current and legacy
        // Android/Web builds; selecting n0 also sees a second Runnable.run().
        val callbackFieldName = "o1"
        val callbackIndex = if (plusClassifier) {
            require(runIndexes.size == 1) {
                "Expected one Plus close-time Runnable.run() callback, found ${runIndexes.size}"
            }
            runIndexes.single()
        } else {
            val callbackFieldIndexes = instructions.indices.filter { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference as? FieldReference
                val registers = instructions[index] as? TwoRegisterInstruction
                instructions[index].opcode == Opcode.IGET_OBJECT && registers?.registerA == 1 &&
                    reference?.definingClass == "Lorg/telegram/ui/SecretMediaViewer;" &&
                    reference.name == callbackFieldName && reference.type == "Ljava/lang/Runnable;"
            }
            require(callbackFieldIndexes.size == 1) {
                "Expected one SecretMediaViewer.o1 close-callback read, found ${callbackFieldIndexes.size}"
            }
            val callbackFieldIndex = callbackFieldIndexes.single()
            val callbackReceiverRegister =
                (instructions[callbackFieldIndex] as TwoRegisterInstruction).registerA
            val closeCallbackRuns = runIndexes.filter { index ->
                val instruction = instructions[index]
                val receiver = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerC.takeIf { instruction.registerCount > 0 }
                    is RegisterRangeInstruction -> instruction.startRegister.takeIf { instruction.registerCount > 0 }
                    else -> null
                }
                index > callbackFieldIndex && receiver == callbackReceiverRegister
            }
            require(closeCallbackRuns.size == 1) {
                "Expected exactly one close callback Runnable.run() using the active callback register, found ${closeCallbackRuns.size}"
            }
            closeCallbackRuns.single()
        }
        require(callbackIndex in runIndexes) { "Resolved callback index is not a Runnable.run() call" }

        val replacement = if (plusClassifier) {
            // Plus synthetic close animation receives the active MessageObject as p2.
            """
                if-eqz p1, :morphe_skip_expiry_callback
                if-eqz p2, :morphe_run_expiry_callback
                invoke-virtual {p2}, ${messageClassifier.definingClass}->A6()Z
                move-result v2
                if-nez v2, :morphe_skip_expiry_callback
                :morphe_run_expiry_callback
                invoke-interface {p1}, Ljava/lang/Runnable;->run()V
                :morphe_skip_expiry_callback
            """.trimIndent()
        } else {
            val messageClass = messageClassifier.definingClass
            val classifierName = messageClassifier.name
            """
                iget-object v2, v0, Lorg/telegram/ui/SecretMediaViewer;->g0:${messageClass}
                if-eqz v2, :morphe_run_expiry_callback
                invoke-virtual {v2}, ${messageClass}->${classifierName}()Z
                move-result v2
                if-nez v2, :morphe_skip_expiry_callback
                :morphe_run_expiry_callback
                invoke-interface {v1}, Ljava/lang/Runnable;->run()V
                :morphe_skip_expiry_callback
            """.trimIndent()
        }
        // Secret-media callback is skipped, but the surrounding close method
        // still clears the callback field and completes the viewer lifecycle normally.
        closeMethod.replaceInstruction(callbackIndex, replacement)
    }
}
