/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Instagram bootstrap fingerprint is based on crimera/piko:
 * https://github.com/crimera/piko
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.instagram.misc.extension.hooks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patches.all.misc.extension.ExtensionHook
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode

internal val instagramInitHook = ExtensionHook(
    fingerprint = Fingerprint(
        name = "onCreate",
        custom = { _, classDef ->
            classDef.endsWith("/InstagramAppShell;")
        },
    ),
    insertIndexResolver = { method ->
        method.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_SUPER
        } + 1
    },
    contextRegisterResolver = { method ->
        val invokeSuperInstruction = method.instructions.first { instruction ->
            instruction.opcode == Opcode.INVOKE_SUPER
        }

        "v${invokeSuperInstruction.registersUsed[0]}"
    },
)
