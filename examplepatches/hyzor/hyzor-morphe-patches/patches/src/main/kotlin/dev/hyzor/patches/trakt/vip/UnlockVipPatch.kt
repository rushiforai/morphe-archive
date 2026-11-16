/*
 * Copyright 2026 ineednotitle
 * https://github.com/ineednotitle/Proteus-Patches
 *
 * Ported from the Trakt "Unlock VIP" patch in Proteus-Patches (GPLv3),
 * re-resolved for 3.28.0.
 */

package dev.hyzor.patches.trakt.vip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.hyzor.patches.trakt.shared.Constants.TRAKT
import dev.hyzor.patches.trakt.shared.Constants.USER
import dev.hyzor.patches.trakt.shared.Constants.USER_IS_VIP
import dev.hyzor.patches.util.getReference

/**
 * Trakt's VIP state lives in one field: `User.h` (`isVip`). The parsed account is the only
 * source, and every VIP surface reads that boolean off the `User` (18 read sites in 3.28.0,
 * including `User.d()`, which is `isVip || isVipEp || isVipOg`).
 *
 * ### Why both constructors
 *
 * `User` is a Kotlin data class with two `<init>` methods that write `h`:
 *
 * - the public 14-argument primary constructor, used by `UserKt.a(User.Companion, i86)` when the
 *   API model is mapped to the domain model;
 * - the synthetic `(I, …)` constructor generated for Kotlinx-serialization, used when a `User`
 *   is decoded from JSON (cached sessions, list responses).
 *
 * Upstream's 3.26.1 patch could hook only the primary constructor because the synthetic body
 * delegated to it. In 3.28.0 R8 emits the synthetic body with its own `iput-boolean`s, so a
 * `User` decoded from JSON would keep the account's real flag. Both stores are forced here.
 *
 * ### What is forced, and what is not
 *
 * The patch overwrites the register that feeds the `iput-boolean` into `h` with `1`, immediately
 * before that store. The instruction is located by field reference, and its value register is
 * read from the instruction, so this stays correct even if R8 renumbers the arguments. Nothing
 * else in either constructor is touched: `isVipEp`, `isVipOg` and `isDirector` are badge/staff
 * flags, not feature gates.
 *
 * This can only unlock what the app gates locally. Membership benefits the Trakt API computes
 * for the account (the website badge, API-level perks) keep following the real tier.
 */
@Suppress("unused")
val unlockVipPatch = bytecodePatch(
    name = "Unlock VIP",
    description = "Reports the signed-in account as VIP to the app's own checks, unlocking the " +
        "local VIP gates (the recap screens, the VIP badge and the other surfaces gated on that " +
        "flag). Client side only: limits and perks the Trakt API enforces server-side still " +
        "follow the real account tier.",
    default = true,
) {
    compatibleWith(TRAKT)

    execute {
        forceVipStore(UserConstructorFingerprint.method)
        forceVipStore(UserSerializerConstructorFingerprint.method)
    }
}

/**
 * Inserts `const/16 <value register>, 0x1` before the constructor's `iput-boolean` into
 * `User.h`, so the constructor stores `true` whatever the caller passed. `const/16` rather
 * than `const/4` keeps the injection valid if a future build moves the register above `v15`.
 */
private fun forceVipStore(method: MutableMethod) {
    val instructions = method.implementation?.instructions
        ?: throw PatchException("${method.definingClass}->${method.name} has no code to patch.")

    val storeIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IPUT_BOOLEAN &&
            instruction.getReference<FieldReference>()?.let { field ->
                field.definingClass == USER && field.name == USER_IS_VIP && field.type == "Z"
            } == true
    }
    if (storeIndex < 0) {
        throw PatchException(
            "${method.definingClass}->${method.name} no longer stores the VIP flag into " +
                "User;->$USER_IS_VIP:Z. The obfuscated model layout moved: re-check the field " +
                "letters in User.toString() and update Constants.USER_IS_VIP.",
        )
    }

    val valueRegister = (instructions[storeIndex] as? TwoRegisterInstruction)?.registerA
        ?: throw PatchException("The VIP store in ${method.name} is not a two-register instruction.")

    method.addInstructions(storeIndex, "const/16 v$valueRegister, 0x1")
}
