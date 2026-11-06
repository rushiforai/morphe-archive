package app.template.patches.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException

/**
 * Verifies that the extension merged into the app has the methods a patch calls.
 *
 * Right after the patches are updated, Morphe Manager can merge the extension of the version
 * of the patches it had before, which would make the patched app crash when it calls a method
 * the old extension does not have. Patching fails instead.
 *
 * @param classType The extension class the patch calls.
 * @param methodNames The names of the methods of the class the patch calls.
 */
internal fun BytecodePatchContext.requireExtensionMethods(classType: String, vararg methodNames: String) {
    val extensionMethodNames = classDefByOrNull(classType)?.methods?.mapTo(HashSet()) { it.name }.orEmpty()

    methodNames.filterNot { it in extensionMethodNames }.let { missing ->
        if (missing.isNotEmpty()) {
            throw PatchException(
                "The extension is outdated, as $classType misses ${missing.joinToString()}. " +
                        "Restart Morphe Manager and patch again."
            )
        }
    }
}
