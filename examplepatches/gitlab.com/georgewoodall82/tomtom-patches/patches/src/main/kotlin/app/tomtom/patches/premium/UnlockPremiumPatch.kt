package app.tomtom.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.tomtom.patches.shared.Constants.COMPATIBILITY_TOMTOM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Unlocks the TomTom GO / GO Expert subscription locally.
 *
 * ## How the subscription works in 3.6.326
 *
 * There is no native code and no local license file. `pb/a` (the subscription
 * context) combines three providers behind `qb/a.e1()`:
 *
 *   Ua/o  -> Google Play purchases (Purchasely checkout)
 *   sb/d  -> LCMS server entitlements (TomTom account)
 *   qb/b  -> decorators (trial filtering, legacy migration)
 *
 * `qb/a$b` folds every provider result into one boolean:
 * "hasActiveSubscriptions". That boolean is what the route/checkout screens,
 * the Android Auto hook and the car-subscription hook branch on.
 *
 * The other half is `N9/c`, which maps the subscription list to a state:
 * FULL_TRIAL / EXPIRING_TRIAL / NO_SUBSCRIPTION / STORE_SUBSCRIPTION /
 * LCMS_SUBSCRIPTION. The onboarding hooks (`H9/G0`, `H9/B`, `H9/K0`,
 * `H9/V0`, `H9/P0`) use that state to decide whether to show the trial
 * timeline, the paywall, the "subscription migrated" dialog or the
 * "30 days free" screen.
 *
 * ## What this patch changes
 *
 * 1. `qb/a$b.invoke` -> always TRUE. Every "needs a subscription" branch
 *    passes, including the ones that are not tied to the LCMS list.
 * 2. `N9/c.invoke` -> always STORE_SUBSCRIPTION. The app considers the user
 *    a paying store subscriber forever; no trial / expired state is fed to
 *    the hooks.
 * 3. `tb/d.f` -> false. Nothing is classified as a trial anymore, so the
 *    trial-card lookup and the trial filters find nothing.
 * 4. `H9/G0.e` -> skip straight to the post-onboarding path. No trial
 *    timeline and no Purchasely paywall on first launch.
 * 5. `e9/v2.J1` -> null. The subscription shop stops rendering the
 *    "Free Trial / Ends: <date>" card.
 *
 * ## What this patch does NOT do
 *
 * Live services that TomTom's servers gate per account (live traffic,
 * speed-camera feeds, map updates, MyDrive sync) still require a real
 * server-side entitlement. Offline navigation, truck routing and the UI
 * unlock locally.
 *
 * All fingerprints are pinned to 3.6.326 and verified by verify.py.
 */
@Suppress("unused")
val unlockSubscriptionPatch = bytecodePatch(
    name = "Unlock Premium Subscription",
    description = "Forces TomTom's subscription checks to report an active paid plan, hides the trial timeline/paywall and removes the free-trial card.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TOMTOM)

    execute {
        // "hasActiveSubscriptions" -> true for every provider combination.
        HasActiveSubscriptionsFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """,
        )

        // Subscription state -> STORE_SUBSCRIPTION (paid, not trial).
        SubscriptionStateFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, LN9/a;->d:LN9/a;
                return-object v0
            """,
        )

        // Nothing is a trial.
        IsTrialFingerprint.method.returnEarly(false)

        // Onboarding subscription step: skip the trial/paywall screen and
        // finish the hook immediately, exactly like a completed purchase.
        SubscriptionOnboardingFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, LH9/G0;->f:Lv9/n;
                invoke-virtual {v0}, Lv9/n;->c()V
                sget-object v0, LQ8/c;->a:LQ8/c;
                invoke-virtual {p0, v0}, LH9/b${'$'}a;->f(LQ8/c;)V
                return-void
            """,
        )

        // Subscription shop: no "Free Trial" card.
        TrialCardFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}

/**
 * Unlocks the full truck vehicle profile.
 *
 * TomTom decides whether to expose the complete truck profile (dimensions,
 * weight, axle load, ADR classes, ...) from the `show_full_vehicle_profile`
 * system setting. Only a detected truck subscription sets it, and a second
 * observer (`x9/r0`) silently flips a truck profile back to CAR whenever the
 * setting is false.
 *
 * This patch:
 * 1. `x9/x0.a` -> on every subscription update, force
 *    show_full_vehicle_profile=true and TRUCK_SUBSCRIPTION_PURCHASED=true.
 * 2. `x9/r0.a` -> never revert the profile to car.
 * 3. `e9/K2.<init>` -> force the in-memory flag true as well, so the screen
 *    is complete even if it is opened before the LCMS list arrives.
 */
@Suppress("unused")
val unlockTruckProfilePatch = bytecodePatch(
    name = "Unlock Truck Profile",
    description = "Enables the full truck vehicle profile (dimensions, weight, ADR, etc.) and stops the app from reverting it to a car profile.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TOMTOM)

    execute {
        // x9/x0.a(List): apply truck flags instead of deriving them from the
        // (often empty) subscription list.
        TruckFlagsFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lx9/x0;->g:Lcom/tomtom/navui/systemport/SystemSettings;
                const-string v1, "com.tomtom.navui.setting.show_full_vehicle_profile"
                const/4 v2, 0x1
                invoke-interface {v0, v1, v2}, Lcom/tomtom/navui/systemport/SystemSettings;->putBoolean(Ljava/lang/String;Z)V
                const-string v1, "com.tomtom.mobile.TRUCK_SUBSCRIPTION_PURCHASED"
                invoke-interface {v0, v1, v2}, Lcom/tomtom/navui/systemport/SystemSettings;->putBoolean(Ljava/lang/String;Z)V
                iput-object p1, p0, Lx9/x0;->s:Ljava/util/List;
                return-void
            """,
        )

        // x9/r0.a(): never switch a truck profile back to car.
        VehicleProfileRevertFingerprint.method.addInstructions(0, "return-void")

        // e9/K2.<init>: force the cached "full profile" flag on.
        val ctor = VehicleProfileModelFingerprint.method
        val index = ctor.implementation!!.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IPUT_BOOLEAN &&
                instruction is Instruction22c &&
                (instruction.reference as? FieldReference)?.name == "y2"
        }
        check(index >= 0) {
            "e9/K2.<init>: iput-boolean y2 not found; this bundle is pinned to TomTom 3.6.326"
        }
        ctor.addInstructions(
            index + 1,
            """
                const/4 v0, 0x1
                iput-boolean v0, p0, Le9/K2;->y2:Z
            """,
        )
    }
}
