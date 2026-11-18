package patches.beachbuggy

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcode
import patches.shared.disableMeasurementAndAttribution

private const val ANALYTICS = "Lcom/vectorunit/VuAnalyticsHelper;"

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { disableMeasurementAndAttribution(it) }
    }
}

internal val beachBuggyTrackingGate = bytecodePatch {
    dependsOn(originalInput, trackingResources)

    execute {
        val owner = mutableClassDefBy(ANALYTICS)
        for ((name, parameters) in listOf("logEvent" to 1, "setUserProperty" to 2)) {
            val method = owner.methods.singleOrNull {
                it.name == name && it.returnType == "V" && it.parameterTypes.size == parameters
            } ?: error("Beach Buggy analytics method changed: $name")
            val body = method.implementation?.instructions?.toList().orEmpty()
            check(body.size >= 2 && body.first().opcode != Opcode.RETURN_VOID &&
                body.last().opcode == Opcode.RETURN_VOID) {
                "Beach Buggy analytics method $name changed or patch already applied"
            }
            method.addInstructions(0, "return-void")
        }
    }
}

@Suppress("unused")
val beachBuggyDisableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Silences the Firebase Analytics event and user-property paths and switches off " +
        "Google measurement, Crashlytics and Sessions upload, and advertising and install-referrer " +
        "permissions in the manifest. Gameplay and Play Games sign-in keep working.",
    default = true,
) {
    compatibleWith(beachBuggy)
    dependsOn(beachBuggyTrackingGate)
}
