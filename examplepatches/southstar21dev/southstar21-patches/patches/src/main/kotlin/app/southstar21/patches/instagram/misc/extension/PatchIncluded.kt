package app.southstar21.patches.instagram.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext

/**
 * Every patch's extension class has a `public static boolean isIncluded()` returning false.
 * Calling this from the patch makes it return true, so the patch shows up in the
 * southstar21 Patches menu and its code runs.
 */
context(patchContext: BytecodePatchContext)
internal fun markPatchIncluded(extensionClass: String) {
    Fingerprint(
        definingClass = extensionClass,
        name = "isIncluded",
        returnType = "Z",
        parameters = listOf(),
    ).method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """
    )
}
