package app.polishapps.patches.yanosik.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_YANOSIK
import app.polishapps.patches.shared.Constants.YANOSIK_26_10_0
import app.polishapps.patches.shared.Constants.YANOSIK_26_9_0
import app.polishapps.patches.shared.MethodTarget
import app.polishapps.patches.shared.forceInstanceOfTrue
import app.polishapps.patches.shared.methodFingerprint
import app.polishapps.patches.shared.replaceBody
import app.polishapps.patches.shared.targetsFor

private const val ADVERT_SERVICE = "Lpl/neptis/features/adsbanners/adsservice/AdvertService;"
private const val START_APP_ADVERT_SERVICE = "Lpl/neptis/data/startappadvert/StartAppAdvertService;"
private const val LAUNCHER_ACTIVITY =
    "Lpl/neptis/yanosik/mobi/android/common/ui/activities/launcher/LauncherActivity;"
private const val MAIN_REPORT_ACTIVITY =
    "Lpl/neptis/yanosik/mobi/android/common/ui/activities/main/MainReportActivity;"
private const val AUDIO_ALERTS_SERVICE = "Lpl/neptis/features/audioalerts/AudioAlertsService;"

/**
 * The PRO map style selector, added in 26.10.0.
 *
 * [selector] picks the style URL from the light/dark mode and a `DEFAULT`/`PRO` enum ([styleEnum]).
 * Callers pick `PRO` only for an active entitlement when the remote `NO_ADS_MAP_STYLE` flag is on.
 */
private data class MapStyleTarget(val selector: MethodTarget, val styleEnum: String)

private data class AdsTargets(
    /** Active premium entitlement interface. Every advert gate is `instance-of X, Y, <entitlement>`. */
    val entitlement: String,
    /** Event classes `AdvertService.checkEntitlements` clears from the sticky event bus. */
    val clearedEvents: List<String>,
    /** The "adverts disabled" event `AdvertService.checkEntitlements` posts. */
    val advertsDisabledEvent: String,
    /** Sticky event bus with `a(Class)` (remove) and `e(Object, Boolean)` (post). */
    val eventBus: String,
    /** Methods that use the entitlement check to decide whether an advert is shown. */
    val premiumGates: List<MethodTarget>,
    val mapStyle: MapStyleTarget? = null,
)

private fun suspendLambda(definingClass: String) =
    MethodTarget(definingClass, "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")

private val targetsByVersion = mapOf(
    YANOSIK_26_9_0 to AdsTargets(
        entitlement = "Ld6f;",
        clearedEvents = listOf("Lgq;", "Liq;", "Lhq;", "Llq;", "Lmq;"),
        advertsDisabledEvent = "Ljq;",
        eventBus = "Lasm;",
        premiumGates = listOf(
            MethodTarget(
                START_APP_ADVERT_SERVICE,
                "refresh\$lambda\$0",
                listOf(START_APP_ADVERT_SERVICE),
                "Ljava/lang/Object;",
            ),
            MethodTarget(LAUNCHER_ACTIVITY, "x0", listOf(LAUNCHER_ACTIVITY, "J", "L"), "Ljava/lang/Object;"),
            MethodTarget(MAIN_REPORT_ACTIVITY, "onCreate", listOf("Landroid/os/Bundle;"), "V"),
            suspendLambda("Lm8b;"),
            suspendLambda("Lk9k;"),
            suspendLambda("Lxo;"),
            MethodTarget("Lni8;", "invoke", listOf("L", "L", "L", "L"), "Ljava/lang/Object;"),
            // Voice adverts.
            MethodTarget("Lzr;", "J"),
            MethodTarget("Letc;", "f"),
            MethodTarget("Lur;", "x", listOf("L", "L")),
            MethodTarget("Lur;", "y", listOf("L")),
            MethodTarget(AUDIO_ALERTS_SERVICE, "tryToPlay"),
            // "More comfort, no ads" alert.
            MethodTarget("Lxok;", "g", listOf("L"), "L"),
        ),
    ),
    YANOSIK_26_10_0 to AdsTargets(
        entitlement = "Lgbf;",
        clearedEvents = listOf("Lnq;", "Lpq;", "Loq;", "Lsq;", "Ltq;"),
        advertsDisabledEvent = "Lqq;",
        eventBus = "Lk7n;",
        premiumGates = listOf(
            MethodTarget(
                START_APP_ADVERT_SERVICE,
                "refresh\$lambda\$0",
                listOf(START_APP_ADVERT_SERVICE),
                "Ljava/lang/Object;",
            ),
            MethodTarget(LAUNCHER_ACTIVITY, "v0", listOf(LAUNCHER_ACTIVITY, "J", "L"), "Ljava/lang/Object;"),
            MethodTarget(MAIN_REPORT_ACTIVITY, "onCreate", listOf("Landroid/os/Bundle;"), "V"),
            suspendLambda("Lkbb;"),
            suspendLambda("Ldkk;"),
            suspendLambda("Ldp;"),
            MethodTarget("Lsl8;", "invoke", listOf("L", "L", "L", "L"), "Ljava/lang/Object;"),
            // Voice adverts.
            MethodTarget("Lgs;", "J"),
            MethodTarget("Lbxc;", "f"),
            MethodTarget("Lcs;", "w", listOf("L", "L")),
            MethodTarget("Lcs;", "x", listOf("L")),
            MethodTarget(AUDIO_ALERTS_SERVICE, "tryToPlay"),
            // "More comfort, no ads" alert.
            MethodTarget("Lu1l;", "g", listOf("L"), "L"),
        ),
        mapStyle = MapStyleTarget(
            selector = MethodTarget("Lfib;", "c", listOf("Lflb;", "Lclb;"), "Ljava/lang/String;"),
            styleEnum = "Lclb;",
        ),
    ),
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Yanosik ads",
    description = "Removes banner ads, splash/start adverts, voice adverts, advert-based navigation POIs " +
        "and selects the ad-free map style.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANOSIK)

    execute {
        val targets = targetsFor(targetsByVersion)

        // Banner service: always take the "adverts disabled" branch.
        methodFingerprint(ADVERT_SERVICE, "isAnyEntitlementsActive", returnType = "Z").method.replaceBody(
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        val clearEvents = targets.clearedEvents.joinToString("\n") { event ->
            """
                const-class p1, $event
                invoke-static {p1}, ${targets.eventBus}->a(Ljava/lang/Class;)V
            """
        }
        methodFingerprint(ADVERT_SERVICE, "checkEntitlements", parameters = listOf("Z")).method.replaceBody(
            """
                $clearEvents
                new-instance p1, ${targets.advertsDisabledEvent}
                invoke-direct {p1}, Ljava/lang/Object;-><init>()V
                const/4 v0, 0x1
                invoke-static {p1, v0}, ${targets.eventBus}->e(Ljava/lang/Object;Z)V
                invoke-direct {p0}, $ADVERT_SERVICE->stopTimer()V
                return-void
            """,
        )

        // Banner fragments render nothing.
        for (fragment in listOf("dashboard/AdsDashboardMainFragment", "small/AdsSmallMainFragment")) {
            methodFingerprint(
                "Lpl/neptis/features/adsbanners/banners/$fragment;",
                "onCreateView",
                parameters = listOf(
                    "Landroid/view/LayoutInflater;",
                    "Landroid/view/ViewGroup;",
                    "Landroid/os/Bundle;",
                ),
                returnType = "Landroid/view/View;",
            ).method.replaceBody(
                """
                    const/4 v0, 0x0
                    return-object v0
                """,
            )
        }

        // Entitlement-gated advert code paths: forcing the check to `true` suppresses the advert.
        targets.premiumGates.forEach { gate ->
            gate.fingerprint().method.forceInstanceOfTrue(targets.entitlement)
        }

        // Map: always load the PRO ("no ads") style. Overriding the style argument at the selector
        // covers every map screen and does not depend on the remote `NO_ADS_MAP_STYLE` flag.
        targets.mapStyle?.let { mapStyle ->
            mapStyle.selector.fingerprint().method.addInstruction(
                0,
                "sget-object p1, ${mapStyle.styleEnum}->PRO:${mapStyle.styleEnum}",
            )
        }

        // Settings: never set up the "buy PRO" upsell alert banner.
        methodFingerprint(
            "Lpl/neptis/features/settings/AppPreferenceActivity;",
            "setupProAlert",
            returnType = "V",
        ).method.replaceBody(
            """
                return-void
            """,
        )
    }
}
