package app.subenoeva.patches.roadsync.pairing

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * `VehiclesRepository.getVehicleCatalogs(boolean, Continuation)` (emitted as `f`).
 *
 * The pairing **Start** screen (`OnboardingPairingStartViewModel`) loads its list of motorcycle
 * models from here: the method delegates to `getVehicleCatalogs$2`, which calls
 * `ModelApi.listModelCatalogs` over gRPC. With no valid session that call throws
 * `UNAUTHENTICATED` (confirmed on-device), so the Start screen can never render offline.
 *
 * Member names are R8-obfuscated and the method has no string literals, so the match anchors on
 * the defining class plus the unique `(boolean, Continuation) -> Object` signature (it is the only
 * repository method whose first parameter is a primitive `boolean`).
 */
internal object GetVehicleCatalogsFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sab/common/data/vehicles/VehiclesRepository;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Z", "Lkotlin/coroutines/Continuation;"),
)

/**
 * `VehiclesRepository.getVehicleSeries(List, Continuation)` (emitted as `h`).
 *
 * The pairing **SelectModel** screen (`OnboardingPairingSelectModelViewModel.loadVehicles`) calls
 * this with the tapped model's series label; it delegates to `getVehicleSeries$2` →
 * `ModelApi` (server). Same auth wall as [GetVehicleCatalogsFingerprint], so SelectModel cannot
 * render offline either.
 *
 * Anchored on the class plus the unique `(List, Continuation) -> Object` signature — the only
 * repository method whose sole non-continuation parameter is a `List`.
 */
internal object GetVehicleSeriesFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sab/common/data/vehicles/VehiclesRepository;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/List;", "Lkotlin/coroutines/Continuation;"),
)

/**
 * `VehiclesRepository.getVehicles(List, List, String, Continuation)` (emitted as `i`).
 *
 * The **hidden third server gate**: `OnboardingPairingResetViewModel$saveVehicle$1` (the coroutine
 * that actually writes the paired `KnownVehicle` after a successful BLE bond) calls this with the
 * bike's BLE series code before persisting. It delegates to `getVehicles$2` → `ModelApi.listModels`
 * (server) and throws `UNAUTHENTICATED` offline, which aborts the save Single so
 * `BondingState.Complete` never fires — i.e. pairing fails at the last step even though the bond
 * succeeded. saveVehicle's own `if (result.isEmpty())` branch falls back to the user-selected
 * vehicle, so returning an empty list here is enough to let the save finish offline.
 *
 * Anchored on the class plus the unique `(List, List, String, Continuation) -> Object` signature.
 */
internal object GetVehiclesFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sab/common/data/vehicles/VehiclesRepository;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Lkotlin/coroutines/Continuation;",
    ),
)

/**
 * The Start screen's **"next" tap handler** — the synthetic lambda
 * `OnboardingPairingStartFragment$onCreateView$1$1$1.n(fragment, setupVehicle)` (emitted as `n`),
 * wired as the `onClick` of every model card.
 *
 * Its very first act is a sentinel guard that silently swallows the tap:
 *
 * ```
 * if (setupVehicle.vehicle == SabVehicle.INSTANCE.unknown()) return   // no navigation
 * ```
 *
 * The app appends that `unknown()` sentinel (`SabVehicle(LocalVehicle.UNKNOWN, emptyMap)`) itself in
 * loading states and treats it as "no real selection". The offline catalog stub above serves exactly
 * that `LocalVehicle.UNKNOWN` placeholder, and `loadVehicles` wraps it as `SabVehicle(UNKNOWN,
 * emptyMap)` — i.e. structurally equal to the sentinel — so the card renders but its tap hits the
 * guard and dies (observed on-device: the "Unknown" card does nothing). The patch neutralizes the
 * guard so the placeholder proceeds to the Reset/bond screen (its `modelCount` of 1 skips SelectModel
 * and navigates straight there).
 *
 * Anchored on the lambda class plus the analytics string it always emits on a real tap.
 */
internal object StartOnNextGuardFingerprint : Fingerprint(
    definingClass =
        "Lcom/drivemode/sab/onboarding/pair/OnboardingPairingStartFragment\$onCreateView\$1\$1\$1;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lkotlin/Unit;",
    parameters = listOf(
        "Lcom/drivemode/sab/onboarding/pair/OnboardingPairingStartFragment;",
        "Lcom/drivemode/sab/onboarding/pair/OnboardingPairingStartViewModel\$SetupVehicle;",
    ),
    strings = listOf("Tapped Ready To Pair Button"),
)

/**
 * `VehiclesRepository.getSetupPage(String, String, Continuation)` (emitted as `d`).
 *
 * The pairing **Reset** (scan/bond) screen builds its UI from `OnboardingPairingResetViewModel`'s
 * `uiState` flow, whose first act (`loadHtml`) calls this with the selected vehicle's id and the
 * current language tag to fetch the model's "put the bike in pairing mode" instructions as an HTML
 * string. It delegates to `ModelApi.listModelSetupPage` over gRPC, so with no session it throws
 * `UNAUTHENTICATED`; `loadHtml` catches that and emits `UiState.ServerError`, which is the
 * "server error" the Reset screen shows offline right after the Start card navigates to it.
 *
 * `getSetupPage` (`d`) and `getTutorialPage` (`e`) are byte-for-byte twins in signature — both
 * `(String, String, Continuation) -> Object`, `PUBLIC FINAL`, no string literals — so the class and
 * signature alone are ambiguous. The [custom] predicate disambiguates on the only thing that differs
 * in the body: `getSetupPage` casts its gRPC result to `ApiV2$ModelSetupPage` (the tutorial twin
 * casts to `ApiV2$ModelTutorialPage`). `getTutorialPage` has no caller in the pairing flow, so only
 * this one needs stubbing.
 */
internal object GetSetupPageFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sab/common/data/vehicles/VehiclesRepository;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lkotlin/coroutines/Continuation;",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is ReferenceInstruction &&
                (instruction.reference as? TypeReference)?.type ==
                "Lcom/honda/roadsync/api/v2/ApiV2\$ModelSetupPage;"
        } == true
    },
)
