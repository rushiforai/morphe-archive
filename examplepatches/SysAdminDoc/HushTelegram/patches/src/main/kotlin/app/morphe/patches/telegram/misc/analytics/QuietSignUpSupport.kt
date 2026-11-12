/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val QUIET_SIGN_UP = "$EXTENSION_PACKAGE/misc/QuietSignUp;"
internal const val QUIET_SIGN_UP_HOOK = "$QUIET_SIGN_UP->noJoinedNotifications(I)Z"
internal const val SIGN_UP = "Lorg/telegram/tgnet/TLRPC\$TL_auth_signUp;"
internal const val NO_JOINED_NOTIFICATIONS = "$SIGN_UP->no_joined_notifications:Z"

/** The sign-up request's one read of its quiet flag: the method, the read's index and its register. */
internal class QuietSignUpSite(val method: MutableMethod, val index: Int, val register: Int) {
    /**
     * Passes the flag through the extension right after it loads, before it goes into the request's
     * flags and the field's own value goes nowhere else. Inserted ahead of the next instruction
     * rather than at its label, so a branch that lands there skips the hook.
     */
    fun apply() {
        method.addInstructions(index + 1,
            "invoke-static/range {v$register .. v$register}, $QUIET_SIGN_UP_HOOK\n" +
                "move-result v$register")
    }
}

/**
 * Don't notify contacts' target (#71): TL_auth_signUp.serializeToStream, which folds
 * no_joined_notifications into the request's flags as it writes them. Telegram's own names are kept
 * on its TL classes, so the request and its field are found by name.
 */
internal fun BytecodePatchContext.resolveQuietSignUp(): QuietSignUpSite {
    val owner = tgMutableClassDefByOrNull(SIGN_UP) ?: throw PatchException("the sign-up request is missing")
    val method = owner.methods.singleOrNull { it.origName == "serializeToStream" && it.origReturnType == "V" &&
        it.parameterTypes.size == 1 && it.implementation != null && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("the sign-up request no longer writes itself out")
    val reads = method.controlBody().withIndex()
        .filter { (_, it) -> it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == NO_JOINED_NOTIFICATIONS }
    if (reads.size != 1) throw PatchException("the sign-up request reads its quiet flag ${reads.size} times, not once")
    val (index, read) = reads.single()
    return QuietSignUpSite(method, index, (read as OneRegisterInstruction).registerA)
}
