/*
 * Ported from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 *
 * Compatibility widened to Instagram 446.0.0.49.77; patch logic unchanged.
 */
package app.ahmedyarub.patches.instagram.misc

import app.morphe.library.instagram.patches.bypassSignatureCheckPatch
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM

@Suppress("unused")
val bypassSignatureCheckPatch = bypassSignatureCheckPatch(
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
}

