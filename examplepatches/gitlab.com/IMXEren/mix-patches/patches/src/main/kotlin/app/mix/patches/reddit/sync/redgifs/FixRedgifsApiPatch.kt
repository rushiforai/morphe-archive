/*
 * Copyright 2026 wchill, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.redgifs

import app.mix.patches.reddit.customclients.INSTALL_NEW_CLIENT_METHOD
import app.mix.patches.reddit.customclients.fixRedgifsApiPatch
import app.mix.patches.reddit.sync.extension.sharedExtensionPatch
import app.mix.patches.reddit.sync.shared.Constants.COMPATIBILITY_SYNC
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/mix/extension/syncforreddit/FixRedgifsApiPatch;"

@Suppress("unused")
val fixRedgifsApi = fixRedgifsApiPatch(
    extensionPatch = sharedExtensionPatch
) {
    compatibleWith(COMPATIBILITY_SYNC)

    execute {
        // region Patch Redgifs OkHttp3 client.

        createOkHttpClientFingerprint.method.apply {
            val index = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.name == "build" && reference.definingClass == "Lokhttp3/OkHttpClient\$Builder;"
            }
            val register = getInstruction<FiveRegisterInstruction>(index).registerC
            replaceInstruction(
                index,
                """
                invoke-static       { v$register }, $EXTENSION_CLASS_DESCRIPTOR->$INSTALL_NEW_CLIENT_METHOD
                """
            )
        }

        getDefaultUserAgentFingerprint.method.apply {
            addInstructions(
                0,
                """
                invoke-static { }, ${getOriginalUserAgentFingerprint.method}
                move-result-object v0
                return-object v0
                """
            )
        }

        // endregion

        // region Fix malformed Redgifs URL ID extraction.

        // Redirect the extractor to the corrected extension implementation. The injected return
        // makes the original body unreachable without depending on its obfuscated symbol names.
        linkHandlerGetGfycatIdFingerprint.method.addInstructions(
            0,
            """
            invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->extractGifId(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
            return-object p0
            """
        )

        // endregion
    }
}
