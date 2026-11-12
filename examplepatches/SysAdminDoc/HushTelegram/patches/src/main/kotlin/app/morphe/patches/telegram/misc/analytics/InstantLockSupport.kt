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
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val INSTANT_LOCK = "$EXTENSION_PACKAGE/misc/InstantLock;"
internal const val INSTANT_LOCK_HOOK = "$INSTANT_LOCK->autoLockIn(I)I"
internal const val AUTO_LOCK_IN = "Lorg/telegram/messenger/SharedConfig;->autoLockIn:I"
internal const val LAST_PAUSE_TIME = "Lorg/telegram/messenger/SharedConfig;->lastPauseTime:I"
private const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
private const val ANDROID_UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
internal const val LAUNCH_ACTIVITY = "Lorg/telegram/ui/LaunchActivity;"

/** One read of the Auto-lock delay: the instruction's index and the register it loads. */
internal class AutoLockRead(val index: Int, val register: Int)

/** A lock check and its reads of the Auto-lock delay, in order. */
internal class InstantLockCheck(val method: MutableMethod, val reads: List<AutoLockRead>) {
    /**
     * Passes each read through the extension right after it loads. Inserted ahead of the next
     * instruction rather than at its label, so a branch that lands there with some other value in
     * the register skips the hook.
     */
    fun apply() {
        for (read in reads.sortedByDescending { it.index }) {
            method.addInstructions(read.index + 1,
                "invoke-static/range {v${read.register} .. v${read.register}}, $INSTANT_LOCK_HOOK\n" +
                    "move-result v${read.register}")
        }
    }
}

/**
 * Instant lock's targets (#71). A lock check is a method outside SharedConfig that reads the
 * Auto-lock delay and also reads or sets the time the app last went to the background:
 * AndroidUtilities.needShowPasscode, which decides on the way back in, LaunchActivity's pause
 * handler, which starts the timer that locks while the app is away, the same pair inlined into the
 * bubble and share screens' onPause, and the media service's own copy of the check. What only shows
 * the delay (the passcode screen and its picker) or stores it (SharedConfig) never reads the pause
 * time, so it keeps the user's choice.
 *
 * The first two are required: without them the switch would do nothing. The rest are hooked where
 * the build has them.
 */
internal fun BytecodePatchContext.resolveInstantLock(): List<InstantLockCheck> {
    val checks = mutableListOf<InstantLockCheck>()
    for (classDef in classDefsMentioning(Mention.reference(AUTO_LOCK_IN) and Mention.reference(LAST_PAUSE_TIME))) {
        if (classDef.origType == SHARED_CONFIG) continue
        val readers = classDef.methods.filter { method ->
            val body = method.controlBody()
            body.any { it.opcode == Opcode.SGET && it.controlRef() == AUTO_LOCK_IN } &&
                body.any { it.controlRef() == LAST_PAUSE_TIME }
        }
        if (readers.isEmpty()) continue
        val owner = tgMutableClassDefBy(classDef)
        for (reader in readers) {
            val method = owner.methods.single { it.name == reader.name && it.parameterTypes.map(CharSequence::toString) ==
                reader.parameterTypes.map(CharSequence::toString) && it.returnType == reader.returnType }
            val reads = method.controlBody().withIndex()
                .filter { (_, it) -> it.opcode == Opcode.SGET && it.controlRef() == AUTO_LOCK_IN }
                .map { (index, it) -> AutoLockRead(index, (it as OneRegisterInstruction).registerA) }
            checks += InstantLockCheck(method, reads)
        }
    }
    if (checks.none { it.method.origDefiningClass == ANDROID_UTILITIES && it.method.origName == "needShowPasscode" &&
            it.method.origParameterTypes == listOf("Z") && it.method.origReturnType == "Z" }) {
        throw PatchException("the passcode check no longer reads the Auto-lock delay")
    }
    val timers = checks.count { it.method.origDefiningClass == LAUNCH_ACTIVITY }
    if (timers != 1) throw PatchException("LaunchActivity has $timers lock timers, not one")
    return checks
}
