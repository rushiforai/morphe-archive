package app.roboroads.patches.discoveryplus.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val AD_SKIP_MODULE = "Lcom/discovery/adtech/adskip/AdSkipModule;"
private const val AD_SKIP_STATE = "Lcom/discovery/adtech/adskip/AdSkipState;"
private const val TIMELINE_INFO = "Lcom/discovery/adtech/core/models/timeline/TimelineInfo;"

/**
 * Legacy adtech path. AdSkipModule.initializeState(TimelineInfo) creates a new AdSkipState
 * and stores it in the "state" field, then logs "State: ".
 */
internal object AdSkipInitializeStateFingerprint : Fingerprint(
    definingClass = AD_SKIP_MODULE,
    name = "initializeState",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(TIMELINE_INFO),
    filters = listOf(
        newInstance(AD_SKIP_STATE),
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = AD_SKIP_MODULE,
            name = "state",
            type = AD_SKIP_STATE,
        ),
        string("State: "),
    ),
)

/**
 * Legacy adtech path. AdSkipModule.updateState(TimelineInfo) refreshes the ad breaks of the
 * existing AdSkipState, then reads the "state" field to log "Updated State: ".
 */
internal object AdSkipUpdateStateFingerprint : Fingerprint(
    definingClass = AD_SKIP_MODULE,
    name = "updateState",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(TIMELINE_INFO),
    filters = listOf(
        methodCall(definingClass = AD_SKIP_STATE, name = "setChapterTimelineEntries"),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = AD_SKIP_MODULE,
            name = "state",
            type = AD_SKIP_STATE,
        ),
        string("Updated State: "),
    ),
)

/**
 * Legacy adtech path. AdSkipModule.onSeekRequest blocks user seeks while inside an ad break.
 */
internal object AdSkipOnSeekRequestFingerprint : Fingerprint(
    definingClass = AD_SKIP_MODULE,
    name = "onSeekRequest",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/discovery/adtech/core/modules/events/PlaybackEvent\$SeekRequest;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/discovery/adtech/adskip/AdSkipUtility;",
            name = "isInAdBreak",
            returnType = "Z",
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        string("Seeking during ad break is not allowed."),
    ),
)

/**
 * Legacy adtech path. Subscriber lambda that receives every coordinator ModuleInputEvent and
 * dispatches SeekRequest / AdBreakWillStart / PodEnded to the module.
 * The lambda name is compiler generated, so it is matched by the three dispatch calls instead.
 * The obfuscated Unit return type and Ref.ObjectRef parameter are declared as "L".
 */
internal object AdSkipModuleInputDispatcherFingerprint : Fingerprint(
    definingClass = AD_SKIP_MODULE,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf(
        AD_SKIP_MODULE,
        "L",
        "Lcom/discovery/adtech/core/modules/events/ModuleInputEvent;",
    ),
    filters = listOf(
        methodCall(definingClass = AD_SKIP_MODULE, name = "onSeekRequest"),
        methodCall(definingClass = AD_SKIP_MODULE, name = "onAdBreakWillStart"),
        methodCall(definingClass = AD_SKIP_MODULE, name = "onAdPodEnd"),
    ),
)

/**
 * TimelineManager path (only active when the remote flag enables it).
 * Sole watched-ad-break check used by DefaultAdSkipManager.
 */
internal object TimelineIsAdBreakAlreadyWatchedFingerprint : Fingerprint(
    definingClass = "Lcom/wbd/beam/player/timelinemanager/seekmediator/gmssseekmediator/models/TimelineStateKt;",
    name = "isAdBreakAlreadyWatched",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(
        "Lcom/wbd/beam/player/timelinemanager/seekmediator/gmssseekmediator/models/TimelineState;",
        "I",
    ),
    filters = listOf(
        methodCall(name = "getWatchedAdBreakIndices", returnType = "Ljava/util/Set;"),
        methodCall(definingClass = "Ljava/util/Set;", name = "contains"),
    ),
)

private const val BUILD_DEFAULT_AD_TECH_SDK = "Lcom/discovery/adtech/sdk/defaultsdk/BuildDefaultAdTechSdkKt;"
private const val AD_TECH_SDK_FEATURES = "Lcom/discovery/adtech/sdk/defaultsdk/DefaultAdTechSdkConfig\$Features;"
private val BUILD_DEFAULT_AD_TECH_SDK_LAMBDA_PARAMETERS = listOf(
    "Lcom/discovery/adtech/sdk/defaultsdk/DefaultAdTechSdkConfig;",
    "Lcom/discovery/adtech/eventstreams/AdTechEventStreamsCallbacks;",
    "Ljava/util/List;",
    "L",
    "L",
    "Lcom/discovery/adtech/sdk/AdTechSdkBuilder;",
)

/**
 * Adtech SDK builder lambda. Configures the server side ad overlay (ad badge, countdown,
 * "Ad x of y", learn more) when DefaultAdTechSdkConfig.Features.getServerSideAdOverlay()
 * is not null, otherwise calls AdTechSdkBuilder.disableAdUi().
 * The obfuscated Unit return type and parameters are declared as "L".
 */
internal object BuildAdTechSdkAdOverlayFingerprint : Fingerprint(
    definingClass = BUILD_DEFAULT_AD_TECH_SDK,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = BUILD_DEFAULT_AD_TECH_SDK_LAMBDA_PARAMETERS,
    filters = listOf(
        methodCall(definingClass = AD_TECH_SDK_FEATURES, name = "getServerSideAdOverlay"),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        string("Configuring Ad UI with "),
    ),
)

/**
 * Adtech SDK builder lambda. Registers the pause ads plugin when
 * DefaultAdTechSdkConfig.Features.getPauseAds() is not null.
 * The obfuscated Unit return type and parameters are declared as "L".
 */
internal object BuildAdTechSdkPauseAdsFingerprint : Fingerprint(
    definingClass = BUILD_DEFAULT_AD_TECH_SDK,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = BUILD_DEFAULT_AD_TECH_SDK_LAMBDA_PARAMETERS,
    filters = listOf(
        methodCall(definingClass = AD_TECH_SDK_FEATURES, name = "getPauseAds"),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        string("PauseAds enabled with "),
    ),
)
