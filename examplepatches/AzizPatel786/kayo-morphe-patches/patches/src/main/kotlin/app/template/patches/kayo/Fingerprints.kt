package app.template.patches.kayo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches `ProfileBasedTrackSelector.<init>(DefaultTrackSelector, ProfileBitrate, TrackBitrateLimiter)`
 * (`Lpx/e;-><init>` in Kayo v6.1.3).
 */
object ProfileBasedTrackSelectorConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;",
        "L",
        "L"
    ),
    filters = listOf(
        string("defaultSelector"),
        string("profileBitrate"),
        string("trackBitrateLimiter")
    )
)

/**
 * Matches `ProfileBasedTrackSelector.onTracksChanged(Tracks)`
 * (`Lpx/e;->onTracksChanged(Lcom/google/android/exoplayer2/Tracks;)V` in Kayo v6.1.3).
 */
object ProfileBasedTrackSelectorOnTracksChangedFingerprint : Fingerprint(
    name = "onTracksChanged",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/google/android/exoplayer2/Tracks;"),
    filters = listOf(
        string("tracks"),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;"
        )
    )
)

/**
 * Wait: in `Lpx/e;`, `onTracksChanged(Tracks)` calls `f(Tracks)` directly, whereas `a:DefaultTrackSelector`
 * is accessed in `b(I)`, `c(I)`, `f(Tracks)`, `getTrackSelector()`.
 * Let's match `onTracksChanged(Lcom/google/android/exoplayer2/Tracks;)V` on the class matched by
 * [ProfileBasedTrackSelectorConstructorFingerprint], or match `f(Lcom/google/android/exoplayer2/Tracks;)V`!
 */
object ProfileBasedTrackSelectorUpdateTracksFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/google/android/exoplayer2/Tracks;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/Tracks;",
            name = "getGroups"
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;"
        ),
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "Lcom/google/android/exoplayer2/trackselection/TrackSelectionParameters;",
            name = "maxVideoBitrate"
        )
    )
)

/**
 * Matches `ProfileBasedTrackSelector.b(int maxVideoBitrate)` (`Lpx/e;->b(I)V` in Kayo v6.1.3),
 * which sets `maxVideoBitrate` on `DefaultTrackSelector`.
 */
object ProfileBasedTrackSelectorSetMaxBitrateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;"
        ),
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;",
            name = "buildUponParameters"
        ),
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector\$Parameters\$Builder;",
            name = "setMaxVideoBitrate",
            parameters = listOf("I")
        ),
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;",
            name = "setParameters"
        )
    )
)

/**
 * Matches `ProfileBasedTrackSelector.c(int maxVideoHeight)` (`Lpx/e;->c(I)V` in Kayo v6.1.3),
 * which sets `maxVideoSize` on `DefaultTrackSelector`.
 */
object ProfileBasedTrackSelectorSetMaxSizeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;"
        ),
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector\$Parameters\$Builder;",
            name = "setMaxVideoSize",
            parameters = listOf("I", "I")
        )
    )
)

/**
 * Matches `AbstractDaznPlayerControls.j4(...)` where player control button click listeners
 * (including `getTrackSelectorButton()`) are initialized.
 */
object AbstractDaznPlayerControlsSetupFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/player/controls/AbstractDaznPlayerControls;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        string("keyMomentsPresenter"),
        string("markersController"),
        methodCall(
            definingClass = "Lcom/dazn/player/controls/AbstractDaznPlayerControls;",
            name = "getTrackSelectorButton",
            returnType = "Landroid/view/View;"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setOnClickListener",
            location = MatchAfterImmediately()
        )
    )
)

/**
 * Matches `AbstractDaznPlayerControls.o2(boolean visible)` which toggles visibility of
 * `getTrackSelectorButton()`.
 */
object AbstractDaznPlayerControlsTrackSelectorVisibilityFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/player/controls/AbstractDaznPlayerControls;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/dazn/player/controls/AbstractDaznPlayerControls;",
            name = "getTrackSelectorButton",
            returnType = "Landroid/view/View;"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        opcode(Opcode.INVOKE_STATIC, MatchAfterImmediately()),
        opcode(Opcode.RETURN_VOID, MatchAfterImmediately())
    )
)

/**
 * Matches `AbstractDaznPlayerControls.onClick(View)` where `getTrackSelectorButton()` click
 * dispatches `d$G`.
 */
object AbstractDaznPlayerControlsOnClickFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/player/controls/AbstractDaznPlayerControls;",
    name = "onClick",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/dazn/player/controls/AbstractDaznPlayerControls;",
            name = "getTrackSelectorButton",
            returnType = "Landroid/view/View;"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "getId",
            returnType = "I",
            location = MatchAfterImmediately()
        )
    )
)

/**
 * Matches `DefaultPlayerControls.<init>(Context, AttributeSet)` (v2 player controls)
 * where `getTrackSelectorButton()` is initialized.
 */
object DefaultPlayerControlsConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/player/v2/controls/DefaultPlayerControls;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    filters = listOf(
        string("exoTrackSelector"),
        methodCall(
            definingClass = "Lcom/dazn/player/v2/controls/DefaultPlayerControls;",
            name = "getTrackSelectorButton"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setOnClickListener"
        )
    )
)

/**
 * Matches `PlaybackServiceDelegate.t()` (`Lgv/x;->t()Ljava/lang/String;`),
 * which computes the stream capabilities string ("mta,50fps,lowlatency,hevc,hdr") sent in the playback request body.
 */
object PlaybackServiceDelegateCapabilitiesFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("mta"),
        string(",50fps"),
        string(",lowlatency")
    )
)

/**
 * Matches `PlaybackServiceDelegate.u()` (`Lgv/x;->u()Ljava/lang/String;`),
 * which sends "low" tier when DrmTierService reports low tier.
 */
object PlaybackServiceDelegateDrmTierFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("low")
    )
)

/**
 * Matches `DrmTierService.b()` (`Lge/i;->b()Z`),
 * which determines whether the device is considered low DRM tier (e.g. failing external HDCP display check).
 */
object DrmTierServiceIsLowTierFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("Error determining DRM tier, defaulting to Low: "),
        string("DrmTier")
    )
)

/**
 * Matches `PlaybackCodecsService.a()` (`LXu/b;->a()Z`),
 * which checks if HEVC decoder is supported.
 */
object PlaybackCodecsServiceIsHevcSupportedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("video/hevc"),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Ls6/p;"
        )
    )
)

/**
 * Matches `LHv/P;->R1(Lcom/google/android/exoplayer2/ExoPlayer;)V` which attaches the active ExoPlayer.
 */
object PlayerInterfaceAttachExoPlayerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/google/android/exoplayer2/ExoPlayer;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = "this",
            type = "Lcom/google/android/exoplayer2/ExoPlayer;"
        )
    )
)

/**
 * Matches `ProfileBasedTrackSelector.setAudioTrack(String)` (`Lpx/e;->setAudioTrack(Ljava/lang/String;)V` in Kayo v6.1.3).
 */
object ProfileBasedTrackSelectorSetAudioTrackFingerprint : Fingerprint(
    name = "setAudioTrack",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;"
        ),
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;",
            name = "buildUponParameters"
        ),
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector\$Parameters\$Builder;",
            name = "setPreferredAudioLanguage",
            parameters = listOf("Ljava/lang/String;")
        )
    )
)

/**
 * Matches `TrackSelectorService.i(Tracks)` (`LFK/b0;->i(Lcom/google/android/exoplayer2/Tracks;)V` in Kayo v6.1.3),
 * which is always invoked by `LHv/P$e;->onTracksChanged` even when `skipNextTrackReselection` is true.
 */
object TrackSelectorServiceOnTracksChangedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/google/android/exoplayer2/Tracks;"),
    filters = listOf(
        string("tracks"),
        opcode(Opcode.CONST_4),
        opcode(Opcode.CONST_4)
    )
)

/**
 * Matches `PlaybackForceQualityModeService.a()` (`LUw/b;->a()I` in Kayo v6.1.3),
 * which reads Featurevisor's `MAX_RESOLUTION_HEIGHT` (720p cap on mobile).
 */
object PlaybackForceQualityModeMaxResolutionHeightFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            name = "FORCE_PLAYBACK_QUALITY_MODE"
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            name = "MAX_RESOLUTION_HEIGHT"
        )
    )
)

/**
 * Matches `LHv/P;->m1(...)` which calls `MediaCodecUtil.forceDisableFrameRateCheck(Z)`
 * and attaches `ExoPlayer` via `R1(ExoPlayer)`.
 */
object PlayerInterfaceInitExoPlayerFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil;",
            name = "forceDisableFrameRateCheck",
            parameters = listOf("Z")
        ),
        methodCall(
            name = "setAudioTrack",
            parameters = listOf("Ljava/lang/String;")
        )
    )
)

/**
 * Matches `VideoCapabilitiesPlugin.execute(String, JSONArray, PluginCallback)` in Kayo TV (au.com.kayosports.tv).
 */
object TvVideoCapabilitiesPluginExecuteFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lorg/json/JSONArray;",
        "Lcom/dazn/shared/plugins/api/PluginCallback;"
    ),
    filters = listOf(
        string("VideoCapabilitiesPlugin"),
        string("IS_4K_SUPPORTED"),
        string("IS_WIDEVINE_L1_SUPPORTED")
    )
)

/**
 * Matches `DrmPlayer.setMaxVideoBitrate(int)` in Kayo TV (au.com.kayosports.tv).
 */
object TvDrmPlayerSetMaxBitrateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        string("getTrackSelectionParameters(...)"),
        fieldAccess(
            opcode = Opcode.IPUT,
            definingClass = "Landroidx/media3/common/TrackSelectionParameters\$Builder;",
            name = "maxVideoBitrate"
        )
    )
)

/**
 * Matches `PlayerView.setPlayer(ExoPlayer)` in Kayo TV (au.com.kayosports.tv).
 */
object TvPlayerViewSetPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/media3/views/PlayerView;",
    name = "setPlayer",
    returnType = "V",
    parameters = listOf("Landroidx/media3/exoplayer/ExoPlayer;")
)

/**
 * Matches `ExoPlayerEventsListener.onTracksChanged(Tracks)` in Kayo TV (au.com.kayosports.tv).
 */
object TvExoPlayerEventsListenerOnTracksChangedFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/media3/ExoPlayerEventsListener;",
    name = "onTracksChanged",
    returnType = "V",
    parameters = listOf("Landroidx/media3/common/Tracks;")
)

/**
 * Matches `MainActivity.dispatchKeyEvent(KeyEvent)` in Kayo TV (au.com.kayosports.tv).
 */
object TvMainActivityDispatchKeyEventFingerprint : Fingerprint(
    name = "dispatchKeyEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/KeyEvent;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/dazn/MainActivity;",
            name = "getWebViewHost"
        )
    )
)

/**
 * Matches `VideoPlugin.getPhysicalDisplaySize()Lorg/json/JSONObject;` in Kayo TV (au.com.kayosports.tv).
 */
object TvVideoPluginGetPhysicalDisplaySizeFingerprint : Fingerprint(
    returnType = "Lorg/json/JSONObject;",
    parameters = listOf(),
    filters = listOf(
        string("getPhysicalDisplaySize failed"),
        string("x"),
        string("y")
    )
)

/**
 * Matches `DaznDrmSessionManager.<init>` in Kayo TV (au.com.kayosports.tv) across v4.6.1 (5 params) and v4.8.1 (6 params).
 * In both versions, `p3` is `useWidevineL3:Z`.
 */
object TvDaznDrmSessionManagerConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/media3/drm/DaznDrmSessionManager;",
    name = "<init>",
    returnType = "V",
    filters = listOf(
        string("securityLevel"),
        string("L3")
    )
)

/**
 * Matches `Util.getCurrentDisplayModeSize(Context)` in Kayo TV (au.com.kayosports.tv).
 */
object TvMedia3UtilGetCurrentDisplayModeSizeFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/common/util/Util;",
    name = "getCurrentDisplayModeSize",
    returnType = "Landroid/graphics/Point;",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Matches `DefaultBandwidthMeter.getInitialBitrateEstimateForNetworkType(I)J` in Kayo TV (au.com.kayosports.tv).
 */
object TvDefaultBandwidthMeterGetInitialEstimateFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;",
    name = "getInitialBitrateEstimateForNetworkType",
    returnType = "J",
    parameters = listOf("I")
)

/**
 * Matches `ResultKt.parse(JSONObject)LoadArguments` in Kayo TV (au.com.kayosports.tv).
 */
object TvLoadArgumentsParserFingerprint : Fingerprint(
    definingClass = "Lkotlin/ResultKt;",
    name = "parse",
    returnType = "Lcom/dazn/plugins/media3/loadarguments/LoadArguments;",
    parameters = listOf("Lorg/json/JSONObject;")
)

/**
 * Matches `DefaultTrackSelector.selectTracksForType(...)` in Kayo TV (au.com.kayosports.tv).
 */
object TvDefaultTrackSelectorSelectTracksForTypeFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;",
    name = "selectTracksForType",
    returnType = "Landroid/util/Pair;",
    parameters = listOf(
        "I",
        "Landroidx/media3/exoplayer/trackselection/MappingTrackSelector\$MappedTrackInfo;",
        "[[[I",
        "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector\$TrackInfo\$Factory;",
        "Ljava/util/Comparator;"
    ),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/util/Pair;",
            name = "create"
        )
    )
)

/**
 * Matches `AdaptiveTrackSelection.determineIdealSelectedIndex(long)` in Kayo TV (au.com.kayosports.tv).
 */
object TvAdaptiveTrackSelectionDetermineIdealSelectedIndexFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;",
    name = "determineIdealSelectedIndex",
    returnType = "I",
    parameters = listOf("J")
)

/**
 * Matches `AdaptiveTrackSelection.getSelectedIndex()` in Kayo TV (au.com.kayosports.tv).
 */
object TvAdaptiveTrackSelectionGetSelectedIndexFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;",
    name = "getSelectedIndex",
    returnType = "I",
    parameters = listOf()
)

/**
 * Matches `AdaptiveTrackSelection.updateSelectedTrack(...)` in Kayo TV (au.com.kayosports.tv).
 */
object TvAdaptiveTrackSelectionUpdateSelectedTrackFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;",
    name = "updateSelectedTrack",
    returnType = "V",
    parameters = listOf(
        "J",
        "J",
        "J",
        "Ljava/util/List;",
        "[Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;"
    )
)


/**
 * Matches `DefaultTrackSelector$Parameters.<init>(DefaultTrackSelector$Parameters$Builder)` in Kayo TV (au.com.kayosports.tv).
 */
object TvDefaultTrackSelectorParametersConstructorFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector\$Parameters;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector\$Parameters\$Builder;")
)

/**
 * Matches `queryConnectedHdcpLevel()Ljava/lang/String;` in Kayo TV (au.com.kayosports.tv) across
 * v4.6.1 (`Lcom/dazn/plugins/media3/enums/Action$Companion;`) and v4.8.1 (`Landroidx/lifecycle/ViewModelStore;`).
 */
object TvHdcpLevelQuerierFingerprint : Fingerprint(
    name = "queryConnectedHdcpLevel",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("HdcpLevelQuerier")
    )
)

/**
 * Matches `HdmiStatusPlugin.tryNotify()V` in Kayo TV (au.com.kayosports.tv).
 */
object TvHdmiStatusPluginTryNotifyFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/hdmistatus/HdmiStatusPlugin;",
    name = "tryNotify",
    returnType = "V",
    parameters = listOf()
)

/**
 * Matches `HdmiStatusPlugin.setConnected(Ljava/lang/String;Z)V` in Kayo TV v4.8.1+ (`au.com.kayosports.tv`).
 */
object TvHdmiStatusPluginSetConnectedFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/hdmistatus/HdmiStatusPlugin;",
    name = "setConnected",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z")
)

/**
 * Matches `DrmPlayer.releasePlayer` in Kayo TV (`au.com.kayosports.tv`) across v4.6.1 (`()V`)
 * and v4.8.1 (`(Lcom/dazn/plugins/media3/ReleaseReason;)V`).
 */
object TvDrmPlayerReleasePlayerFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/media3/drm/DrmPlayer;",
    name = "releasePlayer",
    returnType = "V"
)

/**
 * Matches `DeviceStatsPlugin.readProcCpuInfoMHz()I` in Kayo TV (au.com.kayosports.tv).
 */
object TvDeviceStatsReadCpuMHzFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/devicestats/DeviceStatsPlugin;",
    name = "readProcCpuInfoMHz",
    returnType = "I",
    parameters = listOf()
)

/**
 * Matches `ExoTrackSelection$Definition.<init>(ILandroidx/media3/common/TrackGroup;[I)V` in Kayo TV (au.com.kayosports.tv).
 */
object TvExoTrackSelectionDefinitionConstructorFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/ExoTrackSelection\$Definition;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "I",
        "Landroidx/media3/common/TrackGroup;",
        "[I"
    )
)

/**
 * Matches `AdaptiveTrackSelection.evaluateQueueSize(JLjava/util/List;)I` in Kayo TV (au.com.kayosports.tv).
 */
object TvAdaptiveTrackSelectionEvaluateQueueSizeFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;",
    name = "evaluateQueueSize",
    returnType = "I",
    parameters = listOf(
        "J",
        "Ljava/util/List;"
    )
)

/**
 * Matches `DefaultLoadControl.<init>()V` in Kayo TV (au.com.kayosports.tv).
 */
object TvDefaultLoadControlConstructorFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/DefaultLoadControl;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(opcode(Opcode.RETURN_VOID))
)

/**
 * Matches `DefaultLivePlaybackSpeedControl.<init>(JJ)V` in Kayo TV (au.com.kayosports.tv).
 */
object TvDefaultLivePlaybackSpeedControlConstructorFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "J",
        "J"
    ),
    filters = listOf(opcode(Opcode.RETURN_VOID))
)

/**
 * Matches `ResultKt.parse(Lorg/json/JSONObject;)Lcom/dazn/plugins/media3/ExoPlayerConfig/ExoPlayerConfig;` in Kayo TV (au.com.kayosports.tv).
 */
object TvExoPlayerConfigParserFingerprint : Fingerprint(
    definingClass = "Lkotlin/ResultKt;",
    name = "parse",
    returnType = "Lcom/dazn/plugins/media3/ExoPlayerConfig/ExoPlayerConfig;",
    parameters = listOf("Lorg/json/JSONObject;")
)

/**
 * Matches `ExoPlayerConfig.<init>()V` in Kayo TV (au.com.kayosports.tv).
 */
object TvExoPlayerConfigConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/media3/ExoPlayerConfig/ExoPlayerConfig;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(opcode(Opcode.RETURN_VOID))
)

/**
 * Matches `Notificator.onBandwidthSample(IJJ)V` in Kayo TV (au.com.kayosports.tv).
 */
object TvNotificatorOnBandwidthSampleFingerprint : Fingerprint(
    definingClass = "Lcom/dazn/plugins/media3/Notificator;",
    name = "onBandwidthSample",
    returnType = "V",
    parameters = listOf(
        "I",
        "J",
        "J"
    )
)

/**
 * Matches `DefaultBandwidthMeter.maybeNotifyBandwidthSample(IJJ)V` in Kayo TV (au.com.kayosports.tv).
 */
object TvDefaultBandwidthMeterMaybeNotifyBandwidthSampleFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;",
    name = "maybeNotifyBandwidthSample",
    returnType = "V",
    parameters = listOf(
        "I",
        "J",
        "J"
    )
)

// =============================================================================
// Mobile ExoPlayer v2 QoE & Performance Fingerprints (au.com.kayosports)
// =============================================================================

/**
 * Matches `CustomLoadControlProvider.a(LNu/u;)Lcom/google/android/exoplayer2/LoadControl;` (`LHv/j;->a`)
 * in Kayo Mobile, which constructs the active `DefaultLoadControl` for every stream.
 */
object MobileCustomLoadControlProviderFingerprint : Fingerprint(
    returnType = "Lcom/google/android/exoplayer2/LoadControl;",
    filters = listOf(
        string("streamSpecification"),
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/DefaultLoadControl\$Builder;",
            name = "setBufferDurationsMs"
        )
    )
)

/**
 * Matches `DefaultLoadControl.<init>(Lcom/google/android/exoplayer2/upstream/DefaultAllocator;IIIIIZIZ)V`
 * in ExoPlayer v2 (Kayo Mobile).
 */
object MobileDefaultLoadControlConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/DefaultLoadControl;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lcom/google/android/exoplayer2/upstream/DefaultAllocator;",
        "I",
        "I",
        "I",
        "I",
        "I",
        "Z",
        "I",
        "Z"
    ),
    filters = listOf(opcode(Opcode.RETURN_VOID))
)

/**
 * Matches `DefaultLivePlaybackSpeedControl.<init>(FFJJFFF)V` in ExoPlayer v2 (Kayo Mobile).
 */
object MobileDefaultLivePlaybackSpeedControlConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/DefaultLivePlaybackSpeedControl;",
    name = "<init>",
    returnType = "V",
    filters = listOf(opcode(Opcode.RETURN_VOID))
)

/**
 * Matches `DefaultBandwidthMeter.getInitialBitrateEstimateForNetworkType(I)J` in ExoPlayer v2 (Kayo Mobile).
 */
object MobileDefaultBandwidthMeterGetInitialEstimateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;",
    name = "getInitialBitrateEstimateForNetworkType",
    returnType = "J",
    parameters = listOf("I")
)

/**
 * Matches `PlayerInterfaceDazn.X0(DefaultRenderersFactory)DefaultRenderersFactory` (`LHv/P;->X0`)
 * in Kayo Mobile, which configures `setEnableDecoderFallback`.
 */
object MobileConfigureRenderersFactoryFingerprint : Fingerprint(
    returnType = "Lcom/google/android/exoplayer2/DefaultRenderersFactory;",
    parameters = listOf("Lcom/google/android/exoplayer2/DefaultRenderersFactory;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/exoplayer2/DefaultRenderersFactory;",
            name = "setEnableDecoderFallback",
            parameters = listOf("Z")
        )
    )
)

/**
 * Matches `ExoTrackSelection$Definition.<init>(Lcom/google/android/exoplayer2/source/TrackGroup;[II)V`
 * in ExoPlayer v2 (Kayo Mobile).
 */
object MobileExoTrackSelectionDefinitionConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/trackselection/ExoTrackSelection\$Definition;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lcom/google/android/exoplayer2/source/TrackGroup;",
        "[I",
        "I"
    )
)

/**
 * Matches `AdaptiveTrackSelection.determineIdealSelectedIndex(JJ)I` in ExoPlayer v2 (Kayo Mobile).
 */
object MobileAdaptiveTrackSelectionDetermineIdealSelectedIndexFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/trackselection/AdaptiveTrackSelection;",
    name = "determineIdealSelectedIndex",
    returnType = "I",
    parameters = listOf("J", "J")
)

/**
 * Matches `AdaptiveTrackSelection.getSelectedIndex()I` in ExoPlayer v2 (Kayo Mobile).
 */
object MobileAdaptiveTrackSelectionGetSelectedIndexFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/trackselection/AdaptiveTrackSelection;",
    name = "getSelectedIndex",
    returnType = "I",
    parameters = listOf()
)

/**
 * Matches `AdaptiveTrackSelection.updateSelectedTrack(JJJLjava/util/List;[Lcom/google/android/exoplayer2/source/chunk/MediaChunkIterator;)V`
 * in ExoPlayer v2 (Kayo Mobile).
 */
object MobileAdaptiveTrackSelectionUpdateSelectedTrackFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/trackselection/AdaptiveTrackSelection;",
    name = "updateSelectedTrack",
    returnType = "V",
    parameters = listOf(
        "J",
        "J",
        "J",
        "Ljava/util/List;",
        "[Lcom/google/android/exoplayer2/source/chunk/MediaChunkIterator;"
    )
)

/**
 * Matches `AdaptiveTrackSelection.evaluateQueueSize(JLjava/util/List;)I` in ExoPlayer v2 (Kayo Mobile).
 */
object MobileAdaptiveTrackSelectionEvaluateQueueSizeFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/exoplayer2/trackselection/AdaptiveTrackSelection;",
    name = "evaluateQueueSize",
    returnType = "I",
    parameters = listOf(
        "J",
        "Ljava/util/List;"
    )
)

// =============================================================================
// Android TV Pairip License Check Bypass Fingerprints (au.com.kayosports.tv)
// =============================================================================

/**
 * Matches `com.pairip.application.Application.attachBaseContext(Context)V` in Kayo TV.
 */
object TvPairipApplicationAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Matches `LicenseClient.checkLicense(Context)V` in Kayo TV.
 */
object TvPairipLicenseClientCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Matches `LicenseClient.initializeLicenseCheck()V` in Kayo TV.
 */
object TvPairipLicenseClientInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf()
)

/**
 * Matches `LicenseClient.performLocalInstallerCheck()Z` in Kayo TV.
 */
object TvPairipLicenseClientLocalCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "performLocalInstallerCheck",
    returnType = "Z",
    parameters = listOf()
)

/**
 * Matches `LicenseClient.handleError(LicenseCheckException)V` in Kayo TV.
 */
object TvPairipLicenseClientHandleErrorFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "handleError",
    returnType = "V",
    parameters = listOf("Lcom/pairip/licensecheck/LicenseCheckException;")
)

/**
 * Matches `LicenseClient.scheduleAppShutdown()V` in Kayo TV.
 */
object TvPairipLicenseClientScheduleAppShutdownFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "scheduleAppShutdown",
    returnType = "V",
    parameters = listOf()
)

/**
 * Matches `LicenseContentProvider.onCreate()Z` in Kayo TV.
 */
object TvPairipLicenseContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = listOf()
)

/**
 * Matches `LicenseActivity.onStart()V` in Kayo TV.
 */
object TvPairipLicenseActivityOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "onStart",
    returnType = "V",
    parameters = listOf()
)

/**
 * Matches `LicenseActivity.closeApp()V` in Kayo TV.
 */
object TvPairipLicenseActivityCloseAppFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "closeApp",
    returnType = "V",
    parameters = listOf()
)

/**
 * Matches `LicenseActivity.exitApp()V` in Kayo TV.
 */
object TvPairipLicenseActivityExitAppFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "exitApp",
    returnType = "V",
    parameters = listOf()
)

