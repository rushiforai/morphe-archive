/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.splitwise.patches.menu

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val ACCOUNT = "Lapp/loki/extension/SplitwiseAccount;"

/** The "other options" section of the Account tab (Scan code, Splitwise Pro, ...). */
private val otherOptionsItems = Fingerprint(
    definingClass = "Lcom/Splitwise/SplitwiseMobile/features/account/AccountItemsViewModelConfiguration;",
    name = "buildOtherOptionsItems",
    returnType = "Ljava/util/ArrayList;",
)

/** Every tap on an Account row lands here with its ButtonAction. */
private val buttonTapped = Fingerprint(
    definingClass = "Lcom/Splitwise/SplitwiseMobile/features/account/AccountContentViewModel;",
    name = "onButtonTapped",
    returnType = "V",
    parameters = listOf("Lcom/Splitwise/SplitwiseMobile/features/account/sections/AccountItem\$ButtonAction;"),
)

/**
 * A "Loki Patches" row in Splitwise's Account tab that opens the Loki Patches screen. Unnamed: it is branding,
 * applied with every Splitwise patch through their menu dependency, and a no-op on any other app.
 */
internal val splitwiseAccountRowPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val build = otherOptionsItems.matchOrNull()?.method ?: return@execute
        val tap = buttonTapped.matchOrNull()?.method ?: return@execute

        build.apply {
            val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            for ((index, instruction) in returns.reversed()) {
                val register = (instruction as OneRegisterInstruction).registerA
                // Replace the return, not insert before it: the hiring-promo branch jumps straight to the return.
                replaceInstruction(index, "invoke-static/range { v$register .. v$register }, $ACCOUNT->addRow(Ljava/util/ArrayList;)V")
                addInstruction(index + 1, "return-object v$register")
            }
        }

        // At entry every local register is free, so v0 is scratch.
        tap.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $ACCOUNT->tapped(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :app
                return-void
            """,
            ExternalLabel("app", tap.getInstruction(0)),
        )
    }
}
