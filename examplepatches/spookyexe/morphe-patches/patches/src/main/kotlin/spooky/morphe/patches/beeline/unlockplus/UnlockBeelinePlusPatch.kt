package spooky.morphe.patches.beeline.unlockplus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import spooky.morphe.patches.shared.spoofSignatureVerificationPatch
import spooky.morphe.patches.shared.spoofInstallSourcePatch
import spooky.morphe.patches.shared.spoofFirebaseCertHashPatch

import spooky.morphe.patches.shared.Constants.COMPATIBILITY_BEELINE

/**
Unlock Beeline Plus features: round-trip generation, live traffic and premium map types.

Beeline 4.2.8704 note: `isPlusStyle` is returned FALSE on purpose (matches
the upstream reference) — the premium map *types* become available once the
map-style check stops treating them as Plus-exclusive styling.

Version handling:
- 4.2.8014 / 4.2.8704: the named ViewModel/UI-state getters exist and are
patched directly.
- 4.2.9196: those getters are gone (classes obfuscated); Plus is gated by
the subscription state holder `a()Z` and the `PlusState` StateFlow
snapshot, both patched below instead. All fingerprints run best-effort
so a single miss never fails the patch on either version.
 */
@Suppress("unused")
val unlockBeelinePlusPatch = patch(
    name = "Unlock Beeline Plus features",
    description = "Unlocks Beeline plus features such as round-trip generation, live traffic and premium map types.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BEELINE)

    dependsOn(
        spoofSignatureVerificationPatch,
        spoofInstallSourcePatch,
        spoofFirebaseCertHashPatch
    )

    execute {
        /**
         * Best-effort return-early: skip (with a log line) when the fingerprint
         * does not match this build instead of failing the patch. The named
         * ViewModel getters only exist up to 4.2.8704; from 4.2.9196 on the
         * source-of-truth fingerprints below cover the same behaviour.
         */
        fun Fingerprint.returnEarlyIfFound(value: Boolean, label: String) {
            val method = methodOrNull ?: run {
                println("Unlock Beeline Plus: $label not found in this build — skipped")
                return
            }
            method.returnEarly(value)
        }

        PremiumMapTypesFingerprint.returnEarlyIfFound(false, "isPlusStyle (premium map types)")
        MainViewModelisPlusActiveFingerprint.returnEarlyIfFound(true, "MainViewModel.isPlusActive")
        PlanRouteAutoRouteUiStateisBeelinePlusActiveFingerprint.returnEarlyIfFound(
            true,
            "PlanRouteAutoRouteUiState.isBeelinePlusActive"
        )
        OptionsDialogUiStateisPlusActiveFingerprint.returnEarlyIfFound(true, "OptionsDialogUiState.isPlusActive")
        OptionsDialogUiStateisPlusAvailableOrActiveFingerprint.returnEarlyIfFound(
            true,
            "OptionsDialogUiState.isPlusAvailableOrActive"
        )
        SettingsViewModelgetShowPlusSignUpScreenFingerprint.returnEarlyIfFound(
            false,
            "SettingsViewModel.showPlusSignUpScreen"
        )
        isPlusAvailableInLocaleFingerprint.returnEarlyIfFound(true, "isPlusAvailableInLocale")

        // Source of truth: ViewModels gate Plus features straight off the
        // subscription state holder (jw9 in 4.2.8704, f2d in 4.2.9196).
        PlusSubscriptionStateFingerprint.returnEarlyIfFound(true, "PlusSubscriptionState.a()")

        // `PlusState` snapshot (io7 in 4.2.8704, l0a in 4.2.9196): force
        // `isActive` (parameter 1, stored into field 1) to true at construction
        // so every Compose StateFlow reader — not just the direct a()Z readers —
        // sees Plus as active. Overwriting the parameter register needs no extra
        // locals, and the constructor writes it into the isActive field right
        // after the super call.
        PlusStateConstructorFingerprint.methodOrNull?.let { ctor ->
            ctor.addInstructions(1, "const/4 p1, 0x1")
        } ?: println("Unlock Beeline Plus: PlusState constructor not found in this build — skipped")
    }
}
