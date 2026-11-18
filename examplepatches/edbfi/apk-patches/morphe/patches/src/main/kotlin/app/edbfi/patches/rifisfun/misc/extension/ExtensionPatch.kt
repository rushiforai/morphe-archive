// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.extension

import app.edbfi.patches.shared.Edit
import app.edbfi.patches.shared.extensionSwitch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle

/** The package of the Java the extension adds to the app, as a type descriptor prefix. */
internal const val EXTENSION = "Lapp/edbfi/extension/rifisfun"

/** Where the bundle holds the extension, as named in extensions/rifisfun/build.gradle.kts. */
private const val EXTENSION_FILE = "extensions/edbfi/rifisfun.mpe"

/** Adds the extension's classes to the app and hands it the app's context. Patches that call into it depend on this one. */
internal val extensionPatch =
    patch {
        extendWith(EXTENSION_FILE)

        execute {
            // Should another bundle's file be read in place of ours, fail here rather than leave calls pointing at
            // classes the app lacks.
            if (classDefByOrNull("$EXTENSION/App;") == null) throw PatchException("$EXTENSION_FILE added no extension classes")
            val onCreate = ApplicationOnCreateFingerprint.matchSingle().method
            onCreate.addInstructions(0, "invoke-static/range { p0 .. p0 }, $EXTENSION/App;->init(Landroid/app/Application;)V")
        }
    }

/**
 * Makes the extension class's `isEnabled()`, false as built, return true once applied. Look it up with the rest of a
 * patch's checks, before its first change.
 */
internal fun extensionSwitch(className: String): Edit = extensionSwitch(EXTENSION, className)
