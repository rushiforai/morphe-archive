package app.subenoeva.patches.roadsync.pairing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.subenoeva.patches.shared.Constants.COMPATIBILITY_ROADSYNC
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Lets RoadSync pair a brand-new motorcycle and reach the handlebar controls with no Google account
 * and no network — complements [app.subenoeva.patches.roadsync.login.bypassGoogleLoginPatch], which
 * only gets you into onboarding.
 *
 * ## Why this exists
 *
 * Re-signing a patched build permanently breaks Google Sign-In, so it can never obtain a session
 * token, so every gRPC call to Honda's backend sends an empty `Authorization: Bearer` and comes
 * back `UNAUTHENTICATED`. Pairing a new bike hits that backend in **four** places, all through
 * `VehiclesRepository` (each delegates to a coroutine that calls `ModelApi` over gRPC):
 *
 * 1. **Start screen** — `getVehicleCatalogs` ([GetVehicleCatalogsFingerprint]) lists the models.
 * 2. **SelectModel screen** — `getVehicleSeries` ([GetVehicleSeriesFingerprint]) lists that model's
 *    year variants; tapping one writes it to `savedStateHandle["pairing_vehicle"]` and navigates to
 *    the scan/bond (Reset) screen.
 * 3. **Reset (scan/bond) screen** — `getSetupPage` ([GetSetupPageFingerprint]), called from
 *    `OnboardingPairingResetViewModel.loadHtml` the instant the screen opens, to fetch the model's
 *    "put the bike in pairing mode" instructions as HTML. Offline it throws, and `loadHtml` turns
 *    that into `UiState.ServerError` — the "server error" the Reset screen shows before you can scan.
 * 4. **The save itself** — `getVehicles` ([GetVehiclesFingerprint]), called from
 *    `OnboardingPairingResetViewModel$saveVehicle$1` with the bike's BLE series code *after* a
 *    successful bond, right before it builds and inserts the `KnownVehicle`. This one is the
 *    non-obvious blocker: without it the bond succeeds but the save throws, so
 *    `BondingState.Complete` never fires and pairing silently fails at the last step.
 *
 * ## What it does
 *
 * Everything else in pairing is local and auth-free: the BLE scan filters by the generic name
 * `"HONDA BTU"`, the bond reads `OnboardingInformation` (mac, name, firmware, series code) straight
 * from the bike, and the `KnownVehicle` insert is local Room. So this patch only has to make those
 * three catalog calls succeed offline by returning local data instead of calling the server:
 *
 * - `getVehicleCatalogs` / `getVehicleSeries` return a one-element list built around
 *   `LocalVehicle.Companion.a()` — the app's own built-in "Unknown" placeholder `LocalVehicle`
 *   (empty `vehicleCodes`, empty `imageIds`, meter type `-1`). That renders a single tappable card
 *   on each screen so the user can walk through to the scan, with **no** image fetch (empty
 *   `imageIds` means `saveVehicle`'s image loop never calls the server either).
 * - `getSetupPage` returns a static local HTML string instead of calling the server, so the Reset
 *   screen renders its instructions and lets you scan instead of showing a server error.
 * - `getVehicles` returns an **empty** list. In `saveVehicle` that takes the `if (result.isEmpty())`
 *   branch, which uses the vehicle the user selected above, then finishes: it inserts the selected
 *   `LocalVehicle` into the Room cache and writes a `KnownVehicle` with `state = PAIRED`, `mac` /
 *   `btuName` / `firmwareVersion` taken from the bike over BLE, and `vehicleName` / `modelId` taken
 *   from the placeholder.
 * - The Start screen's tap handler ([StartOnNextGuardFingerprint]) has a sentinel guard that
 *   silently swallows a tap on the `LocalVehicle.UNKNOWN` placeholder (the app's own "no real
 *   selection" marker, which is exactly what the catalog stub serves). Without neutralizing it the
 *   card renders but tapping does nothing. The patch zeroes that comparison so the placeholder
 *   navigates on to the Reset/bond screen.
 *
 * ## What it does NOT do
 *
 * The handlebar control pages (meter layout, which of call/music/navigation/message/volume exist)
 * are resolved from the paired `LocalVehicle`, joined to the `KnownVehicle` by `modelId`
 * (`… JOIN tVehicles ON vehicles.modelId = tVehicles.modelLabel`), **not** from the BLE
 * `displayCapability[]`. With the built-in "Unknown" placeholder those pages fall back to defaults,
 * so you reach the controls but the layout may not match the exact model. Making them exact needs a
 * real catalog `LocalVehicle` for the bike in place of the placeholder (a later refinement); the
 * bike's series code stored on the `KnownVehicle` comes out as `"UNKNOWN"` in that case, which is
 * harmless because the join is by `modelId`, not series code.
 *
 * On by default for the same reason as the login bypass: a re-signed build can never reach the
 * catalog server, so the stock pairing flow is dead weight. Disable it (with the login bypass) only
 * on a build whose signature Honda's project still accepts, where the real catalog works.
 */
@Suppress("unused")
val offlinePairingPatch = bytecodePatch(
    name = "Offline pairing",
    description = "Lets RoadSync pair a new motorcycle and reach the handlebar controls with no " +
        "Google account and no network, by serving the vehicle catalog locally instead of from " +
        "Honda's server. Complements \"Bypass Google login\". Control pages fall back to defaults " +
        "for the placeholder model.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ROADSYNC)

    execute {
        // getVehicles(List, List, String, Continuation): return an empty list instead of calling
        // ModelApi.listModels. saveVehicle then takes its isEmpty() fallback and pairs with the
        // user-selected vehicle. registers=12, so v0 is a free local at method entry.
        GetVehiclesFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, Lkotlin/collections/CollectionsKt;->o()Ljava/util/List;
                move-result-object v0
                return-object v0
            """,
        )

        // getVehicleSeries(List, Continuation): return listOf(LocalVehicle.Companion.a()) — the
        // built-in "Unknown" placeholder — so SelectModel renders one tappable card offline.
        // registers=6, ins=3, so v0 is free.
        GetVehicleSeriesFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/drivemode/sab/common/data/vehicles/LocalVehicle;->Companion:Lcom/drivemode/sab/common/data/vehicles/LocalVehicle${'$'}Companion;
                invoke-virtual { v0 }, Lcom/drivemode/sab/common/data/vehicles/LocalVehicle${'$'}Companion;->a()Lcom/drivemode/sab/common/data/vehicles/LocalVehicle;
                move-result-object v0
                invoke-static { v0 }, Lkotlin/collections/CollectionsKt;->e(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v0
                return-object v0
            """,
        )

        // getVehicleCatalogs(boolean, Continuation): return listOf(VehicleCatalog(placeholder, 1))
        // so the Start screen renders one tappable card offline. registers=6, ins=3, so v0..v2 are
        // free locals.
        GetVehicleCatalogsFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/drivemode/sab/common/data/vehicles/LocalVehicle;->Companion:Lcom/drivemode/sab/common/data/vehicles/LocalVehicle${'$'}Companion;
                invoke-virtual { v0 }, Lcom/drivemode/sab/common/data/vehicles/LocalVehicle${'$'}Companion;->a()Lcom/drivemode/sab/common/data/vehicles/LocalVehicle;
                move-result-object v0
                new-instance v1, Lcom/drivemode/sab/common/data/vehicles/VehicleCatalog;
                const/4 v2, 0x1
                invoke-direct { v1, v0, v2 }, Lcom/drivemode/sab/common/data/vehicles/VehicleCatalog;-><init>(Lcom/drivemode/sab/common/data/vehicles/LocalVehicle;I)V
                invoke-static { v1 }, Lkotlin/collections/CollectionsKt;->e(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v0
                return-object v0
            """,
        )

        // Start screen's onNext tap handler bails before navigating when the tapped vehicle equals
        // the app's "unknown" sentinel (SabVehicle(LocalVehicle.UNKNOWN, emptyMap)) — which is
        // exactly what the catalog stub above serves. Force the sentinel comparison to `false` so the
        // placeholder card navigates: its `modelCount` of 1 sends it straight to the Reset/bond
        // screen. See [StartOnNextGuardFingerprint].
        //
        // The guard is the method's only IF_EQZ (`if-eqz vX, :navigate` right after
        // `Intrinsics.areEqual(vehicle, sentinel)`); zeroing that register makes it always branch to
        // the navigation. The register is reused and reassigned on the navigation path, so clobbering
        // it here is safe.
        val guard = StartOnNextGuardFingerprint.method
        val instructions = guard.implementation!!.instructions
        val ifIndex = instructions.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        val register = (instructions[ifIndex] as OneRegisterInstruction).registerA
        guard.addInstructions(ifIndex, "const/4 v$register, 0x0")

        // getSetupPage(String, String, Continuation): return a static local HTML page instead of
        // calling ModelApi.listModelSetupPage. loadHtml wraps it in UiState.Success, so the Reset
        // screen shows instructions and lets the scan start instead of emitting UiState.ServerError.
        // registers=8 (this + 2 String + Continuation → v4..v7), so v0 is a free local.
        GetSetupPageFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "<html><body><h2>Pairing mode</h2><p>Put the motorcycle into BTU pairing mode, then start the scan.</p></body></html>"
                return-object v0
            """,
        )
    }
}
