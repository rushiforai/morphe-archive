/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.all.shared

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.logging.Logger

private val log = Logger.getLogger(Patch::class.java.name)

/** True if returnEarly(value) already forced this boolean method (const/4 v0, value; return v0). */
fun MutableMethod.alreadyForcedBoolean(value: Boolean): Boolean {
    val ins = implementation?.instructions?.toList() ?: return false
    if (ins.size < 2) return false
    val a = ins[0]
    val b = ins[1]
    return a is NarrowLiteralInstruction &&
        a is OneRegisterInstruction &&
        a.registerA == 0 &&
        a.narrowLiteral == (if (value) 1 else 0) &&
        b.opcode == Opcode.RETURN &&
        b is OneRegisterInstruction &&
        b.registerA == 0
}

/** Idempotent returnEarly: skip if another bundle already forced the same value. */
fun MutableMethod.forceBooleanOnce(value: Boolean, label: String) {
    if (alreadyForcedBoolean(value)) {
        log.info("lustx: $label already forced to $value (another bundle?); skipping")
        return
    }
    returnEarly(value)
}
