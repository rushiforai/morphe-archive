// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.errors

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

@Suppress("unused")
val showRequestErrorsPatch = bytecodePatch(
    name = "Show request errors",
    description = "Shows the actual error when a Reddit request fails, " +
        "instead of the message saying that BaconReader stopped working in July 2023.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        // Every Reddit request catches its IOException and throws a new one with the 2023 farewell message.
        // The app's own errors are already useful ("reddit: 404 Not Found", timeouts, parse errors):
        // rebuild the method without that try block, so they reach the screen.
        val method = RedditRequestRunTaskFingerprint.method
        val implementation = method.implementation!!
        val tryBlocks = implementation.tryBlocks.filterNot { tryBlock ->
            tryBlock.exceptionHandlers.any { it.exceptionType == "Ljava/io/IOException;" }
        }
        if (tryBlocks.size != implementation.tryBlocks.size - 1) {
            throw PatchException("Expected one IOException handler in ${method.definingClass}->runTask")
        }

        val rebuilt = ImmutableMethod(
            method.definingClass,
            method.name,
            method.parameters,
            method.returnType,
            method.accessFlags,
            method.annotations,
            method.hiddenApiRestrictions,
            ImmutableMethodImplementation(
                implementation.registerCount,
                implementation.instructions,
                tryBlocks,
                implementation.debugItems,
            ),
        ).toMutable()

        RedditRequestRunTaskFingerprint.classDef.methods.apply {
            remove(method)
            add(rebuilt)
        }
    }
}
