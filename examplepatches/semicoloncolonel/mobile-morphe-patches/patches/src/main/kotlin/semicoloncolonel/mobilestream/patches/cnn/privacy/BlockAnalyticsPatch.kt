package semicoloncolonel.mobilestream.patches.cnn.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// CNN starts each SDK from FeatureSDKInitializer. Its method names are
// R8-renamed, so each start method is found by a literal it uses. Adobe,
// AppsFlyer, Chartbeat, CNN's Zion/Snowplow collector and "dalton" never
// start. CNN keeps OkHttp's public names, so both shared blocking layers
// apply as well.
//
// On 26.21.0 each SDK starts in its own method, and the method returns at
// once. 26.23.0 merged the AppsFlyer, Chartbeat, Google ads, Adobe, Arkose,
// purchase and Airship starts into one method, which ends by setting
// StartupManager.h, the flag the splash screen waits for. Returning from that
// method at once left the app on the splash screen forever. In a method that
// sets the flag, only the AppsFlyer and Chartbeat start calls are removed;
// Adobe's start is inlined there, so its hosts are left to the shared host
// blocklist.
//
// Not touched: Airship push and in-app messages, Arkose sign-in, purchases,
// the article meter, TV-provider sign-in, Optimizely flags, OneTrust consent,
// content or video.
// ─────────────────────────────────────────────────────────────────────────────

private const val STARTUP_MANAGER = "Lcom/cnn/mobile/android/phone/data/environment/StartupManager;"

private class SdkStartFingerprint(anchor: String) : Fingerprint(
    definingClass = "Lcom/cnn/mobile/android/phone/data/environment/FeatureSDKInitializer;",
    parameters = listOf(),
    returnType = "V",
    strings = listOf(anchor),
)

private val trackerStarts = listOf(
    "Failed to Initialize Adobe Analytics!", "apps_flyer", "chartbeat", "zionApiEndpoint", "dalton",
).map(::SdkStartFingerprint)

// The tracker SDK start calls removed from a method that also signals startup.
// Both return void, so no move-result is left behind.
private fun Instruction.isTrackerStartCall(): Boolean {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return when (reference.definingClass) {
        "Lcom/appsflyer/AppsFlyerLib;" -> reference.name == "start" && reference.returnType == "V"
        "Lcom/chartbeat/androidsdk/Tracker;" -> reference.name == "setupTracker" && reference.returnType == "V"
        else -> false
    }
}

// Whether the method sets a StartupManager flag, which the splash waits for.
private fun MutableMethod.signalsStartup(): Boolean = implementation?.instructions?.any { instruction ->
    instruction.opcode == Opcode.IPUT_BOOLEAN &&
        ((instruction as ReferenceInstruction).reference as FieldReference).definingClass == STARTUP_MANAGER
} == true

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Several anchors can find the same merged method, so each is handled once.
        trackerStarts.mapNotNull { it.methodOrNull }
            .distinctBy { "${it.definingClass}->${it.name}" }
            .forEach { method ->
                if (method.signalsStartup()) {
                    val instructions = method.implementation!!.instructions.toList()
                    instructions.indices.reversed().forEach { index ->
                        if (instructions[index].isTrackerStartCall()) method.removeInstruction(index)
                    }
                } else {
                    method.addInstructions(0, "return-void")
                }
            }

        blockTrackers()
    }
}
