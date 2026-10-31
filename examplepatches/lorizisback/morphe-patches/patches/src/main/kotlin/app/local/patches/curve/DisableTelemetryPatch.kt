package app.local.patches.curve

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly

private const val ANALYTICS = "Lcom/curve/analytics/"
private const val TELEMETRY_CONTINUATION = "Lkotlin/coroutines/Continuation;"
private const val OBJECT = "Ljava/lang/Object;"

private fun BytecodePatchContext.telemetryMethod(
    owner: String, name: String, result: String, vararg parameters: String
) = Fingerprint(
    definingClass = owner, name = name, returnType = result,
    parameters = parameters.toList(), isStatic = false
).matchSingle().method

private fun MutableMethod.completeTelemetryStartup() {
    addInstructions(0, """
        sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
        return-object v0
    """)
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable optional telemetry",
    description = "Disables known analytics, marketing, crash and performance reporting. Removes Braze promotions and attribution. Account, payment, security and support services still communicate with their servers.",
    default = false
) {
    compatibleWith(Compatibility(
        name = "Curve Pay", packageName = "com.imaginecurve.curve.prd",
        apkFileType = ApkFileType.APKM, appIconColor = 0x1C1C1C,
        targets = listOf(AppTarget(version = "5.63.0"))
    ))

    execute {
        // Keep the repository contract, but do not identify users or dispatch events to adapters.
        val repository = "${ANALYTICS}data/repository/CurveAnalyticsRepositoryImpl;"
        val event = "${ANALYTICS}domain/events/CurveEvent;"
        val platform = "${ANALYTICS}domain/AnalyticsPlatform;"
        for (name in listOf("trackEvent", "addDefaultEventProperties", "addDefaultUserProperties")) {
            telemetryMethod(repository, name, "V", event).returnEarly()
        }
        telemetryMethod(repository, "reset", "V").returnEarly()
        telemetryMethod(repository, "setTrackingId", "V", "Ljava/lang/String;").returnEarly()
        telemetryMethod(repository, "activateTracker", "V", platform, "Z").returnEarly()
        telemetryMethod(
            repository, "updateCookiesConsent", "V", platform,
            "Lcom/curve/core/sharedpreferences/CookiesConsent;"
        ).returnEarly()

        // Application setup, dependency injection and local error handling must still run.
        val core = "Lcom/curve/core/setup/CurveCore;"
        telemetryMethod(core, "initLoggers", "V").returnEarly()
        telemetryMethod(core, "initTrackers", "V", "Landroid/app/Application;").returnEarly()
        telemetryMethod("Lio/embrace/android/embracesdk/Embrace;", "start", "V", "Landroid/content/Context;")
            .returnEarly()

        // These suspend functions only configure analytics. Complete them; never suspend or return null.
        for ((owner, name) in listOf(
            "${ANALYTICS}startup/AppsFlyerStarter;" to "init",
            "Lu26;" to "init",
            "Lp20;" to "identifyBrazeUser",
            "Lp20;" to "setupDefaultAnalyticsProperties"
        )) telemetryMethod(owner, name, OBJECT, TELEMETRY_CONTINUATION).completeTelemetryStartup()

        val appsFlyer = "${ANALYTICS}data/appsflyer/AppsFlyerDelegate;"
        telemetryMethod(appsFlyer, "updateFcmToken", "V", "Ljava/lang/String;").returnEarly()
        telemetryMethod(appsFlyer, "getAppsFlyerId", "Ljava/lang/String;").addInstructions(0, """
            const/4 v0, 0x0
            return-object v0
        """)

        // Apply SDK gates before provider-driven initialization, regardless of saved consent values.
        telemetryMethod("Lcom/google/android/gms/measurement/internal/zzal;", "zzt", "Z").returnEarly(true)
        telemetryMethod("Lwd2;", "n", "Z").returnEarly(false)
        telemetryMethod("Lw53;", "a", "Z").returnEarly(false)
        telemetryMethod("Ljc7;", "a", "Ljava/lang/Boolean;").addInstructions(0, """
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v0
        """)

        // Braze may be touched by notification registration after startup. Keep it disabled/offline.
        val braze = "Lcom/braze/Braze\$Companion;"
        telemetryMethod(braze, "isDisabled", "Z").returnEarly(true)
        telemetryMethod("Lcom/braze/storage/c3;", "a", "Z").returnEarly(true)
        telemetryMethod(braze, "setOutboundNetworkRequestsOffline", "V", "Z")
            .addInstructions(0, "const/16 p1, 0x1")

        // A one-element flow containing an empty list lets Wallet combine its other banner sources.
        // nd1 discriminator 6 is this APK's flowOf(value), including collector suspension handling.
        telemetryMethod(
            "Lcom/curve/wallet/banner/usecase/remote/WatchRemoteInfoBannersUseCase;",
            "get", OBJECT, "Ljava/lang/String;", TELEMETRY_CONTINUATION
        ).addInstructions(0, """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            const/4 v1, 0x6
            new-instance v2, Lnd1;
            invoke-direct {v2, v0, v1}, Lnd1;-><init>(Ljava/lang/Object;I)V
            return-object v2
        """)

        // Legacy DI and logout can construct Snowplow independently of CurveCore.initTrackers.
        // Its normal paused result is null. Suppress fresh events and the old-event upload loop.
        telemetryMethod("Lq9d;", "d", "Ljava/util/UUID;", "Lag4;").addInstructions(0, """
            const/4 v0, 0x0
            return-object v0
        """)
        telemetryMethod("La74;", "a", "V", "Llh8;").returnEarly()

        // CCT only carries Google diagnostics (including previously queued reports). A permanent
        // local rejection makes its uploader delete the batch instead of retrying it. This does
        // not touch Firebase Messaging delivery, Remote Config, or Curve's own HTTP clients.
        val googleUpload = Fingerprint(
            definingClass = "Lbn1;", name = "b", returnType = "Lo50;",
            parameters = listOf("Lkme;"), isStatic = false,
            filters = listOf(string("CctTransportBackend"), string("datatransport/3.3.0 android/"))
        ).matchSingle().method
        check(googleUpload.implementation!!.registerCount >= 5)
        googleUpload.addInstructions(0, """
            new-instance v0, Lo50;
            const/16 v1, 0x190
            const/4 v2, 0x0
            const-wide/16 v3, 0x0
            invoke-direct {v0, v1, v2, v3, v4}, Lo50;-><init>(ILjava/net/URL;J)V
            return-object v0
        """)
    }
}
