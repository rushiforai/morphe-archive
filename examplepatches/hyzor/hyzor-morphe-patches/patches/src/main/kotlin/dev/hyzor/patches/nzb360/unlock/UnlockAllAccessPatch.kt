/*
 * Copyright 2026 rushiranpise
 * https://github.com/rushiranpise/morphe-patches
 *
 * Ported from the nzb360 "Unlock All Access" patch in rushiranpise/morphe-patches
 * (GPLv3), re-resolved for 25.3.
 */

package dev.hyzor.patches.nzb360.unlock

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import dev.hyzor.patches.nzb360.shared.Constants.NZB360

/**
 * Unlocks nzb360 All Access.
 *
 * ### How nzb360 gates the modules
 *
 * Every paid surface goes through `NZB360LicenseHelper`, a singleton that keeps two pieces
 * of state:
 *
 *  - `subscriptionActive`, the All Access flag, exposed as `isAASubscriptionActive()`;
 *  - `serviceStatusList`, a per-module `ServiceStatus` record (`service` + `unlocked`).
 *
 * `isUnlocked(service, ignoreAllAccess)` is the only place that combines them: an active All
 * Access subscription unlocks every service unless the caller explicitly asks to ignore it,
 * otherwise the cached per-service status decides. `isLocked(service)` and
 * `isLocked(service, ignoreAllAccess)` are its inverted delegating wrappers, and the 147
 * `isLocked` call sites in 25.3 (dashboard, module screens, settings) all end up there.
 *
 * The patch therefore rewrites the licensing predicates, not the UI:
 *
 *  - `isAASubscriptionActive()` returns `true`;
 *  - `isUnlocked(Service, Z)` returns `true`;
 *  - both `isLocked(Service)` overloads return `false`;
 *  - `Contract$UIState.isSubscribed()` returns `true`, so the Upgrade Center shows the
 *    subscribed state instead of the paywall.
 *
 * The two `isLocked` hooks are redundant while the overloads keep delegating to `isUnlocked`,
 * but they are kept exactly as the upstream patch does: if a future build starts deciding
 * "locked" from the cached status list directly, those two still hold.
 *
 * ### Default plan
 *
 * `UpgradeCenterKt.SubscriptionSection` remembers the selected plan starting at `"Monthly"`
 * and renders the Monthly/Yearly toggle from it. The patch changes that one seed to
 * `"Yearly"`. In the patched build the subscribed state replaces the purchase panel, so the
 * toggle is normally hidden; the edit keeps upstream parity and makes that screen default to
 * yearly if it is ever shown. Nothing else about the billing flow changes.
 *
 * Only client-side decisions change: no purchase is performed, no receipt is forged, and
 * anything nzb360's backend verifies still sees the real account.
 */
@Suppress("unused")
val unlockAllAccessPatch = bytecodePatch(
    name = "Unlock All Access",
    description = "Unlocks All Access without the in-app purchase, so every service module and " +
        "the Upgrade Center behave as if the subscription is active.",
    default = true,
) {
    compatibleWith(NZB360)

    execute {
        AllAccessActiveFingerprint.method.returnBoolean(true)
        IsUnlockedFingerprint.method.returnBoolean(true)
        IsSubscribedFingerprint.method.returnBoolean(true)
        IsLockedOneArgFingerprint.method.returnBoolean(false)
        IsLockedTwoArgFingerprint.method.returnBoolean(false)

        SubscriptionSectionFingerprint.method.defaultPlanToYearly()
    }
}

/**
 * Replaces the whole body with `return value`.
 *
 * Each hook is an instance method, so its register frame always contains at least `v0`
 * (`this`, which is also `p0` in the no-parameter hooks); the two-instruction body needs no
 * other register and leaves every parameter unused.
 */
private fun MutableMethod.returnBoolean(value: Boolean) {
    val constant = if (value) "0x1" else "0x0"
    removeInstructions(0, instructions.count())
    addInstructions(0, "const/4 v0, $constant\nreturn v0")
}

/** `invoke-static {value}, Landroidx/compose/runtime/l;->h(Ljava/lang/Object;)Lc74;` */
private const val MUTABLE_STATE_OF = "Landroidx/compose/runtime/l;->h(Ljava/lang/Object;)Lc74;"

private const val MONTHLY_PLAN = "Monthly"
private const val YEARLY_PLAN = "Yearly"

/**
 * Changes the Upgrade Center's remembered plan seed from `"Monthly"` to `"Yearly"`.
 *
 * The seed is identified by its data flow, not by position: it is the `"Monthly"` const-string
 * whose register is passed straight to Compose's `mutableStateOf` helper (`l.h`). The other
 * `"Monthly"` const-string in the method is the toggle button's label, which must stay.
 * Matching on that data flow fails loudly if the Compose compiler changes the shape.
 */
private fun MutableMethod.defaultPlanToYearly() {
    val body = instructions
    val seeds = body.indices.filter { index ->
        val instruction = body[index]
        if (instruction.opcode != Opcode.CONST_STRING) return@filter false
        val literal = instruction as Instruction21c
        literal.reference.toString() == MONTHLY_PLAN &&
            body.seedsMutableState(index, literal.registerA)
    }
    if (seeds.size != 1) {
        throw PatchException(
            "nzb360: expected exactly one \"$MONTHLY_PLAN\" plan seed in " +
                "UpgradeCenterKt.SubscriptionSection but found ${seeds.size}. " +
                "Re-derive how the Upgrade Center initialises its plan state.",
        )
    }

    val seed = seeds.single()
    val register = (body[seed] as Instruction21c).registerA
    replaceInstruction(seed, "const-string v$register, \"$YEARLY_PLAN\"")
}

/** Whether the const-string at [index] is the value the Compose state is created with. */
private fun List<BuilderInstruction>.seedsMutableState(index: Int, register: Int): Boolean =
    drop(index + 1).take(8).any { next ->
        next.opcode == Opcode.INVOKE_STATIC &&
            next is Instruction35c &&
            next.reference.toString() == MUTABLE_STATE_OF &&
            next.registerCount == 1 &&
            next.registerC == register
    }
