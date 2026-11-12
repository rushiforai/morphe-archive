package app.template.patches.keyflow

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

// ---------------------------------------------------------------------------
// helpers
//
// NOTE: the instruction objects handed out by the Morphe patcher are
// `BuilderInstruction`s whose `toString()` is the default Object one, so all
// matching has to go through the typed dexlib2 interfaces.
//
// IMPORTANT: an instruction must never be inserted *before* a label that is a
// branch target - that breaks the dex assembler.  All insertions below happen
// either at the very start of a method or right after a non-target
// instruction.
// ---------------------------------------------------------------------------

/** Destination register of a single-register instruction, or null. */
internal fun destRegister(instr: Instruction): Int? =
    (instr as? OneRegisterInstruction)?.registerA

/** Source register of a two-register instruction, or null. */
internal fun srcRegister(instr: Instruction): Int? =
    (instr as? TwoRegisterInstruction)?.registerB

/** Literal value of a `const/4` instruction, or null. */
internal fun const4Literal(instr: Instruction): Int? {
    if (instr.opcode != Opcode.CONST_4) return null
    return (instr as? NarrowLiteralInstruction)?.narrowLiteral
}

/**
 * Printable reference of an instruction (type / field / method reference).
 * e.g. "Ly5XhdY0;", "La82eAByx;->RdpTsF:La82eAByx;", "LCtCUGg;->y88yfJ73C(IZ)Z"
 */
internal fun refOf(instr: Instruction): String? =
    (instr as? ReferenceInstruction)?.reference?.toString()

/** Absolute register number of the first parameter of [method]. */
internal fun firstParamRegister(method: Method): Int {
    var slots = 0
    for (p in method.parameters) {
        slots += if (p.type == "J" || p.type == "D") 2 else 1
    }
    val total = method.implementation?.registerCount ?: return -1
    return total - slots
}

/**
 * Inserts [smali] at [index] (before the instruction that is currently there).
 *
 * Only inserting - never removing - keeps the individual patches independent
 * of each other: two patches that insert at the same index both survive, no
 * matter in which order they run.
 *
 * A snippet that does not compile (e.g. because it uses a register a format
 * cannot address) simply adds nothing, so nothing is ever corrupted.
 */
internal fun safeInsertInstructions(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    index: Int,
    smali: String
): Boolean {
    val impl = method.implementation ?: return false
    val before = impl.instructions.size
    method.addInstructions(index, smali)
    return impl.instructions.size > before
}

/**
 * Reports a patch that could not find its anchor.  This is deliberately NOT a
 * hard error: one broken patch must never abort the whole patch run, because
 * the point of this suite is to try many combinations.
 */
/**
 * Replaces the instruction at [index] with [smali].
 *
 * IMPORTANT: `replaceInstructions(index, list)` in the Morphe patcher removes
 * `list.size()` original instructions and then adds `list.size()` new ones -
 * so it silently swallows the instructions that follow.  Adding first and
 * removing the original afterwards replaces exactly one instruction and keeps
 * the instruction count (and therefore every branch offset) intact.
 */
internal fun safeReplaceInstructions(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    index: Int,
    smali: String
): Boolean {
    val count = smali.trim().lines().count { it.isNotBlank() }
    if (count == 0) return false
    val impl = method.implementation ?: return false
    val before = impl.instructions.size
    method.addInstructions(index, smali)
    val added = impl.instructions.size - before
    if (added != count) {
        // the snippet did not compile - roll back whatever made it in
        repeat(added) { method.removeInstruction(index) }
        return false
    }
    // the original instruction now sits right behind the new block
    method.removeInstruction(index + count)
    return true
}

/**
 * Renders an instruction back to smali so that it can be re-emitted after a
 * log statement.  Returns null for formats that are not supported.
 */
internal fun renderInstruction(instr: Instruction): String? {
    val op = instr.opcode.name
    return when {
        instr is TwoRegisterInstruction && instr is ReferenceInstruction ->
            "$op v${instr.registerA}, v${instr.registerB}, ${instr.reference}"
        instr is OneRegisterInstruction && instr is ReferenceInstruction ->
            "$op v${instr.registerA}, ${instr.reference}"
        instr is OneRegisterInstruction && instr is NarrowLiteralInstruction ->
            "$op v${instr.registerA}, ${instr.narrowLiteral}"
        instr is TwoRegisterInstruction ->
            "$op v${instr.registerA}, v${instr.registerB}"
        else -> null
    }
}

/**
 * Inserts a log statement in front of the instruction at [index].
 *
 * ONLY inserting is safe: `replaceInstructions(index, list)` in the Morphe
 * patcher removes `list.size()` original instructions and then adds
 * `list.size()` new ones, so it silently swallows the instructions that
 * follow the replaced one.  Inserting never removes anything.
 *
 * [reg] is the register the log uses, [valueReg] an optional second register
 * whose value is logged (e.g. the error message).
 */
internal fun insertLogBefore(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    index: Int,
    reg: Int,
    message: String,
    valueReg: Int? = null
): Boolean {
    val call = if (valueReg != null) {
        "invoke-static {v$reg, v$valueReg}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I"
    } else {
        "invoke-static {v$reg, v$reg}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I"
    }
    val smali = """
        const-string v$reg, "$message"
        $call
    """.trimIndent()
    return safeInsertInstructions(method, index, smali)
}

/**
 * Reports a patch that could not find its anchor.  This is deliberately NOT a
 * hard error: one broken patch must never abort the whole patch run, because
 * the point of this suite is to try many combinations.
 */
internal fun reportSkip(patchName: String, detail: String) {
    println("[Export] $patchName: SKIPPED - $detail")
}

// ---------------------------------------------------------------------------
// Keyflow 1.5.10 - optional export diagnostics and manual fallbacks.
//
// The actual Pro unlock and all default export bypasses live in ProPatch
// ("Pro Unlock") and SignerPatch ("Signer Identity"). The patches left here
// are disabled by default and kept separate for troubleshooting:
//
//  [Export] 8  Diagnostics      full logcat trace of the export (tag KFPro)
//  [Export] 9  Toast            on-screen toast naming the blocker
//  [Export] 12 Purchase Allow   standalone paid-export receipt bypass
//
// [Export] 12 is redundant when "Pro Unlock" is enabled (it already applies
// the same MeOIJuj fix); it then reports itself as already applied.
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// [Export] 8 - Diagnostics (logcat).
//
//     adb logcat -s KFPro
//
// This traces the *whole* export, not only the Pro gates, so it also shows
// when the export dies somewhere else:
//
//   KFPro: coroutine enter, state=N       <- every entry of the export coroutine
//   KFPro: project/export range is NULL   <- the silent "reset to IDLE" exit
//   KFPro: calling export prepare         <- before the prepare/withContext step
//   KFPro: export prepare returned        <- the prepare step completed
//   KFPro: export function entered        <- the real export function was called
//   KFPro: export function returned       <- the export function finished
//   KFPro: export SUCCEEDED               <- result was a success result
//   KFPro: export FAILED                  <- result was an error result
//   KFPro: export result is a Pro result  <- result was a Pro result
//   KFPro: Pro feature detected           <- a Pro feature was found
//   KFPro: y88yfJ73C ...                  <- the second gate was consulted
//
// `const-string` can only address v0..v15, so no register above 15 is used.
// ---------------------------------------------------------------------------
@Suppress("unused")
val exportExp8DiagnosticsPatch = patch(
    name = "[Export] 8 Diagnostics",
    description = "Log the whole export flow to logcat (tag KFPro). Read with: adb logcat -s KFPro",
    default = false
) {
    compatibleWith(COMPATIBILITY)
    execute {
        var patched = 0

        // ---- LP0JcGi9.cdo7kOuyS: the export function itself ------------------
        //      The first instruction writes its destination register, so the
        //      log can use that very register and the original instruction
        //      simply overwrites it again.
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LP0JcGi9;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (method.name != "cdo7kOuyS") continue
                if (method.parameters.isEmpty()) continue
                if (method.parameters[0].type != "Landroid/content/Context;") continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                if (instrs.isEmpty()) continue
                if (!insertLogBefore(method, 0, 0, "KFPro: export function entered")) continue
                patched++
            }
        }

        // ---- LkCg72Z4t.invokeSuspend: the export coroutine ------------------
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LkCg72Z4t;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (method.name != "invokeSuspend") continue
                if (method.parameters.size != 1) continue
                if (method.returnType != "Ljava/lang/Object;") continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                if (instrs.isEmpty()) continue

                // (index, smali) pairs - applied back to front so that the
                // indices stay valid while we work.
                val inserts = mutableListOf<Pair<Int, String>>()

                fun log(index: Int, reg: Int, message: String, valueReg: Int? = null) {
                    val call = if (valueReg != null) {
                        "invoke-static {v$reg, v$valueReg}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I"
                    } else {
                        "invoke-static {v$reg, v$reg}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I"
                    }
                    inserts.add(index to "const-string v$reg, \"$message\"\n$call")
                }

                // "export coroutine started" - the very first thing the
                // export coroutine does
                log(0, 12, "KFPro: export coroutine started")

                // (b) "export function returned" - the export function is done.
                //     v6 is dead at that point.
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.CHECK_CAST) continue
                    if (refOf(instrs[i]) != "LiGu8W;") continue
                    log(i + 1, 6, "KFPro: export function returned")
                    break
                }

                // (c) "export SUCCEEDED" - the result was a success result
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.INSTANCE_OF) continue
                    if (refOf(instrs[i]) != "LRBnKeZA7;") continue
                    for (j in i + 1 until instrs.size) {
                        if (instrs[j].opcode == Opcode.IF_EQZ) {
                            log(j + 1, 6, "KFPro: export SUCCEEDED")
                            break
                        }
                    }
                    break
                }

                // (d) "export FAILED" - the result was an error result
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.INSTANCE_OF) continue
                    if (refOf(instrs[i]) != "LR7XqhtD;") continue
                    for (j in i + 1 until instrs.size) {
                        if (instrs[j].opcode == Opcode.IF_EQZ) {
                            log(j + 1, 6, "KFPro: export FAILED")
                            break
                        }
                    }
                    break
                }

                // (e) the error message itself (v0 holds it at that point)
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.IGET_OBJECT) continue
                    val ref = refOf(instrs[i]) ?: continue
                    if (!ref.contains("LkCg72Z4t;->oMKv6w5")) continue
                    log(i + 1, 6, "KFPro", 0)
                    break
                }

                // (f) "export result is a Pro result" - the Pro result branch
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.INSTANCE_OF) continue
                    if (refOf(instrs[i]) != "Ly5XhdY0;") continue
                    for (j in i + 1 until instrs.size) {
                        if (instrs[j].opcode == Opcode.IF_EQZ) {
                            log(j + 1, 6, "KFPro: export result is a Pro result (Ly5XhdY0) -> PRO_REQUIRED")
                            break
                        }
                    }
                    break
                }

                // (g) every entry of the coroutine together with its state
                //     label (v2/v3 are dead here - both are re-assigned right
                //     after the method prologue).  The first run enters with
                //     state 0; a resumed run enters with state 1 or 2.
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.IGET) continue
                    val ref = refOf(instrs[i]) ?: continue
                    if (!ref.contains("LkCg72Z4t;->Ei8C6JWM:I")) continue
                    inserts.add(
                        i to """
                        iget v2, v12, LkCg72Z4t;->Ei8C6JWM:I
                        const-string v3, "KFPro: coroutine enter, state="
                        invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                        move-result-object v2
                        invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
                        """.trimIndent()
                    )
                    break
                }

                // (h) the "no export range -> silently reset to IDLE" abort
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.IGET_OBJECT) continue
                    val ref = refOf(instrs[i]) ?: continue
                    if (!ref.contains("LkCg72Z4t;->kwEINn3:")) continue
                    for (j in i + 1 until minOf(i + 4, instrs.size)) {
                        if (instrs[j].opcode != Opcode.IF_NEZ) continue
                        inserts.add(
                            (j + 1) to """
                            const-string v2, "KFPro: project/export range is NULL -> export aborted (state IDLE)"
                            invoke-static {v2, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
                            """.trimIndent()
                        )
                        break
                    }
                    break
                }

                // (i) right before the prepare step (a withContext helper)
                // (j) right after that helper returned.  v6 holds the high
                //     word of the start time from here on, so it is dead at
                //     both points.
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.INVOKE_STATIC) continue
                    val ref = refOf(instrs[i]) ?: continue
                    if (!ref.contains("Ldm1;->oJpK3JT6v")) continue
                    inserts.add(
                        i to """
                        const-string v6, "KFPro: calling export prepare"
                        invoke-static {v6, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
                        """.trimIndent()
                    )
                    for (j in i + 1 until minOf(i + 5, instrs.size)) {
                        if (instrs[j].opcode != Opcode.MOVE_RESULT_OBJECT) continue
                        inserts.add(
                            (j + 1) to """
                            const-string v6, "KFPro: export prepare returned"
                            invoke-static {v6, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
                            """.trimIndent()
                        )
                        break
                    }
                    break
                }

                // apply everything back to front so the indices stay valid
                for ((index, smali) in inserts.sortedByDescending { it.first }) {
                    if (!safeInsertInstructions(method, index, smali)) continue
                    patched++
                }
            }
        }

        // ---- LP0JcGi9.lSqPRgn: the real export-screen prepare step ---------
        //      This is the path behind the Export screen (x00.yMQp6hm ->
        //      x00.oMKv6w5 -> ZSbsOt -> P0JcGi9.lSqPRgn).  It first asks
        //      P0JcGi9.eFUbX for a purchase decision and turns the answer into
        //      IlvEt (allowed), DNpZU (?) or BCTvXMkP (Pro required).
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LP0JcGi9;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (method.name != "lSqPRgn") continue
                if (method.parameters.size != 9) continue
                if (method.parameters[0].type != "Landroid/content/Context;") continue
                if (method.returnType != "Ljava/lang/Object;") continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                if (instrs.isEmpty()) continue

                val inserts = mutableListOf<Pair<Int, String>>()

                fun log(index: Int, reg: Int, message: String) {
                    inserts.add(
                        index to """
                        const-string v$reg, "$message"
                        invoke-static {v$reg, v$reg}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
                        """.trimIndent()
                    )
                }

                // entry of the prepare step (before the state-machine prologue)
                log(0, 0, "KFPro: lSqPRgn enter (export prepare)")

                // the purchase-decision dispatch: v0 holds the instance-of flag
                // here and is dead again right afterwards.
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.CHECK_CAST) continue
                    val message = when (refOf(instrs[i])) {
                        "LilvEt;" -> "KFPro: lSqPRgn pro-check = IlvEt (ALLOWED)"
                        "LDNpZU;" -> "KFPro: lSqPRgn pro-check = DNpZU"
                        else -> continue
                    }
                    log(i, 0, message)
                }

                // the blocked (Pro required) branch: BCTvXMkP -> Ly5XhdY0
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.NEW_INSTANCE) continue
                    if (refOf(instrs[i]) != "Ly5XhdY0;") continue
                    log(i, 0, "KFPro: lSqPRgn pro-check = BCTvXMkP -> PRO REQUIRED")
                    break
                }

                for ((index, smali) in inserts.sortedByDescending { it.first }) {
                    if (!safeInsertInstructions(method, index, smali)) continue
                    patched++
                }
            }
        }

        // ---- LZSbsOt.invokeSuspend: the Export-screen export coroutine ------
        //      Calls P0JcGi9.lSqPRgn and then dispatches its result into the
        //      shared UI state.
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LZSbsOt;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (method.name != "invokeSuspend") continue
                if (method.parameters.size != 1) continue
                if (method.returnType != "Ljava/lang/Object;") continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                if (instrs.isEmpty()) continue

                val inserts = mutableListOf<Pair<Int, String>>()

                fun log(index: Int, reg: Int, message: String) {
                    inserts.add(
                        index to """
                        const-string v$reg, "$message"
                        invoke-static {v$reg, v$reg}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
                        """.trimIndent()
                    )
                }

                log(0, 0, "KFPro: ZSbsOt coroutine started")

                // result dispatch: right before "instance-of v1, v0, LRBnKeZA7;"
                // v1 is written by that instance-of, so it is dead here.
                fun logAfterIfEqz(typeRef: String, message: String): Boolean {
                    for (i in instrs.indices) {
                        if (instrs[i].opcode != Opcode.INSTANCE_OF) continue
                        if (refOf(instrs[i]) != typeRef) continue
                        for (j in i + 1 until instrs.size) {
                            if (instrs[j].opcode != Opcode.IF_EQZ) continue
                            log(j + 1, 1, message)
                            return true
                        }
                        return false
                    }
                    return false
                }

                // "result received" just before the success instance-of
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.INSTANCE_OF) continue
                    if (refOf(instrs[i]) != "LRBnKeZA7;") continue
                    log(i, 1, "KFPro: ZSbsOt result received")
                    break
                }
                logAfterIfEqz("LRBnKeZA7;", "KFPro: ZSbsOt export SUCCEEDED")
                logAfterIfEqz("LR7XqhtD;", "KFPro: ZSbsOt export FAILED")
                logAfterIfEqz("Ly5XhdY0;", "KFPro: ZSbsOt export PRO result")

                for ((index, smali) in inserts.sortedByDescending { it.first }) {
                    if (!safeInsertInstructions(method, index, smali)) continue
                    patched++
                }
            }
        }

        // ---- Lx00.oMKv6w5: the Export-screen "start export" entry ----------
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "Lx00;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (method.name != "oMKv6w5") continue
                if (method.parameters.size != 20) continue
                if (method.returnType != "V") continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                if (instrs.isEmpty()) continue
                if (!insertLogBefore(method, 0, 0, "KFPro: x00.oMKv6w5 export requested")) continue
                patched++
            }
        }

        // ---- Lkts6dAU4: the Pro feature collector ---------------------------
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "Lkts6dAU4;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (!method.name.startsWith("GX9XN3") && method.name != "c3oEd") continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                val where = if (method.name == "c3oEd") "c3oEd" else "GX9XN3ZIZ"
                val reg = if (method.name == "c3oEd") 14 else 0
                val targets = mutableListOf<Int>()
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.NEW_INSTANCE) continue
                    if (refOf(instrs[i]) != "LwNKvkk7;") continue
                    targets.add(i + 1)
                }
                for (i in targets.reversed()) {
                    if (!safeInsertInstructions(
                            method,
                            i,
                            """
                            const-string v$reg, "KFPro: Pro feature detected -> Pro-required exception ($where)"
                            invoke-static {v$reg, v$reg}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
                            """.trimIndent()
                        )
                    ) continue
                    patched++
                }
            }
        }

        // ---- LCtCUGg.y88yfJ73C: the second gate -----------------------------
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LCtCUGg;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (method.name != "y88yfJ73C") continue
                if (method.parameters.size != 2) continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                val targets = mutableListOf<Int>()
                for (i in instrs.indices) {
                    if (const4Literal(instrs[i]) != 0) continue
                    val reg = destRegister(instrs[i]) ?: continue
                    var retIdx = -1
                    for (j in i + 1..minOf(i + 4, instrs.size - 1)) {
                        if (instrs[j].opcode == Opcode.RETURN) {
                            retIdx = j
                            break
                        }
                    }
                    if (retIdx < 0) continue
                    targets.add(i)
                }
                for (i in targets.reversed()) {
                    if (!safeInsertInstructions(
                            method,
                            i + 1,
                            """
                            const-string v0, "KFPro: y88yfJ73C: project uses Pro features (gate now returns TRUE)"
                            invoke-static {v0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
                            const/4 v0, 0x1
                            """.trimIndent()
                        )
                    ) continue
                    patched++
                }
            }
        }

        if (patched == 0) {
            reportSkip("8 Diagnostics", "no diagnostic anchor found")
        }
    }
}

// ---------------------------------------------------------------------------
// [Export] 9 - Toast.
//
// Shows an on-screen toast naming the blocker when the export is cancelled
// because of a Pro feature. v6/v7/v8 are dead at that point and the Context
// comes from the export composable's own Context field.
//
// NOTE: this is a separate patch on purpose - if the toast turns out to be
// problematic on your device you can simply untick it.
// ---------------------------------------------------------------------------
@Suppress("unused")
val exportExp9ToastPatch = patch(
    name = "[Export] 9 Toast",
    description = "Show a toast naming the reason the export was cancelled.",
    default = false
) {
    compatibleWith(COMPATIBILITY)
    execute {
        var patched = 0
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LkCg72Z4t;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (method.name != "invokeSuspend") continue
                if (method.parameters.size != 1) continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                var branchIdx = -1
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.INSTANCE_OF) continue
                    if (refOf(instrs[i]) != "Ly5XhdY0;") continue
                    for (j in i + 1 until instrs.size) {
                        if (instrs[j].opcode == Opcode.IF_EQZ) {
                            branchIdx = j
                            break
                        }
                    }
                    break
                }
                if (branchIdx < 0) continue
                if (!safeInsertInstructions(
                        method,
                        branchIdx + 1,
                        """
                        iget-object v6, v12, LkCg72Z4t;->Jp4lVJ:Landroid/content/Context;
                        const-string v7, "KFPro: export cancelled - Pro feature detected (see logcat KFPro)"
                        const/4 v8, 0x0
                        invoke-static {v6, v7, v8}, LEolhBv;->c3oEd(Landroid/content/Context;Ljava/lang/String;Z)V
                        """.trimIndent()
                    )
                ) continue
                patched++
            }
        }
        if (patched == 0) {
            reportSkip("9 Toast", "Pro-result branch in LkCg72Z4t.invokeSuspend not found")
        }
    }
}

// ---------------------------------------------------------------------------
// [Export] 12 - LP0JcGi9.MeOIJuj: the paid-export purchase check.
//
// This is the check that the Export *screen* actually goes through.  The
// export coroutine ZSbsOt calls P0JcGi9.lSqPRgn, which calls P0JcGi9.eFUbX.
// Because the Pro Unlock patch forces the "is Pro" flag to true, eFUbX
// delegates to MeOIJuj, which verifies the stored LuenIfX receipt with
// LEPiS52 (signature + signer certificate) and turns the two resulting
// booleans into one of three answers:
//
//     if-eqz p2, :cond_9          <- p2 = verification result
//     new-instance p0, LilvEt;    <- ALLOWED
//     invoke-direct {p0, p1}, LilvEt;-><init>(LuenIfX;)V
//     return-object p0
//     :cond_9
//     if-nez p0, :cond_a
//     ... new-instance BCTvXMkP(W7vkhIw.BEDum)      <- "not purchased"
//     :cond_a
//     ... new-instance BCTvXMkP(W7vkhIw.Ei8C6JWM)   <- cancelled / other
//
// The Pro Unlock patch fabricates the receipt LuenIfX("", ""), so the
// signature check always fails and every project that uses Pro features gets
// a BCTvXMkP result.  lSqPRgn turns that into Ly5XhdY0 (PRO_REQUIRED) and the
// export screen silently returns to the export menu.
//
// Replacing that one branch with nop makes MeOIJuj always return the LilvEt
// (allowed) result.  The nop keeps the instruction count - and therefore
// every branch offset - intact.
//
// "Pro Unlock" now applies the same fix by default, so this patch is only a
// standalone fallback for troubleshooting.  When it finds the branch already
// replaced by nop it counts as applied instead of reporting a skip.
// ---------------------------------------------------------------------------
@Suppress("unused")
val exportExp12MeOIJujPurchasePatch = patch(
    name = "[Export] 12 Purchase Allow",
    description = "Always accept the paid-export purchase check (LP0JcGi9.MeOIJuj).",
    default = false
) {
    compatibleWith(COMPATIBILITY)
    execute {
        var patched = 0
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LP0JcGi9;") return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                if (method.name != "MeOIJuj") continue
                if (method.parameters.size != 2) continue
                if (method.parameters[0].type != "Landroid/content/Context;") continue
                if (method.returnType != "Ljava/lang/Object;") continue
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                // There is exactly one "new-instance LilvEt;" in the app.
                for (i in instrs.indices) {
                    if (instrs[i].opcode != Opcode.NEW_INSTANCE) continue
                    if (refOf(instrs[i]) != "LilvEt;") continue
                    val branch = i - 1
                    if (branch < 0) continue
                    when (instrs[branch].opcode) {
                        Opcode.NOP -> patched++ // already applied by Pro Unlock
                        Opcode.IF_EQZ -> {
                            method.replaceInstruction(branch, "nop")
                            patched++
                        }
                        else -> continue
                    }
                }
            }
        }
        if (patched == 0) {
            reportSkip("12 Purchase Allow", "LilvEt branch in LP0JcGi9.MeOIJuj not found")
        }
    }
}
