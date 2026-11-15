/*
 * Copyright 2026 Entree3k
 * https://github.com/Entree3k/Morning-Entree-Patches
 *
 * Ported from the Projectivy Launcher 4.71 "Unlock Premium" patch in
 * Morning-Entree-Patches (GPLv3), re-resolved for 4.73.
 */

package dev.hyzor.patches.projectivy.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.hyzor.patches.projectivy.install.extractNativeLibsPatch
import dev.hyzor.patches.projectivy.shared.Constants.PROJECTIVY

/**
 * Projectivy keeps the free/paid decision in one place: a `StateFlow<Boolean>` created by
 * `PTApplication`'s constructor.
 *
 * ### Which way the flag points
 *
 * `true` means **not registered**. The Premium page (`pj3`) reads it and shows the
 * "register" text and purchase animation only while it is `true`; the parental-control,
 * custom-background and theme-import screens send the user to `PremiumActivity` when it is
 * `true` and let the action through when it is `false`. Roughly thirty UI classes read the
 * same flow directly (display profiles, settings rows and Compose screens), which is why
 * forcing the one flow covers the whole app rather than one screen.
 *
 * ### How it is written
 *
 * The constructor seeds the flow with `Boolean.TRUE` and publishes it through an
 * `asStateFlow()` wrapper. After that, the only writer is `PTApplication.d(Z)V`, which sets
 * it to `z && (lastStart <= 0 || now - lastStart > 8 days)`. That writer is called with
 * `!purchased` from the Play Billing collector, and with `true` from the startup path, so
 * leaving it in place would restore the lock a moment after the patched seed.
 *
 * The patch therefore does the two things the 4.71 upstream patch did, adapted to the new
 * shape:
 *
 *   1. the constructor's `Boolean.TRUE` seed becomes `Boolean.FALSE`;
 *   2. `d(Z)V` starts with `return-void`, so nothing can flip the flow back.
 *
 * There is no second copy of the decision: `x` is the mutable flow, `y` is its read-only
 * wrapper, and no other code writes `x`.
 *
 * The app's native `PTUtils` signature check (`PTApplication.f()`) is left alone. On a
 * re-signed build it only feeds a device-id fallback in the startup analytics; it does not
 * gate premium, and the 4.71 patch did not touch it either.
 *
 * Only client-side decisions change. Anything Projectivy's backend or Play Billing reports
 * is untouched.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Projectivy Launcher's premium features by starting the app in its " +
        "registered state, so the purchase prompts and feature locks are gone.",
    default = true,
) {
    compatibleWith(PROJECTIVY)
    dependsOn(extractNativeLibsPatch)

    execute {
        val constructor = PremiumSeedFingerprint.method
        val seeds = PremiumSeedFingerprint.instructionMatches
        if (seeds.size != 1) {
            throw PatchException(
                "Projectivy: expected exactly one Boolean.TRUE seed in PTApplication.<init> " +
                    "but found ${seeds.size}. Re-derive which StateFlow holds the premium gate.",
            )
        }
        val seed = seeds.single()
        val seedRegister = seed.getInstruction<OneRegisterInstruction>().registerA
        constructor.replaceInstruction(
            seed.index,
            "sget-object v$seedRegister, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
        )

        // The licence re-check writer. Returning immediately leaves the seeded false in place
        // and cannot disturb the existing locals; the rest of the body becomes dead code.
        PremiumLockWriterFingerprint.method.addInstructions(0, "return-void")
    }
}
