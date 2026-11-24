package app.aidan.patches.fizz.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException

/**
 * Selects the verified bytecode target set for the Fizz build being patched.
 *
 * Fizz re-obfuscates its own classes on every release, so a supported version whose
 * descriptors have not been verified needs its own entry. An unknown version fails fast
 * instead of patching another build's descriptors.
 */
fun <T> BytecodePatchContext.fizzTargets(vararg entries: Pair<String, T>): T {
    val version = packageMetadata.versionName
    return entries.firstOrNull { it.first == version }?.second
        ?: throw PatchException(
            "No verified bytecode targets for Fizz $version; supported versions: " +
                entries.joinToString { it.first }
        )
}
