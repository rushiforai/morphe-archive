package patches.soundcloud

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import patches.shared.uniqueMatch

private const val ROOT = "Lcom/soundcloud/android/"
private const val FEATURES = "configuration/features/DefaultFeatureOperations"
private const val STRING = "Ljava/lang/String;"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun exact(owner: String, name: String, result: String, vararg parameters: String) =
    Fingerprint(definingClass = "$ROOT$owner;", name = name, returnType = result,
        parameters = parameters.toList()).uniqueMatch().method

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops SoundCloud's TrackingHandler from storing and dispatching analytics events. " +
        "Other tracking SDKs and online services remain active.",
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput)
    execute {
        // Keep the shutdown control message: swallowing it leaks the worker Looper after idle.
        exact("analytics/base/TrackingHandler", "a", "V", "Landroid/os/Message;").apply {
            if (implementation!!.registerCount < 4)
                throw PatchException("SoundCloud tracking dispatcher has no free registers")
            addInstructionsWithLabels(0, """
                iget v0, p1, Landroid/os/Message;->what:I
                const v1, -0x21524111
                if-eq v0, v1, :morphe_shutdown
                return-void
            """, ExternalLabel("morphe_shutdown", getInstruction(0)))
        }
    }
}

@Suppress("unused")
val disableConsentPatch = bytecodePatch(
    name = "Disable consent popup",
    description = "Uses SoundCloud's no-op consent controller to skip the OneTrust popup. " +
        "Does not grant consent or disable tracking; select Disable analytics separately.",
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput)
    execute {
        val noop = "${ROOT}privacy/consent/base/NoopPrivacyConsentController;"
        val singleton = classDefBy(noop).fields.singleOrNull {
            it.type == noop && AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw PatchException("SoundCloud no-op consent singleton changed")
        exact("privacy/consent/main/PrivacyConsentControllerModule\$Companion", "a",
            "${ROOT}privacy/consent/base/PrivacyConsentController;",
            "${ROOT}privacy/legislation/LegislationOperations;", "Ldagger/Lazy;")
            .addInstructions(0, "sget-object v0, $noop->${singleton.name}:$noop\nreturn-object v0")
    }
}


@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads and upsells",
    description = "Stops SoundCloud from requesting audio/display ads and hides Go upsell prompts. " +
        "Does not change the account's plan, features or entitlements.",
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput)
    execute {
        // Client-side ad request switches.
        for (name in listOf("getShouldRequestAds", "isMonetizableAdGeo")) {
            exact(FEATURES, name, "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }

        // Kotlin serialization bypasses the ordinary data-class constructor in this release,
        // so zero the display placement flag in both generated constructors.
        val ads = "ads/display/data/config/"
        val gam = "$ROOT${ads}GamConfiguration;"
        val aditude = "$ROOT${ads}AditudeConfiguration;"
        exact(ads + "AdPlacementConfiguration", "<init>", "V", "Z", gam, aditude)
            .addInstructions(0, "const/4 p1, 0x0")
        exact(ads + "AdPlacementConfiguration", "<init>", "V", "I", "Z", gam, aditude)
            .addInstructions(0, "const/4 p2, 0x0")

        // Hide upsell prompts only; plan and feature state stay untouched.
        val noUpsell = "${ROOT}upsell/UpsellType\$None;"
        if (classDefBy(noUpsell).fields.none { it.name == "INSTANCE" && it.type == noUpsell })
            throw PatchException("SoundCloud no-upsell singleton changed")
        exact("upsell/UpsellVisibilityController", "mapToPlan", "${ROOT}upsell/UpsellType;",
            "${ROOT}upsell/ApiMobileUpsellApplianceGraph;")
            .addInstructions(0, "sget-object v0, $noUpsell->INSTANCE:$noUpsell\nreturn-object v0")
    }
}
