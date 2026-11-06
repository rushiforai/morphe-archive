/*
 * Ported from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
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

