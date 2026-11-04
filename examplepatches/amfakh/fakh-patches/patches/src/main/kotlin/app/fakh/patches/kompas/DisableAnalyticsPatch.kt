package app.fakh.patches.kompas

import app.fakh.patches.kompas.shared.Constants.COMPATIBILITY_KOMPAS
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/** AppsFlyer entry points that start attribution or log an event; `init` returns the library, the rest return nothing. */
private val APPSFLYER_VOID = setOf("start", "logEvent")

/**
 * Mixpanel's hasOptedOutTracking (R8-renamed): every track call returns early when it is true. The app calls the
 * Mixpanel instance directly on each screen, so the instance has to exist and opt out instead of not being built.
 */
private object MixpanelOptedOutFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("Cannot read opt out flag from sharedPreferences."),
)

/**
 * Insider's init, called from KompasComApp.onCreate. Without it the SDK never starts a session or sends the events
 * the app logs (they stay queued in memory); its marketing pushes are still shown through the app's messaging service.
 */
private object InsiderInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/ertanto/kompas/official/KompasComApp;"),
    strings = listOf("kompasindonesia"),
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops AppsFlyer, Mixpanel and Insider from tracking installs, reads and other in-app events, and " +
        "turns off Firebase Analytics, Crashlytics, Performance and Sessions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KOMPAS)
    category("Privacy")
    dependsOn(firebaseManifestPatch())

    execute {
        MixpanelOptedOutFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
        InsiderInitFingerprint.method.addInstructions(0, "return-void")

        var stubbed = 0
        classDefForEach { classDef ->
            // The R8-renamed AppsFlyerLib implementation that getInstance() returns.
            if (classDef.superclass != "Lcom/appsflyer/AppsFlyerLib;") return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name == "init" && method.returnType == "Lcom/appsflyer/AppsFlyerLib;" -> {
                        method.addInstructions(0, "return-object p0")
                        stubbed++
                    }
                    method.name in APPSFLYER_VOID && method.returnType == "V" -> {
                        method.addInstructions(0, "return-void")
                        stubbed++
                    }
                }
            }
        }
        // init, three start overloads and two logEvent overloads.
        if (stubbed != 6) throw PatchException("Kompas: expected 6 AppsFlyer entry points, found $stubbed")
    }
}
