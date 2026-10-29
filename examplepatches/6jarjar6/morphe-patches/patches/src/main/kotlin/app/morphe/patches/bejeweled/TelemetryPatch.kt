package app.morphe.patches.bejeweled

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.shared.Constants

/**
 * Telemetry-disabled patch for Bejeweled Classic.
 *
 * Stopping telemetry requires cutting MORE than the Nimble/Synergy gate — the
 * game bundles a far wider analytics / ad stack. This patch neutralises each
 * live channel at its cheapest, safest choke point:
 *
 *  1. Nimble/Synergy (the game's own tracker)
 *     - [IsAbleToPostEventFingerprint] — force `isAbleToPostEvent` to always return
 *       false; tracking events queue locally but never POST.
 *     - [OperationalTelemetryLogEventFingerprint] — drop the secondary operational stream.
 *  2. Firebase (Analytics + Crashlytics + ML + auth)
 *     - [CctTransportSendFingerprint] — the one DataTransport egress method; turned
 *       into a thrown IOException so every upload is "deferred" and never leaves the device.
 *  3. GLUAnalytics (the central EA analytics hub)
 *     - `init` / `logEvent` / `doLogEvent` (both overloads) — early-return so the hub
 *       neither starts nor accumulates/dispatches behaviour events.
 *  4. Facebook Audience Network — `AudienceNetworkAds.initialize` early-return; the SDK
 *     never boots.
 *  5. Unity Ads — all four `UnityAds.initialize` overloads early-return; the SDK never
 *     boots (cuts its mediation fan-out to Meta/Instagram/Amazon/Kinesis).
 *
 *  6. GluAnalytics privacy flags (formerly the standalone Privacy-disabled patch)
 *     - GluAnalytics reads `usageSharing` and `internalTargetedAds` from
 *       SharedPreferences with a default of TRUE (i.e. opt-out). Those reads are
 *       rewritten to `false`, forcing usage-sharing off and personalised/targeted
 *       ads off regardless of device or server configuration.
 *
 * Each kill is a tracking-only neutralisation: the game keeps running, and no
 * gameplay-dependent path (store catalog, purchases, age-gate) is touched.
 */
@Suppress("SpellCheckingInspection")
val bejeweledTelemetryDisabled = bytecodePatch(
    name = "Telemetry-disabled",
    description = "Stops Nimble/Synergy, Firebase, GLUAnalytics (incl. privacy flags), Facebook/Unity, popcap, and IronSource mediation telemetry.",
    default = true
) {
    compatibleWith(Constants.BEJEWELED_COMPATIBILITY)

    execute {
        // ------------------------------------------------------------------
        // 1. Nimble/Synergy — never POST a tracking event.
        // ------------------------------------------------------------------
        IsAbleToPostEventFingerprint.method.returnEarly(false)

        // ------------------------------------------------------------------
        // 2. Operational telemetry (internal metrics) — drop the event.
        // ------------------------------------------------------------------
        OperationalTelemetryLogEventFingerprint.method.returnEarly()

        // ------------------------------------------------------------------
        // 3. Firebase — swallow the DataTransport egress. Every destination
        //    (Analytics, Crashlytics, ML Kit, auth) funnels through CctTransport
        //    Backend.send; making it return a junk reference fails every upload
        //    (transport retries indefinitely) and nothing leaves the device.
        // ------------------------------------------------------------------
        CctTransportSendFingerprint.method.returnNullAtStart()

        // ------------------------------------------------------------------
        // 4. GLUAnalytics hub — never start, record or dispatch.
        // ------------------------------------------------------------------
        GluAnalyticsInitFingerprint.method.returnEarly()
        GluAnalyticsLogEventFingerprint.method.returnEarly()
        gluAnalyticsDoLogOverloads.forEach { it.method.returnEarly() }

        // ------------------------------------------------------------------
        // 5. Facebook Audience Network — SDK never boots.
        // ------------------------------------------------------------------
        AudienceNetworkAdsInitFingerprint.method.returnEarly()

        // ------------------------------------------------------------------
        // 6. Unity Ads — SDK never boots (cuts the mediation fan-out).
        // ------------------------------------------------------------------
        unityAdsInitOverloads.forEach { it.method.returnEarly() }

        // ------------------------------------------------------------------
        // PHASE 3 — the residual channels seen after Phase-2.
        // ------------------------------------------------------------------

        // AWS SDK — Kinesis / Cognito / STS (the single HTTP egress).
        AmazonHttpClientExecuteFingerprint.method.returnNullAtStart()

        // Unity Ads SDK internals (facade-kill misses the backing layers).
        UnityAdsImplementationInitFingerprint.method.returnEarly()
        UnityAdsSDKInitializeFingerprint.method.returnNullAtStart()
        UnityAdsSDKInitializeDefaultFingerprint.method.returnNullAtStart()
        CommonGatewayClientExecuteRequestFingerprint.method.returnNullAtStart()
        CommonGatewayClientExecuteWithRetryFingerprint.method.returnNullAtStart()

        // Nimble tracking — event intake + post path + reachability pings.
        TrackingWranglerLogEventFingerprint.method.returnEarly()
        NimbleTrackingSynergyImplPostFingerprint.method.returnEarly()
        NetworkImplDetectFingerprint.method.returnEarly()

        // Firebase Crashlytics — bootstrap fetch + settings URL.
        RemoteSettingsFetcherDoConfigFetchFingerprint.method.returnNullAtStart()
        RemoteSettingsFetcherSettingsUrlFingerprint.method.returnNullAtStart()

        // GLUAnalytics hub transports — geo publish, session-id, CCS putData.
        CacheServicePutDataFingerprint.method.returnEarly()
        GluAnalyticsUnsyncLogGeoFingerprint.method.returnEarly()
        GluAnalyticsUnsyncSessionIDFingerprint.method.returnEarly()
        GluAnalyticsSendDataToCacheServiceFingerprint.method.returnEarly()

        // ------------------------------------------------------------------
        // PHASE 4 — close the Kinesis/Cognito credential chain BEFORE the
        // AmazonHttpClient.execute null-return cascades into an NPE.
        // Real-device crash (12:42, fresh install):
        //   NullPointerException: Response.getAwsResponse() on a null object
        //   at AmazonCognitoIdentityClient.getOpenIdToken
        //     <- AWSBasicCognitoIdentityProvider.refresh
        //     <- CognitoCredentialsProvider.getCredentials
        //     <- AmazonKinesisClient.putRecords
        //     <- AbstractKinesisRecorder.submitAllRecords
        //     <- KinesisRecorderStream$3.run (the glu-analytics-pps handler)
        //
        // With execute() returning null, the first thing to consume the null
        // Response is the Kinesis recorder flusher. Cutting the chain above
        // the null consumer:
        //   1. KinesisRecorderStream.flush()         — the flusher itself
        //   2. AbstractKinesisRecorder.submitAllRecords — second layer
        //   3. AWSBasicCognitoIdentityProvider.refresh — closes the credential
        //      chain globally (String-returning; null-start return)
        //   4. GluAnalytics.unsync_logDefaultSegmentationValues — defense
        //      against the mCallback NPE family from the previous build
        //      (vendor guard + CrashGuard already cover it in this build, but
        //      this costs nothing).
        KinesisRecorderStreamFlushFingerprint.method.returnEarly()
        AbstractKinesisRecorderSubmitAllFingerprint.method.returnEarly()
        AwsBasicCognitoIdentityProviderRefreshFingerprint.method.returnNullAtStart()
        GluAnalyticsUnsyncLogDefaultSegmentationFingerprint.method.returnEarly()

        // ------------------------------------------------------------------
        // PHASE 5 — GluAnalytics privacy flags (merged from the former
        // standalone Privacy-disabled patch). GluAnalytics reads
        // `usageSharing` and `internalTargetedAds` from SharedPreferences
        // defaulting to TRUE (opt-out). Rewrite every such read to `false`:
        // usage-sharing off, personalised/targeted ads off, regardless of
        // device or server configuration. Only <init> and getCustomProperties
        // are considered (other methods read unrelated keys via getBoolean).
        // ------------------------------------------------------------------
        val gb = methodCall("Landroid/content/SharedPreferences;", "getBoolean")
        val sites = mutableListOf<Pair<MutableMethod, Int>>()
        gb.matchAllMethodIndicesForEach(false) { idx ->
            if (this.name == "<init>" || this.name == "getCustomProperties") {
                sites.add(this to idx)
            }
        }
        if (sites.isEmpty()) {
            error("No SharedPreferences.getBoolean privacy reads found in GluAnalytics")
        }
        // Descending index order: removing later sites never shifts earlier
        // sites' captured indices.
        for ((method, idx) in sites.sortedByDescending { it.second }) {
            val resultReg = moveResultRegister(method, idx)
            method.replaceInstruction(idx, "const/4 v$resultReg, 0x0")
            method.removeInstruction(idx + 1)
        }

        // ------------------------------------------------------------------
        // PHASE 6 — residual vendors that survived Phases 1-5 (see
        // Fingerprints.kt Phase-6 block).
        // ------------------------------------------------------------------

        // popcap (draper / moreinfo / gats) - the NetworkerJNI Java wrappers
        // spawn the HTTP worker threads; killing them kills every popcap POST.
        NetworkerJNIHttpGetFingerprint.method.returnEarly()
        NetworkerJNIHttpPostFingerprint.method.returnEarly()
        NetworkerJNIRedemptionFingerprint.method.returnEarly()

        // IronSource mediation workers (i-sdk.mediation.unity3d.com).
        IronSourceMediationWorkerEFingerprint.method.returnEarly()
        IronSourceMediationWorkerDFingerprint.method.returnEarly()

        // Facebook token trackers (graph token-validation pings).
        AccessTokenTrackerStartTrackingFingerprint.method.returnEarly()
        AuthenticationTokenTrackerStartTrackingFingerprint.method.returnEarly()
    }
}

/**
 * Prepends a "return null" preamble at the top of [m]'s body:
 *   const/4 vN, 0        (put zero bits = null into a free register)
 *   return-object vN     (return that null reference)
 *
 * Valid for any reference-returning method. `return-null` is not a representable
 * opcode in the Morphe smali fork, so this two-instruction form is used instead.
 * Allocates one free register.
 */
private fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.returnNullAtStart() {
    val reg = this.findFreeRegister(0)
    this.addInstruction(0, "const/4 v$reg, 0")
    this.addInstruction(1, "return-object v$reg")
}

/**
 * The register that receives a SharedPreferences.getBoolean result: the operand of the
 * `move-result` instruction immediately following the invoke.
 */
private fun moveResultRegister(method: MutableMethod, invokeIndex: Int): Int {
    val mr = method.getInstruction(invokeIndex + 1)
    for (md in (mr as Any).javaClass.declaredMethods) {
        if (md.name == "getRegisterA" && md.parameterCount == 0) {
            md.isAccessible = true
            return md.invoke(mr) as Int
        }
    }
    throw IllegalStateException("move-result at ${invokeIndex + 1} has no register: ${mr.javaClass}")
}
