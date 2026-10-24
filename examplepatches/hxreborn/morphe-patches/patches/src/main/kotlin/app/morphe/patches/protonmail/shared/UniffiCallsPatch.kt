/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.protonmail.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val UNIFFI_CALLS_CLASS = "Lapp/hxreborn/extension/protonmail/UniffiCalls;"

internal val uniffiCallsPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        with(
            IoDispatcherFingerprint.matchAll(1..2)
                .map { it.classDef }
                .single { "Ljava/util/concurrent/Executor;" in it.interfaces },
        ) {
            val dispatcherInstanceField = fields.single {
                it.type == type && AccessFlags.STATIC.isSet(it.accessFlags)
            }

            mutableClassDefBy(UNIFFI_CALLS_CLASS).methods
                .single { it.name == "ioDispatcher" }
                .addInstructions(
                    0,
                    """
                        sget-object v0, $type->${dispatcherInstanceField.name}:${dispatcherInstanceField.type}
                        return-object v0
                    """,
                )
        }
    }
}
