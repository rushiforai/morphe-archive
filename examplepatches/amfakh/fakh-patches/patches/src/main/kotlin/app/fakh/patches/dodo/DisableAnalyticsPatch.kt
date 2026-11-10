package app.fakh.patches.dodo

import app.fakh.patches.dodo.shared.Constants.COMPATIBILITY_DODO
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/** Static SDK entry points that MainApp.onCreate calls directly, so disabling their providers is not enough. */
private val TRACKER_INITS = mapOf(
    "Lcom/adjust/sdk/Adjust;" to setOf("initSdk"),
    "Lcom/tiktok/TikTokBusinessSdk;" to setOf("initializeSdk", "startTrack"),
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops Adjust and TikTok from tracking installs and in-app events, and turns off Firebase " +
        "Analytics, Crashlytics, Performance and Sessions, which get every action you take in the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DODO)
    category("Privacy")
    dependsOn(firebaseManifestPatch())

    execute {
        var stubbed = 0
        classDefForEach { classDef ->
            val names = TRACKER_INITS[classDef.type] ?: return@classDefForEach
            mutableClassDefBy(classDef).methods.filter { it.name in names && it.returnType == "V" }.forEach {
                it.addInstructions(0, "return-void")
                stubbed++
            }
        }
        // Adjust.initSdk, both TikTokBusinessSdk.initializeSdk overloads and startTrack.
        if (stubbed != 4) throw PatchException("Expected 4 tracker init methods, found $stubbed")
    }
}
