/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.patcher.Fingerprint
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireLocals
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy

internal const val SIGN_IN_HELP = "$EXTENSION_PACKAGE/misc/SignInHelp;"
private const val OBJECT = "Ljava/lang/Object;"
internal const val SIGN_IN_EXPLAIN = "$SIGN_IN_HELP->explain($OBJECT$OBJECT$OBJECT)Z"
internal const val SIGN_IN_GOOGLE_FAILED = "$SIGN_IN_HELP->googleFailed($OBJECT)V"
private const val GOOGLE_ACCOUNT = "Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;"
private const val LOG_FAILURE = "Lorg/telegram/messenger/FileLog;->e(Ljava/lang/Throwable;)V"
internal const val TL_ERROR = "Lorg/telegram/tgnet/TLRPC\$TL_error;"
internal const val TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"

/** The error texts that only Telegram's general error handler checks for, which keep it apart from any other method. */
internal val PROCESS_ERROR_ANCHORS = setOf("BALANCE_TOO_LOW", "CHANNELS_TOO_MUCH", "PEER_FLOOD")

/**
 * Whether [method] is Telegram's general error handler (AlertsCreator.processError): static, taking
 * the account, the error, the screen, the request and a vararg array, in a renamed UI class.
 */
internal fun isProcessError(method: Method): Boolean {
    val types = method.parameterTypes.map { it.toString() }
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || types.size != 5 || types[0] != "I" || types[1] != TL_ERROR ||
        types[3] != TL_OBJECT || types[4] != "[$OBJECT" || !method.origDefiningClass.startsWith("Lorg/telegram/ui/")
    ) return false
    val strings = method.implementation?.instructions
        ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet().orEmpty()
    return strings.containsAll(PROCESS_ERROR_ANCHORS)
}

/** No access flags here: the handler is varargs too, and a flag list has to match exactly. */
internal object ProcessErrorFingerprint : Fingerprint(
    custom = { method, _ -> isProcessError(method) },
)

/** Asks the extension first, with the error, screen and request; on true the handler returns null at once. */
internal fun MutableMethod.askSignInHelpFirst() {
    requireLocals("Sign-in help", 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p1 .. p3 }, $SIGN_IN_EXPLAIN
            move-result v0
            if-eqz v0, :hush_stock
            const/4 v0, 0x0
            return-object v0
        """,
        ExternalLabel("hush_stock", getInstruction(0)),
    )
}

/**
 * Where a login email screen takes Google's answer: each handler that catches a failure and only logs
 * it. The one instruction after it is where the extension gets told. 13.2's R8 merged the two
 * screens' observers into one class, whose one method now holds both handlers.
 */
internal fun Method.googleFailures(): List<Int> {
    if (name != "didReceivedNotification") return emptyList()
    val code = implementation?.instructions?.toList() ?: return emptyList()
    if (code.none { it.opcode == Opcode.CHECK_CAST && it.controlRef() == GOOGLE_ACCOUNT }) return emptyList()
    return code.indices.filter { at ->
        code[at].opcode == Opcode.MOVE_EXCEPTION && code.getOrNull(at + 1)?.controlRef() == LOG_FAILURE
    }
}

/** Tells the extension about each failed Google sign-in. False when no screen takes one. */
internal fun BytecodePatchContext.sayWhenGoogleFails(): Boolean {
    val found = classDefsMentioning(Mention.type(GOOGLE_ACCOUNT)).flatMap { cls ->
        cls.methods.filter { it.googleFailures().isNotEmpty() }
    }
    for (match in found) {
        val method = tgMutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
        // Last first, so the handlers still to come stay where they were.
        for (at in method.googleFailures().asReversed()) {
            val caught = (method.getInstruction(at) as OneRegisterInstruction).registerA
            method.addInstructions(at + 1, "invoke-static/range {v$caught .. v$caught}, $SIGN_IN_GOOGLE_FAILED")
        }
    }
    return found.isNotEmpty()
}

/**
 * Says why sign-in stopped when Telegram refuses the app's API ID. On Telegram 13 the phone screen
 * names a few sendCode errors and hands the rest to the general error handler, which has no case for
 * sendCode, so API_ID_PUBLISHED_FLOOD left the screen sitting there with nothing said. The handler
 * now asks the extension first; it answers only for API_ID_PUBLISHED_FLOOD and API_ID_INVALID on
 * sendCode and leaves every other error to Telegram. A failed Google sign-in on the login email
 * screen, which Telegram only logs, gets a toast pointing at the email box. Part of HushTelegram
 * settings, which every selection carries, and it doesn't stop patching when a build moves either.
 */
internal val signInHelpPatch = bytecodePatch {
    dependsOn(telegramExtensionPatch)

    execute {
        controlHook(SIGN_IN_HELP, "explain", listOf(OBJECT, OBJECT, OBJECT), "Z")
        controlHook(SIGN_IN_HELP, "googleFailed", listOf(OBJECT), "V")
        if (!sayWhenGoogleFails()) {
            patchLog.warning("Sign-in help: the login email screen's Google answer wasn't found, so a failed " +
                "Google sign-in still shows no message.")
        }
        val handler = ProcessErrorFingerprint.methodOrNull
        if (handler == null || handler.origReturnType.startsWith("[") || !handler.origReturnType.startsWith("L")) {
            patchLog.warning("Sign-in help: Telegram's general error handler wasn't found, so a refused API ID " +
                "still shows no message.")
            return@execute
        }
        handler.askSignInHelpFirst()
    }
}
