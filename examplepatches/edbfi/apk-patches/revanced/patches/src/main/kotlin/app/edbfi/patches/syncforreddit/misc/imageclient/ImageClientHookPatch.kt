// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.imageclient

import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.replaceInstruction
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

/**
 * Adds the extension's interceptor to the app's image client, after the app's own: the client's `build()` becomes
 * `ImageServer.build(builder)`, which adds it and builds.
 */
internal val imageClientHookPatch =
    bytecodePatch {
        dependsOn(extensionPatch)

        apply {
            val method = imageClientMethod()
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
