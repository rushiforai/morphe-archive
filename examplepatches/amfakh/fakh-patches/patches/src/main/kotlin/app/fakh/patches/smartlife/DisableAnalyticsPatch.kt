package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_TUYA_SMART
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val APPSFLYER_CORE = "Lcom/appsflyer/internal/AFa1tSDK;"

/** AppsFlyer entry points that start attribution or log an event; `init` returns the library, the rest return nothing. */
private val APPSFLYER_VOID = setOf("start", "logEvent")

/**
 * The app's own switch that turns Firebase Analytics collection back on at runtime, overriding the manifest: a static
 * `(boolean)` method that logs "setAnalyticsCollectionEnabled(". R8 renames it between releases, so it is found by
 * that string.
 */
private object EnableAnalyticsCollectionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith("setAnalyticsCollectionEnabled(") == true
        } == true
    },
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops AppsFlyer from tracking installs and in-app events, and turns off Firebase Analytics, " +
        "Crashlytics, Performance and Sessions. Tuya's own usage statistics are left on.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Privacy")
    dependsOn(firebaseManifestPatch())

    execute {
        // The app turns Firebase Analytics collection on after login; without this it would override the manifest.
        EnableAnalyticsCollectionFingerprint.method.addInstructions(0, "return-void")

        var stubbed = 0
        classDefForEach { classDef ->
            if (classDef.type != APPSFLYER_CORE) return@classDefForEach
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
        if (stubbed != 6) throw PatchException("Smart Life: expected 6 AppsFlyer entry points, found $stubbed")
    }
}
