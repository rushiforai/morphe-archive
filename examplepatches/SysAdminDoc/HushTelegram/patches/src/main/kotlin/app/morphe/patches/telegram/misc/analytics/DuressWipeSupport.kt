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
import app.morphe.patches.telegram.misc.folders.APP_PASSCODE
import app.morphe.patches.telegram.misc.folders.CHECK_PASSCODE
import app.morphe.patches.telegram.misc.folders.PASSCODE_HASH
import app.morphe.patches.telegram.misc.folders.PASSCODE_TYPE
import app.morphe.patches.telegram.misc.folders.writeAppPasscodeStubs
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val DURESS_WIPE = "$EXTENSION_PACKAGE/misc/DuressWipe;"
internal const val DURESS_ENTER = "$DURESS_WIPE->enter(Ljava/lang/String;)V"
internal const val DURESS_AFTER_CHECK = "$DURESS_WIPE->afterCheck(I)Z"
private const val DURESS_LOG_OUT = "Lorg/telegram/messenger/MessagesController;"
private const val DURESS_FOLDERS = "Lorg/telegram/messenger/FileLoader;"

/**
 * Telegram's passcode check, with each of its returns: the index and the register it returns.
 * Telegram reuses the typed-passcode register inside the method, so the code is handed over at
 * the start and the answer before every return.
 */
internal class DuressWipeSite(val method: MutableMethod, val returns: List<Pair<Int, Int>>) {
    fun apply() {
        // From the last return up, so each index still names its return. At the return's label,
        // so a branch that lands on the return runs the hook too.
        for ((index, register) in returns.sortedByDescending { it.first }) {
            method.addInstructionsAtControlFlowLabel(index,
                "invoke-static/range {v$register .. v$register}, $DURESS_AFTER_CHECK\n" +
                    "move-result v$register")
        }
        method.addInstructions(0, "invoke-static/range {p0 .. p0}, $DURESS_ENTER")
    }
}

/**
 * Duress passcode's target (#79): SharedConfig.checkPasscode, which every place Telegram asks for
 * its passcode goes through, the lock screen included. The settings row reads Telegram's passcode
 * through the hidden chats' stubs, and the wipe calls Telegram's own log-out and folders by
 * reflection, so those are checked here as well; any of them missing leaves the switch out.
 */
internal fun BytecodePatchContext.resolveDuressWipe(): DuressWipeSite {
    controlHook(APP_PASSCODE, "passcodeSet", emptyList(), "Z")
    controlHook(APP_PASSCODE, "passcodePin", emptyList(), "Z")
    controlHook(APP_PASSCODE, "passcodeMatches", listOf("Ljava/lang/String;"), "Z")
    requireReachable(PASSCODE_HASH, true)
    requireReachable(PASSCODE_TYPE, true)
    requireReachable(CHECK_PASSCODE, true)
    controlMembers(DURESS_LOG_OUT, "static getInstance(I)$DURESS_LOG_OUT", "performLogout(I)V")
    controlMembers(DURESS_FOLDERS, "static getDirectory(I)Ljava/io/File;")

    val config = tgMutableClassDefByOrNull(CHECK_PASSCODE.substringBefore("->"))
        ?: throw PatchException("SharedConfig is missing")
    val method = config.methods.singleOrNull {
        it.origName == "checkPasscode" && it.origParameterTypes == listOf("Ljava/lang/String;") &&
            it.origReturnType == "Z" && AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    } ?: throw PatchException("Telegram's passcode check is missing")
    val body = method.controlBody()
    val returns = body.withIndex().filter { (_, it) -> it.opcode == Opcode.RETURN }
        .map { (index, it) -> index to (it as OneRegisterInstruction).registerA }
    if (returns.isEmpty() || body.any { it.opcode in listOf(Opcode.RETURN_VOID, Opcode.RETURN_OBJECT, Opcode.RETURN_WIDE) }) {
        throw PatchException("Telegram's passcode check no longer returns a plain yes or no")
    }
    return DuressWipeSite(method, returns)
}

/** Hooks every return of Telegram's passcode check and writes the stubs the settings row reads. */
internal fun BytecodePatchContext.applyDuressWipe(site: DuressWipeSite) {
    site.apply()
    writeAppPasscodeStubs()
}
