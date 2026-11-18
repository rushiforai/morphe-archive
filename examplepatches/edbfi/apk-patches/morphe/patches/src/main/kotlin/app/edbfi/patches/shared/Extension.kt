// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.matchSingle

/** `isEnabled()` of an extension class, false as built. */
private class ExtensionSwitchFingerprint(
    extension: String,
    className: String,
) : Fingerprint(
    definingClass = "$extension/$className;",
    name = "isEnabled",
    returnType = "Z",
    parameters = listOf(),
)

/**
 * Makes `isEnabled()` of [className] in the extension package [extension] (a type descriptor prefix), false as built,
 * return true once applied. Look it up with the rest of a patch's checks, before its first change.
 */
internal fun extensionSwitch(
    extension: String,
    className: String,
): Edit = ExtensionSwitchFingerprint(extension, className).matchSingle().method.returnEarlyEdit(true)
