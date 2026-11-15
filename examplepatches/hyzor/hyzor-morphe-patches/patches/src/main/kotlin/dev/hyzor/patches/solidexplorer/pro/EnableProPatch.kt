/*
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 *
 * Ported from the Solid Explorer 3.6.1 "Enable Pro" patch in hoo-dles/morphe-patches
 * (GPLv3), re-resolved for 3.6.4.
 */

package dev.hyzor.patches.solidexplorer.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.hyzor.patches.solidexplorer.shared.Constants.LICENSE_DETAILS
import dev.hyzor.patches.solidexplorer.shared.Constants.LICENSE_STATE
import dev.hyzor.patches.solidexplorer.shared.Constants.SOLID_EXPLORER

/**
 * Solid Explorer keeps the free/paid decision in `LicenseDetails`, an immutable record holding
 * a `LicenseState` plus the trial dates and a revoked reason.
 *
 * ### Why the constructor
 *
 * Every licensing consumer goes through `LicenseDetails`:
 *
 *  - `FeatureGate.isAccessGranted()` is literally
 *    `LicenseState.getPRO().contains(LicensingManager.currentLicenseDetails.state)`, and
 *    `getPRO()` is `{SUBSCRIBER, PREMIUM_PRO}`. The Pro gates (folder encryption, storage
 *    analyser, backup sync, icon sets) are all built on it.
 *  - `LicenseDetails.adsEnabled()` is `state == UNLICENSED` and decides the ads.
 *  - `isPro()`, `isLicensed()`, `isStateResolved()`, `isTrialStarted()` and the paywall screens
 *    read the same field or go through `getState()`.
 *
 * The record is created in exactly one place — `LicenseDetails.<init>` — from the backend
 * response, from the on-disk cache and from the Play Billing reconciliation alike. Rewriting
 * the state there covers all of them at once, including the code that compares the raw field
 * instead of calling the getters (which is why patching `getState()` alone would not remove
 * the ads).
 *
 * ### What it does
 *
 * Like the upstream 3.6.1 patch, the hook only upgrades the free state: when the freshly
 * built record reports ads (`adsEnabled()` is `state == UNLICENSED`) it is rewritten to
 * `PREMIUM_PRO`. Records that are already licensed keep their state, so a subscriber still
 * gets the subscriber UI.
 *
 * The `LicenseState` field of `LicenseDetails` has a single-letter name (`a` in 3.6.4) that
 * R8 is free to change, so the field is taken from the constructor's own `iput-object`
 * rather than hard-coded. Only the state is forged: the product id, trial dates and rest of
 * the record stay as the app received them, and nothing server-side changes.
 */
@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables the features locked behind the Pro subscription.",
    default = true,
) {
    compatibleWith(SOLID_EXPLORER)

    execute {
        val constructor = LicenseDetailsCtorFingerprint.method

        val stateFields = constructor.instructions
            .filter { it.opcode == Opcode.IPUT_OBJECT }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
            .filter { it.type == LICENSE_STATE }
            .distinctBy { it.name }

        if (stateFields.size != 1) {
            throw PatchException(
                "Solid Explorer: expected LicenseDetails.<init> to write exactly one " +
                    "LicenseState field but found ${stateFields.size} " +
                    "(${stateFields.joinToString { it.name }}). Re-derive the licence field " +
                    "against this APK version.",
            )
        }
        val stateField = stateFields.single().name

        constructor.addInstructionsWithLabels(
            constructor.instructions.size - 1,
            """
                invoke-virtual {p0}, $LICENSE_DETAILS->adsEnabled()Z
                move-result v0
                if-eqz v0, :end
                sget-object v0, $LICENSE_STATE->PREMIUM_PRO:$LICENSE_STATE
                iput-object v0, p0, $LICENSE_DETAILS->$stateField:$LICENSE_STATE
            """.trimIndent(),
            ExternalLabel("end", constructor.instructions.last()),
        )
    }
}
