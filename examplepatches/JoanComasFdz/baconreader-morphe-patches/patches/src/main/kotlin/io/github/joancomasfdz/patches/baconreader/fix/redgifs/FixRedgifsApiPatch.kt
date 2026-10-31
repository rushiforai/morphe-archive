// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.redgifs

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lio/github/joancomasfdz/extension/baconreader/FixRedgifsApiPatch;"

@Suppress("unused")
val fixRedgifsApiPatch = bytecodePatch(
    name = "Fix Redgifs API",
    description = "Fixes Redgifs media not loading by using temporary Redgifs API tokens.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        GetOkHttpClientFingerprint.method.apply {
            // Remove conflicting OkHttp interceptors.
            val originalInterceptorInstallIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.NEW_INSTANCE &&
                    getReference<TypeReference>()?.type ==
                    "Lcom/onelouder/baconreader/media/gfycat/RedGifsManager\$HeaderInterceptor;"
            }
            removeInstructions(originalInterceptorInstallIndex, 5)

            val index = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.name == "build" && reference.definingClass == "Lokhttp3/OkHttpClient\$Builder;"
            }
            val register = getInstruction<FiveRegisterInstruction>(index).registerC

            replaceInstruction(
                index,
                "invoke-static { v$register }, $EXTENSION_CLASS_DESCRIPTOR->" +
                    "install(Lokhttp3/OkHttpClient\$Builder;)Lokhttp3/OkHttpClient;",
            )
        }
    }
}
