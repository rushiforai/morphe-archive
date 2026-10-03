/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.app.Application;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.ref.WeakReference;

import app.morphe.extension.facebook.feed.HomeFeedFilter;
import app.morphe.extension.facebook.feed.ReturnRefresh;
import app.morphe.extension.facebook.FeedSanitizer;
import app.morphe.extension.facebook.media.DownloadQuality;
import app.morphe.extension.facebook.media.PlaybackQuality;
import app.morphe.extension.facebook.media.ReelsGestureController;
import app.morphe.extension.facebook.media.ReelsPlaybackSpeed;
import app.morphe.extension.facebook.media.VideoPictureInPictureController;
import app.morphe.extension.facebook.PerformanceOptimizer;
import app.morphe.extension.facebook.StrictAdBlocker;
import app.morphe.extension.facebook.theme.AmoledTheme;
import app.morphe.extension.facebook.theme.MaterialYouTheme;

public final class DeVancedSettings {
    private static final String TAG = "DeVancedSettings";
    private static final String PROFILE_NATIVE_LABEL = "De-Vanced Settings";
    private static final String PROFILE_NATIVE_ACTION = "DE_VANCED_SETTINGS";
    private static final String SETTINGS_GEAR_DRAWABLE =
            "devanced_settings_gear";
    private static final String SHORTCUT_ID = "devanced_settings";
private static volatile Object customNativeActionModel;
private static volatile Object customNativeActionRvr;
private static volatile WeakReference<Activity> marketplacePending;
private static final String PREFS = "devanced_facebook_settings";
private static final long MARKETPLACE_TAB_ID = 1606854132932955L;
private static final String MARKETPLACE_ROUTED_EXTRA =
        "app.morphe.extension.facebook.MARKETPLACE_LAUNCH";
    private static final String KEY_DISABLE_ANALYTICS = "disable_analytics";
    private static final String KEY_FILTER_AI = "filter_ai_content_v2";
    private static final String KEY_DISABLE_ADS = "disable_ads";
    private static final String KEY_OPTIMIZE = "optimize_facebook";
    private static final String KEY_DOWNLOAD_QUALITY = "download_quality";
    private static final String KEY_REELS_PLAYBACK_QUALITY =
            "reels_playback_quality";
    private static final String KEY_STORIES_PLAYBACK_QUALITY =
            "stories_playback_quality";
    private static final String KEY_HIDE_HOME_REELS = "hide_home_reels";
    private static final String KEY_HIDE_HOME_STORIES = "hide_home_stories";
    private static final String KEY_HIDE_HOME_SUGGESTIONS =
            "hide_home_suggestions";
    private static final String KEY_DISABLE_AUTO_REFRESH =
            "disable_auto_refresh";
    private static final String KEY_AMOLED_THEME = "amoled_theme";
    private static final String KEY_MATERIAL_YOU_THEME = "material_you_theme";
    private static final String KEY_PICTURE_IN_PICTURE =
            "picture_in_picture";
    private static final String KEY_MARKETPLACE_ON_LAUNCH =
            "marketplace_on_launch";
    private static final String KEY_REDUCE_ANIMATIONS =
            "reduce_animations";
    private static final String KEY_DISABLE_HAPTICS =
            "disable_haptic_feedback";
    private static final String KEY_REDUCE_BACKGROUND_WORK =
            "reduce_background_work";
    private static final String KEY_REELS_2X_SPEED =
            "reels_2x_speed";

    private static final String[] ANALYTICS_COMPONENTS = {
            "com.facebook.analytics2.fabric.onefabric.OneFabricUploadAlarmReceiver",
            "com.facebook.analytics2.fabric.onefabric.FFAlarmUploadJobService",
            "com.facebook.analytics2.logger.GooglePlayUploadService",
            "com.facebook.analytics2.logger.service.LollipopUploadSafeService",
            "com.facebook.analytics2.logger.legacy.uploader.LollipopUploadService",
            "com.facebook.analytics2.logger.legacy.uploader.Analytics2UploadService",
            "com.facebook.analytics2.logger.legacy.uploader.AlarmBasedUploadService",
            "com.facebook.analytics2.logger.legacy.uploader.HighPriUploadRetryReceiver",
            "com.facebook.falco.jobscheduler.FFJobService",
            "com.facebook.papaya.fb.client.services.FBPapayaJobService",
            "com.facebook.profilo.upload.TraceUploadRetryJob",
            "com.facebook.common.errorreporting.memory.service.jobschedulercompat.fbsvc.DumperUploadService",
            "com.facebook.reportaproblem.base.bugreport.BugReportUploadService",
            "com.facebook.quicklog.filelogger.QPLFileLogBroadcastReceiver",
            "com.facebook.quicklog.module.QPLEventFlushActivity",
            "com.facebook.quicklog.module.QPLRecorderDumpActivity",
            "com.facebook.bugreporter.core.scheduler.AlarmsBroadcastReceiver",
            "com.facebook.bugreporter.core.scheduler.GCMBugReportService",
            "com.facebook.bugreporter.core.scheduler.LollipopBugReportService",
            "com.facebook.errorreporting.lacrima.detector.broadcast.ProtectedLockScreenBroadcastReceiver",
            "com.facebook.errorreporting.lacrima.detector.broadcast.PublicLockScreenBroadcastReceiver",
            "com.facebook.errorreporting.lacrima.detector.broadcast.SecureShutdownBootBroadcastReceiver",
            "com.facebook.googleplay.GooglePlayInstallReferrerReceiver",
            "com.facebook.katana.provider.AttributionIdProvider",
            "com.facebook.katana.provider.InstallReferrerProvider",
            "com.facebook.katana.provider.FirstPartyUserValuesProvider",
            "com.facebook.katana.liteprovider.FirstPartyUserValuesLiteProvider",
            "com.facebook.katana.provider.LastUsedTimestampProvider",
            "com.facebook.katana.liteprovider.usdid.UsdidValuesProvider",
            "com.facebook.fdidlite.FDIDLiteProvider",
            "com.facebook.adspayments.analytics.ExperimentExposeService",
            "com.facebook.notifications.appwidget.bugreporter.NotificationsWidgetDebugHelper",
            "com.google.android.gms.analytics.AnalyticsReceiver",
            "com.google.android.gms.analytics.AnalyticsService",
            "com.google.android.gms.analytics.AnalyticsJobService"
    };

    private static final String[] ANALYTICS_JOB_PREFIXES = {
            "com.facebook.analytics",
            "com.facebook.falco.",
            "com.facebook.papaya.",
            "com.facebook.profilo.",
            "com.facebook.quicklog.",
            "com.facebook.bugreporter.",
            "com.facebook.reportaproblem.",
            "com.facebook.errorreporting.",
            "com.facebook.xanalytics.",
            "com.google.android.gms.analytics."
    };

    private static volatile Application application;
    private static volatile boolean disableAnalytics = true;
    private static volatile boolean filterAiContent = true;
    private static volatile boolean disableAds = true;
    private static volatile boolean optimizeFacebook = true;
    private static volatile DownloadQuality downloadQuality =
            DownloadQuality.HIGHEST;
    private static volatile PlaybackQuality reelsPlaybackQuality =
            PlaybackQuality.AUTO;
    private static volatile PlaybackQuality storiesPlaybackQuality =
            PlaybackQuality.AUTO;
    private static volatile boolean hideHomeReels;
    private static volatile boolean hideHomeStories;
    private static volatile boolean hideHomeSuggestions;
    private static volatile boolean disableAutoRefresh;
    private static volatile boolean amoledTheme;
    private static volatile boolean materialYouTheme;
    private static volatile boolean pictureInPicture;
    private static volatile boolean marketplaceOnLaunch;
    private static volatile boolean reduceAnimations = true;
    private static volatile boolean disableHaptics = true;
    private static volatile boolean reduceBackgroundWork = true;
    private static volatile boolean reels2xSpeed;
    private DeVancedSettings() {
    }

    public static synchronized void initialize(Application app) {
        if (app == null) return;
        application = app;
        reload(app);
        applyAnalyticsComponents(app, disableAnalytics);
        PerformanceOptimizer.setEnabled(optimizeFacebook);
        VideoPictureInPictureController.initialize(app);
        ReturnRefresh.register(app);
        AmoledTheme.initialize(app);
        MaterialYouTheme.initialize(app, materialYouTheme);
        FeedSanitizer.initialize(app);
        ReelsGestureController.initialize(app);
        publishShortcut(app);
        Log.i(TAG, "initialized: filterAi=" + filterAiContent + ", disableAds=" + disableAds +
                ", hideReels=" + hideHomeReels + ", hideStories=" + hideHomeStories +
                ", hideSuggestions=" + hideHomeSuggestions +
                ", disableAutoRefresh=" + disableAutoRefresh +
                ", amoledTheme=" + amoledTheme +
                ", materialYouTheme=" + materialYouTheme +
                ", marketplaceOnLaunch=" + marketplaceOnLaunch +
                ", reduceAnimations=" + reduceAnimations +
                ", disableHaptics=" + disableHaptics +
                ", reduceBackgroundWork=" + reduceBackgroundWork +
                ", reels2xSpeed=" + reels2xSpeed);
    }

    private static void publishShortcut(Context context) {
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            for (ShortcutInfo existing : manager.getDynamicShortcuts()) {
                if (SHORTCUT_ID.equals(existing.getId())) return;
            }
            Intent intent = new Intent(context, DeVancedSettingsActivity.class)
                    .setAction(Intent.ACTION_VIEW)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            Bitmap icon = Bitmap.createBitmap(432, 432, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(icon);
            canvas.drawColor(Color.BLACK);
            Paint disc = new Paint(Paint.ANTI_ALIAS_FLAG);
            disc.setColor(0xFF1877F2);
            canvas.drawCircle(216f, 216f, 132f, disc);
            Paint letter = new Paint(Paint.ANTI_ALIAS_FLAG);
            letter.setColor(Color.WHITE);
            letter.setTextAlign(Paint.Align.CENTER);
            letter.setTypeface(Typeface.DEFAULT_BOLD);
            letter.setTextSize(180f);
            Paint.FontMetrics metrics = letter.getFontMetrics();
            canvas.drawText("D", 216f, 216f - (metrics.ascent + metrics.descent) / 2f, letter);
            ShortcutInfo shortcut = new ShortcutInfo.Builder(context, SHORTCUT_ID)
                    .setShortLabel("De-Vanced")
                    .setLongLabel("De-Vanced Settings")
                    .setIcon(Icon.createWithAdaptiveBitmap(icon))
                    .setIntent(intent)
                    .setRank(0)
                    .build();
            manager.pushDynamicShortcut(shortcut);
        } catch (Throwable ignored) {
        }
    }

    private static void reload(Context context) {
        SharedPreferences preferences =
                context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        disableAnalytics = preferences.getBoolean(KEY_DISABLE_ANALYTICS, true);
        filterAiContent = preferences.getBoolean(KEY_FILTER_AI, true);
        disableAds = preferences.getBoolean(KEY_DISABLE_ADS, true);
        optimizeFacebook = preferences.getBoolean(KEY_OPTIMIZE, true);
        downloadQuality = DownloadQuality.fromPreference(
                preferences.getString(
                        KEY_DOWNLOAD_QUALITY,
                        DownloadQuality.HIGHEST.name()
                )
        );
        reelsPlaybackQuality = PlaybackQuality.fromPreference(
                preferences.getString(
                        KEY_REELS_PLAYBACK_QUALITY,
                        PlaybackQuality.AUTO.name()
                )
        );
        storiesPlaybackQuality = PlaybackQuality.fromPreference(
                preferences.getString(
                        KEY_STORIES_PLAYBACK_QUALITY,
                        PlaybackQuality.AUTO.name()
                )
        );
        hideHomeReels = preferences.getBoolean(KEY_HIDE_HOME_REELS, false);
        hideHomeStories = preferences.getBoolean(KEY_HIDE_HOME_STORIES, false);
        hideHomeSuggestions =
                preferences.getBoolean(KEY_HIDE_HOME_SUGGESTIONS, false);
        disableAutoRefresh =
                preferences.getBoolean(KEY_DISABLE_AUTO_REFRESH, true);
        amoledTheme = preferences.getBoolean(KEY_AMOLED_THEME, false);
        materialYouTheme =
                preferences.getBoolean(KEY_MATERIAL_YOU_THEME, false);
        pictureInPicture =
                preferences.getBoolean(KEY_PICTURE_IN_PICTURE, false);
        marketplaceOnLaunch =
                preferences.getBoolean(KEY_MARKETPLACE_ON_LAUNCH, false);
        reduceAnimations =
                preferences.getBoolean(KEY_REDUCE_ANIMATIONS, true);
        disableHaptics =
                preferences.getBoolean(KEY_DISABLE_HAPTICS, true);
        reduceBackgroundWork =
                preferences.getBoolean(KEY_REDUCE_BACKGROUND_WORK, true);
        reels2xSpeed =
                preferences.getBoolean(KEY_REELS_2X_SPEED, false);
    }

    public static boolean isAnalyticsDisabled() {
        return disableAnalytics;
    }

    public static boolean isAiFilterEnabled() {
        return filterAiContent;
    }

    public static boolean isAdsDisabled() {
        return disableAds;
    }

    public static boolean isOptimizationEnabled() {
        return optimizeFacebook;
    }

    public static DownloadQuality getDownloadQuality() {
        return downloadQuality;
    }

    public static PlaybackQuality getReelsPlaybackQuality() {
        return reelsPlaybackQuality;
    }

    public static PlaybackQuality getStoriesPlaybackQuality() {
        return storiesPlaybackQuality;
    }

    public static boolean isHomeReelsHidden() {
        return hideHomeReels;
    }

    public static boolean isHomeStoriesHidden() {
        return hideHomeStories;
    }

    public static boolean isHomeSuggestionsHidden() {
        return hideHomeSuggestions;
    }

    public static boolean isAutoRefreshDisabled() {
        return disableAutoRefresh;
    }

    public static boolean isAmoledThemeEnabled() {
        return amoledTheme;
    }

    public static boolean isMaterialYouThemeEnabled() {
        return materialYouTheme;
    }

    public static boolean isPictureInPictureEnabled() {
        return pictureInPicture;
    }

    public static boolean isMarketplaceOnLaunchEnabled() {
        return marketplaceOnLaunch;
    }

    public static boolean isReduceAnimationsEnabled() {
        return reduceAnimations;
    }

    public static boolean isHapticsDisabled() {
        return disableHaptics;
    }

    public static boolean isBackgroundWorkReduced() {
        return reduceBackgroundWork;
    }

    public static boolean isReels2xSpeedEnabled() {
        return reels2xSpeed;
    }

    public static boolean filterAnalyticsBooleanResult(boolean original) {
        return disableAnalytics ? false : original;
    }

    public static int filterAnalyticsStartCommandResult(int original) {
        return disableAnalytics
                ? android.app.Service.START_NOT_STICKY
                : original;
    }

    public static void setAnalyticsDisabled(Context context, boolean enabled) {
        disableAnalytics = enabled;
        putBoolean(context, KEY_DISABLE_ANALYTICS, enabled);
        Application app = application;
        if (app != null) applyAnalyticsComponents(app, enabled);
    }

    public static void setAiFilterEnabled(Context context, boolean enabled) {
        filterAiContent = enabled;
        putBoolean(context, KEY_FILTER_AI, enabled);
        StrictAdBlocker.clearClassificationCache();
        FeedSanitizer.requestScan();
    }

    public static void setAdsDisabled(Context context, boolean enabled) {
        disableAds = enabled;
        putBoolean(context, KEY_DISABLE_ADS, enabled);
        StrictAdBlocker.clearClassificationCache();
        FeedSanitizer.requestScan();
    }

    public static void setOptimizationEnabled(Context context, boolean enabled) {
        optimizeFacebook = enabled;
        putBoolean(context, KEY_OPTIMIZE, enabled);
        PerformanceOptimizer.setEnabled(enabled);
    }

    public static void setDownloadQuality(
            Context context,
            DownloadQuality quality
    ) {
        downloadQuality = quality == null
                ? DownloadQuality.HIGHEST
                : quality;
        putString(context, KEY_DOWNLOAD_QUALITY, downloadQuality.name());
    }

    public static void setReelsPlaybackQuality(
            Context context,
            PlaybackQuality quality
    ) {
        reelsPlaybackQuality = quality == null
                ? PlaybackQuality.AUTO
                : quality;
        putString(
                context,
                KEY_REELS_PLAYBACK_QUALITY,
                reelsPlaybackQuality.name()
        );
    }

    public static void setStoriesPlaybackQuality(
            Context context,
            PlaybackQuality quality
    ) {
        storiesPlaybackQuality = quality == null
                ? PlaybackQuality.AUTO
                : quality;
        putString(
                context,
                KEY_STORIES_PLAYBACK_QUALITY,
                storiesPlaybackQuality.name()
        );
    }

    public static void setHomeReelsHidden(Context context, boolean hidden) {
        hideHomeReels = hidden;
        putBoolean(context, KEY_HIDE_HOME_REELS, hidden);
        HomeFeedFilter.clearCaches();
        FeedSanitizer.requestScan();
    }

    public static void setHomeStoriesHidden(Context context, boolean hidden) {
        hideHomeStories = hidden;
        putBoolean(context, KEY_HIDE_HOME_STORIES, hidden);
        HomeFeedFilter.clearCaches();
        FeedSanitizer.requestScan();
    }

    public static void setHomeSuggestionsHidden(
            Context context,
            boolean hidden
    ) {
        hideHomeSuggestions = hidden;
        putBoolean(context, KEY_HIDE_HOME_SUGGESTIONS, hidden);
        HomeFeedFilter.clearCaches();
        FeedSanitizer.requestScan();
    }

    public static void setAutoRefreshDisabled(
            Context context,
            boolean disabled
    ) {
        disableAutoRefresh = disabled;
        putBoolean(context, KEY_DISABLE_AUTO_REFRESH, disabled);
    }

    public static void setAmoledThemeEnabled(
            Context context,
            boolean enabled
    ) {
        amoledTheme = enabled;
        putBoolean(context, KEY_AMOLED_THEME, enabled);
        AmoledTheme.requestViewRepair(context);
        scheduleFacebookRestartV2(context);
    }

    public static void setMaterialYouThemeEnabled(
            Context context,
            boolean enabled
    ) {
        materialYouTheme = enabled;
        putBoolean(context, KEY_MATERIAL_YOU_THEME, enabled);
        MaterialYouTheme.setEnabled(context, enabled);
        AmoledTheme.requestViewRepair(context);
        scheduleFacebookRestartV2(context);
    }

    public static void setPictureInPictureEnabled(
            Context context,
            boolean enabled
    ) {
        pictureInPicture = enabled;
        putBoolean(context, KEY_PICTURE_IN_PICTURE, enabled);
        VideoPictureInPictureController.setEnabled(enabled);
    }

    public static void setMarketplaceOnLaunchEnabled(
            Context context,
            boolean enabled
    ) {
        marketplaceOnLaunch = enabled;
        putBoolean(context, KEY_MARKETPLACE_ON_LAUNCH, enabled);
    }

    public static void onMarketplaceActivityCreateV2(
            Activity activity,
            Bundle savedState
    ) {
        if (activity == null) return;
        marketplacePending = null;
        Intent launchIntent = activity.getIntent();
        boolean plainLauncher = isLauncherStart(launchIntent);
        Log.i(TAG, "marketplace create class=" + activity.getClass().getName() +
                " enabled=" + marketplaceOnLaunch +
                " saved=" + (savedState != null) +
                " plain=" + plainLauncher);
        if (!marketplaceOnLaunch || savedState != null || !plainLauncher) {
            return;
        }
        activity.setIntent(routeMarketplace(launchIntent));
        marketplacePending = new WeakReference<>(activity);
        scheduleMarketplaceDeepLink(activity);
        Log.i(TAG, "marketplace route set on " + activity.getClass().getName());
    }

    private static void scheduleMarketplaceDeepLink(Activity activity) {
        if (activity == null) return;
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            Activity host = marketplacePending == null
                    ? null
                    : marketplacePending.get();
            if (host != activity ||
                    host.isFinishing() ||
                    host.isDestroyed()) {
                return;
            }
            try {
                Intent marketplace = new Intent(
                        Intent.ACTION_VIEW,
                        Uri.parse("fb://marketplace")
                );
                host.startActivity(marketplace);
                Log.i(TAG, "marketplace deep link started");
            } catch (Throwable error) {
                Log.w(TAG, "marketplace deep link failed", error);
            }
        }, 250L);
    }

    public static void onMarketplaceActivityCreate(
            Activity activity,
            Bundle savedState
    ) {
        if (activity == null ||
                !"com.facebook.katana.activity.FbMainTabActivity"
                    .equals(activity.getClass().getName())) {
            return;
        }
        marketplacePending = null;
        if (!marketplaceOnLaunch || savedState != null ||
                !isLauncherStart(activity.getIntent())) {
            return;
        }
        activity.setIntent(routeMarketplace(activity.getIntent()));
        marketplacePending = new WeakReference<>(activity);
    }

    public static void setMarketplaceSanitizedIntent(
            Activity activity,
            Intent sanitized
    ) {
        Intent next = sanitized;
        try {
            Log.i(TAG, "marketplace sanitize pending=" +
                    isMarketplacePending(activity));
            if (isMarketplacePending(activity) && sanitized != null &&
                    !sanitized.hasExtra("target_tab_id")) {
                next = routeMarketplace(sanitized);
            }
        } catch (Throwable ignored) {
            next = sanitized;
        }
        Log.i(TAG, "marketplace sanitized final target=" +
                next.hasExtra("target_tab_id") +
                " value=" + next.getLongExtra("target_tab_id", -1L));
        activity.setIntent(next);
    }

    public static boolean startMarketplaceOnAskedTab(boolean original) {
        Log.i(TAG, "marketplace start gate pending=" +
                (pendingMarketplaceV2() != null) + " original=" + original);
        return pendingMarketplaceV2() != null || original;
    }

    public static boolean keepMarketplaceAskedStartTab(boolean original) {
        Log.i(TAG, "marketplace keep gate pending=" +
                (pendingMarketplaceV2() != null) + " original=" + original);
        return pendingMarketplaceV2() != null || original;
    }

    private static boolean isMarketplacePending(Activity activity) {
        WeakReference<Activity> current = marketplacePending;
        return current != null && current.get() == activity &&
                pendingMarketplaceV2() != null;
    }

    private static Activity pendingMarketplaceV2() {
        WeakReference<Activity> current = marketplacePending;
        Activity activity = current == null ? null : current.get();
        if (activity == null || activity.isFinishing() ||
                activity.isDestroyed()) {
            marketplacePending = null;
            return null;
        }
        return activity;
    }

    private static Activity pendingMarketplace() {
        WeakReference<Activity> current = marketplacePending;
        Activity activity = current == null ? null : current.get();
        if (activity == null || activity.isFinishing() ||
                activity.isDestroyed()) {
            marketplacePending = null;
            return null;
        }
        Intent intent = activity.getIntent();
        return intent != null &&
                intent.getBooleanExtra(MARKETPLACE_ROUTED_EXTRA, false)
                ? activity : null;
    }

    private static boolean isLauncherStart(Intent intent) {
        return intent != null &&
                Intent.ACTION_MAIN.equals(intent.getAction()) &&
                intent.hasCategory(Intent.CATEGORY_LAUNCHER) &&
                intent.getData() == null &&
                !intent.hasExtra("target_tab_id") &&
                !intent.hasExtra("tabbar_target_intent") &&
                !intent.hasExtra("extra_launch_uri") &&
                !intent.hasExtra("target_fragment") &&
                !intent.hasExtra("fragment_type");
    }

    private static Intent routeMarketplace(Intent intent) {
        return new Intent(intent)
                .putExtra("target_tab_id", MARKETPLACE_TAB_ID)
                .putExtra(MARKETPLACE_ROUTED_EXTRA, true);
    }

    public static void setReduceAnimationsEnabled(
            Context context,
            boolean enabled
    ) {
        reduceAnimations = enabled;
        putBoolean(context, KEY_REDUCE_ANIMATIONS, enabled);
        PerformanceOptimizer.setEnabled(optimizeFacebook);
    }

    public static void setHapticsDisabled(
            Context context,
            boolean disabled
    ) {
        disableHaptics = disabled;
        putBoolean(context, KEY_DISABLE_HAPTICS, disabled);
        PerformanceOptimizer.setEnabled(optimizeFacebook);
    }

    public static void setBackgroundWorkReduced(
            Context context,
            boolean reduced
    ) {
        reduceBackgroundWork = reduced;
        putBoolean(context, KEY_REDUCE_BACKGROUND_WORK, reduced);
        PerformanceOptimizer.setEnabled(optimizeFacebook);
    }

    public static void setReels2xSpeedEnabled(
            Context context,
            boolean enabled
    ) {
        reels2xSpeed = enabled;
        putBoolean(context, KEY_REELS_2X_SPEED, enabled);
        ReelsGestureController.cancelForSettingChange();
        if (!enabled) ReelsPlaybackSpeed.resetGestureState();
    }

    private static void putBoolean(Context context, String key, boolean value) {
        if (context == null) return;
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit()
                .putBoolean(key, value)
                .apply();
    }

    private static void putString(Context context, String key, String value) {
        if (context == null) return;
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit()
                .putString(key, value)
                .apply();
    }

    private static void scheduleFacebookRestartV2(final Context context) {
        if (context == null) return;
        final Context appContext = context.getApplicationContext();
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                if (context instanceof Activity) {
                    ((Activity) context).finishAffinity();
                }
            } catch (Throwable ignored) {
            }
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                try {
                    Intent launch = appContext.getPackageManager()
                            .getLaunchIntentForPackage(
                                    appContext.getPackageName()
                            );
                    if (launch == null) return;
                    launch.addFlags(
                            Intent.FLAG_ACTIVITY_NEW_TASK |
                                    Intent.FLAG_ACTIVITY_CLEAR_TASK |
                                    Intent.FLAG_ACTIVITY_CLEAR_TOP
                    );
                    appContext.startActivity(launch);
                } catch (Throwable error) {
                    Log.w(TAG, "theme restart failed", error);
                }
            }, 160L);
        }, 120L);
    }

    private static void scheduleFacebookRestart(final Context context) {
        if (context == null) return;
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                Intent launch = context.getPackageManager()
                        .getLaunchIntentForPackage(context.getPackageName());
                if (launch == null) return;
                launch.addFlags(
                        Intent.FLAG_ACTIVITY_NEW_TASK |
                                Intent.FLAG_ACTIVITY_CLEAR_TASK |
                                Intent.FLAG_ACTIVITY_CLEAR_TOP
                );
                context.startActivity(launch);
                if (context instanceof Activity) {
                    ((Activity) context).finishAffinity();
                }
            } catch (Throwable error) {
                Log.w(TAG, "theme restart failed", error);
            }
        }, 350L);
    }

    public static void openSettings(Context context) {
        if (context == null) return;
        Intent intent = new Intent();
        intent.setClassName(
                context,
                "app.morphe.extension.facebook.settings.DeVancedSettingsActivity"
        );
        if (!(context instanceof android.app.Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(intent);
    }

    /**
     * Adds one entry to Facebook's native profile action model list.
     *
     * Facebook supplies this collection as pairs of its own GraphQL action
     * model and the label used by the Litho row renderer. The model is kept
     * from an existing native action so Facebook supplies the normal icon and
     * row behavior; the row click handler is replaced by the bytecode patch.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void appendNativeProfileAction(
        java.util.AbstractCollection actions
    ) {
        if (actions == null || actions.isEmpty()) return;

        try {
            Object template = null;
            for (Object action : actions) {
                Object label = readPairField(action, "second");
                if (PROFILE_NATIVE_LABEL.equals(String.valueOf(label))) {
                    return;
                }
                if (template == null && isSettingsAction(action)) {
                    template = action;
                }
                if (template == null) {
                    template = action;
                }
            }
            if (template == null) return;

            Object model = readPairField(template, "first");
            Class<?> pairClass = template.getClass();
            java.lang.reflect.Constructor<?> constructor =
                    pairClass.getDeclaredConstructor(
                            Object.class,
                            Object.class
                    );
            constructor.setAccessible(true);
            actions.add(
                    constructor.newInstance(model, PROFILE_NATIVE_LABEL)
            );
        } catch (Throwable error) {
            Log.w(TAG, "native profile action append failed", error);
        }
    }

    public static void configureNativeProfileRow(
            Object row,
            CharSequence label,
            Object sectionContext
    ) {
        if (row == null || !PROFILE_NATIVE_LABEL.contentEquals(label)) {
            return;
        }

        try {
            Class<?> eventKindClass = Class.forName("X.1Gn");
            java.lang.reflect.Field eventKind =
                    eventKindClass.getDeclaredField("A03");
            eventKind.setAccessible(true);

            Class<?> sectionContextClass = Class.forName("X.1oa");
            java.lang.reflect.Method eventFactory =
                    Class.forName("X.PyD").getDeclaredMethod(
                            "A1Y",
                            eventKindClass,
                            sectionContextClass,
                            Class.class,
                            String.class,
                            Object[].class,
                            int.class
                    );
            eventFactory.setAccessible(true);
            Object event = eventFactory.invoke(
                    null,
                    eventKind.get(null),
                    sectionContext,
                    Class.forName("X.SlB"),
                    "ProfileDynamicActionBarOverflowSection",
                    new Object[]{
                            "DE_VANCED_SETTINGS",
                            label,
                            null
                    },
                    -881715170
            );

            Class<?> eventClass = Class.forName("X.dBt");
            java.lang.reflect.Method attach =
                    findDeclaredMethod(row.getClass(), "A2j", eventClass);
            if (attach == null) {
                throw new NoSuchMethodException("A2j");
            }
            attach.setAccessible(true);
            attach.invoke(row, event);
        } catch (Throwable error) {
            Log.w(TAG, "native profile row click binding failed", error);
        }
    }

    public static String handleNativeProfileClick(
            String action,
            Object contextHolder
    ) {
        return dispatchNativeProfileClick(action, contextHolder)
                ? ""
                : action;
    }

    public static boolean isNativeProfileAction(String action) {
        return PROFILE_NATIVE_ACTION.equals(action);
    }

    public static boolean dispatchNativeProfileClick(String action) {
        return dispatchNativeProfileClick(action, application);
    }

    public static boolean dispatchNativeProfileClickForRvr(Object rvr) {
        if (rvr != customNativeActionRvr) return false;
        try {
            openSettings(application);
        } catch (Throwable error) {
            Log.w(TAG, "native profile Rvr click failed", error);
        }
        return true;
    }

    public static boolean dispatchNativeProfileClick(
            String action,
            Object contextHolder
    ) {
        if (!isNativeProfileAction(action)) return false;

        try {
            Context context = contextFromHolder(contextHolder);
            openSettings(context != null ? context : application);
        } catch (Throwable error) {
            Log.w(TAG, "native profile row click failed", error);
        }
        return true;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void appendNativeDataDiffAction(Object section) {
        if (section == null) return;

        try {
            java.lang.reflect.Field listField =
                    findField(section.getClass(), "A05");
            if (listField == null) return;
            listField.setAccessible(true);
            Object value = listField.get(section);
            if (!(value instanceof java.util.List)) return;

            java.util.List current = (java.util.List) value;
            if (customNativeActionModel != null &&
                    current.contains(customNativeActionModel)) {
                return;
            }

            Object template = null;
            String modelAccessor = null;
            for (Object item : current) {
                String accessor = findNoArgAccessor(
                        item,
                        "AGh",
                        "AEo",
                        "AEr"
                );
                if (accessor != null) {
                    template = item;
                    modelAccessor = accessor;
                    break;
                }
            }
            if (template == null || modelAccessor == null) return;

            Object clonedModel = cloneGraphObject(template);
            Object originalRvr = invokeNoArgs(template, modelAccessor);
            Object clonedRvr = cloneGraphObject(originalRvr);
            Object originalRwy = invokeNoArgs(originalRvr, "A00");
            if (clonedModel == null ||
                    clonedRvr == null ||
                    originalRwy == null) {
                Log.w(TAG, "native data diff clone unavailable");
                return;
            }

            boolean rvrLinked = linkCachedObject(
                    clonedRvr,
                    originalRwy,
                    "A00",
                    new int[]{
                            -1827023272,
                            1294166455,
                            961636491,
                            2107353906
                    }
            );
            boolean modelLinked = linkCachedObject(
                    clonedModel,
                    clonedRvr,
                    modelAccessor,
                    new int[]{
                            -683926361,
                            1443520086,
                            1294166455,
                            -1827023272
                    }
            );
            if (!rvrLinked || !modelLinked) {
                Log.w(
                        TAG,
                        "native data diff clone links failed rvr=" +
                                rvrLinked + " model=" + modelLinked
                );
                return;
            }

            java.util.ArrayList updated =
                    new java.util.ArrayList(current);
            updated.add(clonedModel);
            listField.set(section, updated);
            customNativeActionModel = clonedModel;
            customNativeActionRvr = clonedRvr;
        } catch (Throwable error) {
            Log.w(TAG, "native data diff append failed", error);
        }
    }

    public static String overrideProfileActionLabel(
            String original,
            Object model
    ) {
        if (!isCustomNativeProfileObject(model)) {
            return original;
        }
        return PROFILE_NATIVE_LABEL;
    }

    public static android.graphics.drawable.Drawable
            overrideNativeProfileDrawable(
                    android.graphics.drawable.Drawable original,
                    Object model,
                    Context context
            ) {
        if (!isCustomNativeProfileObject(model)) {
            return original;
        }
        try {
            if (context != null) {
                int gearResource = context.getResources().getIdentifier(
                        SETTINGS_GEAR_DRAWABLE,
                        "drawable",
                        context.getPackageName()
                );
                if (gearResource != 0) {
                    android.graphics.drawable.Drawable gear =
                            context.getDrawable(gearResource);
                    if (gear != null) {
                        return copyNativeDrawableAppearance(gear, original);
                    }
                }
            }

            if (context != null) {
                int gearResource = context.getResources().getIdentifier(
                        "meta_brand_design_system_icons_raster_gear_outline_24",
                        "drawable",
                        context.getPackageName()
                );
                if (gearResource != 0) {
                    android.graphics.drawable.Drawable gear =
                            context.getDrawable(gearResource);
                    if (gear != null) {
                        return copyNativeDrawableAppearance(gear, original);
                    }
                }
            }

            Class<?> iconProvider = Class.forName("X.9n6");
            java.lang.reflect.Constructor<?> constructor =
                    iconProvider.getDeclaredConstructor();
            constructor.setAccessible(true);
            Object provider = constructor.newInstance();
            java.lang.reflect.Method drawableMethod =
                    iconProvider.getDeclaredMethod(
                            "A00",
                            Context.class,
                            String.class
                    );
            drawableMethod.setAccessible(true);
            Object gear = drawableMethod.invoke(
                    provider,
                    context,
                    "slate-settings"
            );
            return gear instanceof android.graphics.drawable.Drawable
                    ? (android.graphics.drawable.Drawable) gear
                    : original;
        } catch (Throwable error) {
            Log.w(TAG, "custom native row gear drawable failed", error);
            return original;
        }
    }

    public static android.graphics.drawable.Drawable
            overrideNativeProfileDrawableRange(
                    Object model,
                    android.graphics.drawable.Drawable original,
                    Context context
            ) {
        return overrideNativeProfileDrawable(original, model, context);
    }

    private static android.graphics.drawable.Drawable
            copyNativeDrawableAppearance(
                    android.graphics.drawable.Drawable drawable,
                    android.graphics.drawable.Drawable original
            ) {
        if (drawable == null) return null;
        android.graphics.drawable.Drawable copy = drawable.mutate();
        if (original != null) {
            android.graphics.ColorFilter colorFilter =
                    original.getColorFilter();
            if (colorFilter != null) {
                copy.setColorFilter(colorFilter);
            }
        }
        return copy;
    }

    private static boolean isCustomNativeProfileObject(Object candidate) {
        if (candidate == null) return false;
        if (candidate == customNativeActionModel ||
                candidate == customNativeActionRvr) {
            return true;
        }

        java.util.Set<Object> seen =
                java.util.Collections.newSetFromMap(
                        new java.util.IdentityHashMap<>()
                );
        Object current = candidate;
        for (int depth = 0; depth < 4 &&
                current != null &&
                seen.add(current);
                depth++) {
            try {
                Object actionType = invokeFirstNoArgs(
                        current,
                        "Bvt",
                        "Bub",
                        "Bv6"
                );
                if (PROFILE_NATIVE_ACTION.equals(
                        String.valueOf(actionType)
                )) {
                    return true;
                }
            } catch (Throwable ignored) {
            }

            Object next = invokeFirstNoArgs(
                    current,
                    "AGh",
                    "AEo",
                    "AEr"
            );
            if (next == null) {
                try {
                    next = invokeNoArgs(current, "A00");
                } catch (Throwable ignored) {
                }
            }
            if (next == null || next == current) {
                break;
            }
            current = next;
        }
        return false;
    }

    private static Context contextFromHolder(Object holder) {
        if (holder instanceof Context) {
            return (Context) holder;
        }
        if (holder == null) return application;

        try {
            java.lang.reflect.Field contextField =
                    holder.getClass().getDeclaredField("A0C");
            contextField.setAccessible(true);
            Object context = contextField.get(holder);
            if (context instanceof Context) {
                return (Context) context;
            }
        } catch (Throwable ignored) {
        }
        return application;
    }

    private static java.lang.reflect.Method findDeclaredMethod(
            Class<?> type,
            String name,
            Class<?>... parameterTypes
    ) {
        for (Class<?> current = type;
                current != null;
                current = current.getSuperclass()) {
            try {
                return current.getDeclaredMethod(name, parameterTypes);
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    private static java.lang.reflect.Field findField(
            Class<?> type,
            String name
    ) {
        for (Class<?> current = type;
                current != null;
                current = current.getSuperclass()) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
            }
        }
        return null;
    }

    private static Object invokeNoArgs(Object target, String name)
            throws Exception {
        if (target == null) return null;
        java.lang.reflect.Method method =
                findDeclaredMethod(target.getClass(), name);
        if (method == null) {
            throw new NoSuchMethodException(name);
        }
        method.setAccessible(true);
        return method.invoke(target);
    }

    private static String findNoArgAccessor(
            Object target,
            String... names
    ) {
        if (target == null) return null;
        for (String name : names) {
            if (findDeclaredMethod(target.getClass(), name) != null) {
                return name;
            }
        }
        return null;
    }

    private static Object invokeFirstNoArgs(
            Object target,
            String... names
    ) {
        for (String name : names) {
            try {
                Object result = invokeNoArgs(target, name);
                if (result != null) return result;
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static void putCachedObject(
            Object target,
            int fieldKey,
            Object value
    ) throws Exception {
        ensureFieldCacheKey(target, fieldKey);
        java.lang.reflect.Method method =
                findDeclaredMethod(
                        target.getClass(),
                        "putToCache",
                        int.class,
                        Object.class
                );
        if (method == null) {
            throw new NoSuchMethodException("putToCache");
        }
        method.setAccessible(true);
        method.invoke(target, fieldKey, value);
    }

    private static void ensureFieldCacheKey(
            Object target,
            int fieldKey
    ) throws Exception {
        java.lang.reflect.Field setFieldsField =
                findField(target.getClass(), "mSetFields");
        java.lang.reflect.Field cacheField =
                findField(target.getClass(), "mFieldCache");
        if (setFieldsField == null || cacheField == null) {
            throw new NoSuchFieldException("GraphQL field cache");
        }
        setFieldsField.setAccessible(true);
        cacheField.setAccessible(true);

        int[] oldSetFields = (int[]) setFieldsField.get(target);
        if (oldSetFields == null) {
            oldSetFields = new int[0];
        }
        if (java.util.Arrays.binarySearch(oldSetFields, fieldKey) >= 0) {
            return;
        }

        int[] newSetFields =
                java.util.Arrays.copyOf(oldSetFields, oldSetFields.length + 1);
        newSetFields[oldSetFields.length] = fieldKey;
        java.util.Arrays.sort(newSetFields);

        Object[] oldCache = (Object[]) cacheField.get(target);
        int oldCacheLength = oldCache == null ? 0 : oldCache.length;
        int newCacheLength = Math.max(
                newSetFields.length + 2,
                oldCacheLength + 1
        );
        Object[] newCache = new Object[newCacheLength];
        if (oldCache != null) {
            int oldNormalLength =
                    Math.min(oldSetFields.length, oldCache.length);
            for (int index = 0; index < oldNormalLength; index++) {
                int newIndex = java.util.Arrays.binarySearch(
                        newSetFields,
                        oldSetFields[index]
                );
                if (newIndex >= 0 && newIndex < newCache.length) {
                    newCache[newIndex] = oldCache[index];
                }
            }
            if (oldCache.length >= 2) {
                newCache[newCache.length - 2] =
                        oldCache[oldCache.length - 2];
                newCache[newCache.length - 1] =
                        oldCache[oldCache.length - 1];
            }
        }
        setFieldsField.set(target, newSetFields);
        cacheField.set(target, newCache);
    }

    private static boolean linkCachedObject(
            Object target,
            Object value,
            String accessor,
            int[] fieldKeys
    ) {
        for (int fieldKey : fieldKeys) {
            try {
                putReinterpretCachedObject(target, fieldKey, value);
                Object linked = invokeNoArgs(target, accessor);
                if (linked == value) {
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private static void putReinterpretCachedObject(
            Object target,
            int fieldKey,
            Object value
    ) throws Exception {
        java.lang.reflect.Method method =
                findDeclaredMethod(
                        target.getClass(),
                        "putToReinterpretCache",
                        int.class,
                        Object.class
                );
        if (method == null) {
            throw new NoSuchMethodException("putToReinterpretCache");
        }
        method.setAccessible(true);
        method.invoke(target, fieldKey, value);
    }

    private static Object cloneGraphObject(Object source) {
        if (source == null) return null;
        try {
            Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
            java.lang.reflect.Field singleton =
                    unsafeClass.getDeclaredField("theUnsafe");
            singleton.setAccessible(true);
            Object unsafe = singleton.get(null);
            java.lang.reflect.Method allocate =
                    unsafeClass.getMethod(
                            "allocateInstance",
                            Class.class
                    );
            Object copy = allocate.invoke(unsafe, source.getClass());

            for (Class<?> current = source.getClass();
                    current != null;
                    current = current.getSuperclass()) {
                for (java.lang.reflect.Field field :
                        current.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(
                            field.getModifiers()
                    )) {
                        continue;
                    }
                    field.setAccessible(true);
                    Object value = field.get(source);
                    if ("mFieldCache".equals(field.getName()) &&
                            value instanceof Object[]) {
                        value = ((Object[]) value).clone();
                    }
                    field.set(copy, value);
                }
            }
            return copy;
        } catch (Throwable error) {
            Log.w(TAG, "native graph clone failed", error);
            return null;
        }
    }

    private static boolean isSettingsAction(Object pair) {
        Object label = readPairField(pair, "second");
        if (label != null &&
                String.valueOf(label).toLowerCase(
                        java.util.Locale.ROOT
                ).contains("settings")) {
            return true;
        }

        try {
            Object model = readPairField(pair, "first");
            Class<?> modelInterface = Class.forName("X.UT0");
            java.lang.reflect.Method actionIdMethod =
                    Class.forName("X.PyA").getDeclaredMethod(
                            "A0O",
                            modelInterface
                    );
            actionIdMethod.setAccessible(true);
            Object actionId = actionIdMethod.invoke(null, model);
            return actionId != null &&
                    String.valueOf(actionId).toLowerCase(
                            java.util.Locale.ROOT
                    ).contains("settings");
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Object readPairField(Object pair, String name) {
        if (pair == null) return null;
        try {
            java.lang.reflect.Field field =
                    pair.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(pair);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static void openRepository(Context context) {
        if (context == null) return;
        Intent intent = new Intent(
                Intent.ACTION_VIEW,
                Uri.parse("https://github.com/RookieEnough/De-Vanced")
        );
        if (!(context instanceof android.app.Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(intent);
    }

    private static void applyAnalyticsComponents(Application app, boolean disabled) {
        PackageManager packageManager = app.getPackageManager();
        int state = disabled
                ? PackageManager.COMPONENT_ENABLED_STATE_DISABLED
                : PackageManager.COMPONENT_ENABLED_STATE_DEFAULT;
        int changed = 0;
        for (String className : ANALYTICS_COMPONENTS) {
            try {
                packageManager.setComponentEnabledSetting(
                        new ComponentName(app.getPackageName(), className),
                        state,
                        PackageManager.DONT_KILL_APP
                );
                changed++;
            } catch (Throwable ignored) {
            }
        }
        if (disabled) cancelAnalyticsJobs(app);
        Log.i(
                TAG,
                "analytics " + (disabled ? "disabled" : "restored") +
                        "; components=" + changed
        );
    }

    private static void cancelAnalyticsJobs(Application app) {
        try {
            JobScheduler scheduler =
                    (JobScheduler) app.getSystemService(Context.JOB_SCHEDULER_SERVICE);
            if (scheduler == null) return;
            int cancelled = 0;
            for (JobInfo job : scheduler.getAllPendingJobs()) {
                ComponentName service = job.getService();
                if (service != null && isAnalyticsJob(service.getClassName())) {
                    scheduler.cancel(job.getId());
                    cancelled++;
                }
            }
            Log.i(TAG, "cancelled analytics jobs=" + cancelled);
        } catch (Throwable ignored) {
        }
    }

    private static boolean isAnalyticsJob(String className) {
        if (className == null) return false;
        for (String prefix : ANALYTICS_JOB_PREFIXES) {
            if (className.startsWith(prefix)) return true;
        }
        return false;
    }
}
