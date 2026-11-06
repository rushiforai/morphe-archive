package app.lostprc.patches.qq.lite

/*
 * Everything below comes straight from diffing the original QQ 9.3.75 (versionCode 16580, arm64-v8a)
 * against the slimmed "QQ_9.3.75_LITE" build:
 *
 *  - All classes*.dex, resources.arsc and res/ are byte identical, so no bytecode changes are needed.
 *  - 113 asset / native-library entries were dropped (plus the old META-INF signature, which the
 *    patcher replaces anyway).
 *  - 41 <application> children were dropped from AndroidManifest.xml.
 *
 * The removals are grouped into categories so each one can be turned off with a patch option.
 */

internal class RemovalGroup(
    /** Archive entries. A trailing slash removes everything below that directory. */
    val apkEntries: List<String>,
    /** Values of android:name of direct <application> children that are removed. */
    val manifestComponents: Set<String>,
)

private val WWISE_AUDIO_PLUGINS = listOf(
    "AudioInput", "Compressor", "Delay", "Expander", "Flanger", "Gain", "GuitarDistortion",
    "Harmonizer", "MatrixReverb", "Motion", "ParametricEQ", "PeakLimiter", "PitchShifter",
    "Recorder", "Reflect", "RoomVerb", "SilenceGenerator", "SineTone", "SoundSeedAir",
    "SoundSeedImpact", "StereoDelay", "SynthOne", "TimeStretch", "ToneGen", "Tremolo",
).map { "libAk$it.so" }

private fun nativeLibs(vararg names: String) = names.map { "lib/arm64-v8a/$it" }

/** Game center, cloud games (YunGame), mini games and the game widgets. */
internal val GAME_CENTER = RemovalGroup(
    apkEntries = listOf(
        "assets/mini/",
        "assets/minigame/",
        "assets/wxa_dynamic_pkg_release_arm64-v8a-4.2.7-1075-release.zip",
    ),
    manifestComponents = setOf(
        "com.tencent.mobileqq.gamecenter.yungame.YunGameService",
        "com.tencent.mobileqq.qshadow.yungame.PluginSingleTaskProxyActivity",
        "com.tencent.mobileqq.activity.QQGamePubAccountActivity",
        "com.tencent.gamecenter.wadl.base.WadlPluginProxyActivity",
        "com.tencent.gamecenter.wadl.api.impl.WadlProxyService",
        "com.tencent.gamecenter.wadl.biz.service.WadlJsBridgeService",
        "com.tencent.gamecenter.wadl.notification.WadlNotificationService",
        "com.tencent.gamecenter.activities.GameCenterActivity",
        "com.tencent.gamecenter.activities.SingleTaskQQBrowser",
        "com.tencent.mobileqq.gameparty.PromptDialogActivity",
        "com.tencent.mobileqq.nearby.gameroom.GameRoomInviteActivity",
        "com.tencent.mobileqq.nearby.gameroom.GameRoomTransActivity",
        "com.tencent.mobileqq.minigame.ui.GameActivity1",
        "com.tencent.mobileqq.minigame.ui.GameActivity2",
        "com.tencent.mobileqq.minigame.ui.GameActivity3",
        "com.tencent.mobileqq.minigame.ui.GameActivity6",
        "com.tencent.mobileqq.minigame.metafarm.widget.MetaFarmAppWidgetProvider",
        "com.tencent.mobileqq.gamecenter.appwidget.GameCenterAppWidgetProviderV2",
        "com.tencent.mobileqq.qqlive.room.floatview.QQLiveGameRoomService",
        "com.tencent.qqmini.minigame.utils.ConsoleLogFileProvider",
    ),
)

/** Super QQ Show / ZPlan / Zootopia / CMShow (Apollo): UE4 + Filament 3D avatar engine, Wwise audio, GVoice. */
internal val ZPLAN = RemovalGroup(
    apkEntries = listOf(
        "assets/filament/",
        "assets/qav_zplan_avatar_bg_v1/",
        "assets/zplan/",
        "assets/GCloudVoice/",
        "assets/UE4CommandLine.txt",
        "assets/main.obb.png",
        "assets/zootopia_scene_loading_anim_outer_apng.png",
    ) + WWISE_AUDIO_PLUGINS.map { "lib/arm64-v8a/$it" } + nativeLibs(
        "libMasteringSuite.so",
        "libMcDSP.so",
        "libQQShow2DEngine_android.so",
        "libQQShow2D_shared.so",
        "libzplan-android.so",
        "libzplan_interface_dynamic.so",
        "libzplan_service.so",
    ),
    manifestComponents = setOf(
        "com.tencent.mobileqq.apollo.store.ApolloDiyTextActivity",
        "com.tencent.mobileqq.apollo.store.ApolloFloatActivity",
        "com.tencent.sqshow.activity.ZplanHostActivity",
        "com.tencent.mobileqq.zplan.activity.PeakHostActivity",
        "com.tencent.mobileqq.zplan.share.ZPlanShareTranslucentActivity",
        "com.tencent.mobileqq.zootopia.ZootopiaUEActivity",
        "com.tencent.sqshow.zootopia.ZootopiaActivity",
        "com.tencent.sqshow.zootopia.ZootopiaTransparentActivity",
        "com.tencent.sqshow.zootopia.recommend.main.ZPlanMainRecommendActivity",
        "com.tencent.mobileqq.zplan.room.impl.meeting.ZPlanMeetingForegroundService",
        "com.tencent.zplan.engine.service.ZPlanEngineService",
        "com.tencent.zplan.world.activity.ZPlanActivity",
        "com.tencent.zplan.activity.ZPlanStoreActivityByView",
        "com.tencent.gcloud.ApolloProvider",
        "com.epicgames.ue4.GameActivity.bPackageDataInsideApk",
        "com.epicgames.ue4.GameActivity.ProjectName",
        "com.epicgames.ue4.GameActivity.bHasOBBFiles",
        "com.epicgames.ue4.GameActivity.BuildConfiguration",
        "com.epicgames.ue4.GameActivity.bUseExternalFilesDir",
        "com.epicgames.ue4.GameActivity.bPublicLogFiles",
    ),
)

/** Crash reporting, performance monitoring and device fingerprinting native libraries. */
internal val TELEMETRY = RemovalGroup(
    apkEntries = nativeLibs(
        "libBeaconDT.so",
        "libBugly_Native.so",
        "libbugly_dumper.so",
        "libbuglybacktrace.so",
        "libmatrix-hookcommon.so",
        "libmatrix-memoryhook.so",
        "libmatrix-pthreadhook.so",
        "libmatrix-traffic.so",
        "libqimei.so",
        "librmonitor_base.so",
        "librmonitor_memory.so",
        "librtc_node_report.so",
        "libunusedcodecheck.so",
        "libwechatbacktrace.so",
        "libwechatcrash.so",
    ),
    manifestComponents = emptySet(),
)

/** VIP ad guide, embedded plugin packages, festival red-packet assets and other leftovers. */
internal val MISC = RemovalGroup(
    apkEntries = listOf(
        "assets/KingkongPatch.apk",
        "assets/MidasPay.zip",
        "assets/live_shopping_manager.apk",
        "assets/res_hub/mobile_qq_android/online/config.json",
        "assets/spring_2023_gesture_hand.png",
        "assets/springhb/",
        "assets/springhb_shuayishua/",
    ) + nativeLibs("libMMANDKSignature.so"),
    manifestComponents = setOf(
        "cooperation.vip.ad.UserLeadingActivity",
        // Split-APK marker, meaningless for a single merged APK.
        "com.android.vending.splits",
    ),
)
