/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.util

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Selects one bytecode match, with a patch-specific failure instead of Collection.single(). Competing
 * matches are named, so a changed build can be checked before anyone installs it.
 */
internal fun <T> Iterable<T>.singleOrPatchException(contract: String): T {
    val matches = if (this is Collection<T>) this else toList()
    return matches.singleOrNull() ?: throw PatchException(
        "$contract: expected exactly one match, found ${matches.size}." +
            if (matches.isEmpty()) "" else " Candidates: " + matches.joinToString(limit = 12) { describeCandidate(it) },
    )
}

/** An instruction prints as its object identity, so name it by opcode and reference instead. */
internal fun describeCandidate(candidate: Any?): String = when (candidate) {
    is Instruction -> candidate.opcode.name +
        ((candidate as? ReferenceInstruction)?.reference?.let { " $it" } ?: "")
    is IndexedValue<*> -> "${candidate.index}: ${describeCandidate(candidate.value)}"
    is Pair<*, *> -> "(${describeCandidate(candidate.first)}, ${describeCandidate(candidate.second)})"
    else -> candidate.toString()
}

/**
 * Every match, when they are all the same body, and a refusal when they are not.
 *
 * <p>For a boundary where a duplicate is the host repeating itself rather than the selector
 * losing its grip. R8 outlines a lambda body once per call site, so 46.9.3 carries the playback
 * speed menu's list factory twice on one class, `invoke$328` and `invoke$851`, with identical
 * instructions. Refusing on the count takes the patch down over a copy of the thing it wanted.
 * Two bodies that differ are the other case, and still refuse, because then which one the caller
 * means is a guess.
 *
 * <p>Opcodes only. Registers and references differ between two copies of one body in ways that
 * say nothing about whether they do the same thing.
 */
internal fun <T : Method> Iterable<T>.sameBodiedOrPatchException(contract: String): List<T> {
    val matches = toList()
    if (matches.isEmpty()) {
        throw PatchException("$contract: expected at least one match, found 0.")
    }
    val bodies = matches.map { match ->
        match.implementationOrPatchException(contract).instructions.map { it.opcode }
    }.distinct()
    if (bodies.size > 1) {
        throw PatchException(
            "$contract: found ${matches.size} matches with different bodies, so which one is " +
                "meant is a guess: " +
                matches.joinToString { it.definingClass + "->" + it.name },
        )
    }
    return matches
}

/** Reads a method body, naming the patch and bytecode boundary if the method became abstract. */
internal fun Method.implementationOrPatchException(patch: String): MethodImplementation =
    implementation ?: throw PatchException(
        "$patch: $definingClass->$name(${parameterTypes.joinToString("")})$returnType has no implementation.",
    )
