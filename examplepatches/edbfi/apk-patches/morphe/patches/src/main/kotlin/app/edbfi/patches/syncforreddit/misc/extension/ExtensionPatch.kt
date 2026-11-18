// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.extension

import app.edbfi.patches.shared.Edit
import app.edbfi.patches.shared.extensionSwitch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch

/** The package of the Java the extension adds to the app, as a type descriptor prefix. */
internal const val EXTENSION = "Lapp/edbfi/extension/syncforreddit"

/** Where the bundle holds the extension, as named in extensions/syncforreddit/build.gradle.kts. */
private const val EXTENSION_FILE = "extensions/edbfi/syncforreddit.mpe"

/** Adds the extension's classes to the app. Patches that call into it depend on this one. */
internal val extensionPatch =
    patch {
        extendWith(EXTENSION_FILE)
        // Some patches call into the extension without looking anything up in it. Should another bundle's file be read
        // in place of ours, fail here rather than leave those calls pointing at classes the app lacks.
        execute {
            if (classDefByOrNull("$EXTENSION/Http;") == null) throw PatchException("$EXTENSION_FILE added no extension classes")
        }
    }

/**
 * Makes the extension class's `isEnabled()`, false as built, return true once applied. Look it up with the rest of a
 * patch's checks, before its first change.
 */
internal fun extensionSwitch(className: String): Edit = extensionSwitch(EXTENSION, className)

/** Turns the extension class on, for a patch whose only change this is or whose other changes are already made. */
internal fun enableInExtension(className: String) = extensionSwitch(className).apply()
