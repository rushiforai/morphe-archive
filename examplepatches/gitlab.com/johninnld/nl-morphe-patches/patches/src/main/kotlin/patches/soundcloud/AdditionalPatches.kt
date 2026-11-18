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
private const val TIER = "${ROOT}configuration/plans/Tier;"
private const val PLAN = "${ROOT}configuration/plans/ConsumerPlan;"
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
val ignoreDeviceLimitPatch = bytecodePatch(
    name = "Ignore device limit",
    description = "SoundCloud signs in on up to ten devices: the /configuration response marks " +
        "the device authorized or not, and only the app itself enforces that -- a new sign-in that " +
        "is marked unauthorized never finishes, the server can also refuse the registration request " +
        "outright, and a configuration refresh signs an existing device out and revokes its token. " +
        "This patch skips the registration call at sign-in and ignores the unauthorized state, so " +
        "signing in and staying signed in no longer depend on it. The install then stays unregistered " +
        "in SoundCloud's device list, and if the servers ever enforce the count beyond these " +
        "handshakes, the patch cannot help.",
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput)
    execute {
        // Both gates read the state only through these predicates, which read the parsed
        // field directly: DefaultSignInOperations.b() refuses the sign-in (DEVICE_CONFLICT
        // when recoverable, DEVICE_BLOCK otherwise), and ConfigurationManager.d() logs the
        // device out and revokes its token on the next configuration refresh.
        for (predicate in listOf("isUnauthorized", "isRecoverableBlock", "isUnrecoverableBlock"))
            exact("foundation/domain/configuration/DeviceManagement", predicate, "Z")
                .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // The registration request itself can also be refused over HTTP for a device past
        // the limit, which fails the sign-in before any flag exists. Skip the registration
        // handshake entirely: the sign-in proceeds without registering this install, and
        // the startup configuration fetch (whose failures are only reported, never fatal)
        // takes over as on a fresh session.
        exact("onboarding/auth/DefaultSignInOperations", "b",
            "Lcom/soundcloud/java/optional/Optional;", "Z", "${ROOT}api/oauth/Token;")
            .addInstructions(0, """
                invoke-static {}, Lcom/soundcloud/java/optional/Optional;->a()Lcom/soundcloud/java/optional/Optional;
                move-result-object v0
                return-object v0
            """)
    }
}


@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable SoundCloud Go",
    description = "Enables local Go+ plan controls and the offline_sync, no_audio_ads and hq_audio feature " +
        "switches from the /configuration response, hides Go upsells and consumer-plan transition screens, " +
        "and disables client ad requests and display placements. SoundCloud's servers still decide which " +
        "streams, downloads and audio quality the account may fetch: high-bitrate audio and encrypted " +
        "offline copies stay tied to a real Go+ subscription.",
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput)
    extendWith("extensions/soundcloud.mpe")
    execute {
        // Force the three Go feature switches where the /configuration response is parsed. The
        // constructor stores the flag through its (String, boolean) delegation, so rewriting p2
        // before the original body runs covers every later read, including the feature preferences
        // update and its observable. The constructor has no local registers, so the static helper
        // takes the parameter registers directly and move-result writes p2 back.
        val goPlus = "Lnl/johninnl/soundcloud/GoPlus;"
        exact("configuration/plans/Feature", "<init>", "V", STRING, "Z", "Ljava/util/List;").apply {
            if (implementation!!.registerCount != 4)
                throw PatchException("SoundCloud feature constructor gained local registers")
            addInstructions(0, """
                invoke-static {p1, p2}, $goPlus->feature(${STRING}Z)Z
                move-result p2
            """)
        }

        // Keep backend parsing and normal plan storage updates; replace only the client plan values.
        exact("configuration/plans/UserConsumerPlan", "<init>", "V", STRING, "Z", STRING,
            "Ljava/util/List;", STRING, STRING).addInstructions(0, """
                const-string p1, "high_tier"
                const-string p5, "go-plus"
                const-string p6, "SoundCloud Go"
            """)
        if (classDefBy(TIER).fields.none { it.name == "HIGH" && it.type == TIER } ||
            classDefBy(PLAN).fields.none { it.name == "GO_PLUS" && it.type == PLAN })
            throw PatchException("SoundCloud Go plan constants changed")
        exact("configuration/data/ConfigurationSettingsStorage", "b", TIER)
            .addInstructions(0, "sget-object v0, $TIER->HIGH:$TIER\nreturn-object v0")
        exact(FEATURES, "getCurrentTier", TIER)
            .addInstructions(0, "sget-object v0, $TIER->HIGH:$TIER\nreturn-object v0")
        exact(FEATURES, "getCurrentConsumerPlan", PLAN)
            .addInstructions(0, "sget-object v0, $PLAN->GO_PLUS:$PLAN\nreturn-object v0")

        val noUpsell = "${ROOT}upsell/UpsellType\$None;"
        if (classDefBy(noUpsell).fields.none { it.name == "INSTANCE" && it.type == noUpsell })
            throw PatchException("SoundCloud no-upsell singleton changed")
        exact("upsell/UpsellVisibilityController", "mapToPlan", "${ROOT}upsell/UpsellType;",
            "${ROOT}upsell/ApiMobileUpsellApplianceGraph;")
            .addInstructions(0, "sget-object v0, $noUpsell->INSTANCE:$noUpsell\nreturn-object v0")

        // The old b(RootActivity) hook no longer exists. The new a() also refreshes configuration;
        // suppress consumer transition navigation instead, preserving refresh and disposal.
        for ((name, type) in listOf("c" to "Offboarding", "d" to "Onboarding")) {
            exact("configuration/DefaultConfigurationUpdatesLifecycleObserver", name, "V",
                "${ROOT}payments/plantransitions/pub/PlanInTransition\$Fan;",
                "${ROOT}payments/plantransitions/pub/TransitionType\$$type;", "J", "J", STRING)
                .addInstructions(0, "return-void")
        }
        for (name in listOf("getShouldRequestAds", "isMonetizableAdGeo")) {
            exact(FEATURES, name, "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }

        // Kotlin serialization bypasses the ordinary data-class constructor in this release.
        val ads = "ads/display/data/config/"
        val gam = "$ROOT${ads}GamConfiguration;"
        val aditude = "$ROOT${ads}AditudeConfiguration;"
        exact(ads + "AdPlacementConfiguration", "<init>", "V", "Z", gam, aditude)
            .addInstructions(0, "const/4 p1, 0x0")
        exact(ads + "AdPlacementConfiguration", "<init>", "V", "I", "Z", gam, aditude)
            .addInstructions(0, "const/4 p2, 0x0")
    }
}
