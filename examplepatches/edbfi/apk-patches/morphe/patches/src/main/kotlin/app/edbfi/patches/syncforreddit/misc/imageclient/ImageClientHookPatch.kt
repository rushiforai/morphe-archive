// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.imageclient

import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

/**
 * Adds the extension's interceptor to the app's image client, after the app's own: the client's `build()` becomes
 * `ImageServer.build(builder)`, which adds it and builds.
 */
internal val imageClientHookPatch =
    patch {
        dependsOn(extensionPatch)

        execute {
            val method = ImageClientFingerprint.matchSingle().method
            val builds = method.instructions.withIndex().filter { it.value.isClientBuild() }
            val build = builds.singleOrNull()?.index ?: throw PatchException("Expected one client build in ${method.name}, found ${builds.size}")
            val builder = method.getInstruction<FiveRegisterInstruction>(build).registerC
            // A branch lands on the build call (the DNS-over-HTTPS setting skips one step). Replacing the call keeps
            // its label, so both paths reach the hook; inserting before it would leave the label behind.
            method.replaceInstruction(
                build,
                "invoke-static/range { v$builder .. v$builder }, $EXTENSION/ImageServer;->build(Lokhttp3/OkHttpClient\$Builder;)Lokhttp3/OkHttpClient;",
            )
        }
    }
