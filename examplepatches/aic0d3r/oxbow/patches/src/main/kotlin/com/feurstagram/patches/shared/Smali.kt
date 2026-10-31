package com.feurstagram.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.StringReference

const val CONFIG_CLASS = "Lcom/feurstagram/extension/Config;"

/** True when the method loads a string ending with [suffix] (purge-log prefixes change per release). */
fun Method.hasStringEndingWith(suffix: String): Boolean =
    implementation?.instructions?.any { it.getReference<StringReference>()?.string?.endsWith(suffix) == true } == true

/** Fingerprint on a method that loads a string ending with [suffix]. */
fun stringSuffixFingerprint(suffix: String, returnType: String? = null) = Fingerprint(
    returnType = returnType,
    custom = { method, _ -> method.hasStringEndingWith(suffix) },
)

/** Free local registers at method entry (parameters sit in the highest registers). */
fun Method.freeLocals(): Int {
    val params = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return (implementation?.registerCount ?: 0) - params - self
}

/**
 * At method entry: `if (Config.<toggle>()) return <value>;`. Uses v0 only, which is free at
 * entry whenever the method has a local register.
 */
fun MutableMethod.returnEarlyIf(toggle: String, returnSmali: String = "return-void") {
    if (freeLocals() < 1) throw PatchException("$name has no free register for the $toggle hook")
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $CONFIG_CLASS->$toggle()Z
            move-result v0
            if-eqz v0, :instagram
            $returnSmali
        """,
        ExternalLabel("instagram", getInstruction(0)),
    )
}

/**
 * At method entry: when Config.<toggle>() is on, finish the queued task by calling [complete]
 * (an interface method taking an error object and a message, both null for done) and return,
 * instead of running the method, which is what would send the request.
 */
fun MutableMethod.holdReceipt(toggle: String, complete: String, parameterIndex: Int = 1) {
    if (freeLocals() < 4) throw PatchException("$name has no free registers for the $toggle hook")
    val callback = parameterRegister(parameterIndex)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $CONFIG_CLASS->$toggle()Z
            move-result v0
            if-eqz v0, :instagram
            const/4 v2, 0x0
            const/4 v3, 0x0
            move-object/from16 v1, v$callback
            invoke-interface {v1, v2, v3}, $complete
            return-void
        """,
        ExternalLabel("instagram", getInstruction(0)),
    )
}

/**
 * At method entry: if Config.<toggle>(this String parameter) is true, return true. Used where a
 * boolean answer has to be overridden for one value of an argument, not for the whole call.
 */
fun MutableMethod.returnTrueIf(toggle: String, parameterIndex: Int) {
    if (freeLocals() < 2) throw PatchException("$name has no free registers for the $toggle hook")
    val argument = parameterRegister(parameterIndex)
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v1, v$argument
            invoke-static {v1}, $CONFIG_CLASS->$toggle(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :instagram
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("instagram", getInstruction(0)),
    )
}

/**
 * At method entry: when Config.<toggle>() is on, hand each listed String parameter to
 * Config.<remember>(String). Used to keep the ids of what Ghost mode reports as seen locally only.
 */
fun MutableMethod.rememberStringsIf(toggle: String, remember: String, parameterIndexes: List<Int>) {
    if (parameterIndexes.isEmpty()) return
    if (freeLocals() < 2) throw PatchException("$name has no free registers for the $toggle hook")
    val calls = parameterIndexes.joinToString("\n") {
        "move-object/from16 v1, v${parameterRegister(it)}\n" +
            "invoke-static {v1}, $CONFIG_CLASS->$remember(Ljava/lang/String;)V"
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $CONFIG_CLASS->$toggle()Z
            move-result v0
            if-eqz v0, :instagram
            $calls
        """,
        ExternalLabel("instagram", getInstruction(0)),
    )
}

/** Register holding parameter [index] (0-based, without `this`), which sits in the highest locals. */
private fun MutableMethod.parameterRegister(index: Int): Int {
    val words = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } + 1
    return (implementation?.registerCount ?: 0) - words + 1 + index
}
