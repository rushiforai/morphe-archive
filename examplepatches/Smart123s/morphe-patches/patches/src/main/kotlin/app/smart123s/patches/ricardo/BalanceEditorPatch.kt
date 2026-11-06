/*
 * Copyright (C) 2026 Smart123s' patches contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.smart123s.patches.ricardo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val GAME = "Lricardonemlopot/nemlopot/rube/RubeLoaderTest;"

internal object BalanceActivityFingerprint : Fingerprint(
    definingClass = "Lricardonemlopot/nemlopot/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

internal object BalanceLimitFingerprint : Fingerprint(
    definingClass = GAME,
    name = "csalokEllen",
    parameters = emptyList(),
    returnType = "V",
)

internal object BalanceMenuBindingFingerprint : Fingerprint(
    definingClass = GAME,
    name = "bodykatKeres",
    parameters = emptyList(),
    returnType = "V",
)

internal object BalanceTouchFingerprint : Fingerprint(
    definingClass = GAME,
    name = "touchDown",
    parameters = listOf("I", "I", "I", "I"),
    returnType = "Z",
)

internal object BalanceDisposeFingerprint : Fingerprint(
    definingClass = GAME,
    name = "dispose",
    parameters = emptyList(),
    returnType = "V",
)

@Suppress("unused")
val balanceEditorPatch = bytecodePatch(
    name = "Balance editor",
    description = "Adds a coin button below Gameplay Challenge on the tuning screen to set and save the balance.",
) {
    compatibleWith(ricardoCompatibility)
    dependsOn(balanceMenuResourcesPatch)
    extendWith("extensions/ricardo.mpe")

    execute {
        val activity = BalanceActivityFingerprint.method
        val returns = activity.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
        if (returns.size != 1) throw PatchException("Expected one MainActivity.onCreate return")
        activity.addInstructions(
            returns.single().index,
            "invoke-static {p0}, Lricardonemlopot/nemlopot/patches/BalanceEditor;->install(Landroid/app/Activity;)V",
        )

        val binding = BalanceMenuBindingFingerprint.method
        val bindingReturn = binding.implementation!!.instructions.withIndex()
            .singleOrNull { it.value.opcode == Opcode.RETURN_VOID }
            ?: throw PatchException("Expected one menu binding return")
        binding.addInstructions(bindingReturn.index, """
            iget-object v1, p0, $GAME->mScene:Lricardonemlopot/nemlopot/rube/RubeScene;
            invoke-static {v1}, Lricardonemlopot/nemlopot/patches/TuningBalanceButton;->bind(Lricardonemlopot/nemlopot/rube/RubeScene;)V
        """)

        BalanceTouchFingerprint.method.hookBalanceTouch()
        BalanceDisposeFingerprint.method.addInstructions(
            0,
            "invoke-static {}, Lricardonemlopot/nemlopot/patches/TuningBalanceButton;->clear()V",
        )

        // The original zeros wallets above 40,000,000 on every frame. Allow the
        // whole nonnegative int range without changing its separate record check.
        val limit = BalanceLimitFingerprint.method
        val moneyLimit = limit.implementation!!.instructions.withIndex().singleOrNull {
            (it.value as? WideLiteralInstruction)?.wideLiteral == 40_000_000L
        } ?: throw PatchException("Expected Ricardo's original balance limit")
        val register = (moneyLimit.value as OneRegisterInstruction).registerA
        limit.replaceInstruction(moneyLimit.index, "const v$register, 0x7fffffff")
    }
}
