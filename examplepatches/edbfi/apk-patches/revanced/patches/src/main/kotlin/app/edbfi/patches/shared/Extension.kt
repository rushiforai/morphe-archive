// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.shared

import app.revanced.patcher.definingClass
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.name
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType

/**
 * Makes `isEnabled()` of [className] in the extension package [extension] (a type descriptor prefix), false as built,
 * return true once applied. Look it up with the rest of a patch's checks, before its first change.
 */
internal fun BytecodePatchContext.extensionSwitch(
    extension: String,
    className: String,
): Edit {
    val method =
        uniqueMethod("$className.isEnabled in the extension") {
            definingClass("$extension/$className;")
            name("isEnabled")
            returnType("Z")
        }
    return Edit(1) {
        method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
