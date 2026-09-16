/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.util

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation

/** Selects one bytecode match, with a patch-specific failure instead of Collection.single(). */
internal fun <T> Iterable<T>.singleOrPatchException(contract: String): T {
    val matches = if (this is Collection<T>) this else toList()
    return matches.singleOrNull()
        ?: throw PatchException("$contract: expected exactly one match, found ${matches.size}.")
}

/** Reads a method body, naming the patch and bytecode boundary if the method became abstract. */
internal fun Method.implementationOrPatchException(patch: String): MethodImplementation =
    implementation ?: throw PatchException(
        "$patch: $definingClass->$name(${parameterTypes.joinToString("")})$returnType has no implementation.",
    )
