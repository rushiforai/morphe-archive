/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.freeze

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.shared.bytecode.hexToBytes
import app.morphe.patches.shared.bytecode.replaceFirst
import app.morphe.patches.shared.bytecode.requireOccurrenceCount
import app.morphe.patches.webetu.shared.WebetuConstants

@Suppress("unused")
val fixScreenFreezePatch = rawResourcePatch(
    name = "Fix screen freeze",
    description = "Fixes screen freezing after resuming the app from the background.",
    default = true,
) {
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)

    execute {
        val bundle = get("assets/index.android.bundle")
        val data = bundle.readBytes()

        // Keep dashboard buttons activated when Redux restores an incomplete option config.
        val needle = """
            49 05 07 06              # Select r5, r7, r6
            90 05 05                 # ToBoolean r5, r5
            79 05                    # LoadConstFalse r5
            40 01 05                 # StoreToEnv r1, 5, r5
            46 5a                    # Jmp
        """.hexToBytes()

        val replacement = """
            49 05 07 06              # Select r5, r7, r6
            90 05 05                 # ToBoolean r5, r5
            78 05                    # LoadConstTrue r5
            40 01 05                 # StoreToEnv r1, 5, r5
            46 5a                    # Jmp
        """.hexToBytes()

        data.requireOccurrenceCount(
            needle,
            1,
            "Expected exactly one dashboard renderItem needle in index.android.bundle",
        )
        require(needle.size == replacement.size) {
            "Screen-freeze replacement must preserve the bundle size"
        }

        bundle.writeBytes(data.replaceFirst(needle, replacement))
    }
}

