/**
 * Gboard_Pro - Gboard Enhancement Mod
 *
 * Maintained and customized by Arafath (@smartworldarafath)
 * Repository: https://github.com/smartworldarafath/Gboard_Pro
 * Licensed under the GNU General Public License v3.0 (GPLv3)
 */
package com.akshaykadam.pixelboard.extension.settings;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.annotation.SuppressLint;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Insets;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.speech.RecognitionSupport;
import android.speech.RecognitionSupportCallback;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.provider.Settings;
import android.provider.OpenableColumns;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.LinearInterpolator;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.VideoView;
import com.akshaykadam.pixelboard.extension.advancedvoice.GboardAdvancedVoiceSettings;
import com.akshaykadam.pixelboard.extension.writingtools.GboardAiWritingToolsSettings;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import android.widget.Toast;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.lang.reflect.Proxy;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;

import com.akshaykadam.pixelboard.extension.R;
import com.akshaykadam.pixelboard.extension.BuildConfig;
import com.akshaykadam.pixelboard.extension.settings.keyboardpreview.GboardKeyboardPreviewController;

public final class GboardPatchesSettingsActivity extends Activity
        implements GboardPatchesSettingsContract.Host {
    private static final String TAG = "GboardPatches";
    public static final String ACTION_UPDATES = "com.akshaykadam.pixelboard.action.UPDATES";
    public static final String ACTION_APPEARANCE = "com.akshaykadam.pixelboard.action.APPEARANCE";
    public static final String ACTION_BOARD_UI = "com.akshaykadam.pixelboard.action.BOARD_UI";
    public static final String ACTION_ABOUT = "com.akshaykadam.pixelboard.action.ABOUT";
    public static final String ACTION_PRO = "com.akshaykadam.pixelboard.action.PRO";
    public static final String ACTION_ADDITIONAL = "com.akshaykadam.pixelboard.action.ADDITIONAL";
    public static final String ACTION_HELP_FEEDBACK = "com.akshaykadam.pixelboard.action.HELP_FEEDBACK";
    public static final String ACTION_NOTIFICATIONS = "com.akshaykadam.pixelboard.action.NOTIFICATIONS";
    public static final String ACTION_BETA_PROGRAM = "com.akshaykadam.pixelboard.action.BETA_PROGRAM";
    public static final String ACTION_BETA_TESTING = "com.akshaykadam.pixelboard.action.BETA_TESTING";
    public static final String ACTION_BETA_FEATURES = "com.akshaykadam.pixelboard.action.BETA_FEATURES";
    private static final int REQUEST_PICK_BETA_SCREENSHOTS = 1009;
    private BetaScreenshotCallback pendingBetaScreenshotCallback;
    private boolean standaloneFeatureMode = false;
    public static final String EXTRA_NAVIGATION_PATH =
            "com.akshaykadam.pixelboard.extension.extra.PATCHES_NAVIGATION_PATH";
    private static final String ENTER_PREF_HEADER_EXTRA = "ENTER_PREF_HEADER";
    private static final String GBOARD_SETTINGS_ACTIVITY_CLASS =
            "com.google.android.apps.inputmethod.latin.preference.SettingsActivity";
    private static final String SUPPORTED_DEVELOPER_OPTIONS_TARGET_VERSION =
            "18.0.3.954559732-release-arm64-v8a";
    private static final String GBOARD_PACKAGE_STABLE =
            "com.google.android.inputmethod.latin";
    private static final String GBOARD_PACKAGE_REVERSED_DEV =
            "com.akshaykadam.pixelboard";
    private static final String LIVE_TRANSCRIBE_PACKAGE_NAME =
            "com.google.audio.hearing.visualization.accessibility.scribe";
    private static final String SPEECH_SERVICES_PACKAGE_NAME =
            "com.google.android.tts";
    private static final String SPEECH_SERVICES_RECOGNITION_SERVICE_CLASS_NAME =
            "com.google.android.apps.speech.tts.googletts.service."
                    + "GoogleTTSRecognitionService";
    private static final String SPEECH_SERVICES_PLAY_STORE_URL =
            "https://play.google.com/store/apps/details?id=com.google.android.tts";
    private static final String LIVE_TRANSCRIBE_PLAY_STORE_URL =
            "https://play.google.com/store/apps/details?id=com.google.audio.hearing.visualization.accessibility.scribe";
    private static final String PLAY_STORE_PACKAGE_NAME = "com.android.vending";
    private static final long OFFLINE_SPEECH_LANGUAGE_QUERY_TIMEOUT_MS = 10_000L;
    private static final long RESTART_ICON_ROTATION_DURATION_MS = 700L;
    private static final long RESTART_DELAY_MS = 500L;
    private static final long RESTART_CRASH_RECOVERY_RESTORE_DELAY_MS = 2000L;
    private static final int REQUEST_CREATE_TEXT_DOCUMENT = 0x4742;
    private static final int REQUEST_OPEN_TEXT_DOCUMENT = 0x4743;
    private static final int REQUEST_OPEN_DOCUMENT_TREE = 0x4746;
    private static final int REQUEST_RUNTIME_PERMISSION = 0x4747;
    private static final int REQUEST_CREATE_BINARY_DOCUMENT = 0x4748;
    private static final int REQUEST_OPEN_BINARY_DOCUMENT = 0x4749;
    private static final int TOOLBAR_HEIGHT_DP = 56;
    private static final int NO_SCROLL_POSITION_REQUESTED = -1;
    private static final String TOOLBAR_TITLE_PATCHES = "Patches";
    private static final String ABOUT_AUTHOR_URL = "https://github.com/smartworldarafath";
    private static final String ABOUT_PATCH_REPOSITORY_URL =
            "https://github.com/smartworldarafath/Gboard_Pro";
    private static final String DOCUMENT_TYPE_FALLBACK = "text/plain";
    private static final String DOCUMENT_PICKER_FAILED = "Unable to open file picker.";
    private static final String DOCUMENT_WRITE_FAILED = "Failed to export file.";
    private static final String DOCUMENT_READ_FAILED = "Failed to import file.";
    private Palette palette;
    private GboardM3Helper.Palette m3Palette;
    private boolean lastRenderedAmoled;
    private boolean lastRenderedLiquidGlass;
    private String lastRenderedThemeKey;
    private int lastRenderedAccent;
    private int lastRenderedWindowBg;
    private boolean skipNextResumeRebuild;
    private FrameLayout rootView;
    private LinearLayout toolbarView;
    private View backButtonView;
    private TextView toolbarTitleView;
    private View restartButton;
    private ObjectAnimator restartButtonAnimator;
    private TextView headerBadgeView;
    private TextView headerTitleView;
    private TextView headerSummaryView;
    private LinearLayout panelContainer;
    private ScrollView contentScrollView;
    private LinearLayout contentColumn;
    private LinearLayout screenActionContainer;
    private LinearLayout footerContainer;
    private View footerLeftLine;
    private View footerRightLine;
    private TextView footerVersionView;
    private GboardKeyboardPreviewController keyboardPreviewController;
    private List<GboardPatchesSettingsContract.Feature> features;
    private final GboardPatchesSettingsOrchestrator<GboardPatchesSettingsContract.Feature,
            GboardPatchesSettingsContract.Intent>
            settingsOrchestrator =
            new GboardPatchesSettingsOrchestrator<GboardPatchesSettingsContract.Feature,
                    GboardPatchesSettingsContract.Intent>();
    private final GboardPatchesSettingsScrollState scrollState =
            new GboardPatchesSettingsScrollState();
    // Every screen apply rebuilds all rows, which drops TalkBack's focus. Rows report when
    // TalkBack focuses them, so the same row (by title) can get focus back after the rebuild,
    // and after returning from a sub-page.
    private final Map<String, View> rowViewsByAccessibilityKey = new HashMap<String, View>();
    private final Map<Integer, String> accessibilityFocusKeyByDepth = new HashMap<Integer, String>();
    private String accessibilityFocusedRowKey;
    private int appliedScreenDepth = -1;
    private boolean featuresInitialized;
    private Object backInvokedCallback;
    private final Handler screenRefreshHandler = new Handler(Looper.getMainLooper());
    private final Runnable screenRefreshRunnable = this::refresh;
    private final Runnable deferredRenderRunnable = this::initializeFeaturesAndRenderSafely;
    private final ExecutorService screenBuildExecutor =
            Executors.newSingleThreadExecutor(runnable -> {
                Thread thread = new Thread(runnable, "GboardPatchesScreenBuild");
                thread.setDaemon(true);
                return thread;
            });
    private final ExecutorService backgroundStateExecutor =
            Executors.newSingleThreadExecutor(runnable -> {
                Thread thread = new Thread(runnable, "GboardPatchesBackgroundState");
                thread.setDaemon(true);
                return thread;
            });
    private final Object screenBuildLock = new Object();
    private int requestedScrollYOnNextScreenApply = 0;
    private boolean initialFeatureFromIntentHandled;
    private PendingTextDocumentWrite pendingTextDocumentWrite;
    private GboardPatchesSettingsContract.StringValueConsumer pendingTextDocumentReader;
    private PendingBinaryDocumentWrite pendingBinaryDocumentWrite;
    private GboardPatchesSettingsContract.BinaryDocumentConsumer pendingBinaryDocumentReader;
    private GboardPatchesSettingsContract.StringValueConsumer pendingDocumentTreeConsumer;
    private GboardPatchesSettingsContract.Feature lifecycleVisibleFeature;
    private boolean featureLifecycleEnabled;
    private GboardPatchesSettingsContract.BooleanValueConsumer pendingPermissionConsumer;
    private volatile GboardPatchesSettingsContract.OfflineSpeechLanguages offlineSpeechLanguages =
            GboardPatchesSettingsContract.OfflineSpeechLanguages.loading();
    private SpeechRecognizer offlineSpeechRecognizer;
    private int offlineSpeechLanguageQueryGeneration;
    private Runnable offlineSpeechLanguageQueryTimeoutRunnable;

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(GboardSettingsLocaleManager.wrapContext(newBase));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(resolveActivityTheme());
        super.onCreate(savedInstanceState);
        try {
            scheduleRestartCrashRecoveryGuardRestore();
            m3Palette = GboardM3Helper.Palette.forContext(this);
            palette = Palette.forContext(this, getResources().getConfiguration());
            lastRenderedAmoled = GboardM3Helper.isAmoledBlackEnabled(this);
            lastRenderedLiquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(this);
            lastRenderedThemeKey = GboardM3Helper.getSelectedThemeKey(this);
            lastRenderedAccent = palette.accent;
            lastRenderedWindowBg = palette.windowBackground;
            features = Collections.emptyList();
            featuresInitialized = false;
            GboardM3Helper.applyActivityEnterTransition(this);
            configureWindow();
            View contentView = buildContentView();
            setContentView(contentView);
            installWindowInsetsHandling(contentView);
            registerBackCallback();
            renderInitialScreenSynchronously();
            com.akshaykadam.pixelboard.extension.updater.GboardNotificationHelper.requestNotificationPermission(this);
            com.akshaykadam.pixelboard.extension.updater.GboardNotificationHelper.ensureNotificationChannel(this);
            if (com.akshaykadam.pixelboard.extension.updater.PixelBoardUpdateManager.isAutoCheckEnabled(this)) {
                com.akshaykadam.pixelboard.extension.updater.GboardUpdateCheckReceiver.scheduleUpdateCheck(this);
            }
        } catch (Throwable throwable) {
            showFatalFallbackScreen("Failed to initialize patches settings activity", throwable);
        }
    }

    private void renderInitialScreenSynchronously() {
        try {
            palette = Palette.forContext(this, getResources().getConfiguration());
            ensureFeaturesInitialized();
            Intent intent = getIntent();
            List<GboardPatchesSettingsContract.Feature> initialPath = resolveInitialPathFromIntent(intent);
            initialFeatureFromIntentHandled = true;
            if (initialPath != null && !initialPath.isEmpty()) {
                scrollState.resetForDirectPath(initialPath.size() - 1);
                requestScrollPositionOnNextScreenApply(0);
                GboardPatchesSettingsOrchestrator.Transition<
                        GboardPatchesSettingsContract.Feature,
                        GboardPatchesSettingsContract.Intent> replaceTr =
                        settingsOrchestrator.accept(
                                GboardPatchesSettingsOrchestrator.Event.replacePath(initialPath));
                GboardPatchesSettingsContract.Feature top = initialPath.get(initialPath.size() - 1);
                GboardPatchesSettingsContract.Screen screen = top.buildScreen(this);
                int gen = settingsOrchestrator.snapshot().getRenderGeneration();
                GboardPatchesSettingsOrchestrator.Transition<
                        GboardPatchesSettingsContract.Feature,
                        GboardPatchesSettingsContract.Intent> readyTr =
                        settingsOrchestrator.accept(
                                GboardPatchesSettingsOrchestrator.Event.renderReady(
                                        gen, screen.getRefreshIntervalMs()));
                applyScreen(screen);
                applyOrchestration(replaceTr);
                applyOrchestration(readyTr);
                skipNextResumeRebuild = true;
                return;
            }
            GboardPatchesSettingsContract.Screen rootScreen = buildRootScreen();
            int gen = settingsOrchestrator.snapshot().getRenderGeneration();
            GboardPatchesSettingsOrchestrator.Transition<
                    GboardPatchesSettingsContract.Feature,
                    GboardPatchesSettingsContract.Intent> readyTr =
                    settingsOrchestrator.accept(
                            GboardPatchesSettingsOrchestrator.Event.renderReady(
                                    gen, rootScreen.getRefreshIntervalMs()));
            applyScreen(rootScreen);
            applyOrchestration(readyTr);
            skipNextResumeRebuild = true;
        } catch (Throwable throwable) {
            Log.w(TAG, "Synchronous initial screen render fallback", throwable);
        }
    }

    private List<GboardPatchesSettingsContract.Feature> resolveInitialPathFromIntent(Intent intent) {
        if (intent == null) {
            standaloneFeatureMode = false;
            return null;
        }
        String action = intent.getAction();
        GboardPatchesSettingsContract.Feature targetFeature = null;
        if (ACTION_UPDATES.equals(action)) {
            targetFeature = new com.akshaykadam.pixelboard.extension.updater.PixelBoardUpdateFeature(this);
        } else if (ACTION_APPEARANCE.equals(action)) {
            targetFeature = new GboardAppearanceFeature(this);
        } else if (ACTION_BOARD_UI.equals(action)) {
            targetFeature = new GboardBoardUiFeature(this);
        } else if (ACTION_ABOUT.equals(action)) {
            targetFeature = new GboardAboutFeature(this);
        } else if (ACTION_PRO.equals(action)) {
            targetFeature = new GboardProFeature(this);
        } else if (ACTION_ADDITIONAL.equals(action)) {
            targetFeature = new GboardAdditionalFeature(this);
        } else if (ACTION_HELP_FEEDBACK.equals(action)) {
            targetFeature = new GboardHelpFeedbackFeature(this);
        } else if (ACTION_NOTIFICATIONS.equals(action)) {
            targetFeature = new GboardAdditionalFeature.NotificationSettingsFeature(this);
        } else if (ACTION_BETA_PROGRAM.equals(action)) {
            targetFeature = new GboardBetaProgramFeature(this);
        } else if (ACTION_BETA_TESTING.equals(action)) {
            targetFeature = new GboardBetaProgramFeature.BetaVersionTestingFeature(this);
        } else if (ACTION_BETA_FEATURES.equals(action)) {
            targetFeature = new GboardBetaProgramFeature.NewBetaFeaturesFeature(this);
        }
        if (targetFeature != null) {
            standaloneFeatureMode = true;
            return Collections.singletonList(targetFeature);
        }
        standaloneFeatureMode = false;
        if (intent.hasExtra(EXTRA_NAVIGATION_PATH)) {
            ArrayList<String> pathIds = intent.getStringArrayListExtra(EXTRA_NAVIGATION_PATH);
            intent.removeExtra(EXTRA_NAVIGATION_PATH);
            List<GboardPatchesSettingsContract.Feature> resolvedPath =
                    GboardPatchesNavigationPath.resolve(this, features, pathIds);
            if (pathIds != null && !pathIds.isEmpty() && resolvedPath.size() == pathIds.size()) {
                return resolvedPath;
            }
        }
        return null;
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        setRestartButtonPending(false);
        initialFeatureFromIntentHandled = false;
        skipNextResumeRebuild = false;
        scheduleDeferredRender();
    }

    @Override
    protected void onResume() {
        super.onResume();
        GboardM3Helper.enforceHighRefreshRate(getWindow());
        featureLifecycleEnabled = true;
        boolean currentAmoled = GboardM3Helper.isAmoledBlackEnabled(this);
        boolean currentLiquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(this);
        String currentThemeKey = GboardM3Helper.getSelectedThemeKey(this);
        Palette latestPalette = Palette.forContext(this, getResources().getConfiguration());
        if (currentAmoled != lastRenderedAmoled
                || currentLiquidGlass != lastRenderedLiquidGlass
                || !TextUtils.equals(currentThemeKey, lastRenderedThemeKey)
                || latestPalette.accent != lastRenderedAccent
                || latestPalette.windowBackground != lastRenderedWindowBg) {
            skipNextResumeRebuild = false;
            refreshAfterThemeChange();
            return;
        }
        if (skipNextResumeRebuild) {
            skipNextResumeRebuild = false;
            syncVisibleFeatureLifecycle();
            return;
        }
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.resume()));
    }

    public void animateThemeChangeTransition() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(this::animateThemeChangeTransition);
            return;
        }
        final FrameLayout hostRoot = rootView;
        if (hostRoot == null || hostRoot.getWidth() <= 0 || hostRoot.getHeight() <= 0) {
            refreshAfterThemeChange();
            return;
        }
        hostRoot.postDelayed(() -> {
            if (isFinishing()) return;
            Bitmap captured = null;
            try {
                captured = Bitmap.createBitmap(
                        hostRoot.getWidth(), hostRoot.getHeight(), Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(captured);
                hostRoot.draw(canvas);
            } catch (Throwable ignored) {
                if (captured != null) {
                    captured.recycle();
                }
                refreshAfterThemeChange();
                return;
            }
            final Bitmap finalBitmap = captured;
            final ImageView overlay = new ImageView(this);
            overlay.setScaleType(ImageView.ScaleType.FIT_XY);
            overlay.setImageBitmap(finalBitmap);
            overlay.setClickable(false);
            overlay.setFocusable(false);
            hostRoot.addView(overlay, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT));

            refreshAfterThemeChange();

            overlay.animate()
                    .alpha(0f)
                    .scaleX(0.992f)
                    .scaleY(0.992f)
                    .setDuration(340L)
                    .setInterpolator(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP
                            ? new android.view.animation.PathInterpolator(0.22f, 1f, 0.36f, 1f)
                            : new android.view.animation.DecelerateInterpolator())
                    .withLayer()
                    .withEndAction(() -> {
                        try {
                            hostRoot.removeView(overlay);
                            overlay.setImageDrawable(null);
                            if (!finalBitmap.isRecycled()) {
                                finalBitmap.recycle();
                            }
                        } catch (Throwable ignored) {
                        }
                    })
                    .start();
        }, 95L);
    }

    public void refreshAfterThemeChange() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(this::refreshAfterThemeChange);
            return;
        }
        GboardM3Helper.invalidateCaches();
        m3Palette = GboardM3Helper.Palette.forContext(this);
        palette = Palette.forContext(this, getResources().getConfiguration());
        lastRenderedAmoled = GboardM3Helper.isAmoledBlackEnabled(this);
        lastRenderedLiquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(this);
        lastRenderedThemeKey = GboardM3Helper.getSelectedThemeKey(this);
        lastRenderedAccent = palette.accent;
        lastRenderedWindowBg = palette.windowBackground;
        configureWindow();
        if (rootView != null) {
            rootView.setBackgroundColor(palette.windowBackground);
        }
        if (toolbarView != null) {
            toolbarView.setBackgroundColor(palette.windowBackground);
        }
        if (backButtonView != null) {
            backButtonView.setBackground(lastRenderedLiquidGlass
                    ? GboardM3Helper.createLiquidGlassOrbWithRipple(this, m3Palette)
                    : buildRippleDrawable(dp(22)));
            backButtonView.setElevation(0f);
            backButtonView.invalidate();
        }
        if (restartButton != null) {
            restartButton.setBackground(lastRenderedLiquidGlass
                    ? GboardM3Helper.createLiquidGlassOrbWithRipple(this, m3Palette)
                    : buildRippleDrawable(dp(22)));
            restartButton.setElevation(0f);
            restartButton.invalidate();
        }
        if (toolbarTitleView != null) {
            toolbarTitleView.setTextColor(palette.textPrimary);
        }
        if (footerVersionView != null) {
            footerVersionView.setTextColor(palette.textSecondary);
        }
        int lineColor = GboardM3Helper.blendAlpha(palette.textSecondary, 0.25f);
        if (footerLeftLine != null) {
            footerLeftLine.setBackgroundColor(lineColor);
        }
        if (footerRightLine != null) {
            footerRightLine.setBackgroundColor(lineColor);
        }
        if (headerTitleView != null) {
            headerTitleView.setTextColor(palette.textPrimary);
        }
        if (headerSummaryView != null) {
            headerSummaryView.setTextColor(palette.textSecondary);
        }
        if (headerBadgeView != null) {
            headerBadgeView.setTextColor(palette.accent);
        }
        renderCurrentScreenSafely();
    }

    @Override
    protected void onPause() {
        featureLifecycleEnabled = false;
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.pause()));
        cancelDeferredRender();
        cancelOfflineSpeechLanguageQuery();
        super.onPause();
    }

    @Override
    public void finish() {
        super.finish();
        GboardM3Helper.applyActivityExitTransition(this);
    }

    @Override
    protected void onDestroy() {
        featureLifecycleEnabled = false;
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.pause()));
        setRestartButtonPending(false);
        cancelDeferredRender();
        cancelOfflineSpeechLanguageQuery();
        unregisterBackCallback();
        detachKeyboardPreviewSafely();
        screenBuildExecutor.shutdownNow();
        backgroundStateExecutor.shutdownNow();
        super.onDestroy();
    }

    @Override
    @SuppressLint("GestureBackNavigation")
    public void onBackPressed() {
        if (standaloneFeatureMode) {
            finish();
            return;
        }
        if (!navigateBack()) {
            return;
        }
        super.onBackPressed();
    }

    @Override
    public Context getContext() {
        return this;
    }

    @Override
    public void submit(GboardPatchesSettingsContract.Intent intent) {
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.featureIntent(intent)));
    }

    @Override
    public GboardPatchesSettingsContract.OfflineSpeechLanguages getOfflineSpeechLanguages() {
        return offlineSpeechLanguages;
    }

    @Override
    public void refresh() {
        initializeFeaturesAndRenderSafely();
    }

    public void onManagedDialogShown() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(this::onManagedDialogShown);
            return;
        }
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.modalShown()));
    }

    public void onManagedDialogDismissed() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(this::onManagedDialogDismissed);
            return;
        }
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.modalDismissed()));
    }

    @Override
    public void openFeature(GboardPatchesSettingsContract.Feature feature) {
        if (feature == null) {
            return;
        }
        GboardPatchesSettingsOrchestrator.State<GboardPatchesSettingsContract.Feature> state =
                settingsOrchestrator.snapshot();
        scrollState.enterFeature(state.getCurrent() == null, currentScrollY());
        requestScrollPositionOnNextScreenApply(0);
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.open(feature)));
    }

    @Override
    public void openTargetSettingsHeader(int headerKeyResourceId) {
        if (headerKeyResourceId == 0) {
            return;
        }
        String currentPackage = getPackageName();
        if (!isSupportedTargetPackage(currentPackage)) {
            showUnsupportedDeveloperOptionsPackageDialog(currentPackage, headerKeyResourceId);
            return;
        }
        if (tryLaunchTargetSettingsHeader(currentPackage, headerKeyResourceId, false)) {
            return;
        }
        throw new ActivityNotFoundException(
                "No supported Gboard Developer options entry is available");
    }

    private boolean tryLaunchTargetSettingsHeader(String packageName, int headerKeyResourceId) {
        return tryLaunchTargetSettingsHeader(packageName, headerKeyResourceId, false);
    }

    private boolean tryLaunchTargetSettingsHeader(String packageName, int headerKeyResourceId,
            boolean allowUnknownVersion) {
        String targetVersionName = targetPackageVersionName(packageName);
        if (!allowUnknownVersion
                && !isSupportedDeveloperOptionsTargetVersion(targetVersionName)) {
            return false;
        }

        Intent intent = new Intent();
        intent.setComponent(new ComponentName(packageName, GBOARD_SETTINGS_ACTIVITY_CLASS));
        intent.putExtra(ENTER_PREF_HEADER_EXTRA, headerKeyResourceId);
        try {
            startActivity(intent);
            return true;
        } catch (ActivityNotFoundException | SecurityException exception) {
            return false;
        }
    }

    private void showUnsupportedDeveloperOptionsPackageDialog(String packageName,
            int headerKeyResourceId) {
        String safePackageName = packageName == null ? "" : packageName;
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(R.string.gboard_patches_developer_options_package_warning_title)
                .setMessage(GboardSettingsText.format(
                        this,
                        R.string.gboard_patches_developer_options_package_warning_message,
                        safePackageName))
                .setNegativeButton(R.string.gboard_patches_dialog_close, null)
                .setPositiveButton(R.string.gboard_patches_developer_options_try_anyway,
                        (ignored, which) -> tryLaunchUnverifiedDeveloperOptions(
                                safePackageName,
                                headerKeyResourceId))
                .create();
        dialog.setOnDismissListener(ignored -> onManagedDialogDismissed());
        try {
            dialog.show();
            onManagedDialogShown();
            tintDialogButtons(dialog);
        } catch (Throwable throwable) {
            Log.w(TAG, "Unable to show unsupported Gboard package warning", throwable);
            showDeveloperOptionsLaunchFailure(safePackageName);
        }
    }

    private void tryLaunchUnverifiedDeveloperOptions(String packageName,
            int headerKeyResourceId) {
        try {
            if (!tryLaunchTargetSettingsHeader(packageName, headerKeyResourceId, true)) {
                showDeveloperOptionsLaunchFailure(packageName);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Unable to open Developer options for " + packageName, throwable);
            showDeveloperOptionsLaunchFailure(packageName);
        }
    }

    private void showDeveloperOptionsLaunchFailure(String packageName) {
        Toast.makeText(
                this,
                GboardSettingsText.format(
                        this,
                        R.string.gboard_patches_developer_options_launch_failed,
                        packageName),
                Toast.LENGTH_LONG)
                .show();
    }

    private String targetPackageVersionName(String packageName) {
        try {
            PackageInfo packageInfo = getPackageManager().getPackageInfo(packageName, 0);
            return packageInfo.versionName;
        } catch (PackageManager.NameNotFoundException | SecurityException exception) {
            return null;
        }
    }

    private List<String> targetSettingsPackages() {
        Set<String> packageNames = new LinkedHashSet<String>();
        String currentPackage = getPackageName();
        if (currentPackage != null && !currentPackage.isEmpty()) {
            packageNames.add(currentPackage);
        }
        packageNames.add(GBOARD_PACKAGE_STABLE);
        packageNames.add(GBOARD_PACKAGE_REVERSED_DEV);
        return new ArrayList<String>(packageNames);
    }

    static boolean isSupportedDeveloperOptionsTargetVersion(String versionName) {
        return SUPPORTED_DEVELOPER_OPTIONS_TARGET_VERSION.equals(versionName)
                || "18.3.1.977415014-release-arm64-v8a".equals(versionName)
                || "18.4.1.985164140-release-arm64-v8a".equals(versionName);
    }

    private static boolean isSupportedTargetPackage(String packageName) {
        return GBOARD_PACKAGE_STABLE.equals(packageName)
                || GBOARD_PACKAGE_REVERSED_DEV.equals(packageName)
                || (packageName != null && packageName.startsWith(GBOARD_PACKAGE_REVERSED_DEV));
    }

    @Override
    public void showChoiceDialog(String title, String[] labels, String[] values,
            String currentValue, String customValue, Runnable customAction,
            GboardPatchesSettingsContract.StringValueConsumer valueConsumer) {
        int checkedIndex = resolveCheckedIndex(values, currentValue);
        final Runnable[] pendingSelectionAction = new Runnable[1];
        ListAdapter adapter = new ArrayAdapter<String>(this, 0, labels) {
            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                AccessibleRow row;
                RadioButton radio;
                TextView label;
                if (convertView instanceof AccessibleRow) {
                    row = (AccessibleRow) convertView;
                    radio = (RadioButton) row.getChildAt(0);
                    label = (TextView) row.getChildAt(1);
                } else {
                    row = new AccessibleRow(getContext());
                    row.setOrientation(LinearLayout.HORIZONTAL);
                    row.setGravity(Gravity.CENTER_VERTICAL);
                    row.setPadding(dp(20), dp(12), dp(20), dp(12));
                    row.setMinimumHeight(dp(48));

                    radio = new RadioButton(getContext());
                    radio.setClickable(false);
                    radio.setFocusable(false);
                    row.describeAs(radio, RadioButton.class);
                    ColorStateList radioTint = new ColorStateList(
                            new int[][] {
                                    new int[] { android.R.attr.state_checked },
                                    new int[] { -android.R.attr.state_checked }
                            },
                            new int[] {
                                    palette.accent,
                                    blendAlpha(palette.textSecondary, 0.6f)
                            });
                    radio.setButtonTintList(radioTint);
                    row.addView(radio, new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));

                    label = new TextView(getContext());
                    label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
                    label.setTextColor(palette.textPrimary);
                    label.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                        label.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
                    }
                    LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                            0,
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            1f);
                    lp.leftMargin = dp(16);
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                        lp.setMarginStart(dp(16));
                    }
                    label.setLayoutParams(lp);
                    row.addView(label);
                }
                label.setText(getItem(position));
                radio.setChecked(position == checkedIndex);
                return row;
            }
        };
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title)
                .setSingleChoiceItems(adapter, checkedIndex, (dialogInterface, which) -> {
                    if (which < 0 || which >= values.length) {
                        return;
                    }
                    String selectedValue = values[which];
                    pendingSelectionAction[0] = () -> runSafely(
                            "handle choice dialog selection",
                            () -> {
                                if (customValue != null
                                        && customAction != null
                                        && customValue.equals(selectedValue)) {
                                    customAction.run();
                                } else {
                                    valueConsumer.accept(selectedValue);
                                    renderCurrentScreenSafely();
                                }
                            });
                    dialogInterface.dismiss();
                })
                .setNegativeButton(text(R.string.gboard_patches_dialog_cancel), null)
                .create();
        dialog.setOnDismissListener(ignored -> {
            Runnable action = pendingSelectionAction[0];
            pendingSelectionAction[0] = null;
            onManagedDialogDismissed();
            if (action == null) {
                return;
            }
            postToDecorView(action);
        });
        try {
            dialog.show();
            onManagedDialogShown();
            tintDialogButtons(dialog);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to show choice dialog", throwable);
        }
    }

    @Override
    public void showMultiChoiceDialog(String title, String[] labels, String[] values,
            boolean[] initiallySelected,
            String positiveLabel,
            GboardPatchesSettingsContract.StringListConsumer valueConsumer) {
        if (labels == null || values == null || initiallySelected == null
                || labels.length != values.length
                || labels.length != initiallySelected.length
                || valueConsumer == null) {
            return;
        }
        boolean[] selected = initiallySelected.clone();
        final Runnable[] pendingAction = new Runnable[1];
        AlertDialog.Builder builder = new AlertDialog.Builder(this)
                .setTitle(title)
                .setMultiChoiceItems(labels, selected,
                        (ignored, which, checked) -> {
                            if (which >= 0 && which < selected.length) {
                                selected[which] = checked;
                            }
                        })
                .setPositiveButton(positiveLabel, null)
                .setNegativeButton(text(R.string.gboard_patches_dialog_cancel), null);
        AlertDialog dialog = builder.create();
        dialog.setOnShowListener(ignored -> {
            tintDialogButtons(dialog);
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                List<String> chosen = new ArrayList<String>();
                for (int index = 0; index < values.length; index++) {
                    if (selected[index]) {
                        chosen.add(values[index]);
                    }
                }
                if (chosen.isEmpty()) {
                    return;
                }
                pendingAction[0] = () -> runSafely(
                        "handle multi-choice dialog selection",
                        () -> valueConsumer.accept(chosen));
                dialog.dismiss();
            });
        });
        dialog.setOnDismissListener(ignored -> {
            Runnable action = pendingAction[0];
            pendingAction[0] = null;
            onManagedDialogDismissed();
            if (action != null) {
                postToDecorView(action);
            }
        });
        try {
            dialog.show();
            onManagedDialogShown();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to show multi-choice dialog", throwable);
        }
    }

    @Override
    public void showPositiveIntegerDialog(String title, String hint, int initialValue,
            GboardPatchesSettingsContract.PositiveIntegerConsumer consumer) {
        EditText input = new EditText(this);
        input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        input.setHint(hint);
        input.setText(Integer.toString(initialValue));
        input.setSelectAllOnFocus(true);

        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(dp(24), dp(8), dp(24), 0);
        container.addView(input, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title)
                .setView(container)
                .setPositiveButton(text(R.string.gboard_patches_dialog_save), null)
                .setNegativeButton(
                        text(R.string.gboard_patches_dialog_cancel),
                        null)
                .create();
        dialog.setOnShowListener(ignored -> {
            tintDialogButtons(dialog);
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                int value = parsePositiveInteger(input.getText().toString());
                if (value <= 0) {
                    input.setError(text(R.string.gboard_patches_dialog_error_positive));
                    return;
                }
                try {
                    consumer.accept(value);
                    dialog.dismiss();
                    renderCurrentScreenSafely();
                } catch (IllegalArgumentException exception) {
                    input.setError(exception.getMessage());
                } catch (Throwable throwable) {
                    Log.w(TAG, "Failed to persist positive integer setting", throwable);
                    input.setError(text(R.string.gboard_patches_dialog_error_save_failed));
                }
            });
        });
        dialog.setOnDismissListener(ignored -> onManagedDialogDismissed());
        try {
            dialog.show();
            onManagedDialogShown();
            input.requestFocus();
            input.setSelection(input.getText().length());
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to show positive integer dialog", throwable);
        }
    }

    @Override
    public void showTextInputDialog(String title, String hint, String initialValue,
            GboardPatchesSettingsContract.TextValueConsumer consumer) {
        EditText input = new EditText(this);
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT
                | android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setHint(hint);
        input.setText(initialValue == null ? "" : initialValue);
        input.setSelectAllOnFocus(true);

        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(dp(24), dp(8), dp(24), 0);
        container.addView(input, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title)
                .setView(container)
                .setPositiveButton(text(R.string.gboard_patches_dialog_save), null)
                .setNegativeButton(
                        text(R.string.gboard_patches_dialog_cancel),
                        null)
                .create();
        dialog.setOnShowListener(ignored -> {
            tintDialogButtons(dialog);
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                try {
                    consumer.accept(input.getText() == null ? "" : input.getText().toString());
                    dialog.dismiss();
                    renderCurrentScreenSafely();
                } catch (IllegalArgumentException exception) {
                    input.setError(exception.getMessage());
                } catch (Throwable throwable) {
                    Log.w(TAG, "Failed to persist text setting", throwable);
                    input.setError(text(R.string.gboard_patches_dialog_error_save_failed));
                }
            });
        });
        dialog.setOnDismissListener(ignored -> onManagedDialogDismissed());
        try {
            dialog.show();
            onManagedDialogShown();
            input.requestFocus();
            input.setSelection(input.getText().length());
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to show text input dialog", throwable);
        }
    }

    @Override
    public void showPreviewDialog(GboardPatchesSettingsContract.PreviewSpec previewSpec) {
        ScrollView scrollView = new ScrollView(this);
        scrollView.setFillViewport(true);

        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(dp(24), dp(8), dp(24), 0);
        container.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        String message = previewSpec.getMessage();
        if (message != null && !message.isEmpty()) {
            TextView messageView = new TextView(this);
            messageView.setText(message);
            messageView.setTextColor(palette.textSecondary);
            messageView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            messageView.setLineSpacing(0f, 1.1f);
            messageView.setGravity(Gravity.START);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                messageView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            }
            container.addView(messageView);
        }

        List<GboardPatchesSettingsContract.PreviewMedia> previewMedia =
                previewSpec.getMediaItems();
        List<VideoView> previewVideoViews = new ArrayList<VideoView>();
        boolean sideBySide = previewSpec.getLayout()
                == GboardPatchesSettingsContract.PreviewLayout.SIDE_BY_SIDE;
        if (!sideBySide || previewMedia.size() <= 1) {
            boolean firstImage = true;
            for (GboardPatchesSettingsContract.PreviewMedia previewItem : previewMedia) {
                View imageCard = buildPreviewMediaCard(
                        previewSpec.getTitle(),
                        previewItem,
                        false,
                        previewVideoViews);
                LinearLayout.LayoutParams imageCardParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                imageCardParams.topMargin = firstImage ? dp(16) : dp(12);
                imageCard.setLayoutParams(imageCardParams);
                container.addView(imageCard);
                firstImage = false;
            }
        } else {
            for (int index = 0; index < previewMedia.size(); index += 2) {
                LinearLayout previewRow = new LinearLayout(this);
                previewRow.setOrientation(LinearLayout.HORIZONTAL);
                previewRow.setBaselineAligned(false);
                LinearLayout.LayoutParams previewRowParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                previewRowParams.topMargin = index == 0 ? dp(16) : dp(12);
                previewRow.setLayoutParams(previewRowParams);

                View leftCard = buildPreviewMediaCard(
                        previewSpec.getTitle(),
                        previewMedia.get(index),
                        true,
                        previewVideoViews);
                LinearLayout.LayoutParams leftParams = new LinearLayout.LayoutParams(
                        0,
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        1f);
                leftParams.rightMargin = dp(6);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                    leftParams.setMarginEnd(dp(6));
                }
                previewRow.addView(leftCard, leftParams);

                if (index + 1 < previewMedia.size()) {
                    View rightCard = buildPreviewMediaCard(
                            previewSpec.getTitle(),
                            previewMedia.get(index + 1),
                            true,
                            previewVideoViews);
                    LinearLayout.LayoutParams rightParams = new LinearLayout.LayoutParams(
                            0,
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            1f);
                    rightParams.leftMargin = dp(6);
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                        rightParams.setMarginStart(dp(6));
                    }
                    previewRow.addView(rightCard, rightParams);
                } else {
                    View spacer = new View(this);
                    previewRow.addView(spacer, new LinearLayout.LayoutParams(
                            0,
                            0,
                            1f));
                }

                container.addView(previewRow);
            }
        }
        scrollView.addView(container);

        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(previewSpec.getTitle())
                .setView(scrollView)
                .setPositiveButton(text(R.string.gboard_patches_dialog_close), null)
                .create();
        dialog.setOnDismissListener(ignored -> {
            for (VideoView previewVideoView : previewVideoViews) {
                try {
                    previewVideoView.stopPlayback();
                } catch (Throwable throwable) {
                    Log.w(TAG, "Failed to stop preview video playback", throwable);
                }
            }
            onManagedDialogDismissed();
        });
        try {
            dialog.show();
            onManagedDialogShown();
            tintDialogButtons(dialog);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to show preview dialog", throwable);
        }
    }

    @Override
    public void showManagedDialog(GboardPatchesSettingsContract.ManagedDialogAction action) {
        if (action == null) {
            return;
        }
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(() -> showManagedDialog(action));
            return;
        }
        Throwable throwable = GboardManagedDialogRunner.run(
                action,
                this::onManagedDialogShown,
                this::onManagedDialogDismissed);
        if (throwable != null) {
            Log.w(TAG, "Failed to show managed settings dialog", throwable);
        }
    }

    @Override
    @SuppressWarnings("deprecation")
    public void createTextDocument(String fileName, String mimeType, String text,
            Runnable completionAction) {
        pendingTextDocumentWrite = new PendingTextDocumentWrite(
                text != null ? text : "",
                completionAction);
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        intent.setType(normalizeMimeType(mimeType));
        if (fileName != null && !fileName.trim().isEmpty()) {
            intent.putExtra(Intent.EXTRA_TITLE, fileName.trim());
        }
        try {
            startActivityForResult(intent, REQUEST_CREATE_TEXT_DOCUMENT);
        } catch (ActivityNotFoundException ignored) {
            pendingTextDocumentWrite = null;
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        } catch (Throwable throwable) {
            pendingTextDocumentWrite = null;
            Log.w(TAG, "Failed to launch document create picker", throwable);
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    @SuppressWarnings("deprecation")
    public void openTextDocument(String[] mimeTypes,
            GboardPatchesSettingsContract.StringValueConsumer valueConsumer) {
        if (valueConsumer == null) {
            return;
        }
        pendingTextDocumentReader = valueConsumer;
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, false);
        String[] normalizedMimeTypes = normalizeMimeTypes(mimeTypes);
        intent.setType(normalizedMimeTypes.length == 1
                ? normalizedMimeTypes[0]
                : "*/*");
        if (normalizedMimeTypes.length > 1) {
            intent.putExtra(Intent.EXTRA_MIME_TYPES, normalizedMimeTypes);
        }
        try {
            startActivityForResult(intent, REQUEST_OPEN_TEXT_DOCUMENT);
        } catch (ActivityNotFoundException ignored) {
            pendingTextDocumentReader = null;
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        } catch (Throwable throwable) {
            pendingTextDocumentReader = null;
            Log.w(TAG, "Failed to launch document open picker", throwable);
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    @SuppressWarnings("deprecation")
    public void createBinaryDocument(String fileName, String mimeType, byte[] data,
            Runnable completionAction) {
        pendingBinaryDocumentWrite = new PendingBinaryDocumentWrite(
                data == null ? new byte[0] : data.clone(), completionAction);
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                .setType(normalizeMimeType(mimeType));
        if (fileName != null && !fileName.isBlank()) {
            intent.putExtra(Intent.EXTRA_TITLE, fileName.trim());
        }
        try {
            startActivityForResult(intent, REQUEST_CREATE_BINARY_DOCUMENT);
        } catch (Throwable throwable) {
            pendingBinaryDocumentWrite = null;
            Log.w(TAG, "Failed to launch binary document create picker", throwable);
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    @SuppressWarnings("deprecation")
    public void openBinaryDocument(String[] mimeTypes,
            GboardPatchesSettingsContract.BinaryDocumentConsumer documentConsumer) {
        if (documentConsumer == null) {
            return;
        }
        pendingBinaryDocumentReader = documentConsumer;
        String[] normalizedMimeTypes = normalizeMimeTypes(mimeTypes);
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                .putExtra(Intent.EXTRA_ALLOW_MULTIPLE, false)
                .setType(normalizedMimeTypes.length == 1 ? normalizedMimeTypes[0] : "*/*");
        if (normalizedMimeTypes.length > 1) {
            intent.putExtra(Intent.EXTRA_MIME_TYPES, normalizedMimeTypes);
        }
        try {
            startActivityForResult(intent, REQUEST_OPEN_BINARY_DOCUMENT);
        } catch (Throwable throwable) {
            pendingBinaryDocumentReader = null;
            Log.w(TAG, "Failed to launch binary document open picker", throwable);
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void requestTargetRestart() {
        requestGboardRestart();
    }

    @Override
    @SuppressWarnings("deprecation")
    public void openDocumentTree(String initialTreeUri,
            GboardPatchesSettingsContract.StringValueConsumer valueConsumer) {
        if (valueConsumer == null) {
            return;
        }
        pendingDocumentTreeConsumer = valueConsumer;
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
                | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION
                | Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                && initialTreeUri != null && initialTreeUri.startsWith("content://")) {
            try {
                intent.putExtra("android.provider.extra.INITIAL_URI", Uri.parse(initialTreeUri));
            } catch (Throwable ignored) {
                // The picker can still open without an initial location.
            }
        }
        try {
            startActivityForResult(intent, REQUEST_OPEN_DOCUMENT_TREE);
        } catch (ActivityNotFoundException ignored) {
            pendingDocumentTreeConsumer = null;
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        } catch (Throwable throwable) {
            pendingDocumentTreeConsumer = null;
            Log.w(TAG, "Failed to launch document tree picker", throwable);
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void requestRuntimePermission(String permission,
            GboardPatchesSettingsContract.BooleanValueConsumer resultConsumer) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(() -> requestRuntimePermission(permission, resultConsumer));
            return;
        }
        if (permission == null || permission.isBlank() || resultConsumer == null) {
            return;
        }
        if (checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED) {
            resultConsumer.accept(true);
            return;
        }
        if (pendingPermissionConsumer != null) {
            resultConsumer.accept(false);
            return;
        }
        pendingPermissionConsumer = resultConsumer;
        try {
            requestPermissions(new String[]{permission}, REQUEST_RUNTIME_PERMISSION);
        } catch (Throwable throwable) {
            pendingPermissionConsumer = null;
            Log.w(TAG, "Failed to request runtime permission " + permission, throwable);
            resultConsumer.accept(false);
        }
    }

    @Override
    public void openAllFilesAccessSettings(String unavailableMessage) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(() -> openAllFilesAccessSettings(unavailableMessage));
            return;
        }
        Intent appIntent = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION)
                .setData(Uri.parse("package:" + getPackageName()));
        try {
            startActivity(appIntent);
        } catch (ActivityNotFoundException ignored) {
            try {
                startActivity(new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION));
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to launch all files access settings", throwable);
                Toast.makeText(this, unavailableMessage == null ? "" : unavailableMessage,
                        Toast.LENGTH_LONG).show();
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to launch app all files access settings", throwable);
            Toast.makeText(this, unavailableMessage == null ? "" : unavailableMessage,
                    Toast.LENGTH_LONG).show();
        }
    }

    @Override
    public void openBatteryOptimizationSettings(String unavailableMessage) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(() -> openBatteryOptimizationSettings(unavailableMessage));
            return;
        }
        Intent appIntent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
                .setData(Uri.parse("package:" + getPackageName()));
        try {
            startActivity(appIntent);
        } catch (ActivityNotFoundException ignored) {
            openBatteryOptimizationSettingsFallback(unavailableMessage);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to launch app battery optimization settings", throwable);
            openBatteryOptimizationSettingsFallback(unavailableMessage);
        }
    }

    private void openBatteryOptimizationSettingsFallback(String unavailableMessage) {
        try {
            startActivity(new Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to launch battery optimization settings", throwable);
            Toast.makeText(this, unavailableMessage == null ? "" : unavailableMessage,
                    Toast.LENGTH_LONG).show();
        }
    }

    @Override
    public void showMessage(String message) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(() -> showMessage(message));
            return;
        }
        Toast.makeText(this, message == null ? "" : message, Toast.LENGTH_LONG).show();
    }

    @Override
    @SuppressWarnings("deprecation")
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_CREATE_TEXT_DOCUMENT) {
            handleCreateTextDocumentResult(resultCode, data);
            return;
        }
        if (requestCode == REQUEST_OPEN_TEXT_DOCUMENT) {
            handleOpenTextDocumentResult(resultCode, data);
            return;
        }
        if (requestCode == REQUEST_OPEN_DOCUMENT_TREE) {
            handleOpenDocumentTreeResult(resultCode, data);
            return;
        }
        if (requestCode == REQUEST_CREATE_BINARY_DOCUMENT) {
            handleCreateBinaryDocumentResult(resultCode, data);
            return;
        }
        if (requestCode == REQUEST_OPEN_BINARY_DOCUMENT) {
            handleOpenBinaryDocumentResult(resultCode, data);
            return;
        }
        if (requestCode == REQUEST_PICK_BETA_SCREENSHOTS) {
            handleBetaScreenshotPickResult(resultCode, data);
        }
    }

    public interface BetaScreenshotCallback {
        void onPicked(List<Uri> uris);
    }

    @SuppressWarnings("deprecation")
    public void launchBetaScreenshotPicker(BetaScreenshotCallback callback) {
        pendingBetaScreenshotCallback = callback;
        Intent docIntent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        docIntent.addCategory(Intent.CATEGORY_OPENABLE);
        docIntent.setType("image/*");
        docIntent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
        docIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        try {
            startActivityForResult(Intent.createChooser(docIntent, "Select Screenshots (up to 5)"),
                    REQUEST_PICK_BETA_SCREENSHOTS);
        } catch (Throwable fallback) {
            try {
                Intent getIntent = new Intent(Intent.ACTION_GET_CONTENT);
                getIntent.setType("image/*");
                getIntent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
                startActivityForResult(Intent.createChooser(getIntent, "Select Screenshots (up to 5)"),
                        REQUEST_PICK_BETA_SCREENSHOTS);
            } catch (Throwable ignored) {
                pendingBetaScreenshotCallback = null;
                Toast.makeText(this, "No image picker available on device", Toast.LENGTH_SHORT).show();
            }
        }
    }

    private void handleBetaScreenshotPickResult(int resultCode, Intent data) {
        BetaScreenshotCallback cb = pendingBetaScreenshotCallback;
        pendingBetaScreenshotCallback = null;
        if (cb == null || resultCode != Activity.RESULT_OK || data == null) {
            return;
        }
        List<Uri> picked = new ArrayList<>();
        try {
            android.content.ClipData clip = data.getClipData();
            if (clip != null) {
                for (int i = 0; i < clip.getItemCount(); i++) {
                    Uri u = clip.getItemAt(i).getUri();
                    if (u != null) {
                        try {
                            getContentResolver().takePersistableUriPermission(u, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                        } catch (Throwable ignored) {
                        }
                        picked.add(u);
                    }
                }
            } else if (data.getData() != null) {
                Uri u = data.getData();
                try {
                    getContentResolver().takePersistableUriPermission(u, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                } catch (Throwable ignored) {
                }
                picked.add(u);
            }
        } catch (Throwable ignored) {
        }
        cb.onPicked(picked);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions,
            int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode != REQUEST_RUNTIME_PERMISSION) {
            return;
        }
        GboardPatchesSettingsContract.BooleanValueConsumer consumer = pendingPermissionConsumer;
        pendingPermissionConsumer = null;
        if (consumer != null) {
            consumer.accept(grantResults != null
                    && grantResults.length > 0
                    && grantResults[0] == PackageManager.PERMISSION_GRANTED);
        }
    }

    private View buildPreviewMediaCard(String dialogTitle,
            GboardPatchesSettingsContract.PreviewMedia previewMedia, boolean compact,
            List<VideoView> previewVideoViews) {
        LinearLayout imageCard = new LinearLayout(this);
        imageCard.setOrientation(LinearLayout.VERTICAL);
        imageCard.setGravity(Gravity.CENTER_HORIZONTAL);
        imageCard.setBackground(buildCardDrawable(
                palette.surfaceAlt,
                palette.surfaceStroke,
                dp(24)));
        imageCard.setPadding(
                compact ? dp(10) : dp(16),
                compact ? dp(12) : dp(16),
                compact ? dp(10) : dp(16),
                compact ? dp(12) : dp(16));

        View previewContent = null;
        if (previewMedia instanceof GboardPatchesSettingsContract.PreviewImage previewImage) {
            previewContent = buildPreviewImageView(dialogTitle, previewImage, compact);
        } else if (previewMedia instanceof GboardPatchesSettingsContract.PreviewVideo previewVideo) {
            previewContent = buildPreviewVideoView(
                    dialogTitle,
                    previewVideo,
                    compact,
                    previewVideoViews);
        }

        if (previewContent != null) {
            ViewGroup.LayoutParams previewLayoutParams = previewContent.getLayoutParams();
            if (previewLayoutParams != null) {
                imageCard.addView(previewContent, previewLayoutParams);
            } else {
                imageCard.addView(previewContent, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
            }
        } else {
            TextView errorView = new TextView(this);
            errorView.setText(text(R.string.gboard_patches_preview_load_failed));
            errorView.setTextColor(palette.textSecondary);
            errorView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            imageCard.addView(errorView);
        }

        String caption = previewMedia.getCaption();
        if (caption != null && !caption.isEmpty()) {
            TextView captionView = new TextView(this);
            captionView.setText(caption);
            captionView.setTextColor(palette.textPrimary);
            captionView.setTextSize(TypedValue.COMPLEX_UNIT_SP, compact ? 12f : 13f);
            captionView.setTypeface(Typeface.DEFAULT_BOLD);
            LinearLayout.LayoutParams captionParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            captionParams.topMargin = compact ? dp(8) : dp(12);
            captionView.setLayoutParams(captionParams);
            captionView.setGravity(Gravity.CENTER_HORIZONTAL);
            imageCard.addView(captionView);
        }

        return imageCard;
    }

    private View buildPreviewImageView(String dialogTitle,
            GboardPatchesSettingsContract.PreviewImage previewImage, boolean compact) {
        Bitmap bitmap = decodePreviewBitmap(previewImage.getAssetPath());
        if (bitmap == null) {
            return null;
        }
        ImageView imageView = new ImageView(this);
        imageView.setAdjustViewBounds(true);
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setMaxHeight(compact ? dp(220) : dp(420));
        imageView.setImageBitmap(bitmap);
        imageView.setContentDescription(dialogTitle);
        return imageView;
    }

    private View buildPreviewVideoView(String dialogTitle,
            GboardPatchesSettingsContract.PreviewVideo previewVideo, boolean compact,
            List<VideoView> previewVideoViews) {
        Uri videoUri = resolvePreviewVideoUri(previewVideo);
        if (videoUri == null) {
            return null;
        }
        FrameLayout videoContainer = new FrameLayout(this);
        videoContainer.setForegroundGravity(Gravity.CENTER);
        videoContainer.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                compact ? dp(220) : dp(420)));

        VideoView videoView = new VideoView(this);
        videoView.setVideoURI(videoUri);
        videoView.setContentDescription(dialogTitle);
        videoView.setOnPreparedListener(mediaPlayer ->
                preparePreviewVideo(mediaPlayer, videoView, videoContainer, compact));
        videoView.setOnErrorListener((mediaPlayer, what, extra) -> {
            Log.w(TAG, "Failed to prepare preview video asset: " + previewVideo.getAssetPath()
                    + ", what=" + what + ", extra=" + extra);
            videoContainer.post(() -> showPreviewVideoLoadError(videoContainer));
            return true;
        });
        videoContainer.addView(videoView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        previewVideoViews.add(videoView);
        return videoContainer;
    }

    private void preparePreviewVideo(MediaPlayer mediaPlayer, VideoView videoView,
            FrameLayout videoContainer, boolean compact) {
        try {
            mediaPlayer.setVolume(0f, 0f);
            mediaPlayer.setLooping(true);
            updatePreviewVideoContainerHeight(
                    videoContainer,
                    mediaPlayer.getVideoWidth(),
                    mediaPlayer.getVideoHeight(),
                    compact);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to configure preview video playback", throwable);
        }
        try {
            videoView.start();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to start preview video playback", throwable);
        }
    }

    private void updatePreviewVideoContainerHeight(FrameLayout videoContainer, int videoWidth,
            int videoHeight, boolean compact) {
        if (videoContainer == null || videoWidth <= 0 || videoHeight <= 0) {
            return;
        }
        int maxHeight = compact ? dp(220) : dp(420);
        int minHeight = compact ? dp(96) : dp(140);
        videoContainer.post(() -> {
            int containerWidth = videoContainer.getWidth();
            if (containerWidth <= 0) {
                return;
            }
            int targetHeight = Math.round(
                    (float) containerWidth * ((float) videoHeight / (float) videoWidth));
            targetHeight = Math.max(minHeight, Math.min(maxHeight, targetHeight));
            ViewGroup.LayoutParams layoutParams = videoContainer.getLayoutParams();
            if (layoutParams == null || layoutParams.height == targetHeight) {
                return;
            }
            layoutParams.height = targetHeight;
            videoContainer.setLayoutParams(layoutParams);
        });
    }

    private Bitmap decodePreviewBitmap(String assetPath) {
        try (InputStream inputStream = getAssets().open(assetPath)) {
            return BitmapFactory.decodeStream(inputStream);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to load preview asset: " + assetPath, throwable);
            return null;
        }
    }

    private Uri resolvePreviewVideoUri(GboardPatchesSettingsContract.PreviewVideo previewVideo) {
        if (previewVideo == null) {
            return null;
        }
        return resolvePreviewVideoAssetUri(previewVideo.getAssetPath());
    }

    private Uri resolvePreviewVideoAssetUri(String assetPath) {
        if (assetPath == null || assetPath.isEmpty()) {
            return null;
        }
        File cacheFile = materializePreviewVideoAsset(assetPath);
        if (cacheFile == null) {
            return null;
        }
        return Uri.fromFile(cacheFile);
    }

    private File materializePreviewVideoAsset(String assetPath) {
        try (InputStream inputStream = getAssets().open(assetPath)) {
            File cacheDirectory = new File(getCacheDir(), "preview-videos");
            if (!cacheDirectory.exists() && !cacheDirectory.mkdirs()) {
                Log.w(TAG, "Failed to create preview video cache directory: "
                        + cacheDirectory.getAbsolutePath());
                return null;
            }
            File outputFile = new File(cacheDirectory, sanitizePreviewAssetFileName(assetPath));
            try (FileOutputStream outputStream = new FileOutputStream(outputFile, false)) {
                byte[] buffer = new byte[8192];
                while (true) {
                    int read = inputStream.read(buffer);
                    if (read < 0) {
                        break;
                    }
                    outputStream.write(buffer, 0, read);
                }
                outputStream.flush();
            }
            return outputFile;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to materialize preview video asset: " + assetPath, throwable);
            return null;
        }
    }

    private static String sanitizePreviewAssetFileName(String assetPath) {
        String normalized = assetPath.replace('\\', '/');
        int lastSlash = normalized.lastIndexOf('/');
        String fileName = lastSlash >= 0 ? normalized.substring(lastSlash + 1) : normalized;
        if (fileName.isEmpty()) {
            return "preview-video.mp4";
        }
        return fileName;
    }

    private void showPreviewVideoLoadError(FrameLayout videoContainer) {
        if (videoContainer == null) {
            return;
        }
        videoContainer.removeAllViews();

        TextView errorView = new TextView(this);
        errorView.setText(text(R.string.gboard_patches_preview_load_failed));
        errorView.setTextColor(palette.textSecondary);
        errorView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        errorView.setGravity(Gravity.CENTER);

        videoContainer.addView(errorView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER));
    }

    private void handleCreateTextDocumentResult(int resultCode, Intent data) {
        PendingTextDocumentWrite pendingWrite = pendingTextDocumentWrite;
        pendingTextDocumentWrite = null;
        if (resultCode != RESULT_OK || data == null || data.getData() == null
                || pendingWrite == null) {
            return;
        }
        try {
            writeTextDocument(data.getData(), pendingWrite.text);
            if (pendingWrite.completionAction != null) {
                pendingWrite.completionAction.run();
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to write selected document", throwable);
            Toast.makeText(this, DOCUMENT_WRITE_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    private void handleOpenTextDocumentResult(int resultCode, Intent data) {
        GboardPatchesSettingsContract.StringValueConsumer reader = pendingTextDocumentReader;
        pendingTextDocumentReader = null;
        Uri uri = selectedDocumentUri(data);
        if (resultCode != RESULT_OK || uri == null || reader == null) {
            return;
        }
        try {
            reader.accept(readTextDocument(uri));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to read selected document", throwable);
            Toast.makeText(this, DOCUMENT_READ_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    private void handleCreateBinaryDocumentResult(int resultCode, Intent data) {
        PendingBinaryDocumentWrite pendingWrite = pendingBinaryDocumentWrite;
        pendingBinaryDocumentWrite = null;
        if (resultCode != RESULT_OK || data == null || data.getData() == null
                || pendingWrite == null) {
            return;
        }
        try (OutputStream output = getContentResolver().openOutputStream(data.getData(), "wt")) {
            if (output == null) {
                throw new java.io.IOException("Content resolver returned null output stream");
            }
            output.write(pendingWrite.data);
            output.flush();
            if (pendingWrite.completionAction != null) {
                pendingWrite.completionAction.run();
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to write selected binary document", throwable);
            Toast.makeText(this, DOCUMENT_WRITE_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    private void handleOpenBinaryDocumentResult(int resultCode, Intent data) {
        GboardPatchesSettingsContract.BinaryDocumentConsumer reader =
                pendingBinaryDocumentReader;
        pendingBinaryDocumentReader = null;
        Uri uri = selectedDocumentUri(data);
        if (resultCode != RESULT_OK || uri == null || reader == null) {
            return;
        }
        try {
            reader.accept(new GboardPatchesSettingsContract.BinaryDocument(
                    queryDisplayName(uri), getContentResolver().getType(uri),
                    readBinaryDocument(uri)));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to read selected binary document", throwable);
            Toast.makeText(this, DOCUMENT_READ_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    private static Uri selectedDocumentUri(Intent data) {
        if (data == null) {
            return null;
        }
        Uri direct = data.getData();
        if (direct != null) {
            return direct;
        }
        ClipData clipData = data.getClipData();
        if (clipData == null || clipData.getItemCount() == 0) {
            return null;
        }
        ClipData.Item first = clipData.getItemAt(0);
        return first == null ? null : first.getUri();
    }

    private String queryDisplayName(Uri uri) {
        try (Cursor cursor = getContentResolver().query(uri,
                new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                int index = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                if (index >= 0) {
                    return cursor.getString(index);
                }
            }
        } catch (Throwable ignored) {
            // Fall back to the URI path below.
        }
        return uri.getLastPathSegment();
    }

    private byte[] readBinaryDocument(Uri uri) throws java.io.IOException {
        try (InputStream input = getContentResolver().openInputStream(uri)) {
            if (input == null) {
                throw new java.io.IOException("Content resolver returned null input stream");
            }
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) != -1) {
                output.write(buffer, 0, read);
            }
            return output.toByteArray();
        }
    }

    private void handleOpenDocumentTreeResult(int resultCode, Intent data) {
        GboardPatchesSettingsContract.StringValueConsumer consumer = pendingDocumentTreeConsumer;
        pendingDocumentTreeConsumer = null;
        if (resultCode != RESULT_OK || data == null || data.getData() == null
                || consumer == null) {
            return;
        }
        Uri treeUri = data.getData();
        int grantFlags = data.getFlags()
                & (Intent.FLAG_GRANT_READ_URI_PERMISSION
                | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        if ((grantFlags & Intent.FLAG_GRANT_READ_URI_PERMISSION) == 0) {
            return;
        }
        try {
            getContentResolver().takePersistableUriPermission(treeUri, grantFlags);
            consumer.accept(treeUri.toString());
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to persist selected document tree", throwable);
            Toast.makeText(this, DOCUMENT_PICKER_FAILED, Toast.LENGTH_SHORT).show();
        }
    }

    private void writeTextDocument(Uri uri, String text) throws java.io.IOException {
        try (OutputStream outputStream = getContentResolver().openOutputStream(uri, "wt")) {
            if (outputStream == null) {
                throw new java.io.IOException("Content resolver returned null output stream.");
            }
            outputStream.write((text != null ? text : "").getBytes(StandardCharsets.UTF_8));
            outputStream.flush();
        }
    }

    private String readTextDocument(Uri uri) throws java.io.IOException {
        try (InputStream inputStream = getContentResolver().openInputStream(uri)) {
            if (inputStream == null) {
                throw new java.io.IOException("Content resolver returned null input stream.");
            }
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int read;
            while ((read = inputStream.read(buffer)) >= 0) {
                outputStream.write(buffer, 0, read);
            }
            return outputStream.toString(StandardCharsets.UTF_8.name());
        }
    }

    private static String normalizeMimeType(String mimeType) {
        return mimeType != null && !mimeType.trim().isEmpty()
                ? mimeType.trim()
                : DOCUMENT_TYPE_FALLBACK;
    }

    private static String[] normalizeMimeTypes(String[] mimeTypes) {
        if (mimeTypes == null || mimeTypes.length == 0) {
            return new String[] { DOCUMENT_TYPE_FALLBACK };
        }
        List<String> normalized = new ArrayList<String>();
        for (String mimeType : mimeTypes) {
            if (mimeType != null && !mimeType.trim().isEmpty()) {
                normalized.add(mimeType.trim());
            }
        }
        if (normalized.isEmpty()) {
            normalized.add(DOCUMENT_TYPE_FALLBACK);
        }
        return normalized.toArray(new String[0]);
    }

    private void configureWindow() {
        GboardM3Helper.enforceHighRefreshRate(getWindow());
        if (getActionBar() != null) {
            getActionBar().hide();
        }
        Window window = getWindow();
        if (m3Palette == null) {
            m3Palette = GboardM3Helper.Palette.forContext(this);
        }
        window.setBackgroundDrawable(new ColorDrawable(palette.windowBackground));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            android.view.WindowManager.LayoutParams lp = window.getAttributes();
            lp.layoutInDisplayCutoutMode =
                    android.view.WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
            window.setAttributes(lp);
        }
        boolean nightMode = (getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        boolean darkUi = nightMode || m3Palette.isAmoled;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false);
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                int lightFlag = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                controller.setSystemBarsAppearance(darkUi ? 0 : lightFlag, lightFlag);
            }
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            View decor = window.getDecorView();
            int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
            if (!darkUi) {
                flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                }
            }
            decor.setSystemUiVisibility(flags);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            window.setStatusBarContrastEnforced(false);
            window.setNavigationBarContrastEnforced(false);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
        }
    }

    private int resolveActivityTheme() {
        try {
            ActivityInfo info = getPackageManager().getActivityInfo(
                    new ComponentName(this, "com.google.android.apps.inputmethod.latin.preference.SettingsActivity"),
                    0);
            if (info.theme != 0) {
                return info.theme;
            }
        } catch (Throwable ignored) {
        }
        try {
            ActivityInfo myInfo = getPackageManager().getActivityInfo(getComponentName(), 0);
            if (myInfo.theme != 0) {
                return myInfo.theme;
            }
        } catch (Throwable ignored) {
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            return android.R.style.Theme_DeviceDefault_DayNight;
        }
        boolean nightMode = (getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return nightMode
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar;
    }

    private View buildContentView() {
        FrameLayout root = new FrameLayout(this);
        rootView = root;
        root.setBackgroundColor(palette.windowBackground);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout shell = new LinearLayout(this);
        shell.setOrientation(LinearLayout.VERTICAL);
        shell.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(shell);

        shell.addView(buildToolbar());

        contentScrollView = new ScrollView(this);
        contentScrollView.setClipToPadding(false);
        contentScrollView.setFillViewport(true);
        contentScrollView.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        contentScrollView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                0,
                1f));

        contentColumn = new LinearLayout(this);
        contentColumn.setOrientation(LinearLayout.VERTICAL);
        contentColumn.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            contentColumn.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        contentColumn.setPadding(0, 0, 0, dp(16));
        contentColumn.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        contentColumn.addView(buildHeaderCard());
        contentColumn.addView(buildPanelCard());

        contentScrollView.addView(contentColumn);
        shell.addView(contentScrollView);

        screenActionContainer = new LinearLayout(this);
        screenActionContainer.setOrientation(LinearLayout.VERTICAL);
        screenActionContainer.setPadding(dp(16), dp(8), dp(16), dp(16));
        screenActionContainer.setVisibility(View.GONE);
        shell.addView(screenActionContainer, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        footerContainer = new LinearLayout(this);
        footerContainer.setOrientation(LinearLayout.HORIZONTAL);
        footerContainer.setGravity(Gravity.CENTER_VERTICAL);
        footerContainer.setPadding(dp(24), dp(10), dp(24), dp(18));

        int dividerColor = GboardM3Helper.blendAlpha(palette.textSecondary, 0.25f);
        footerLeftLine = new View(this);
        footerLeftLine.setBackgroundColor(dividerColor);
        LinearLayout.LayoutParams leftLineLp = new LinearLayout.LayoutParams(0, dp(1), 1f);
        footerContainer.addView(footerLeftLine, leftLineLp);

        footerVersionView = new TextView(this);
        footerVersionView.setText("Gboard_Pro " + resolvePatchVersion());
        footerVersionView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        footerVersionView.setTextColor(palette.textSecondary);
        footerVersionView.setGravity(Gravity.CENTER);
        footerVersionView.setPadding(dp(12), 0, dp(12), 0);
        footerContainer.addView(footerVersionView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        footerRightLine = new View(this);
        footerRightLine.setBackgroundColor(dividerColor);
        LinearLayout.LayoutParams rightLineLp = new LinearLayout.LayoutParams(0, dp(1), 1f);
        footerContainer.addView(footerRightLine, rightLineLp);

        shell.addView(footerContainer, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        keyboardPreviewController = new GboardKeyboardPreviewController(
                this,
                this::targetSettingsPackages,
                this::onManagedDialogShown,
                this::onManagedDialogDismissed,
                palette.accent,
                palette.windowBackground);
        keyboardPreviewController.attachTo(root);
        return root;
    }

    private String resolvePatchVersion() {
        try {
            if (BuildConfig.PATCH_VERSION != null && !BuildConfig.PATCH_VERSION.trim().isEmpty()) {
                return BuildConfig.PATCH_VERSION.trim();
            }
        } catch (Throwable ignored) {
        }
        try {
            PackageInfo packageInfo = getPackageManager().getPackageInfo(getPackageName(), 0);
            if (packageInfo != null && packageInfo.versionName != null) {
                return packageInfo.versionName;
            }
        } catch (Throwable ignored) {
        }
        return BuildConfig.PATCH_VERSION;
    }

    private View buildToolbar() {
        toolbarView = new LinearLayout(this);
        toolbarView.setOrientation(LinearLayout.HORIZONTAL);
        toolbarView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        toolbarView.setBackgroundColor(palette.windowBackground);
        toolbarView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(TOOLBAR_HEIGHT_DP)));
        toolbarView.setPadding(dp(14), 0, dp(14), 0);

        View backButton = buildBackButton();

        toolbarTitleView = new TextView(this);
        toolbarTitleView.setTextColor(palette.textPrimary);
        toolbarTitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 21f);
        toolbarTitleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        toolbarTitleView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            toolbarTitleView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        toolbarTitleView.setSingleLine(true);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            toolbarTitleView.setAccessibilityHeading(true);
        }
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f);
        titleLp.leftMargin = dp(12);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            titleLp.setMarginStart(dp(12));
        }
        toolbarTitleView.setLayoutParams(titleLp);

        toolbarView.addView(backButton);
        toolbarView.addView(toolbarTitleView);
        toolbarView.addView(buildRestartButton());
        return toolbarView;
    }

    private View buildRestartButton() {
        String restartLabel = text(R.string.gboard_patches_restart_action);
        restartButton = new View(this) {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final Path path = new Path();

            {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);
                paint.setStrokeWidth(getResources().getDisplayMetrics().density * 1.8f);
            }

            @Override
            protected void onDraw(Canvas canvas) {
                super.onDraw(canvas);
                float density = getResources().getDisplayMetrics().density;
                float iconSize = density * 24f;
                float left = (getWidth() - iconSize) / 2f;
                float top = (getHeight() - iconSize) / 2f;
                float scale = iconSize / 24f;

                paint.setColor(palette.textPrimary);
                path.reset();
                path.moveTo(left + (4.48f * scale), top + (14.5f * scale));
                path.cubicTo(
                        left + (5.6f * scale), top + (17.7f * scale),
                        left + (8.65f * scale), top + (20f * scale),
                        left + (12.25f * scale), top + (20f * scale));
                path.cubicTo(
                        left + (16.8f * scale), top + (20f * scale),
                        left + (20.5f * scale), top + (16.3f * scale),
                        left + (20.5f * scale), top + (11.75f * scale));
                path.cubicTo(
                        left + (20.5f * scale), top + (7.2f * scale),
                        left + (16.8f * scale), top + (3.5f * scale),
                        left + (12.25f * scale), top + (3.5f * scale));
                path.cubicTo(
                        left + (8.55f * scale), top + (3.5f * scale),
                        left + (5.55f * scale), top + (5.95f * scale),
                        left + (4.5f * scale), top + (9.5f * scale));
                canvas.drawPath(path, paint);

                path.reset();
                path.moveTo(left + (4.5f * scale), top + (4.5f * scale));
                path.lineTo(left + (4.5f * scale), top + (9.5f * scale));
                path.lineTo(left + (9.5f * scale), top + (9.5f * scale));
                canvas.drawPath(path, paint);
            }

            @Override
            public CharSequence getAccessibilityClassName() {
                return Button.class.getName();
            }
        };
        restartButton.setContentDescription(restartLabel);
        restartButton.setLayoutParams(new LinearLayout.LayoutParams(dp(44), dp(44)));
        restartButton.setBackground(GboardM3Helper.isLiquidGlassUiEnabled(this)
                ? GboardM3Helper.createLiquidGlassOrbWithRipple(
                        this, m3Palette != null ? m3Palette : GboardM3Helper.Palette.forContext(this))
                : buildRippleDrawable(dp(22)));
        restartButton.setElevation(0f);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            restartButton.setTooltipText(restartLabel);
        } else {
            restartButton.setOnLongClickListener(view -> {
                showSafeToast(R.string.gboard_patches_restart_action);
                return true;
            });
        }
        restartButton.setOnClickListener(view -> requestGboardRestart());
        return restartButton;
    }

    private void scheduleRestartCrashRecoveryGuardRestore() {
        try {
            Context applicationContext = getApplicationContext();
            Context restoreContext = applicationContext != null ? applicationContext : this;
            boolean scheduled = screenRefreshHandler.postDelayed(
                    () -> restoreRestartCrashRecoveryGuard(restoreContext),
                    RESTART_CRASH_RECOVERY_RESTORE_DELAY_MS);
            if (!scheduled) {
                Log.w(TAG, "Failed to schedule Gboard crash recovery cleanup restoration");
            }
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to defer Gboard crash recovery cleanup restoration", throwable);
            } catch (Throwable ignored) {
                // The restart guard must never escape into the host app.
            }
        }
    }

    private void restoreRestartCrashRecoveryGuard(Context context) {
        try {
            if (!GboardRestartCrashRecoveryGuard.restoreIfPending(context)) {
                Log.w(TAG, "Failed to restore Gboard crash recovery cleanup setting");
            }
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to run Gboard crash recovery cleanup restoration", throwable);
            } catch (Throwable ignored) {
                // The restart guard must never escape into the host app.
            }
        }
    }

    private void requestGboardRestart() {
        try {
            GboardPatchesSettingsOrchestrator.State<GboardPatchesSettingsContract.Feature> state =
                    settingsOrchestrator.snapshot();
            ArrayList<String> navigationPath = GboardPatchesNavigationPath.capture(
                    state.getBackStack(), state.getCurrent());

            Context applicationContext = getApplicationContext();
            Context restartContext = applicationContext != null ? applicationContext : this;
            if (!GboardRestartCrashRecoveryGuard.prepare(restartContext)) {
                handleRestartFailure("Failed to prepare safe Gboard restart", null);
                return;
            }
            setRestartButtonPending(true);
            boolean scheduled = screenRefreshHandler.postDelayed(
                    () -> coldRestartGboard(restartContext, navigationPath),
                    RESTART_DELAY_MS);
            if (!scheduled) {
                handleRestartFailure("Failed to schedule Gboard restart", null);
            }
        } catch (Throwable throwable) {
            handleRestartFailure("Failed to request Gboard restart", throwable);
        }
    }

    private void coldRestartGboard(Context context, ArrayList<String> navigationPath) {
        try {
            ComponentName patchesComponent =
                    new ComponentName(context, GboardPatchesSettingsActivity.class);
            Intent restartIntent = Intent.makeRestartActivityTask(patchesComponent);
            restartIntent.putStringArrayListExtra(EXTRA_NAVIGATION_PATH, navigationPath);
            restartIntent.setPackage(context.getPackageName());
            context.startActivity(restartIntent);
            System.exit(0);
        } catch (Throwable throwable) {
            handleRestartFailure("Failed to cold restart Gboard", throwable);
        }
    }

    private void setRestartButtonPending(boolean pending) {
        try {
            if (!pending) {
                stopRestartButtonAnimation();
            }
            if (restartButton == null) {
                return;
            }
            restartButton.setEnabled(!pending);
            restartButton.setAlpha(1f);
            String restartingLabel = pending ? text(R.string.gboard_patches_restarting) : null;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                restartButton.setStateDescription(restartingLabel);
            } else if (pending) {
                restartButton.announceForAccessibility(restartingLabel);
            }
            if (pending) {
                startRestartButtonAnimation();
            }
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to update Gboard restart action", throwable);
            } catch (Throwable ignored) {
                // A restart failure must never escape into the host app.
            }
        }
    }

    private void startRestartButtonAnimation() {
        stopRestartButtonAnimation();
        if (restartButton == null) {
            return;
        }
        restartButtonAnimator = ObjectAnimator.ofFloat(
                restartButton,
                View.ROTATION,
                0f,
                -360f);
        restartButtonAnimator.setDuration(RESTART_ICON_ROTATION_DURATION_MS);
        restartButtonAnimator.setInterpolator(new LinearInterpolator());
        restartButtonAnimator.setRepeatCount(ValueAnimator.INFINITE);
        restartButtonAnimator.start();
    }

    private void stopRestartButtonAnimation() {
        if (restartButtonAnimator != null) {
            restartButtonAnimator.cancel();
            restartButtonAnimator = null;
        }
        if (restartButton != null) {
            restartButton.setRotation(0f);
        }
    }

    private void handleRestartFailure(String message, Throwable throwable) {
        try {
            if (!GboardRestartCrashRecoveryGuard.restoreIfPending(this)) {
                Log.w(TAG, "Failed to roll back Gboard restart guard");
            }
        } catch (Throwable ignored) {
            // A restart failure must never escape into the host app.
        }
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // A restart failure must never escape into the host app.
        }
        setRestartButtonPending(false);
        try {
            showRestartFailure();
        } catch (Throwable notificationThrowable) {
            try {
                Log.w(TAG, "Failed to show Gboard restart error", notificationThrowable);
            } catch (Throwable ignored) {
                // A restart failure must never escape into the host app.
            }
        }
    }

    private void showRestartFailure() {
        Toast.makeText(
                this,
                text(R.string.gboard_patches_restart_failed),
                Toast.LENGTH_LONG)
                .show();
    }

    private View buildBackButton() {
        View backButton = new View(this) {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final Path path = new Path();

            {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);
                paint.setStrokeWidth(getResources().getDisplayMetrics().density * 2.15f);
            }

            @Override
            protected void onDraw(Canvas canvas) {
                super.onDraw(canvas);
                float density = getResources().getDisplayMetrics().density;
                float iconSize = density * 24f;
                float left = (getWidth() - iconSize) / 2f;
                float top = (getHeight() - iconSize) / 2f;
                float scale = iconSize / 24f;

                paint.setColor(palette.textPrimary);
                path.reset();
                path.moveTo(left + (19.5f * scale), top + (12f * scale));
                path.lineTo(left + (7.8f * scale), top + (12f * scale));
                path.moveTo(left + (12.9f * scale), top + (7f * scale));
                path.lineTo(left + (7.8f * scale), top + (12f * scale));
                path.lineTo(left + (12.9f * scale), top + (17f * scale));
                boolean isRtl = Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1
                        && getResources().getConfiguration().getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
                if (isRtl) {
                    canvas.save();
                    canvas.scale(-1f, 1f, getWidth() / 2f, getHeight() / 2f);
                }
                canvas.drawPath(path, paint);
                if (isRtl) {
                    canvas.restore();
                }
            }

            @Override
            public CharSequence getAccessibilityClassName() {
                return Button.class.getName();
            }
        };
        backButton.setContentDescription(text(R.string.gboard_patches_navigate_up));
        backButton.setLayoutParams(new LinearLayout.LayoutParams(dp(44), dp(44)));
        backButton.setBackground(GboardM3Helper.isLiquidGlassUiEnabled(this)
                ? GboardM3Helper.createLiquidGlassOrbWithRipple(
                        this, m3Palette != null ? m3Palette : GboardM3Helper.Palette.forContext(this))
                : buildRippleDrawable(dp(22)));
        backButton.setElevation(0f);
        backButton.setOnClickListener(view -> goBackOrFinish());
        backButtonView = backButton;
        return backButton;
    }

    private View buildHeaderCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            card.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        card.setBackground(buildCardDrawable(palette.surfaceAlt, palette.surfaceStroke, dp(24)));
        card.setPadding(dp(20), dp(20), dp(20), dp(20));
        card.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        card.setVisibility(View.GONE);

        headerBadgeView = new TextView(this);
        headerBadgeView.setAllCaps(true);
        headerBadgeView.setTextColor(palette.accent);
        headerBadgeView.setTypeface(Typeface.DEFAULT_BOLD);
        headerBadgeView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        headerBadgeView.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            headerBadgeView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }

        headerTitleView = new TextView(this);
        headerTitleView.setTextColor(palette.textPrimary);
        headerTitleView.setTypeface(Typeface.DEFAULT_BOLD);
        headerTitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24f);
        headerTitleView.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            headerTitleView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        titleParams.topMargin = dp(8);
        headerTitleView.setLayoutParams(titleParams);

        headerSummaryView = new TextView(this);
        headerSummaryView.setTextColor(palette.textSecondary);
        headerSummaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        headerSummaryView.setLineSpacing(0f, 1.1f);
        headerSummaryView.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            headerSummaryView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        LinearLayout.LayoutParams summaryParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        summaryParams.topMargin = dp(6);
        headerSummaryView.setLayoutParams(summaryParams);

        card.addView(headerBadgeView);
        card.addView(headerTitleView);
        card.addView(headerSummaryView);
        return card;
    }

    private View buildPanelCard() {
        panelContainer = new LinearLayout(this);
        panelContainer.setOrientation(LinearLayout.VERTICAL);
        panelContainer.setBackground(null);
        LinearLayout.LayoutParams panelParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        panelParams.topMargin = 0;
        panelContainer.setLayoutParams(panelParams);
        panelContainer.setPadding(0, 0, 0, 0);
        return panelContainer;
    }

    private void goBackOrFinish() {
        if (standaloneFeatureMode || navigateBack()) {
            finish();
        }
    }

    @Override
    public void openExternalUrl(String url) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        try {
            startActivity(intent);
        } catch (ActivityNotFoundException ignored) {
            // Ignore devices without a visible browser handler.
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to open external URL: " + url, throwable);
        }
    }

    @Override
    public void openSpeechRecognitionAndSynthesisStoreListing() {
        if (openGooglePlayListing(
                SPEECH_SERVICES_PACKAGE_NAME,
                SPEECH_SERVICES_PLAY_STORE_URL)) {
            return;
        }
        showSafeToast(
                R.string.gboard_patches_advanced_voice_speech_services_open_failed);
    }

    @Override
    public void openLiveTranscribeLanguageManager() {
        Intent launchIntent = null;
        try {
            launchIntent = getPackageManager().getLaunchIntentForPackage(
                    LIVE_TRANSCRIBE_PACKAGE_NAME);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to resolve Live Transcribe launcher", throwable);
        }
        if (tryStartActivity(launchIntent)) {
            return;
        }
        if (openGooglePlayListing(
                LIVE_TRANSCRIBE_PACKAGE_NAME,
                LIVE_TRANSCRIBE_PLAY_STORE_URL)) {
            return;
        }
        showSafeToast(
                R.string.gboard_patches_advanced_voice_live_transcribe_open_failed);
    }

    private void showSafeToast(int resourceId) {
        try {
            String message = GboardSettingsText.get(this, resourceId);
            Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to show navigation error message", throwable);
            } catch (Throwable ignored) {
                // A patch error must never escape into the host app.
            }
        }
    }

    private boolean openGooglePlayListing(String packageName, String webUrl) {
        Intent marketIntent = new Intent(
                Intent.ACTION_VIEW,
                Uri.parse("market://details?id=" + packageName));
        marketIntent.setPackage(PLAY_STORE_PACKAGE_NAME);
        if (tryStartActivity(marketIntent)) {
            return true;
        }
        return tryStartActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(webUrl)));
    }

    private boolean tryStartActivity(Intent intent) {
        if (intent == null) {
            return false;
        }
        try {
            startActivity(intent);
            return true;
        } catch (ActivityNotFoundException | SecurityException exception) {
            Log.w(TAG, "Activity navigation attempt failed: " + intent, exception);
            return false;
        } catch (Throwable throwable) {
            Log.w(TAG, "Unexpected activity navigation failure: " + intent, throwable);
            return false;
        }
    }

    private void refreshOfflineSpeechLanguagesForCurrentFeature() {
        GboardPatchesSettingsContract.Feature currentFeature =
                settingsOrchestrator.snapshot().getCurrent();
        if (currentFeature != null && currentFeature.requiresOfflineSpeechLanguages()) {
            queryOfflineSpeechLanguages();
            return;
        }
        offlineSpeechLanguageQueryGeneration++;
        cancelOfflineSpeechLanguageQueryTimeout();
        destroyOfflineSpeechRecognizer();
    }

    private void queryOfflineSpeechLanguages() {
        offlineSpeechLanguageQueryGeneration++;
        cancelOfflineSpeechLanguageQueryTimeout();
        destroyOfflineSpeechRecognizer();
        offlineSpeechLanguages = GboardPatchesSettingsContract.OfflineSpeechLanguages.loading();

        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            offlineSpeechLanguages =
                    GboardPatchesSettingsContract.OfflineSpeechLanguages.unsupported();
            renderCurrentScreenSafely();
            return;
        }
        ComponentName recognitionService = new ComponentName(
                SPEECH_SERVICES_PACKAGE_NAME,
                SPEECH_SERVICES_RECOGNITION_SERVICE_CLASS_NAME);
        if (!isRecognitionServiceAvailable(recognitionService)) {
            offlineSpeechLanguages =
                    GboardPatchesSettingsContract.OfflineSpeechLanguages.unavailable();
            renderCurrentScreenSafely();
            return;
        }

        final int queryGeneration = offlineSpeechLanguageQueryGeneration;
        try {
            offlineSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(
                    this,
                    recognitionService);
            Intent recognitionIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
            recognitionIntent.putExtra(
                    RecognizerIntent.EXTRA_LANGUAGE_MODEL,
                    RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
            recognitionIntent.putExtra(RecognizerIntent.EXTRA_PREFER_OFFLINE, true);
            offlineSpeechLanguageQueryTimeoutRunnable = () -> {
                if (queryGeneration != offlineSpeechLanguageQueryGeneration) {
                    return;
                }
                Log.w(TAG, "Speech Services recognition support query timed out");
                completeOfflineSpeechLanguageQuery(
                        queryGeneration,
                        GboardPatchesSettingsContract.OfflineSpeechLanguages.error());
            };
            screenRefreshHandler.postDelayed(
                    offlineSpeechLanguageQueryTimeoutRunnable,
                    OFFLINE_SPEECH_LANGUAGE_QUERY_TIMEOUT_MS);
            offlineSpeechRecognizer.checkRecognitionSupport(
                    recognitionIntent,
                    getMainExecutor(),
                    new RecognitionSupportCallback() {
                        @Override
                        public void onSupportResult(RecognitionSupport recognitionSupport) {
                            if (queryGeneration != offlineSpeechLanguageQueryGeneration) {
                                return;
                            }
                            List<String> installedLanguages = recognitionSupport == null
                                    ? Collections.emptyList()
                                    : recognitionSupport.getInstalledOnDeviceLanguages();
                            Log.i(TAG, "Speech Services installed offline languages from "
                                    + recognitionService.flattenToShortString()
                                    + ": " + installedLanguages);
                            completeOfflineSpeechLanguageQuery(
                                    queryGeneration,
                                    GboardPatchesSettingsContract.OfflineSpeechLanguages.available(
                                            installedLanguages));
                        }

                        @Override
                        public void onError(int error) {
                            if (queryGeneration != offlineSpeechLanguageQueryGeneration) {
                                return;
                            }
                            Log.w(TAG,
                                    "Speech Services recognition support callback reported error "
                                            + error
                                            + "; waiting for timeout or a later support result");
                        }
                    });
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to query installed on-device speech languages", throwable);
            completeOfflineSpeechLanguageQuery(
                    queryGeneration,
                    GboardPatchesSettingsContract.OfflineSpeechLanguages.error());
        }
    }

    @SuppressWarnings("deprecation")
    private boolean isRecognitionServiceAvailable(ComponentName recognitionService) {
        try {
            android.content.pm.ServiceInfo serviceInfo = getPackageManager().getServiceInfo(
                    recognitionService,
                    0);
            return serviceInfo.enabled
                    && serviceInfo.applicationInfo != null
                    && serviceInfo.applicationInfo.enabled;
        } catch (PackageManager.NameNotFoundException exception) {
            Log.w(TAG, "Speech Services recognition service is unavailable: "
                    + recognitionService.flattenToShortString());
            return false;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to inspect Speech Services recognition service: "
                    + recognitionService.flattenToShortString(), throwable);
            return false;
        }
    }

    private void completeOfflineSpeechLanguageQuery(
            int queryGeneration,
            GboardPatchesSettingsContract.OfflineSpeechLanguages result) {
        if (queryGeneration != offlineSpeechLanguageQueryGeneration) {
            return;
        }
        offlineSpeechLanguageQueryGeneration++;
        cancelOfflineSpeechLanguageQueryTimeout();
        offlineSpeechLanguages = result;
        destroyOfflineSpeechRecognizer();
        renderCurrentScreenSafely();
    }

    private void cancelOfflineSpeechLanguageQuery() {
        offlineSpeechLanguageQueryGeneration++;
        cancelOfflineSpeechLanguageQueryTimeout();
        destroyOfflineSpeechRecognizer();
    }

    private void cancelOfflineSpeechLanguageQueryTimeout() {
        if (offlineSpeechLanguageQueryTimeoutRunnable == null) {
            return;
        }
        screenRefreshHandler.removeCallbacks(offlineSpeechLanguageQueryTimeoutRunnable);
        offlineSpeechLanguageQueryTimeoutRunnable = null;
    }

    private void destroyOfflineSpeechRecognizer() {
        if (offlineSpeechRecognizer == null) {
            return;
        }
        try {
            offlineSpeechRecognizer.destroy();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to destroy on-device speech recognizer", throwable);
        } finally {
            offlineSpeechRecognizer = null;
        }
    }

    private boolean navigateToRootIfNeeded() {
        return !navigateBack();
    }

    private boolean navigateBack() {
        if (standaloneFeatureMode) {
            finish();
            return false;
        }
        GboardPatchesSettingsOrchestrator.State<GboardPatchesSettingsContract.Feature> state =
                settingsOrchestrator.snapshot();
        if (state.getCurrent() != null) {
            boolean returningToRoot = state.getBackStack().isEmpty();
            requestScrollPositionOnNextScreenApply(
                    scrollState.leaveFeature(returningToRoot));
        }
        return applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.back()));
    }

    private void registerBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            return;
        }
        try {
            Class<?> callbackClass = Class.forName("android.window.OnBackInvokedCallback");
            Class<?> dispatcherClass = Class.forName("android.window.OnBackInvokedDispatcher");
            Object callback = Proxy.newProxyInstance(
                    callbackClass.getClassLoader(),
                    new Class<?>[] { callbackClass },
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if ("hashCode".equals(method.getName())) {
                                return Integer.valueOf(System.identityHashCode(proxy));
                            }
                            if ("equals".equals(method.getName())) {
                                Object other = args != null && args.length > 0 ? args[0] : null;
                                return Boolean.valueOf(proxy == other);
                            }
                            if ("toString".equals(method.getName())) {
                                return "GboardPatchesOnBackInvokedCallbackProxy";
                            }
                        }
                        if ("onBackInvoked".equals(method.getName())) {
                            if (!navigateToRootIfNeeded()) {
                                finish();
                            }
                        }
                        return null;
                    });
            Object dispatcher = Activity.class.getMethod("getOnBackInvokedDispatcher")
                    .invoke(this);
            if (dispatcher == null) {
                return;
            }
            int priorityDefault = dispatcherClass.getField("PRIORITY_DEFAULT").getInt(null);
            dispatcherClass.getMethod("registerOnBackInvokedCallback", int.class, callbackClass)
                    .invoke(dispatcher, priorityDefault, callback);
            backInvokedCallback = callback;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to register platform back callback", throwable);
            backInvokedCallback = null;
        }
    }

    private void unregisterBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU || backInvokedCallback == null) {
            return;
        }
        try {
            Class<?> callbackClass = Class.forName("android.window.OnBackInvokedCallback");
            Class<?> dispatcherClass = Class.forName("android.window.OnBackInvokedDispatcher");
            Object dispatcher = Activity.class.getMethod("getOnBackInvokedDispatcher")
                    .invoke(this);
            if (dispatcher != null) {
                dispatcherClass.getMethod("unregisterOnBackInvokedCallback", callbackClass)
                        .invoke(dispatcher, backInvokedCallback);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to unregister platform back callback", throwable);
        }
        backInvokedCallback = null;
    }

    private void installWindowInsetsHandling(View root) {
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            try {
                updateToolbarInsets(resolveTopInset(insets));
                int bottomInset = resolveBottomInset(insets);
                if (contentScrollView != null) {
                    int bottomPadding = keyboardPreviewController == null
                            ? bottomInset
                            : keyboardPreviewController.contentBottomPadding(bottomInset);
                    contentScrollView.setPadding(0, 0, 0, bottomPadding);
                }
                if (screenActionContainer != null) {
                    screenActionContainer.setPadding(
                            dp(16), dp(8), dp(16), dp(16) + bottomInset);
                }
                if (footerContainer != null) {
                    footerContainer.setPadding(dp(24), dp(10), dp(24), dp(18) + bottomInset);
                } else if (footerVersionView != null) {
                    footerVersionView.setPadding(0, dp(12), 0, dp(24) + bottomInset);
                }
                if (keyboardPreviewController != null) {
                    keyboardPreviewController.updateSafeAreaInsets(resolveRightInset(insets),
                            bottomInset);
                }
            } catch (Throwable throwable) {
                try {
                    Log.w(TAG, "Failed to apply patches settings insets", throwable);
                } catch (Throwable ignored) {
                    // Insets are optional UI polish and must not affect the settings host.
                }
            }
            return insets;
        });
        root.requestApplyInsets();
    }

    private void scheduleDeferredRender() {
        if (settingsOrchestrator.snapshot().isFatal()) {
            return;
        }
        View anchor = panelContainer != null ? panelContainer : getWindow().getDecorView();
        if (anchor == null) {
            initializeFeaturesAndRenderSafely();
            return;
        }
        anchor.removeCallbacks(deferredRenderRunnable);
        anchor.post(deferredRenderRunnable);
    }

    private void cancelDeferredRender() {
        View anchor = panelContainer != null ? panelContainer : getWindow().getDecorView();
        if (anchor != null) {
            anchor.removeCallbacks(deferredRenderRunnable);
        }
    }

    private void postToDecorView(Runnable action) {
        if (action == null) {
            return;
        }
        View anchor = panelContainer != null ? panelContainer : getWindow().getDecorView();
        if (anchor == null) {
            action.run();
            return;
        }
        anchor.post(action);
    }

    private void initializeFeaturesAndRenderSafely() {
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.requestRender()));
    }

    private boolean applyOrchestration(
            GboardPatchesSettingsOrchestrator.Transition<
                    GboardPatchesSettingsContract.Feature,
                    GboardPatchesSettingsContract.Intent> transition) {
        boolean exitRequested = false;
        for (GboardPatchesSettingsOrchestrator.Effect<
                GboardPatchesSettingsContract.Feature,
                GboardPatchesSettingsContract.Intent> effect : transition.getEffects()) {
            switch (effect.getKind()) {
                case REQUEST_RENDER:
                    enqueueScreenBuild(effect.getGeneration());
                    break;
                case REFRESH_DEPENDENCIES:
                    refreshOfflineSpeechLanguagesForCurrentFeature();
                    break;
                case SCROLL_TO_TOP:
                    if (requestedScrollYOnNextScreenApply == NO_SCROLL_POSITION_REQUESTED) {
                        requestScrollPositionOnNextScreenApply(0);
                    }
                    break;
                case SCHEDULE_REFRESH:
                    scheduleScreenRefresh(effect.getDelayMs());
                    break;
                case CANCEL_REFRESH:
                    cancelScheduledScreenRefresh();
                    break;
                case CANCEL_PENDING_RENDER:
                    cancelDeferredRender();
                    break;
                case EXECUTE_INTENT:
                    GboardPatchesSettingsContract.Intent intent = effect.getPayload();
                    if (intent != null) {
                        intent.apply(this);
                    }
                    break;
                case EXIT:
                    exitRequested = true;
                    break;
                default:
                    break;
            }
        }
        syncVisibleFeatureLifecycle();
        return exitRequested;
    }

    private void syncVisibleFeatureLifecycle() {
        GboardPatchesSettingsContract.Feature target = featureLifecycleEnabled
                ? settingsOrchestrator.snapshot().getCurrent()
                : null;
        if (target == lifecycleVisibleFeature) {
            return;
        }
        GboardPatchesSettingsContract.Feature previous = lifecycleVisibleFeature;
        lifecycleVisibleFeature = target;
        if (previous != null) {
            try {
                previous.onHidden(this);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to hide settings feature", throwable);
            }
        }
        if (target != null) {
            try {
                target.onVisible(this);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to show settings feature", throwable);
            }
        }
    }

    private void enqueueScreenBuild(int buildGeneration) {
        try {
            screenBuildExecutor.execute(() -> buildAndApplyCurrentScreen(buildGeneration));
        } catch (RejectedExecutionException ignored) {
            // Activity is already tearing down.
        }
    }

    private static boolean containsEffect(
            GboardPatchesSettingsOrchestrator.Transition<?, ?> transition,
            GboardPatchesSettingsOrchestrator.EffectKind kind) {
        for (GboardPatchesSettingsOrchestrator.Effect<?, ?> effect : transition.getEffects()) {
            if (effect.getKind() == kind) {
                return true;
            }
        }
        return false;
    }

    private void ensureFeaturesInitialized() {
        if (featuresInitialized) {
            return;
        }
        synchronized (screenBuildLock) {
            if (featuresInitialized) {
                return;
            }
            try {
                features = GboardPatchesSettingsFeatureRegistry.features(this);
            } catch (Throwable throwable) {
                throw new IllegalStateException(
                        "Failed to resolve patches settings features",
                        throwable);
            }
            featuresInitialized = true;
        }
    }

    private void buildAndApplyCurrentScreen(int buildGeneration) {
        if (settingsOrchestrator.snapshot().isFatal()) {
            return;
        }

        GboardPatchesSettingsContract.Screen screen;
        GboardPatchesSettingsContract.Feature featureSnapshot =
                settingsOrchestrator.snapshot().getCurrent();
        try {
            palette = Palette.forContext(this, getResources().getConfiguration());
            ensureFeaturesInitialized();
            if (openInitialFeatureFromIntentIfNeeded()) {
                return;
            }
            featureSnapshot = settingsOrchestrator.snapshot().getCurrent();
            screen = featureSnapshot == null
                    ? buildRootScreen()
                    : featureSnapshot.buildScreen(this);
        } catch (IllegalStateException exception) {
            runOnUiThread(() -> {
                if (!isLatestScreenBuild(buildGeneration)
                        || settingsOrchestrator.snapshot().isFatal()
                        || isFinishing()) {
                    return;
                }
                Throwable cause = exception.getCause() == null ? exception : exception.getCause();
                showFatalFallbackScreen(exception.getMessage(), cause);
            });
            return;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render settings screen", throwable);
            screen = buildFeatureErrorScreen(settingsOrchestrator.snapshot().getCurrent());
        }

        GboardPatchesSettingsContract.Feature appliedFeature = featureSnapshot;
        GboardPatchesSettingsContract.Screen finalScreen = screen;
        runOnUiThread(() -> {
            if (isFinishing()
                    || (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1
                    && isDestroyed())) {
                return;
            }
            GboardPatchesSettingsOrchestrator.Transition<
                    GboardPatchesSettingsContract.Feature,
                    GboardPatchesSettingsContract.Intent> renderTransition =
                    settingsOrchestrator.accept(
                            GboardPatchesSettingsOrchestrator.Event.renderReady(
                                    buildGeneration,
                                    finalScreen.getRefreshIntervalMs()));
            if (!containsEffect(renderTransition,
                    GboardPatchesSettingsOrchestrator.EffectKind.APPLY_RENDER)
                    || settingsOrchestrator.snapshot().isFatal()) {
                return;
            }
            try {
                applyScreen(finalScreen);
                applyOrchestration(renderTransition);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to apply settings screen", throwable);
                try {
                    GboardPatchesSettingsOrchestrator.Transition<
                            GboardPatchesSettingsContract.Feature,
                            GboardPatchesSettingsContract.Intent> recoveryTransition =
                            settingsOrchestrator.accept(
                                    GboardPatchesSettingsOrchestrator.Event.renderFailed(
                                            buildGeneration));
                    if (!containsEffect(recoveryTransition,
                            GboardPatchesSettingsOrchestrator.EffectKind.APPLY_RECOVERY)) {
                        return;
                    }
                    GboardPatchesSettingsContract.Screen recoveryScreen =
                            buildFeatureErrorScreen(appliedFeature);
                    GboardPatchesSettingsOrchestrator.Transition<
                            GboardPatchesSettingsContract.Feature,
                            GboardPatchesSettingsContract.Intent> recoveryReady =
                            settingsOrchestrator.accept(
                                    GboardPatchesSettingsOrchestrator.Event.recoveryReady(
                                            buildGeneration,
                                            recoveryScreen.getRefreshIntervalMs()));
                    if (!containsEffect(recoveryReady,
                            GboardPatchesSettingsOrchestrator.EffectKind.APPLY_RECOVERY)) {
                        return;
                    }
                    applyScreen(recoveryScreen);
                    applyOrchestration(recoveryReady);
                } catch (Throwable fallbackThrowable) {
                    Log.w(TAG, "Failed to apply feature error screen", fallbackThrowable);
                    try {
                        fallbackThrowable.addSuppressed(throwable);
                    } catch (Throwable ignored) {
                    }
                    showFatalFallbackScreen("Failed to apply settings screen", fallbackThrowable);
                }
            }
        });
    }

    private boolean isLatestScreenBuild(int buildGeneration) {
        return buildGeneration == settingsOrchestrator.snapshot().getRenderGeneration();
    }

    private void updateToolbarInsets(int topInset) {
        if (toolbarView == null) {
            return;
        }
        ViewGroup.LayoutParams layoutParams = toolbarView.getLayoutParams();
        int targetHeight = dp(TOOLBAR_HEIGHT_DP) + topInset;
        if (layoutParams.height != targetHeight) {
            layoutParams.height = targetHeight;
            toolbarView.setLayoutParams(layoutParams);
        }
        toolbarView.setPadding(dp(14), topInset, dp(14), dp(4));
    }

    private int resolveTopInset(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            Insets systemBarsInsets = insets.getInsets(WindowInsets.Type.systemBars());
            return systemBarsInsets.top;
        }
        return insets.getSystemWindowInsetTop();
    }

    private int resolveBottomInset(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            Insets systemBarsInsets = insets.getInsets(WindowInsets.Type.systemBars());
            return systemBarsInsets.bottom;
        }
        return insets.getSystemWindowInsetBottom();
    }

    private int resolveRightInset(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            Insets systemBarsInsets = insets.getInsets(WindowInsets.Type.systemBars());
            return systemBarsInsets.right;
        }
        return insets.getSystemWindowInsetRight();
    }

    private void renderCurrentScreenSafely() {
        initializeFeaturesAndRenderSafely();
    }

    private void applyScreen(GboardPatchesSettingsContract.Screen screen) {
        m3Palette = GboardM3Helper.Palette.forContext(this);
        GboardPatchesSettingsOrchestrator.State<GboardPatchesSettingsContract.Feature> state =
                settingsOrchestrator.snapshot();
        int screenDepth = state.getBackStack().size() + (state.getCurrent() == null ? 0 : 1);
        if (appliedScreenDepth >= 0) {
            accessibilityFocusKeyByDepth.put(appliedScreenDepth, accessibilityFocusedRowKey);
        }
        rowViewsByAccessibilityKey.clear();
        toolbarTitleView.setText(screen.getToolbarTitle());
        if (restartButton != null) {
            restartButton.setVisibility(screen.isRestartActionVisible() ? View.VISIBLE : View.GONE);
        }
        headerBadgeView.setText(screen.getHeaderBadge());
        headerTitleView.setText(screen.getHeaderTitle());
        headerSummaryView.setText(screen.getHeaderSummary());
        headerSummaryView.setVisibility(
                TextUtils.isEmpty(screen.getHeaderSummary()) ? View.GONE : View.VISIBLE);
        applyPanelStyle(screen.getPanelStyle());
        panelContainer.removeAllViews();
        if (state.getCurrent() instanceof GboardHelpFeedbackFeature helpFeature) {
            View formView = helpFeature.buildFormView(this, m3Palette);
            LinearLayout.LayoutParams formLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            formLp.setMargins(dp(16), dp(8), dp(16), dp(16));
            panelContainer.addView(formView, formLp);
        } else if (state.getCurrent() instanceof GboardBetaProgramFeature.BetaVersionTestingFeature betaTesting) {
            View testingView = betaTesting.buildTestingView(this, m3Palette);
            LinearLayout.LayoutParams testingLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            testingLp.setMargins(dp(16), dp(8), dp(16), dp(16));
            panelContainer.addView(testingView, testingLp);
        } else {
            List<GboardPatchesSettingsContract.Section> sections = screen.getSections();
            for (GboardPatchesSettingsContract.StatusBlock statusBlock : screen.getStatusBlocks()) {
                panelContainer.addView(createStatusBlockView(statusBlock, sections));
            }
            for (GboardPatchesSettingsContract.Section section : sections) {
                panelContainer.addView(createSectionView(section));
            }
        }
        screenActionContainer.removeAllViews();
        GboardPatchesSettingsContract.CommandRow primaryAction = screen.getPrimaryAction();
        if (primaryAction == null) {
            screenActionContainer.setVisibility(View.GONE);
        } else {
            screenActionContainer.addView(createSectionView(
                    new GboardPatchesSettingsContract.Section(
                            null, Collections.singletonList(primaryAction))));
            screenActionContainer.setVisibility(View.VISIBLE);
        }
        int requestedScrollY = consumeRequestedScrollPositionOnNextScreenApply();
        if (requestedScrollY >= 0) {
            scrollContentToPositionAfterLayout(requestedScrollY);
        }
        if (appliedScreenDepth >= 0 && contentColumn != null) {
            android.view.animation.PathInterpolator smoothCurve =
                    new android.view.animation.PathInterpolator(0.22f, 1f, 0.36f, 1f);
            if (screenDepth > appliedScreenDepth) {
                contentColumn.setTranslationX(dp(64));
                contentColumn.setAlpha(0f);
                contentColumn.animate()
                        .withLayer()
                        .translationX(0f)
                        .alpha(1f)
                        .setDuration(240)
                        .setInterpolator(smoothCurve)
                        .start();
            } else if (screenDepth < appliedScreenDepth) {
                contentColumn.setTranslationX(-dp(64));
                contentColumn.setAlpha(0f);
                contentColumn.animate()
                        .withLayer()
                        .translationX(0f)
                        .alpha(1f)
                        .setDuration(240)
                        .setInterpolator(smoothCurve)
                        .start();
            }
        }
        restoreAccessibilityFocus(screenDepth);
    }

    /**
     * Puts TalkBack's focus back after a rebuild: on the same row when the screen refreshed or
     * the user came back from a sub-page, and on the page title when a new page opened, so the
     * new page is announced instead of focus being lost.
     */
    private void restoreAccessibilityFocus(int screenDepth) {
        int previousDepth = appliedScreenDepth;
        appliedScreenDepth = screenDepth;
        String rowKey = screenDepth > previousDepth
                ? null
                : accessibilityFocusKeyByDepth.get(screenDepth);
        accessibilityFocusKeyByDepth.keySet().removeIf(depth -> depth >= screenDepth);
        accessibilityFocusedRowKey = rowKey;
        if (previousDepth < 0 || !isScreenReaderActive()) {
            return;
        }
        View target = rowKey == null ? null : rowViewsByAccessibilityKey.get(rowKey);
        if (target == null && screenDepth != previousDepth) {
            target = toolbarTitleView;
        }
        if (target == null) {
            return;
        }
        View focusTarget = target;
        postToDecorView(() -> focusTarget.performAccessibilityAction(
                AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
    }

    private boolean isScreenReaderActive() {
        AccessibilityManager manager =
                (AccessibilityManager) getSystemService(Context.ACCESSIBILITY_SERVICE);
        return manager != null && manager.isEnabled() && manager.isTouchExplorationEnabled();
    }

    private void trackAccessibilityFocus(View rowView, CharSequence title) {
        if (title == null || title.length() == 0) {
            return;
        }
        String rowKey = title.toString();
        rowViewsByAccessibilityKey.put(rowKey, rowView);
        rowView.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
                if (action == AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS) {
                    accessibilityFocusedRowKey = rowKey;
                }
                return super.performAccessibilityAction(host, action, arguments);
            }
        });
    }

    private void applyPanelStyle(GboardPatchesSettingsContract.PanelStyle panelStyle) {
        if (panelContainer == null) {
            return;
        }
        panelContainer.setBackground(null);
        panelContainer.setPadding(0, 0, 0, 0);
    }

    private void openFeaturePath(GboardPatchesSettingsContract.Feature... featurePath) {
        if (featurePath == null || featurePath.length == 0) {
            return;
        }
        List<GboardPatchesSettingsContract.Feature> sanitizedPath =
                new ArrayList<GboardPatchesSettingsContract.Feature>();
        for (GboardPatchesSettingsContract.Feature feature : featurePath) {
            if (feature != null) {
                sanitizedPath.add(feature);
            }
        }
        if (sanitizedPath.isEmpty()) {
            return;
        }
        scrollState.resetForDirectPath(sanitizedPath.size() - 1);
        requestScrollPositionOnNextScreenApply(0);
        applyOrchestration(settingsOrchestrator.accept(
                GboardPatchesSettingsOrchestrator.Event.replacePath(sanitizedPath)));
    }

    private boolean openInitialFeatureFromIntentIfNeeded() {
        if (initialFeatureFromIntentHandled) {
            return false;
        }
        initialFeatureFromIntentHandled = true;
        Intent intent = getIntent();
        if (intent == null) {
            return false;
        }

        String action = intent.getAction();
        Class<?> targetFeatureClass = null;
        if (ACTION_UPDATES.equals(action)) {
            targetFeatureClass = com.akshaykadam.pixelboard.extension.updater.PixelBoardUpdateFeature.class;
        } else if (ACTION_APPEARANCE.equals(action)) {
            targetFeatureClass = GboardAppearanceFeature.class;
        } else if (ACTION_BOARD_UI.equals(action)) {
            targetFeatureClass = GboardBoardUiFeature.class;
        } else if (ACTION_ABOUT.equals(action)) {
            targetFeatureClass = GboardAboutFeature.class;
        } else if (ACTION_PRO.equals(action)) {
            targetFeatureClass = GboardProFeature.class;
        } else if (ACTION_ADDITIONAL.equals(action)) {
            targetFeatureClass = GboardAdditionalFeature.class;
        } else if (ACTION_HELP_FEEDBACK.equals(action)) {
            targetFeatureClass = GboardHelpFeedbackFeature.class;
        } else if (ACTION_NOTIFICATIONS.equals(action)) {
            targetFeatureClass = GboardAdditionalFeature.NotificationSettingsFeature.class;
        } else if (ACTION_BETA_PROGRAM.equals(action)) {
            targetFeatureClass = GboardBetaProgramFeature.class;
        } else if (ACTION_BETA_TESTING.equals(action)) {
            targetFeatureClass = GboardBetaProgramFeature.BetaVersionTestingFeature.class;
        } else if (ACTION_BETA_FEATURES.equals(action)) {
            targetFeatureClass = GboardBetaProgramFeature.NewBetaFeaturesFeature.class;
        }

        if (targetFeatureClass != null) {
            standaloneFeatureMode = true;
            GboardPatchesSettingsContract.Feature targetFeature = null;
            if (ACTION_UPDATES.equals(action)) {
                targetFeature = new com.akshaykadam.pixelboard.extension.updater.PixelBoardUpdateFeature(this);
            } else if (ACTION_APPEARANCE.equals(action)) {
                targetFeature = new GboardAppearanceFeature(this);
            } else if (ACTION_BOARD_UI.equals(action)) {
                targetFeature = new GboardBoardUiFeature(this);
            } else if (ACTION_ABOUT.equals(action)) {
                targetFeature = new GboardAboutFeature(this);
            } else if (ACTION_PRO.equals(action)) {
                targetFeature = new GboardProFeature(this);
            } else if (ACTION_ADDITIONAL.equals(action)) {
                targetFeature = new GboardAdditionalFeature(this);
            } else if (ACTION_HELP_FEEDBACK.equals(action)) {
                targetFeature = new GboardHelpFeedbackFeature(this);
            } else if (ACTION_NOTIFICATIONS.equals(action)) {
                targetFeature = new GboardAdditionalFeature.NotificationSettingsFeature(this);
            } else if (ACTION_BETA_PROGRAM.equals(action)) {
                targetFeature = new GboardBetaProgramFeature(this);
            } else if (ACTION_BETA_TESTING.equals(action)) {
                targetFeature = new GboardBetaProgramFeature.BetaVersionTestingFeature(this);
            } else if (ACTION_BETA_FEATURES.equals(action)) {
                targetFeature = new GboardBetaProgramFeature.NewBetaFeaturesFeature(this);
            }

            if (targetFeature != null) {
                List<GboardPatchesSettingsContract.Feature> path =
                        Collections.singletonList(targetFeature);
                runOnUiThread(() -> {
                    scrollState.resetForDirectPath(0);
                    requestScrollPositionOnNextScreenApply(0);
                    applyOrchestration(settingsOrchestrator.accept(
                            GboardPatchesSettingsOrchestrator.Event.replacePath(path)));
                });
                return true;
            }
        } else {
            standaloneFeatureMode = false;
        }

        if (restoreNavigationPathFromIntent(intent)) {
            return true;
        }
        return false;
    }

    private boolean restoreNavigationPathFromIntent(Intent intent) {
        if (!intent.hasExtra(EXTRA_NAVIGATION_PATH)) {
            return false;
        }
        ArrayList<String> pathIds = intent.getStringArrayListExtra(EXTRA_NAVIGATION_PATH);
        intent.removeExtra(EXTRA_NAVIGATION_PATH);
        List<GboardPatchesSettingsContract.Feature> resolvedPath =
                GboardPatchesNavigationPath.resolve(this, features, pathIds);
        if (pathIds == null
                || pathIds.isEmpty()
                || resolvedPath.size() != pathIds.size()) {
            return false;
        }
        runOnUiThread(() -> {
            scrollState.resetForDirectPath(resolvedPath.size() - 1);
            requestScrollPositionOnNextScreenApply(0);
            applyOrchestration(settingsOrchestrator.accept(
                    GboardPatchesSettingsOrchestrator.Event.replacePath(resolvedPath)));
        });
        return true;
    }

    private int currentScrollY() {
        return contentScrollView == null ? 0 : contentScrollView.getScrollY();
    }

    private void requestScrollPositionOnNextScreenApply(int scrollY) {
        requestedScrollYOnNextScreenApply = Math.max(0, scrollY);
    }

    private int consumeRequestedScrollPositionOnNextScreenApply() {
        int requestedScrollY = requestedScrollYOnNextScreenApply;
        requestedScrollYOnNextScreenApply = NO_SCROLL_POSITION_REQUESTED;
        return requestedScrollY;
    }

    private void scrollContentToPositionAfterLayout(int scrollY) {
        if (contentScrollView == null) {
            return;
        }
        int targetScrollY = Math.max(0, scrollY);
        contentScrollView.scrollTo(0, targetScrollY);
        contentScrollView.post(() -> {
            if (contentScrollView == null) {
                return;
            }
            contentScrollView.scrollTo(0, targetScrollY);
        });
    }

    private void scheduleScreenRefresh(long refreshIntervalMs) {
        cancelScheduledScreenRefresh();
        if (refreshIntervalMs <= 0L) {
            return;
        }
        screenRefreshHandler.postDelayed(screenRefreshRunnable, refreshIntervalMs);
    }

    private void cancelScheduledScreenRefresh() {
        screenRefreshHandler.removeCallbacks(screenRefreshRunnable);
    }

    private void showFatalFallbackScreen(String reason, Throwable throwable) {
        settingsOrchestrator.accept(GboardPatchesSettingsOrchestrator.Event.fatal());
        cancelScheduledScreenRefresh();
        setRestartButtonPending(false);
        Log.e(TAG, reason, throwable);
        detachKeyboardPreviewSafely();
        if (palette == null) {
            palette = Palette.forConfiguration(getResources().getConfiguration());
        }
        toolbarView = null;
        toolbarTitleView = null;
        restartButton = null;
        headerBadgeView = null;
        headerTitleView = null;
        headerSummaryView = null;
        panelContainer = null;
        contentScrollView = null;
        contentColumn = null;
        screenActionContainer = null;
        setContentView(buildFatalFallbackView());
    }

    private View buildFatalFallbackView() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER);
        root.setBackgroundColor(palette.windowBackground);
        int padding = dp(24);
        root.setPadding(padding, padding, padding, padding);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        TextView titleView = new TextView(this);
        titleView.setText(text(R.string.gboard_patches_fatal_fallback_title));
        titleView.setTextColor(palette.textPrimary);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setGravity(Gravity.CENTER_HORIZONTAL);

        TextView summaryView = new TextView(this);
        summaryView.setText(text(R.string.gboard_patches_fatal_fallback_summary));
        summaryView.setTextColor(palette.textSecondary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        summaryView.setGravity(Gravity.CENTER_HORIZONTAL);
        summaryView.setLineSpacing(0f, 1.15f);
        LinearLayout.LayoutParams summaryParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        summaryParams.topMargin = dp(12);

        root.addView(titleView);
        root.addView(summaryView, summaryParams);
        return root;
    }

    private void detachKeyboardPreviewSafely() {
        GboardKeyboardPreviewController controller = keyboardPreviewController;
        keyboardPreviewController = null;
        if (controller == null) return;
        try {
            controller.detach();
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to detach keyboard preview", throwable);
            } catch (Throwable ignored) {
                // Activity teardown must continue even if diagnostics fail.
            }
        }
    }

    private GboardPatchesSettingsContract.Screen buildRootScreen() {
        Context context = this;
        SharedPreferences writingPrefs = GboardAiWritingToolsSettings.preferences(context);
        SharedPreferences voicePrefs = GboardAdvancedVoiceSettings.preferences(context);
        SharedPreferences patchesPrefs = GboardPatchesSettings.preferences(context);

        if (writingPrefs != null) {
            if (!writingPrefs.getBoolean("pref_defaults_migrated_v4", false)) {
                writingPrefs.edit()
                        .putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ENABLED, true)
                        .putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ALL_KEYBOARDS, true)
                        .putBoolean("pref_defaults_migrated_v4", true)
                        .apply();
            }
        }
        if (voicePrefs != null) {
            if (!voicePrefs.getBoolean("pref_defaults_migrated_v4", false)) {
                voicePrefs.edit()
                        .putBoolean(GboardAdvancedVoiceSettings.PREF_KEY_ENABLED, true)
                        .putBoolean("pref_defaults_migrated_v4", true)
                        .apply();
            }
        }
        if (patchesPrefs != null) {
            GboardRoundedKeysSettings.ensureDefaults(context, patchesPrefs);
        }

        boolean aiWritingToolsEnabled = writingPrefs == null
                || GboardAiWritingToolsSettings.readEnabled(writingPrefs);
        boolean allKeyboardsEnabled = writingPrefs == null
                || GboardAiWritingToolsSettings.readAllKeyboardsEnabled(writingPrefs);
        boolean advancedVoiceEnabled = voicePrefs == null
                || GboardAdvancedVoiceSettings.readEnabled(voicePrefs);
        boolean roundedKeysEnabled = patchesPrefs == null
                || GboardRoundedKeysSettings.readEnabled(patchesPrefs);

        List<GboardPatchesSettingsContract.Row> rows =
                new ArrayList<GboardPatchesSettingsContract.Row>();

        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(context, R.string.gboard_patches_ai_writing_tools_enabled_title),
                GboardSettingsText.get(context, R.string.gboard_patches_ai_writing_tools_enabled_summary),
                true,
                aiWritingToolsEnabled,
                value -> {
                    if (writingPrefs != null) {
                        GboardAiWritingToolsSettings.writeEnabled(writingPrefs, value);
                        renderCurrentScreenSafely();
                    }
                }));

        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(context, R.string.gboard_patches_ai_writing_tools_all_keyboards_title),
                GboardSettingsText.get(context, R.string.gboard_patches_ai_writing_tools_all_keyboards_summary),
                aiWritingToolsEnabled,
                allKeyboardsEnabled,
                value -> {
                    if (writingPrefs != null) {
                        GboardAiWritingToolsSettings.writeAllKeyboardsEnabled(writingPrefs, value);
                    }
                }));

        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(context, R.string.gboard_patches_advanced_voice_enabled_title),
                GboardSettingsText.get(context, R.string.gboard_patches_advanced_voice_enabled_summary),
                true,
                advancedVoiceEnabled,
                value -> {
                    if (voicePrefs != null) {
                        GboardAdvancedVoiceSettings.writeEnabled(voicePrefs, value);
                    }
                }));

        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(context, R.string.gboard_patches_rounded_keys_enabled_title),
                GboardSettingsText.get(context, R.string.gboard_patches_rounded_keys_enabled_summary),
                true,
                roundedKeysEnabled,
                value -> {
                    if (patchesPrefs != null) {
                        GboardRoundedKeysSettings.writeEnabled(patchesPrefs, value);
                        GboardRoundedKeysSettings.applyToGboardPreferences(context, value);
                        renderCurrentScreenSafely();
                    }
                }));

        List<GboardPatchesSettingsContract.Section> sections =
                new ArrayList<GboardPatchesSettingsContract.Section>();
        sections.add(new GboardPatchesSettingsContract.Section(
                GboardSettingsText.get(context, R.string.gboard_patches_section_features),
                rows));

        if (com.akshaykadam.pixelboard.extension.writingtools.GboardAiWritingToolsDeviceSupport.isSupportedDevice()) {
            String backendType = writingPrefs != null
                    ? GboardAiWritingToolsSettings.readBackendType(writingPrefs)
                    : GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER;

            List<GboardPatchesSettingsContract.Row> backendRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();

            backendRows.add(new GboardPatchesSettingsContract.RadioRow(
                    "Google Cloud (Server)",
                    "Cloud-based processing for text generation, rewriting, and smart suggestions.",
                    aiWritingToolsEnabled,
                    GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER.equals(backendType),
                    () -> {
                        if (writingPrefs != null) {
                            GboardAiWritingToolsSettings.writeBackendType(writingPrefs,
                                    GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER);
                            renderCurrentScreenSafely();
                        }
                    },
                    createBackendIcon(GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER)));

            backendRows.add(new GboardPatchesSettingsContract.RadioRow(
                    "Private Inference (AICore)",
                    "Private on-device inference using Gemini Nano via Android AICore system service.",
                    aiWritingToolsEnabled,
                    GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE.equals(backendType),
                    () -> {
                        if (writingPrefs != null) {
                            GboardAiWritingToolsSettings.writeBackendType(writingPrefs,
                                    GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);
                            renderCurrentScreenSafely();
                        }
                    },
                    createBackendIcon(GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE)));

            backendRows.add(new GboardPatchesSettingsContract.RadioRow(
                    "Private Inference (Astrea)",
                    "Private on-device inference via Astrea isolated execution environment.",
                    aiWritingToolsEnabled,
                    GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA.equals(backendType),
                    () -> {
                        if (writingPrefs != null) {
                            GboardAiWritingToolsSettings.writeBackendType(writingPrefs,
                                    GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA);
                            renderCurrentScreenSafely();
                        }
                    },
                    createBackendIcon(GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA)));

            sections.add(new GboardPatchesSettingsContract.Section(
                    GboardSettingsText.get(context, R.string.gboard_patches_ai_writing_tools_backend_type_title),
                    backendRows));
        }

        return new GboardPatchesSettingsContract.Screen(
                GboardSettingsText.get(context, R.string.gboard_patches_activity_title),
                null,
                null,
                null,
                Collections.emptyList(),
                sections,
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT);
    }

    static GboardPatchesSettingsContract.Screen createRootScreen(
            GboardPatchesSettingsContract.FeatureHost host,
            List<? extends GboardPatchesSettingsContract.Feature> rootFeatures,
            String aboutAuthor,
            String patchVersion,
            Runnable authorAction,
            Runnable patchRepositoryAction) {
        List<GboardPatchesSettingsContract.Row> featureRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        Context context = host == null ? null : host.getContext();
        for (GboardPatchesSettingsContract.Feature feature : rootFeatures) {
            featureRows.add(new GboardPatchesSettingsContract.NavigationRow(
                    feature.getEntryTitle(),
                    feature.getEntrySummary(),
                    true,
                    () -> feature.openRootEntry(host)));
        }
        List<GboardPatchesSettingsContract.Row> preferenceRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        preferenceRows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(context, R.string.gboard_patches_language_title),
                GboardSettingsText.get(context, R.string.gboard_patches_language_summary),
                currentLanguageLabel(context),
                true,
                () -> showLanguageDialog(host)));
        List<GboardPatchesSettingsContract.Row> aboutRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        aboutRows.add(new GboardPatchesSettingsContract.CommandRow(
                GboardSettingsText.get(context, R.string.gboard_patches_about_author_title),
                aboutAuthor,
                true,
                authorAction));
        aboutRows.add(new GboardPatchesSettingsContract.CommandRow(
                GboardSettingsText.get(context,
                        R.string.gboard_patches_about_patch_version_title),
                patchVersion,
                true,
                patchRepositoryAction));
        return new GboardPatchesSettingsContract.Screen(
                GboardSettingsText.get(context, R.string.gboard_patches_activity_title),
                GboardSettingsText.get(context, R.string.gboard_patches_header_badge),
                GboardSettingsText.get(context, R.string.gboard_patches_header_title),
                GboardSettingsText.get(context, R.string.gboard_patches_header_summary),
                Collections.emptyList(),
                Arrays.asList(
                        new GboardPatchesSettingsContract.Section(
                                GboardSettingsText.get(context,
                                        R.string.gboard_patches_section_features),
                                featureRows),
                        new GboardPatchesSettingsContract.Section(
                                GboardSettingsText.get(context,
                                        R.string.gboard_patches_section_about),
                                aboutRows),
                        new GboardPatchesSettingsContract.Section(
                                GboardSettingsText.get(context,
                                        R.string.gboard_patches_section_preferences),
                                preferenceRows)));
    }

    private static void showLanguageDialog(GboardPatchesSettingsContract.FeatureHost host) {
        if (host == null) {
            return;
        }
        Context context = host.getContext();
        GboardPatchesSettingsContract.showChoiceDialog(host,
                GboardSettingsText.get(context, R.string.gboard_patches_language_title),
                new String[] {
                        GboardSettingsText.get(context,
                                R.string.gboard_patches_language_system_label),
                        GboardSettingsText.get(context,
                                R.string.gboard_patches_language_english_label)
                },
                new String[] {
                        GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                        GboardSettingsLocaleManager.LANGUAGE_ENGLISH
                },
                context == null
                        ? GboardSettingsLocaleManager.LANGUAGE_SYSTEM
                        : GboardSettingsLocaleManager.readLanguagePreference(
                                GboardPatchesSettings.preferences(context)),
                "",
                () -> {
                },
                value -> {
                    if (context == null) {
                        return;
                    }
                    GboardSettingsLocaleManager.writeLanguagePreference(context, value);
                    if (context instanceof Activity activity) {
                        activity.recreate();
                    } else {
                        GboardPatchesSettingsContract.refresh(host);
                    }
                });
    }

    private static String currentLanguageLabel(Context context) {
        SharedPreferences preferences = context == null
                ? null
                : GboardPatchesSettings.preferences(context);
        String preference = GboardSettingsLocaleManager.readLanguagePreference(preferences);
        if (GboardSettingsLocaleManager.LANGUAGE_ENGLISH.equals(preference)) {
            return GboardSettingsText.get(context,
                    R.string.gboard_patches_language_english_label);
        }
        return GboardSettingsText.format(context,
                R.string.gboard_patches_language_system_value,
                GboardSettingsText.get(context,
                        R.string.gboard_patches_language_english_label));
    }

    private GboardPatchesSettingsContract.Screen buildFeatureErrorScreen(
            GboardPatchesSettingsContract.Feature feature) {
        String toolbarTitle = feature != null
                ? feature.getEntryTitle()
                : TOOLBAR_TITLE_PATCHES;
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                text(R.string.gboard_patches_error_row_title),
                text(R.string.gboard_patches_error_row_summary),
                GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                toolbarTitle,
                text(R.string.gboard_patches_header_badge),
                text(R.string.gboard_patches_error_header_title),
                text(R.string.gboard_patches_error_header_summary),
                statusBlocks,
                Collections.emptyList());
    }

    private View createRowView(GboardPatchesSettingsContract.Row row) {
        View rowView = createRowContentView(row);
        GboardPatchesSettingsContract.PreviewSpec previewSpec = row.getPreviewSpec();
        if (previewSpec != null && rowView instanceof AccessibleRow accessibleRow) {
            accessibleRow.setPreviewAction(text(R.string.gboard_patches_preview_label),
                    () -> runSafely("show row preview", () -> showPreviewDialog(previewSpec)));
        }
        return rowView;
    }

    private View createRowContentView(GboardPatchesSettingsContract.Row row) {
        if (row instanceof GboardPatchesSettingsContract.ToggleRow toggleRow) {
            return createToggleRow(toggleRow);
        }
        if (row instanceof GboardPatchesSettingsContract.NavigationRow navigationRow) {
            return createNavigationRow(navigationRow);
        }
        if (row instanceof GboardPatchesSettingsContract.SelectorRow selectorRow) {
            return createSelectorRow(selectorRow);
        }
        if (row instanceof GboardPatchesSettingsContract.RadioRow radioRow) {
            return createRadioRow(radioRow);
        }
        if (row instanceof GboardPatchesSettingsContract.DetailRow detailRow) {
            return createDetailRow(detailRow);
        }
        if (row instanceof GboardPatchesSettingsContract.DangerRow dangerRow) {
            return createDangerRow(dangerRow);
        }
        if (row instanceof GboardPatchesSettingsContract.CommandRow commandRow) {
            return createCommandRow(commandRow);
        }
        if (row instanceof GboardPatchesSettingsContract.SwitchRow switchRow) {
            return createToggleRow(new GboardPatchesSettingsContract.ToggleRow(
                    switchRow.getTitle(),
                    switchRow.getSummary(),
                    switchRow.isEnabled(),
                    switchRow.isChecked(),
                    switchRow.getToggleAction(),
                    switchRow.getPreviewSpec()));
        }
        if (row instanceof GboardPatchesSettingsContract.ActionRow actionRow) {
            if (actionRow.shouldShowChevron()) {
                return createNavigationRow(new GboardPatchesSettingsContract.NavigationRow(
                        actionRow.getTitle(),
                        actionRow.getSummary(),
                        null,
                        actionRow.isEnabled(),
                        actionRow.getAction(),
                        actionRow.getPreviewSpec()));
            }
            return createCommandRow(new GboardPatchesSettingsContract.CommandRow(
                    actionRow.getTitle(),
                    actionRow.getSummary(),
                    actionRow.isEnabled(),
                    actionRow.getAction(),
                    actionRow.getPreviewSpec()));
        }
        if (row instanceof GboardPatchesSettingsContract.InfoRow infoRow) {
            return createDetailRow(new GboardPatchesSettingsContract.DetailRow(
                    infoRow.getTitle(),
                    infoRow.getSummary(),
                    infoRow.isEnabled(),
                    isLikelyMonospace(infoRow.getSummary())));
        }
        throw new IllegalArgumentException("Unsupported row type: " + row.getClass().getName());
    }

    private View createToggleRow(GboardPatchesSettingsContract.ToggleRow rowModel) {
        AccessibleRow row = buildBaseRow();
        LinearLayout textColumn = buildRowTextColumn(true);
        TextView titleView = buildRowTitle(rowModel.getTitle());
        TextView summaryView = buildRowSummary(rowModel.getSummary(), false);
        if (rowModel.getBadge() != null && !rowModel.getBadge().isEmpty()) {
            LinearLayout titleContainer = new LinearLayout(this);
            titleContainer.setOrientation(LinearLayout.HORIZONTAL);
            titleContainer.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                titleContainer.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            }
            titleContainer.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            titleView.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            titleContainer.addView(titleView);

            TextView badgeView = buildBetaBadge(rowModel.getBadge());
            LinearLayout.LayoutParams badgeParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            badgeParams.leftMargin = dp(8);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                badgeParams.setMarginStart(dp(8));
            }
            titleContainer.addView(badgeView, badgeParams);

            textColumn.addView(titleContainer);
        } else {
            textColumn.addView(titleView);
        }
        textColumn.addView(summaryView);
        LinearLayout toggleSupportLine = buildToggleSupportLine(rowModel);
        if (toggleSupportLine != null) {
            textColumn.addView(toggleSupportLine);
        }

        Switch switchView = new Switch(this);
        switchView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        switchView.setShowText(false);
        applySwitchTint(switchView);
        switchView.setChecked(rowModel.isChecked());
        switchView.setOnCheckedChangeListener((buttonView, isChecked) -> {
            try {
                backgroundStateExecutor.execute(() -> {
                    try {
                        rowModel.getToggleAction().accept(isChecked);
                    } catch (Throwable throwable) {
                        Log.w(TAG, "Failed to toggle switch row", throwable);
                    }
                    postToDecorView(this::renderCurrentScreenSafely);
                });
            } catch (RejectedExecutionException ignored) {
                // Activity is already tearing down.
            }
        });

        row.addView(textColumn);
        row.addView(switchView);
        row.describeAs(switchView, Switch.class);
        bindSwitchRowState(row, titleView, summaryView, toggleSupportLine, switchView,
                rowModel.isEnabled());
        row.setOnClickListener(view -> {
            if (row.isEnabled()) {
                runSafely("toggle switch row", switchView::toggle);
            }
        });
        return row;
    }

    private View createNavigationRow(GboardPatchesSettingsContract.NavigationRow rowModel) {
        LinearLayout row = buildBaseRow();
        View orbIcon = createRowOrbIconView(rowModel.getTitle());
        if (orbIcon != null) {
            row.addView(orbIcon);
        }
        LinearLayout textColumn = buildRowTextColumn(true);
        TextView titleView = buildRowTitle(rowModel.getTitle());
        TextView summaryView = buildRowSummary(rowModel.getSummary(), false);
        textColumn.addView(titleView);
        textColumn.addView(summaryView);
        row.addView(textColumn);
        if (rowModel.getTrailingText() != null && !rowModel.getTrailingText().isEmpty()) {
            row.addView(buildTrailingValue(rowModel.getTrailingText()), trailingLayoutParams(dp(10)));
        }
        View previewButton = buildPreviewButton(rowModel);
        if (previewButton != null) {
            row.addView(previewButton, trailingLayoutParams(dp(10)));
        }
        TextView chevronView = null;
        if (rowModel.shouldShowChevron()) {
            chevronView = buildChevronView();
            row.addView(chevronView);
        }
        bindActionRowState(row, titleView, summaryView, chevronView, rowModel.isEnabled());
        row.setOnClickListener(view -> {
            if (row.isEnabled()) {
                runSafely("handle navigation row", rowModel.getAction());
            }
        });
        return row;
    }

    private View createSelectorRow(GboardPatchesSettingsContract.SelectorRow rowModel) {
        LinearLayout row = buildBaseRow();
        LinearLayout textColumn = buildRowTextColumn(true);
        TextView titleView = buildRowTitle(rowModel.getTitle());
        TextView summaryView = buildRowSummary(rowModel.getSummary(), false);
        textColumn.addView(titleView);
        textColumn.addView(summaryView);
        LinearLayout selectorSupportLine = buildSelectorSupportLine(rowModel);
        if (selectorSupportLine != null) {
            textColumn.addView(selectorSupportLine);
        }
        row.addView(textColumn);
        TextView chevronView = buildChevronView();
        row.addView(chevronView);
        bindSelectorRowState(row, titleView, summaryView, selectorSupportLine, chevronView,
                rowModel.isEnabled());
        row.setOnClickListener(view -> {
            if (row.isEnabled()) {
                runSafely("handle selector row", rowModel.getAction());
            }
        });
        return row;
    }

    private View createRadioRow(GboardPatchesSettingsContract.RadioRow rowModel) {
        AccessibleRow row = buildBaseRow();

        if (rowModel.getIconDrawable() != null) {
            ImageView iconView = new ImageView(this);
            iconView.setImageDrawable(rowModel.getIconDrawable());
            iconView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            iconView.setClipToOutline(true);
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(42), dp(42));
            iconParams.rightMargin = dp(16);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                iconParams.setMarginEnd(dp(16));
            }
            iconParams.gravity = Gravity.CENTER_VERTICAL;
            row.addView(iconView, iconParams);
        }

        LinearLayout textColumn = buildRowTextColumn(true);
        TextView titleView = buildRowTitle(rowModel.getTitle());
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        TextView summaryView = buildRowSummary(rowModel.getSummary(), false);
        textColumn.addView(titleView);
        textColumn.addView(summaryView);
        row.addView(textColumn);

        TextView chevronView = buildChevronView();
        LinearLayout.LayoutParams chevronParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        chevronParams.gravity = Gravity.CENTER_VERTICAL;
        chevronParams.rightMargin = dp(12);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            chevronParams.setMarginEnd(dp(12));
        }
        row.addView(chevronView, chevronParams);

        View verticalDivider = new View(this);
        verticalDivider.setBackgroundColor(blendAlpha(palette.textSecondary, 0.25f));
        LinearLayout.LayoutParams vDivParams = new LinearLayout.LayoutParams(dp(1), dp(28));
        vDivParams.gravity = Gravity.CENTER_VERTICAL;
        vDivParams.rightMargin = dp(16);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            vDivParams.setMarginEnd(dp(16));
        }
        row.addView(verticalDivider, vDivParams);

        RadioButton radioButton = new RadioButton(this);
        radioButton.setClickable(false);
        radioButton.setFocusable(false);
        ColorStateList radioTint = new ColorStateList(
                new int[][] {
                        new int[] { android.R.attr.state_checked },
                        new int[] { -android.R.attr.state_checked }
                },
                new int[] {
                        palette.accent,
                        blendAlpha(palette.textSecondary, 0.5f)
                });
        radioButton.setButtonTintList(radioTint);
        radioButton.setChecked(rowModel.isChecked());
        LinearLayout.LayoutParams radioParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        radioParams.gravity = Gravity.CENTER_VERTICAL;
        row.addView(radioButton, radioParams);
        row.describeAs(radioButton, RadioButton.class);

        row.setEnabled(rowModel.isEnabled());
        row.setClickable(rowModel.isEnabled());
        titleView.setTextColor(rowModel.isEnabled() ? palette.textPrimary : palette.textDisabled);
        summaryView.setTextColor(rowModel.isEnabled() ? palette.textSecondary : palette.textDisabled);
        chevronView.setAlpha(rowModel.isEnabled() ? 1f : 0.4f);
        verticalDivider.setAlpha(rowModel.isEnabled() ? 1f : 0.4f);
        radioButton.setEnabled(rowModel.isEnabled());
        row.setAlpha(rowModel.isEnabled() ? 1f : 0.6f);

        row.setOnClickListener(view -> {
            if (row.isEnabled() && rowModel.getSelectAction() != null) {
                runSafely("select radio row", rowModel.getSelectAction());
            }
        });

        return row;
    }

    private Drawable createBackendIcon(String backendType) {
        return new Drawable() {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

            @Override
            public void draw(Canvas canvas) {
                Rect bounds = getBounds();
                int width = bounds.width() > 0 ? bounds.width() : dp(24);
                int height = bounds.height() > 0 ? bounds.height() : dp(24);

                canvas.save();
                canvas.translate(bounds.left, bounds.top);
                float scale = Math.min(width, height) / 24f;
                canvas.scale(scale, scale);

                paint.setColor(palette.textPrimary);
                paint.setStyle(Paint.Style.FILL);

                if (GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER.equals(backendType)) {
                    RectF baseRect = new RectF(4.5f, 13f, 19.5f, 18.5f);
                    canvas.drawRoundRect(baseRect, 2.75f, 2.75f, paint);
                    canvas.drawCircle(8.5f, 13.5f, 4f, paint);
                    canvas.drawCircle(13.5f, 10.5f, 5.5f, paint);
                    canvas.drawCircle(17.5f, 14.5f, 3.5f, paint);
                } else if (GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE.equals(backendType)) {
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(1.8f);
                    RectF chip = new RectF(6.5f, 6.5f, 17.5f, 17.5f);
                    canvas.drawRoundRect(chip, 2.5f, 2.5f, paint);
                    paint.setStyle(Paint.Style.FILL);
                    RectF core = new RectF(9.5f, 9.5f, 14.5f, 14.5f);
                    canvas.drawRoundRect(core, 1.5f, 1.5f, paint);
                    paint.setStrokeWidth(1.6f);
                    canvas.drawLine(10f, 3f, 10f, 6.5f, paint);
                    canvas.drawLine(14f, 3f, 14f, 6.5f, paint);
                    canvas.drawLine(10f, 17.5f, 10f, 21f, paint);
                    canvas.drawLine(14f, 17.5f, 14f, 21f, paint);
                    canvas.drawLine(3f, 10f, 6.5f, 10f, paint);
                    canvas.drawLine(3f, 14f, 6.5f, 14f, paint);
                    canvas.drawLine(17.5f, 10f, 21f, 10f, paint);
                    canvas.drawLine(17.5f, 14f, 21f, 14f, paint);
                } else {
                    Path shieldPath = new Path();
                    shieldPath.moveTo(12f, 3.5f);
                    shieldPath.lineTo(19f, 6.2f);
                    shieldPath.quadTo(19.2f, 13.5f, 12f, 20.5f);
                    shieldPath.quadTo(4.8f, 13.5f, 5f, 6.2f);
                    shieldPath.close();
                    canvas.drawPath(shieldPath, paint);

                    paint.setColor(palette.surfaceAlt);
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(1.8f);
                    paint.setStrokeCap(Paint.Cap.ROUND);
                    paint.setStrokeJoin(Paint.Join.ROUND);
                    Path check = new Path();
                    check.moveTo(9f, 11.5f);
                    check.lineTo(11f, 13.8f);
                    check.lineTo(15.5f, 9.2f);
                    canvas.drawPath(check, paint);
                }

                canvas.restore();
            }

            @Override
            public void setAlpha(int alpha) {
                paint.setAlpha(alpha);
            }

            @Override
            public void setColorFilter(ColorFilter colorFilter) {
                paint.setColorFilter(colorFilter);
            }

            @Override
            public int getOpacity() {
                return PixelFormat.TRANSLUCENT;
            }

            @Override
            public int getIntrinsicWidth() {
                return dp(24);
            }

            @Override
            public int getIntrinsicHeight() {
                return dp(24);
            }
        };
    }

    private View createDetailRow(GboardPatchesSettingsContract.DetailRow rowModel) {
        TextView titleView = buildRowTitle(rowModel.getTitle());
        TextView summaryView = buildRowSummary(rowModel.getSummary(), rowModel.isMonospace());
        titleView.setTextColor(palette.textPrimary);
        summaryView.setTextColor(palette.textSecondary);

        View orbIcon = createRowOrbIconView(rowModel.getTitle());
        if (orbIcon != null) {
            LinearLayout row = buildBaseRow();
            row.setClickable(false);
            row.setBackground(null);
            row.addView(orbIcon);
            LinearLayout textColumn = buildRowTextColumn(false);
            textColumn.addView(titleView);
            textColumn.addView(summaryView);
            row.addView(textColumn);
            row.setAlpha(1f);
            return row;
        }

        LinearLayout row = buildDetailRowContainer();
        row.addView(titleView);
        row.addView(summaryView);
        row.setAlpha(rowModel.isEnabled() ? 1f : 0.96f);
        return row;
    }

    private View createCommandRow(GboardPatchesSettingsContract.CommandRow rowModel) {
        LinearLayout row = buildBaseRow();
        View orbIcon = createRowOrbIconView(rowModel.getTitle());
        if (orbIcon != null) {
            row.addView(orbIcon);
        }
        LinearLayout textColumn = buildRowTextColumn(true);
        TextView titleView = buildRowTitle(rowModel.getTitle());
        TextView summaryView = buildRowSummary(rowModel.getSummary(), false);
        textColumn.addView(titleView);
        textColumn.addView(summaryView);
        row.addView(textColumn);
        View previewButton = buildPreviewButton(rowModel);
        if (previewButton != null) {
            row.addView(previewButton, trailingLayoutParams(dp(10)));
        }
        bindActionRowState(row, titleView, summaryView, null, rowModel.isEnabled());
        row.setOnClickListener(view -> {
            if (row.isEnabled()) {
                runSafely("handle command row", rowModel.getAction());
            }
        });
        return row;
    }

    private View createDangerRow(GboardPatchesSettingsContract.DangerRow rowModel) {
        View row = createCommandRow(rowModel);
        row.setOnClickListener(view -> {
            if (row.isEnabled()) {
                showConfirmDialog(
                        rowModel.getConfirmTitle(),
                        rowModel.getConfirmMessage(),
                        rowModel.getAction());
            }
        });
        return row;
    }

    private View createStatusBlockView(GboardPatchesSettingsContract.StatusBlock block) {
        return createStatusBlockView(block, Collections.emptyList());
    }

    private View createStatusBlockView(
            GboardPatchesSettingsContract.StatusBlock block,
            List<GboardPatchesSettingsContract.Section> screenSections) {
        final GboardM3Helper.Palette m3Pal =
                m3Palette != null ? m3Palette : GboardM3Helper.Palette.forContext(this);
        final boolean liquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(this);

        if ("Gboard Pro".equals(block.getTitle()) || "About Gboard Pro".equals(block.getTitle())) {
            LinearLayout wrapper = new LinearLayout(this);
            wrapper.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams wrapperLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            wrapperLp.setMargins(dp(16), dp(8), dp(16), dp(14));
            wrapper.setLayoutParams(wrapperLp);
            wrapper.setClipChildren(false);
            wrapper.setClipToPadding(false);

            LinearLayout card = new LinearLayout(this);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setGravity(Gravity.CENTER_HORIZONTAL);
            card.setPadding(dp(22), dp(26), dp(22), dp(24));
            card.setBackground(liquidGlass
                    ? GboardM3Helper.createLiquidGlassCardDrawable(this, m3Pal, 26, true)
                    : buildCardDrawable(palette.surface, palette.surfaceStroke, dp(18)));
            card.setElevation(0f);

            ImageView heroIcon = new ImageView(this);
            heroIcon.setImageDrawable(loadMipmapDrawable("ic_app"));
            heroIcon.setScaleType(ImageView.ScaleType.FIT_CENTER);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                heroIcon.setOutlineProvider(new android.view.ViewOutlineProvider() {
                    @Override
                    public void getOutline(View view, android.graphics.Outline outline) {
                        outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), dpF(19f));
                    }
                });
                heroIcon.setClipToOutline(true);
            }
            LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(dp(74), dp(74));
            iconLp.bottomMargin = dp(14);
            card.addView(heroIcon, iconLp);

            TextView titleView = new TextView(this);
            titleView.setText("Gboard Pro");
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24f);
            titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            titleView.setTextColor(palette.textPrimary);
            titleView.setGravity(Gravity.CENTER);
            card.addView(titleView);

            TextView versionText = new TextView(this);
            versionText.setText("v" + BuildConfig.PATCH_VERSION);
            versionText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            versionText.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            versionText.setTextColor(m3Pal.isNight ? palette.textSecondary : 0xFF6D758F);
            versionText.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams verLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            verLp.topMargin = dp(4);
            verLp.bottomMargin = dp(12);
            card.addView(versionText, verLp);

            TextView summaryView = new TextView(this);
            summaryView.setText(block.getSummary());
            summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            summaryView.setLineSpacing(dp(2), 1.18f);
            summaryView.setTextColor(palette.textSecondary);
            summaryView.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams sumLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            card.addView(summaryView, sumLp);

            // Show "[ ↻ Check for Updates ]" 3D Liquid Glass pill or Material 3 Filled Button on About & Updates
            final GboardPatchesSettingsContract.Row primaryHeroActionRow = findFirstActionRow(screenSections);
            final int ctaInk;
            if (liquidGlass) {
                ctaInk = (m3Pal.isAmoled || m3Pal.isNight) ? m3Pal.accent : 0xFF2336F5;
            } else {
                float accLum = (0.299f * Color.red(palette.accent)
                        + 0.587f * Color.green(palette.accent)
                        + 0.114f * Color.blue(palette.accent)) / 255f;
                ctaInk = accLum > 0.58f ? 0xFF121318 : Color.WHITE;
            }
            String ctaLabel = primaryHeroActionRow != null
                    ? primaryHeroActionRow.getTitle().toString()
                    : "Check for Updates";
            boolean enabled = primaryHeroActionRow == null || primaryHeroActionRow.isEnabled();

            LinearLayout ctaPill = new LinearLayout(this);
            ctaPill.setOrientation(LinearLayout.HORIZONTAL);
            ctaPill.setGravity(Gravity.CENTER);
            ctaPill.setBackground(liquidGlass
                    ? GboardM3Helper.createLiquidGlassPillButtonDrawable(this, m3Pal)
                    : GboardM3Helper.createClickableCardDrawable(palette.accent, Color.TRANSPARENT, palette.pressedOverlay, dp(999)));
            ctaPill.setElevation(0f);
            ctaPill.setPadding(dp(26), dp(12), dp(28), dp(12));
            ctaPill.setMinimumHeight(dp(50));
            ctaPill.setEnabled(enabled);
            ctaPill.setClickable(enabled);
            ctaPill.setFocusable(enabled);
            ctaPill.setAlpha(enabled ? 1f : 0.65f);

            View refreshGlyph = new View(this) {
                private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
                private final Path path = new Path();
                private final RectF oval = new RectF();
                @Override
                protected void onDraw(Canvas canvas) {
                    super.onDraw(canvas);
                    float cx = getWidth() / 2f;
                    float cy = getHeight() / 2f;
                    float u = dpF(1f);
                    p.setColor(ctaInk);
                    p.setStyle(Paint.Style.STROKE);
                    p.setStrokeCap(Paint.Cap.ROUND);
                    p.setStrokeJoin(Paint.Join.ROUND);
                    p.setStrokeWidth(2.0f * u);
                    float r = 6.2f * u;
                    oval.set(cx - r, cy - r, cx + r, cy + r);
                    canvas.drawArc(oval, -20f, 305f, false, p);
                    // Clockwise top-right arrowhead
                    path.reset();
                    path.moveTo(cx + 2.4f * u, cy - 6.6f * u);
                    path.lineTo(cx + 6.2f * u, cy - 5.6f * u);
                    path.lineTo(cx + 5.2f * u, cy - 1.8f * u);
                    canvas.drawPath(path, p);
                }
            };
            LinearLayout.LayoutParams glyphLp = new LinearLayout.LayoutParams(dp(20), dp(20));
            glyphLp.rightMargin = dp(9);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                glyphLp.setMarginEnd(dp(9));
            }
            ctaPill.addView(refreshGlyph, glyphLp);

            TextView ctaButton = new TextView(this);
            ctaButton.setText(ctaLabel);
            ctaButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            ctaButton.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            ctaButton.setTextColor(ctaInk);
            ctaButton.setSingleLine(true);
            ctaPill.addView(ctaButton);

            ctaPill.setOnClickListener(v -> {
                if (!v.isEnabled()) return;
                if (primaryHeroActionRow != null) {
                    Runnable action = extractRowAction(primaryHeroActionRow);
                    if (action != null) {
                        runSafely("handle hero action", action);
                    }
                } else {
                    runSafely("open updates from about hero", () ->
                            openFeature(new com.akshaykadam.pixelboard.extension.updater.PixelBoardUpdateFeature(this)));
                }
            });
            LinearLayout.LayoutParams ctaLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, dp(50));
            ctaLp.topMargin = dp(18);
            ctaLp.gravity = Gravity.CENTER_HORIZONTAL;
            card.addView(ctaPill, ctaLp);

            wrapper.addView(card);
            return wrapper;
        }

        LinearLayout wrapper = new LinearLayout(this);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams wrapperLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        wrapperLp.setMargins(dp(16), dp(6), dp(16), dp(12));
        wrapper.setLayoutParams(wrapperLp);
        wrapper.setClipChildren(false);
        wrapper.setClipToPadding(false);

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(18), dp(16), dp(18), dp(16));
        card.setBackground(liquidGlass
                ? GboardM3Helper.createLiquidGlassCardDrawable(this, m3Pal, 24, false)
                : buildCardDrawable(toneBackground(block.getTone()), palette.surfaceStroke, dp(16)));
        card.setElevation(0f);

        TextView titleView = new TextView(this);
        titleView.setText(block.getTitle());
        titleView.setTextColor(block.getTone() == GboardPatchesSettingsContract.StatusTone.WARNING
                ? 0xFFD97706 : palette.accent);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        if (block.getTone() == GboardPatchesSettingsContract.StatusTone.WARNING) {
            titleView.setContentDescription(
                    text(R.string.gboard_patches_warning_label) + ": " + block.getTitle());
        }
        card.addView(titleView);

        TextView summaryView = buildRowSummary(block.getSummary(), false);
        summaryView.setPadding(0, dp(4), 0, 0);
        card.addView(summaryView);

        wrapper.addView(card);
        return wrapper;
    }

    private GboardPatchesSettingsContract.Row findFirstActionRow(
            List<GboardPatchesSettingsContract.Section> sections) {
        if (sections == null) {
            return null;
        }
        for (GboardPatchesSettingsContract.Section sec : sections) {
            if ("ACTIONS".equalsIgnoreCase(sec.getTitle())
                    && sec.getItems() != null
                    && !sec.getItems().isEmpty()) {
                return sec.getItems().get(0);
            }
        }
        return null;
    }

    private Runnable extractRowAction(GboardPatchesSettingsContract.Row row) {
        if (row instanceof GboardPatchesSettingsContract.NavigationRow nav) {
            return nav.getAction();
        }
        if (row instanceof GboardPatchesSettingsContract.CommandRow cmd) {
            return cmd.getAction();
        }
        return null;
    }

    private Drawable loadMipmapDrawable(String resName) {
        try {
            int id = getResources().getIdentifier(resName, "mipmap", getPackageName());
            if (id != 0) {
                return getDrawable(id);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private View createSectionView(GboardPatchesSettingsContract.Section section) {
        final GboardM3Helper.Palette m3Pal =
                m3Palette != null ? m3Palette : GboardM3Helper.Palette.forContext(this);
        final boolean liquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(this);
        LinearLayout container = buildSectionContainer(
                section.getStyle() == GboardPatchesSettingsContract.SectionStyle.ADVANCED);
        container.setClipChildren(false);
        container.setClipToPadding(false);
        String sectionTitle = section.getTitle();
        String sectionDesc = section.getDescription();
        boolean isActionsSection = "ACTIONS".equalsIgnoreCase(sectionTitle);
        boolean isHighlightsSection = sectionTitle != null && sectionTitle.startsWith("Gboard Pro v");

        if (isActionsSection) {
            container.addView(buildActionsHeaderView(sectionTitle, m3Pal));
        } else if (isHighlightsSection) {
            container.addView(buildHighlightsHeaderView(sectionTitle, sectionDesc, m3Pal));
        } else {
            if (sectionTitle != null && !sectionTitle.isEmpty()) {
                container.addView(buildSectionTitle(sectionTitle));
            }
            if (sectionDesc != null && !sectionDesc.isEmpty()) {
                container.addView(buildSectionSummary(sectionDesc, false));
            }
        }

        List<GboardPatchesSettingsContract.Row> items = section.getItems();
        if (items != null && !items.isEmpty()) {
            if (isActionsSection) {
                for (GboardPatchesSettingsContract.Row item : items) {
                    LinearLayout actionCard = new LinearLayout(this);
                    actionCard.setOrientation(LinearLayout.VERTICAL);
                    actionCard.setBackground(liquidGlass
                            ? GboardM3Helper.createLiquidGlassCardDrawable(this, m3Pal, 22, false)
                            : buildCardDrawable(palette.surface, palette.surfaceStroke, dp(16)));
                    actionCard.setElevation(0f);
                    if (!liquidGlass && Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        actionCard.setClipToOutline(true);
                    } else {
                        actionCard.setClipChildren(false);
                        actionCard.setClipToPadding(false);
                    }
                    LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT);
                    cardParams.setMargins(dp(16), dp(4), dp(16), dp(8));
                    actionCard.setLayoutParams(cardParams);
                    View rowView = createRowView(item);
                    trackAccessibilityFocus(rowView, item.getTitle());
                    actionCard.addView(rowView);
                    container.addView(actionCard);
                }
            } else {
                LinearLayout card = new LinearLayout(this);
                card.setOrientation(LinearLayout.VERTICAL);
                card.setGravity(Gravity.START);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                    card.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
                }
                card.setBackground(liquidGlass
                        ? GboardM3Helper.createLiquidGlassCardDrawable(this, m3Pal, 24, false)
                        : buildCardDrawable(palette.surface, palette.surfaceStroke, dp(16)));
                card.setElevation(0f);
                if (!liquidGlass && Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    card.setClipToOutline(true);
                } else {
                    card.setClipChildren(false);
                    card.setClipToPadding(false);
                }
                LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                cardParams.leftMargin = dp(16);
                cardParams.rightMargin = dp(16);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                    cardParams.setMarginStart(dp(16));
                    cardParams.setMarginEnd(dp(16));
                }
                cardParams.topMargin = dp(6);
                cardParams.bottomMargin = dp(14);
                card.setLayoutParams(cardParams);

                int dividerColor = GboardM3Helper.blendAlpha(palette.textSecondary, 0.14f);
                boolean first = true;
                for (GboardPatchesSettingsContract.Row item : items) {
                    if (!first) {
                        View divider = new View(this);
                        divider.setBackgroundColor(dividerColor);
                        LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT,
                                dp(1));
                        dividerParams.leftMargin = dp(16);
                        dividerParams.rightMargin = dp(16);
                        card.addView(divider, dividerParams);
                    }
                    View rowView = createRowView(item);
                    trackAccessibilityFocus(rowView, item.getTitle());
                    card.addView(rowView);
                    first = false;
                }
                container.addView(card);
            }
        }
        return container;
    }

    private Drawable createGboardProHeroEmblemDrawable(final GboardM3Helper.Palette m3Pal) {
        return new Drawable() {
            private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final RectF r = new RectF();
            private final Path path = new Path();

            @Override
            public void draw(Canvas canvas) {
                Rect b = getBounds();
                if (b.width() <= 0 || b.height() <= 0) return;
                float u = Math.min(b.width(), b.height()) / 76f;
                float cx = b.exactCenterX();
                float cy = b.exactCenterY();
                canvas.save();
                canvas.translate(cx - 38f * u, cy - 38f * u);

                // Outer frosted glass frame matching About.png & Gboard Pro Updates.png
                p.setStyle(Paint.Style.FILL);
                p.setColor(m3Pal.isNight ? 0x33000000 : 0x1A182240);
                r.set(3f * u, 5f * u, 73f * u, 75f * u);
                canvas.drawRoundRect(r, 20f * u, 20f * u, p);

                p.setShader(new LinearGradient(
                        4f * u, 4f * u, 72f * u, 72f * u,
                        m3Pal.isNight
                                ? new int[]{0xFF1F253A, 0xFF141828}
                                : new int[]{0xFFF4F5FC, 0xFFE3E6F4},
                        null, Shader.TileMode.CLAMP));
                r.set(4f * u, 4f * u, 72f * u, 72f * u);
                canvas.drawRoundRect(r, 20f * u, 20f * u, p);
                p.setShader(null);

                p.setStyle(Paint.Style.STROKE);
                p.setStrokeWidth(1.4f * u);
                p.setColor(m3Pal.isNight ? 0x44A8C7FA : 0xFAFFFFFF);
                canvas.drawRoundRect(r, 20f * u, 20f * u, p);

                // Dark slate-blue keyboard base inside bottom-right of badge
                p.setStyle(Paint.Style.FILL);
                p.setShader(new LinearGradient(
                        16f * u, 24f * u, 68f * u, 68f * u,
                        0xFF3E4F78, 0xFF283452, Shader.TileMode.CLAMP));
                r.set(16f * u, 24f * u, 68f * u, 68f * u);
                canvas.drawRoundRect(r, 14f * u, 14f * u, p);
                p.setShader(null);

                // Keyboard mini keys inside dark slate base (2 rows + spacebar)
                p.setColor(0xD8E8EEF8);
                float kSize = 5.2f * u;
                for (int col = 0; col < 4; col++) {
                    float kx = (24f + col * 9.5f) * u;
                    r.set(kx, 46f * u, kx + kSize, 46f * u + kSize);
                    canvas.drawRoundRect(r, 1.8f * u, 1.8f * u, p);
                }
                for (int col = 0; col < 2; col++) {
                    float kx = (24f + col * 9.5f) * u;
                    r.set(kx, 55.5f * u, kx + kSize, 55.5f * u + kSize);
                    canvas.drawRoundRect(r, 1.8f * u, 1.8f * u, p);
                }
                r.set(43f * u, 55.5f * u, 59f * u, 55.5f * u + kSize);
                canvas.drawRoundRect(r, 2.2f * u, 2.2f * u, p);

                // Overlapping glossy white top-left G speech-tile casting soft shadow
                p.setColor(0x30101628);
                r.set(10f * u, 12f * u, 46f * u, 48f * u);
                canvas.drawRoundRect(r, 10f * u, 10f * u, p);

                p.setShader(new LinearGradient(
                        9f * u, 9f * u, 45f * u, 45f * u,
                        0xFFFFFFFF, 0xFFF1F4FE, Shader.TileMode.CLAMP));
                r.set(9f * u, 9f * u, 45f * u, 45f * u);
                canvas.drawRoundRect(r, 10f * u, 10f * u, p);
                p.setShader(null);

                // Sky-royal blue 'G' emblem inside the white tile
                float gcx = 27f * u;
                float gcy = 27f * u;
                float gr = 9.2f * u;
                p.setStyle(Paint.Style.STROKE);
                p.setStrokeWidth(3.6f * u);
                p.setStrokeCap(Paint.Cap.BUTT);
                p.setColor(0xFF4285F4);
                r.set(gcx - gr, gcy - gr, gcx + gr, gcy + gr);
                canvas.drawArc(r, 42f, 275f, false, p);
                p.setStrokeCap(Paint.Cap.ROUND);
                canvas.drawLine(gcx, gcy + 0.4f * u, gcx + gr * 0.96f, gcy + 0.4f * u, p);
                // Vertical cap down on right bar of 'G'
                p.setStyle(Paint.Style.FILL);
                r.set(gcx + gr * 0.62f, gcy - 1.4f * u, gcx + gr * 1.15f, gcy + gr * 0.62f);
                canvas.drawRect(r, p);

                canvas.restore();
            }

            @Override public void setAlpha(int alpha) { p.setAlpha(alpha); }
            @Override public void setColorFilter(ColorFilter colorFilter) { p.setColorFilter(colorFilter); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        };
    }

    private View buildActionsHeaderView(String title, final GboardM3Helper.Palette m3Pal) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(22), dp(14), dp(20), dp(8));

        View bolt = new View(this) {
            private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final Path path = new Path();
            @Override
            protected void onDraw(Canvas canvas) {
                super.onDraw(canvas);
                float w = getWidth();
                float h = getHeight();
                p.setStyle(Paint.Style.FILL);
                p.setColor(m3Pal.isAmoled || m3Pal.isNight ? m3Pal.accent : 0xFF2E90FA);
                path.reset();
                path.moveTo(w * 0.56f, h * 0.08f);
                path.lineTo(w * 0.18f, h * 0.54f);
                path.lineTo(w * 0.48f, h * 0.54f);
                path.lineTo(w * 0.42f, h * 0.92f);
                path.lineTo(w * 0.82f, h * 0.44f);
                path.lineTo(w * 0.52f, h * 0.44f);
                path.close();
                canvas.drawPath(path, p);
            }
        };
        LinearLayout.LayoutParams boltLp = new LinearLayout.LayoutParams(dp(16), dp(16));
        boltLp.rightMargin = dp(8);
        row.addView(bolt, boltLp);

        TextView label = new TextView(this);
        label.setText(title);
        label.setTextColor(palette.textPrimary);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        label.setLetterSpacing(0.08f);
        label.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        row.addView(label);
        return row;
    }

    private View buildHighlightsHeaderView(
            String title, String subtitle, final GboardM3Helper.Palette m3Pal) {
        LinearLayout wrapper = new LinearLayout(this);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        wrapper.setPadding(dp(22), dp(16), dp(20), dp(8));

        LinearLayout topRow = new LinearLayout(this);
        topRow.setOrientation(LinearLayout.HORIZONTAL);
        topRow.setGravity(Gravity.CENTER_VERTICAL);

        View infoBadge = new View(this) {
            private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            @Override
            protected void onDraw(Canvas canvas) {
                super.onDraw(canvas);
                float cx = getWidth() / 2f;
                float cy = getHeight() / 2f;
                float r = Math.min(cx, cy) - dpF(1f);
                p.setStyle(Paint.Style.FILL);
                p.setColor(m3Pal.isAmoled || m3Pal.isNight ? m3Pal.accent : 0xFF2E90FA);
                canvas.drawCircle(cx, cy, r, p);
                p.setColor(m3Pal.isAmoled || m3Pal.isNight ? 0xFF000000 : 0xFFFFFFFF);
                p.setStyle(Paint.Style.STROKE);
                p.setStrokeCap(Paint.Cap.ROUND);
                p.setStrokeWidth(dpF(2.1f));
                canvas.drawLine(cx, cy - dpF(0.6f), cx, cy + dpF(4.6f), p);
                p.setStyle(Paint.Style.FILL);
                canvas.drawCircle(cx, cy - dpF(4.4f), dpF(1.2f), p);
            }
        };
        LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(dp(24), dp(24));
        badgeLp.rightMargin = dp(10);
        topRow.addView(infoBadge, badgeLp);

        TextView titleView = new TextView(this);
        titleView.setText(title);
        titleView.setTextColor(palette.textPrimary);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        topRow.addView(titleView);
        wrapper.addView(topRow);

        if (!TextUtils.isEmpty(subtitle)) {
            TextView subView = new TextView(this);
            subView.setText(subtitle);
            subView.setTextColor(palette.textSecondary);
            subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            LinearLayout.LayoutParams subLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            subLp.topMargin = dp(4);
            wrapper.addView(subView, subLp);
        }
        return wrapper;
    }

    private View createRowOrbIconView(CharSequence title) {
        if (title == null) {
            return null;
        }
        final boolean liquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(this);
        final String key = title.toString();
        final int iconKind = resolveRowIconKind(key);
        if (iconKind == 0) {
            return null;
        }
        final GboardM3Helper.Palette m3Pal =
                m3Palette != null ? m3Palette : GboardM3Helper.Palette.forContext(this);
        View orb = new View(this) {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final Path path = new Path();
            private final RectF oval = new RectF();

            {
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);
            }

            private void drawSolidGitHubOctocat(Canvas canvas, float cx, float cy, float u, int bgColor, int fgColor) {
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(bgColor);
                float r = 7.4f * u;
                canvas.drawCircle(cx, cy, r, paint);
                // Punch out crisp Octocat silhouette
                paint.setColor(fgColor);
                // Ears
                path.reset();
                path.moveTo(cx - 4.2f * u, cy - 1.5f * u);
                path.lineTo(cx - 4.6f * u, cy - 5.2f * u);
                path.lineTo(cx - 1.8f * u, cy - 3.6f * u);
                path.lineTo(cx + 1.8f * u, cy - 3.6f * u);
                path.lineTo(cx + 4.6f * u, cy - 5.2f * u);
                path.lineTo(cx + 4.2f * u, cy - 1.5f * u);
                // Head dome + torso down to bottom circle rim
                path.cubicTo(cx + 5.6f * u, cy + 0.4f * u, cx + 4.6f * u, cy + 2.8f * u, cx + 2.0f * u, cy + 3.4f * u);
                path.lineTo(cx + 2.2f * u, cy + 7.2f * u);
                path.lineTo(cx - 2.2f * u, cy + 7.2f * u);
                path.lineTo(cx - 2.0f * u, cy + 3.4f * u);
                path.cubicTo(cx - 4.6f * u, cy + 2.8f * u, cx - 5.6f * u, cy + 0.4f * u, cx - 4.2f * u, cy - 1.5f * u);
                path.close();
                canvas.drawPath(path, paint);
                // Little curled tail on left
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(1.25f * u);
                path.reset();
                path.moveTo(cx - 1.8f * u, cy + 5.2f * u);
                path.cubicTo(cx - 3.6f * u, cy + 5.2f * u, cx - 4.0f * u, cy + 3.5f * u, cx - 5.2f * u, cy + 3.6f * u);
                canvas.drawPath(path, paint);
            }

            @Override
            protected void onDraw(Canvas canvas) {
                super.onDraw(canvas);
                float cx = getWidth() / 2f;
                float cy = getHeight() / 2f;
                float u = dpF(1f);
                int primaryBlue = liquidGlass
                        ? ((m3Pal.isAmoled || m3Pal.isNight) ? m3Pal.accent : 0xFF2E40F5)
                        : m3Pal.textSecondary;
                int cutoutBg = liquidGlass
                        ? (m3Pal.isAmoled ? 0xFF0A0E18 : (m3Pal.isNight ? 0xFF1F2436 : 0xFFF2F4FC))
                        : palette.surface;
                paint.setColor(primaryBlue);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(1.85f * u);

                switch (iconKind) {
                    case 1: // Developer (solid filled person bust - About.png)
                        paint.setStyle(Paint.Style.FILL);
                        canvas.drawCircle(cx, cy - 3.4f * u, 3.2f * u, paint);
                        oval.set(cx - 5.8f * u, cy + 1.0f * u, cx + 5.8f * u, cy + 7.4f * u);
                        path.reset();
                        path.addArc(oval, 180f, 180f);
                        path.lineTo(cx + 5.8f * u, cy + 5.8f * u);
                        path.quadTo(cx + 5.8f * u, cy + 6.8f * u, cx + 4.4f * u, cy + 6.8f * u);
                        path.lineTo(cx - 4.4f * u, cy + 6.8f * u);
                        path.quadTo(cx - 5.8f * u, cy + 6.8f * u, cx - 5.8f * u, cy + 5.8f * u);
                        path.close();
                        canvas.drawPath(path, paint);
                        break;
                    case 2: // Community (solid filled Telegram paper plane with inner wing fold - About.png)
                        paint.setStyle(Paint.Style.FILL);
                        path.reset();
                        path.moveTo(cx + 7.2f * u, cy - 5.8f * u);
                        path.lineTo(cx - 7.6f * u, cy - 0.6f * u);
                        path.lineTo(cx - 2.0f * u, cy + 1.4f * u);
                        path.lineTo(cx - 0.6f * u, cy + 6.6f * u);
                        path.lineTo(cx + 1.8f * u, cy + 3.4f * u);
                        path.lineTo(cx + 4.6f * u, cy + 6.2f * u);
                        path.close();
                        canvas.drawPath(path, paint);
                        paint.setColor(cutoutBg);
                        paint.setStyle(Paint.Style.STROKE);
                        paint.setStrokeWidth(1.3f * u);
                        canvas.drawLine(cx - 1.6f * u, cy + 1.6f * u, cx + 4.8f * u, cy - 3.8f * u, paint);
                        break;
                    case 3: // Source Code & All Releases (solid GitHub Octocat circle badge)
                        int ghBg = (m3Pal.isAmoled || m3Pal.isNight) ? m3Pal.accent
                                : ("source code".equalsIgnoreCase(key) ? 0xFF3A426E : 0xFF2034F2);
                        drawSolidGitHubOctocat(canvas, cx, cy, u, ghBg, cutoutBg);
                        break;
                    case 4: // Release Version (3D isometric wireframe cube - About.png)
                        paint.setStyle(Paint.Style.STROKE);
                        paint.setStrokeWidth(1.65f * u);
                        path.reset();
                        path.moveTo(cx, cy - 7.2f * u);
                        path.lineTo(cx + 6.5f * u, cy - 3.5f * u);
                        path.lineTo(cx + 6.5f * u, cy + 3.5f * u);
                        path.lineTo(cx, cy + 7.2f * u);
                        path.lineTo(cx - 6.5f * u, cy + 3.5f * u);
                        path.lineTo(cx - 6.5f * u, cy - 3.5f * u);
                        path.close();
                        canvas.drawPath(path, paint);
                        canvas.drawLine(cx, cy, cx, cy + 7.2f * u, paint);
                        canvas.drawLine(cx - 6.5f * u, cy - 3.5f * u, cx, cy, paint);
                        canvas.drawLine(cx + 6.5f * u, cy - 3.5f * u, cx, cy, paint);
                        break;
                    case 5: // Base Gboard (smartphone handset outline - About.png)
                        paint.setStyle(Paint.Style.STROKE);
                        paint.setStrokeWidth(1.65f * u);
                        oval.set(cx - 4.7f * u, cy - 7.4f * u, cx + 4.7f * u, cy + 7.4f * u);
                        canvas.drawRoundRect(oval, 1.8f * u, 1.8f * u, paint);
                        paint.setStrokeWidth(1.4f * u);
                        canvas.drawLine(cx - 1.3f * u, cy - 5.1f * u, cx + 1.3f * u, cy - 5.1f * u, paint);
                        paint.setStyle(Paint.Style.FILL);
                        canvas.drawCircle(cx, cy + 4.9f * u, 0.9f * u, paint);
                        break;
                    case 6: // Check for Updates / Download (tray box + downward arrow - Gboard Pro Updates.png)
                        paint.setStyle(Paint.Style.STROKE);
                        paint.setStrokeWidth(1.8f * u);
                        // Rounded square box notched at top center
                        path.reset();
                        path.moveTo(cx - 2.4f * u, cy - 5.8f * u);
                        path.lineTo(cx - 5.2f * u, cy - 5.8f * u);
                        path.quadTo(cx - 6.6f * u, cy - 5.8f * u, cx - 6.6f * u, cy - 4.2f * u);
                        path.lineTo(cx - 6.6f * u, cy + 4.8f * u);
                        path.quadTo(cx - 6.6f * u, cy + 6.4f * u, cx - 5.0f * u, cy + 6.4f * u);
                        path.lineTo(cx + 5.0f * u, cy + 6.4f * u);
                        path.quadTo(cx + 6.6f * u, cy + 6.4f * u, cx + 6.6f * u, cy + 4.8f * u);
                        path.lineTo(cx + 6.6f * u, cy - 4.2f * u);
                        path.quadTo(cx + 6.6f * u, cy - 5.8f * u, cx + 5.2f * u, cy - 5.8f * u);
                        path.lineTo(cx + 2.4f * u, cy - 5.8f * u);
                        canvas.drawPath(path, paint);
                        // Down arrow inside box
                        canvas.drawLine(cx, cy - 6.8f * u, cx, cy + 2.4f * u, paint);
                        path.reset();
                        path.moveTo(cx - 3.2f * u, cy - 0.6f * u);
                        path.lineTo(cx, cy + 2.8f * u);
                        path.lineTo(cx + 3.2f * u, cy - 0.6f * u);
                        canvas.drawPath(path, paint);
                        break;
                    case 7: // Highlights Row 1: Solid filled artist palette (Gboard Pro Updates.png)
                        paint.setStyle(Paint.Style.FILL);
                        path.reset();
                        path.moveTo(cx, cy - 7.4f * u);
                        path.cubicTo(cx + 4.8f * u, cy - 7.4f * u, cx + 7.6f * u, cy - 3.8f * u, cx + 7.4f * u, cy + 0.4f * u);
                        path.cubicTo(cx + 7.2f * u, cy + 2.4f * u, cx + 5.4f * u, cy + 2.6f * u, cx + 3.8f * u, cy + 2.4f * u);
                        path.cubicTo(cx + 2.4f * u, cy + 2.3f * u, cx + 2.2f * u, cy + 3.8f * u, cx + 3.0f * u, cy + 5.0f * u);
                        path.cubicTo(cx + 3.8f * u, cy + 6.4f * u, cx + 2.2f * u, cy + 7.4f * u, cx - 0.4f * u, cy + 7.4f * u);
                        path.cubicTo(cx - 5.2f * u, cy + 7.4f * u, cx - 7.6f * u, cy + 3.8f * u, cx - 7.6f * u, cy - 0.2f * u);
                        path.cubicTo(cx - 7.6f * u, cy - 4.4f * u, cx - 4.4f * u, cy - 7.4f * u, cx, cy - 7.4f * u);
                        path.close();
                        canvas.drawPath(path, paint);
                        // Paint dots cutout
                        paint.setColor(cutoutBg);
                        canvas.drawCircle(cx - 3.2f * u, cy - 1.6f * u, 1.25f * u, paint);
                        canvas.drawCircle(cx - 0.2f * u, cy - 3.8f * u, 1.25f * u, paint);
                        canvas.drawCircle(cx + 3.4f * u, cy - 2.0f * u, 1.25f * u, paint);
                        canvas.drawCircle(cx - 2.8f * u, cy + 2.4f * u, 1.25f * u, paint);
                        break;
                    case 8: // Highlights Row 2: Solid 4-rounded-squares 2x2 grid (Gboard Pro Updates.png)
                        paint.setStyle(Paint.Style.FILL);
                        float gGap = 1.6f * u;
                        float gCell = 5.4f * u;
                        float gx0 = cx - gCell - gGap * 0.5f;
                        float gy0 = cy - gCell - gGap * 0.5f;
                        for (int rr = 0; rr < 2; rr++) {
                            for (int cc = 0; cc < 2; cc++) {
                                float x1 = gx0 + cc * (gCell + gGap);
                                float y1 = gy0 + rr * (gCell + gGap);
                                oval.set(x1, y1, x1 + gCell, y1 + gCell);
                                canvas.drawRoundRect(oval, 1.6f * u, 1.6f * u, paint);
                            }
                        }
                        break;
                    case 9: // Highlights Row 3: Solid filled jigsaw puzzle piece (Gboard Pro Updates.png)
                        paint.setStyle(Paint.Style.FILL);
                        oval.set(cx - 6.0f * u, cy - 4.0f * u, cx + 4.4f * u, cy + 6.4f * u);
                        canvas.drawRoundRect(oval, 1.6f * u, 1.6f * u, paint);
                        canvas.drawCircle(cx - 0.8f * u, cy - 5.2f * u, 2.2f * u, paint);
                        canvas.drawCircle(cx + 5.6f * u, cy + 1.2f * u, 2.2f * u, paint);
                        // Subtractive bottom notch for authentic puzzle piece shape
                        paint.setColor(cutoutBg);
                        canvas.drawCircle(cx - 0.8f * u, cy + 6.4f * u, 2.0f * u, paint);
                        break;
                    case 10: // Amoled (crisp crescent moon)
                        paint.setStyle(Paint.Style.STROKE);
                        path.reset();
                        path.moveTo(cx + 1.4f * u, cy - 6.8f * u);
                        path.cubicTo(
                                cx - 3.6f * u, cy - 6.6f * u,
                                cx - 7.0f * u, cy - 2.6f * u,
                                cx - 6.8f * u, cy + 2.0f * u);
                        path.cubicTo(
                                cx - 6.6f * u, cy + 5.8f * u,
                                cx - 2.2f * u, cy + 8.0f * u,
                                cx + 2.4f * u, cy + 7.2f * u);
                        path.cubicTo(
                                cx + 4.8f * u, cy + 6.8f * u,
                                cx + 6.6f * u, cy + 5.2f * u,
                                cx + 7.2f * u, cy + 3.4f * u);
                        path.cubicTo(
                                cx + 3.2f * u, cy + 4.4f * u,
                                cx - 1.2f * u, cy + 2.0f * u,
                                cx - 1.6f * u, cy - 2.0f * u);
                        path.cubicTo(
                                cx - 1.9f * u, cy - 4.0f * u,
                                cx - 0.6f * u, cy - 5.8f * u,
                                cx + 1.4f * u, cy - 6.8f * u);
                        path.close();
                        canvas.drawPath(path, paint);
                        break;
                    case 11: // Advanced Settings (sliders)
                        canvas.drawLine(cx - 6.5f * u, cy - 3.5f * u, cx + 6.5f * u, cy - 3.5f * u, paint);
                        canvas.drawLine(cx - 6.5f * u, cy + 3.5f * u, cx + 6.5f * u, cy + 3.5f * u, paint);
                        paint.setStyle(Paint.Style.FILL);
                        canvas.drawCircle(cx - 2.2f * u, cy - 3.5f * u, 2.4f * u, paint);
                        canvas.drawCircle(cx + 2.4f * u, cy + 3.5f * u, 2.4f * u, paint);
                        break;
                    case 12: // Notification (bell)
                        path.reset();
                        path.moveTo(cx - 5.2f * u, cy + 3.0f * u);
                        path.lineTo(cx - 4.4f * u, cy - 2.2f * u);
                        oval.set(cx - 4.4f * u, cy - 6.6f * u, cx + 4.4f * u, cy + 2.2f * u);
                        path.arcTo(oval, 180f, 180f);
                        path.lineTo(cx + 5.2f * u, cy + 3.0f * u);
                        path.lineTo(cx + 6.4f * u, cy + 4.2f * u);
                        path.lineTo(cx - 6.4f * u, cy + 4.2f * u);
                        path.close();
                        canvas.drawPath(path, paint);
                        canvas.drawLine(cx - 1.5f * u, cy + 6.8f * u, cx + 1.5f * u, cy + 6.8f * u, paint);
                        break;
                    case 13: // Permissions (shield check)
                        path.reset();
                        path.moveTo(cx, cy - 7.4f * u);
                        path.lineTo(cx + 6.2f * u, cy - 4.8f * u);
                        path.lineTo(cx + 6.2f * u, cy + 0.5f * u);
                        path.quadTo(cx + 5.6f * u, cy + 5.6f * u, cx, cy + 7.6f * u);
                        path.quadTo(cx - 5.6f * u, cy + 5.6f * u, cx - 6.2f * u, cy + 0.5f * u);
                        path.lineTo(cx - 6.2f * u, cy - 4.8f * u);
                        path.close();
                        canvas.drawPath(path, paint);
                        path.reset();
                        path.moveTo(cx - 2.6f * u, cy + 0.2f * u);
                        path.lineTo(cx - 0.6f * u, cy + 2.4f * u);
                        path.lineTo(cx + 3.2f * u, cy - 2.0f * u);
                        canvas.drawPath(path, paint);
                        break;
                    case 14: // Beta Program / Testing Mode (flask)
                        path.reset();
                        path.moveTo(cx - 2.4f * u, cy - 7.0f * u);
                        path.lineTo(cx + 2.4f * u, cy - 7.0f * u);
                        path.moveTo(cx - 1.6f * u, cy - 7.0f * u);
                        path.lineTo(cx - 1.6f * u, cy - 2.0f * u);
                        path.lineTo(cx - 6.2f * u, cy + 5.6f * u);
                        path.quadTo(cx - 6.6f * u, cy + 6.8f * u, cx - 5.0f * u, cy + 6.8f * u);
                        path.lineTo(cx + 5.0f * u, cy + 6.8f * u);
                        path.quadTo(cx + 6.6f * u, cy + 6.8f * u, cx + 6.2f * u, cy + 5.6f * u);
                        path.lineTo(cx + 1.6f * u, cy - 2.0f * u);
                        path.lineTo(cx + 1.6f * u, cy - 7.0f * u);
                        canvas.drawPath(path, paint);
                        break;
                    case 15: // Reset (circular arrow)
                        oval.set(cx - 6.2f * u, cy - 6.2f * u, cx + 6.2f * u, cy + 6.2f * u);
                        canvas.drawArc(oval, -50f, 285f, false, paint);
                        path.reset();
                        path.moveTo(cx + 2.0f * u, cy - 6.6f * u);
                        path.lineTo(cx + 5.6f * u, cy - 6.4f * u);
                        path.lineTo(cx + 5.0f * u, cy - 2.4f * u);
                        canvas.drawPath(path, paint);
                        break;
                    default: // Sparkle / Fallback
                        path.reset();
                        path.moveTo(cx, cy - 7.2f * u);
                        path.lineTo(cx + 2.0f * u, cy - 2.0f * u);
                        path.lineTo(cx + 7.2f * u, cy);
                        path.lineTo(cx + 2.0f * u, cy + 2.0f * u);
                        path.lineTo(cx, cy + 7.2f * u);
                        path.lineTo(cx - 2.0f * u, cy + 2.0f * u);
                        path.lineTo(cx - 7.2f * u, cy);
                        path.lineTo(cx - 2.0f * u, cy - 2.0f * u);
                        path.close();
                        canvas.drawPath(path, paint);
                        break;
                }
            }
        };
        orb.setBackground(liquidGlass
                ? GboardM3Helper.createLiquidGlassOrbDrawable(this, m3Pal)
                : null);
        orb.setElevation(0f);
        int iconPx = liquidGlass ? dp(44) : dp(24);
        int endMargin = liquidGlass ? dp(14) : dp(16);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(iconPx, iconPx);
        lp.gravity = Gravity.CENTER_VERTICAL;
        lp.rightMargin = endMargin;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            lp.setMarginEnd(endMargin);
        }
        orb.setLayoutParams(lp);
        return orb;
    }

    private float dpF(float value) {
        return value * getResources().getDisplayMetrics().density;
    }

    private int resolveRowIconKind(String title) {
        String lower = title.toLowerCase(Locale.US);
        if ("developer".equals(lower)) return 1;
        if ("community".equals(lower)) return 2;
        if ("source code".equals(lower) || "all releases".equals(lower)) return 3;
        if ("release version".equals(lower)) return 4;
        if ("base gboard".equals(lower)) return 5;
        if (lower.contains("check for update") || lower.contains("download")
                || lower.contains("install update")) return 6;
        if (lower.contains("native liquid glass") || lower.contains("3d liquid glass")
                || lower.contains("choose ui") || lower.contains("classic")) return 7;
        if (lower.contains("multi-density") || lower.contains("density")) return 8;
        if (lower.contains("package icon") || lower.contains("in-app feedback") || lower.contains("feedback")) return 9;
        if ("amoled".equals(lower) || lower.contains("amoled")) return 10;
        if ("advanced settings".equals(lower)) return 11;
        if (lower.contains("notification") || "new features notifications".equals(lower)) return 12;
        if ("permissions".equals(lower)) return 13;
        if ("beta program".equals(lower) || lower.contains("testing mode")
                || lower.contains("beta version testing")) return 14;
        if ("reset".equals(lower)) return 15;
        if (lower.contains("additional") || lower.contains("new features (beta)")) return 16;
        return 0;
    }

    private void bindSwitchRowState(LinearLayout row, TextView titleView, TextView summaryView,
            LinearLayout supportLine, Switch switchView, boolean enabled) {
        row.setEnabled(enabled);
        row.setClickable(enabled);
        switchView.setEnabled(enabled);
        titleView.setTextColor(enabled ? palette.textPrimary : palette.textDisabled);
        summaryView.setTextColor(enabled ? palette.textSecondary : palette.textDisabled);
        if (supportLine != null) {
            for (int index = 0; index < supportLine.getChildCount(); index++) {
                View child = supportLine.getChildAt(index);
                child.setEnabled(enabled);
                child.setAlpha(enabled ? 1f : 0.9f);
            }
        }
        row.setAlpha(enabled ? 1f : 0.92f);
    }

    private void applySwitchTint(Switch switchView) {
        switchView.setThumbTintList(null);
        switchView.setTrackTintList(null);
        if (GboardM3Helper.isLiquidGlassUiEnabled(this)) {
            GboardM3Helper.Palette m3Pal = m3Palette != null ? m3Palette : GboardM3Helper.Palette.forContext(this);
            switchView.setTrackDrawable(GboardM3Helper.createLiquidGlassSwitchTrackDrawable(this, m3Pal));
            switchView.setThumbDrawable(GboardM3Helper.createLiquidGlassSwitchThumbDrawable(this, m3Pal, true));
            switchView.setSwitchMinWidth(dp(54));
        } else {
            switchView.setTrackDrawable(new Material3SwitchTrackDrawable());
            switchView.setThumbDrawable(new Material3SwitchThumbDrawable());
            switchView.setSwitchMinWidth(dp(52));
        }
        switchView.setThumbTextPadding(0);
        switchView.setShowText(false);
    }

    private final class Material3SwitchTrackDrawable extends Drawable {
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private boolean isChecked = false;
        private boolean isEnabled = true;

        Material3SwitchTrackDrawable() {
            fillPaint.setStyle(Paint.Style.FILL);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeWidth(dp(2));
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean checked = false;
            boolean enabled = false;
            for (int s : state) {
                if (s == android.R.attr.state_checked) {
                    checked = true;
                }
                if (s == android.R.attr.state_enabled) {
                    enabled = true;
                }
            }
            if (isChecked != checked || isEnabled != enabled) {
                isChecked = checked;
                isEnabled = enabled;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float radius = bounds.height() / 2f;
            if (isChecked) {
                fillPaint.setColor(isEnabled ? palette.accent : blendAlpha(palette.accent, 0.38f));
                canvas.drawRoundRect(bounds.left, bounds.top, bounds.right, bounds.bottom, radius, radius, fillPaint);
            } else {
                fillPaint.setColor(blendAlpha(palette.windowBackground, 0.5f));
                canvas.drawRoundRect(bounds.left, bounds.top, bounds.right, bounds.bottom, radius, radius, fillPaint);
                strokePaint.setColor(isEnabled ? blendAlpha(palette.textSecondary, 0.45f) : blendAlpha(palette.textDisabled, 0.3f));
                float inset = dp(1);
                canvas.drawRoundRect(bounds.left + inset, bounds.top + inset, bounds.right - inset, bounds.bottom - inset, radius, radius, strokePaint);
            }
        }

        @Override
        public int getIntrinsicWidth() {
            return dp(52);
        }

        @Override
        public int getIntrinsicHeight() {
            return dp(32);
        }

        @Override
        public void setAlpha(int alpha) {
            fillPaint.setAlpha(alpha);
            strokePaint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            fillPaint.setColorFilter(colorFilter);
            strokePaint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private final class Material3SwitchThumbDrawable extends Drawable {
        private final Paint thumbPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint checkPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path checkPath = new Path();
        private boolean isChecked = false;
        private boolean isEnabled = true;

        Material3SwitchThumbDrawable() {
            thumbPaint.setStyle(Paint.Style.FILL);
            checkPaint.setStyle(Paint.Style.STROKE);
            checkPaint.setStrokeCap(Paint.Cap.ROUND);
            checkPaint.setStrokeJoin(Paint.Join.ROUND);
            checkPaint.setStrokeWidth(dp(2.2f));
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean checked = false;
            boolean enabled = false;
            for (int s : state) {
                if (s == android.R.attr.state_checked) {
                    checked = true;
                }
                if (s == android.R.attr.state_enabled) {
                    enabled = true;
                }
            }
            if (isChecked != checked || isEnabled != enabled) {
                isChecked = checked;
                isEnabled = enabled;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float cx = bounds.exactCenterX();
            float cy = bounds.exactCenterY();
            float density = getResources().getDisplayMetrics().density;

            if (isChecked) {
                thumbPaint.setColor(isEnabled ? palette.windowBackground : blendAlpha(palette.windowBackground, 0.6f));
                canvas.drawCircle(cx, cy, 12f * density, thumbPaint);

                checkPaint.setColor(isEnabled ? palette.accent : blendAlpha(palette.accent, 0.6f));
                checkPath.reset();
                checkPath.moveTo(cx - (4.2f * density), cy - (0.2f * density));
                checkPath.lineTo(cx - (1.2f * density), cy + (3.0f * density));
                checkPath.lineTo(cx + (4.5f * density), cy - (3.2f * density));
                canvas.drawPath(checkPath, checkPaint);
            } else {
                thumbPaint.setColor(isEnabled ? blendAlpha(palette.textSecondary, 0.8f) : blendAlpha(palette.textDisabled, 0.5f));
                canvas.drawCircle(cx, cy, 8f * density, thumbPaint);
            }
        }

        @Override
        public int getIntrinsicWidth() {
            return dp(32);
        }

        @Override
        public int getIntrinsicHeight() {
            return dp(32);
        }

        @Override
        public void setAlpha(int alpha) {
            thumbPaint.setAlpha(alpha);
            checkPaint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            thumbPaint.setColorFilter(colorFilter);
            checkPaint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private void runSafely(String operationName, Runnable action) {
        try {
            action.run();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to " + operationName, throwable);
            renderCurrentScreenSafely();
        }
    }

    private void bindActionRowState(LinearLayout row, TextView titleView, TextView summaryView,
            TextView chevronView, boolean enabled) {
        row.setEnabled(enabled);
        row.setClickable(enabled);
        titleView.setTextColor(enabled ? palette.textPrimary : palette.textDisabled);
        summaryView.setTextColor(enabled ? palette.textSecondary : palette.textDisabled);
        if (chevronView != null) {
            chevronView.setTextColor(enabled ? palette.textSecondary : palette.textDisabled);
        }
        row.setAlpha(enabled ? 1f : 0.92f);
    }

    private void bindSelectorRowState(LinearLayout row, TextView titleView, TextView summaryView,
            LinearLayout supportLine, TextView chevronView, boolean enabled) {
        bindActionRowState(row, titleView, summaryView, chevronView, enabled);
        if (supportLine != null) {
            for (int index = 0; index < supportLine.getChildCount(); index++) {
                View child = supportLine.getChildAt(index);
                child.setEnabled(enabled);
                child.setAlpha(enabled ? 1f : 0.9f);
            }
        }
    }

    private AccessibleRow buildBaseRow() {
        AccessibleRow row = new AccessibleRow(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            row.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        row.setMinimumHeight(dp(64));
        row.setPadding(dp(16), dp(16), dp(16), dp(16));
        row.setBackground(buildRippleDrawable(0));
        row.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    private LinearLayout buildDetailRowContainer() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            row.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        row.setPadding(dp(16), dp(16), dp(16), dp(16));
        row.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    private LinearLayout buildSectionContainer(boolean advanced) {
        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            container.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        container.setBackground(null);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = 0;
        container.setLayoutParams(params);
        container.setPadding(0, 0, 0, 0);
        return container;
    }

    private LinearLayout buildRowTextColumn(boolean trailingSpacing) {
        LinearLayout textColumn = new LinearLayout(this);
        textColumn.setOrientation(LinearLayout.VERTICAL);
        textColumn.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            textColumn.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f);
        textParams.gravity = Gravity.CENTER_VERTICAL;
        textColumn.setLayoutParams(textParams);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            textColumn.setPaddingRelative(0, 0, trailingSpacing ? dp(16) : 0, 0);
        } else {
            textColumn.setPadding(0, 0, trailingSpacing ? dp(16) : 0, 0);
        }
        return textColumn;
    }

    private TextView buildRowTitle(CharSequence text) {
        TextView titleView = new TextView(this);
        titleView.setTextColor(palette.textPrimary);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        titleView.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        titleView.setLineSpacing(0f, 1.15f);
        titleView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            titleView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        titleView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        titleView.setText(text);
        return titleView;
    }

    private TextView buildRowSummary(String text, boolean monospace) {
        TextView summaryView = new TextView(this);
        summaryView.setTextColor(palette.textSecondary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        summaryView.setLineSpacing(dp(2), 1.15f);
        summaryView.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            summaryView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(4);
        summaryView.setLayoutParams(params);
        summaryView.setText(text);
        summaryView.setVisibility(TextUtils.isEmpty(text) ? View.GONE : View.VISIBLE);
        if (monospace || isLikelyMonospace(text)) {
            summaryView.setTypeface(Typeface.MONOSPACE);
            summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            summaryView.setLineSpacing(0f, 1.0f);
        }
        return summaryView;
    }

    private TextView buildSectionTitle(String text) {
        TextView titleView = new TextView(this);
        titleView.setText(text);
        titleView.setTextColor(palette.accent);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        titleView.setLetterSpacing(0.08f);
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        titleView.setAllCaps(true);
        titleView.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            titleView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        titleView.setPadding(dp(22), dp(14), dp(22), dp(6));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            titleView.setAccessibilityHeading(true);
        }
        return titleView;
    }

    private TextView buildSectionSummary(String text, boolean monospace) {
        TextView summaryView = new TextView(this);
        summaryView.setText(text);
        summaryView.setTextColor(palette.textSecondary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        summaryView.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            summaryView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.leftMargin = dp(20);
        params.rightMargin = dp(20);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            params.setMarginStart(dp(20));
            params.setMarginEnd(dp(20));
        }
        params.topMargin = dp(4);
        params.bottomMargin = dp(8);
        summaryView.setLayoutParams(params);
        summaryView.setVisibility(TextUtils.isEmpty(text) ? View.GONE : View.VISIBLE);
        if (monospace || isLikelyMonospace(text)) {
            summaryView.setTypeface(Typeface.MONOSPACE);
            summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        }
        return summaryView;
    }

    private TextView buildTrailingValue(String text) {
        TextView valueView = new TextView(this);
        valueView.setText(text);
        valueView.setTextColor(palette.accent);
        valueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        valueView.setTypeface(Typeface.DEFAULT_BOLD);
        valueView.setGravity(Gravity.CENTER_VERTICAL);
        return valueView;
    }

    private LinearLayout buildSelectorSupportLine(
            GboardPatchesSettingsContract.SelectorRow rowModel) {
        boolean hasCurrentValue =
                rowModel.getCurrentValue() != null && !rowModel.getCurrentValue().isEmpty();
        View previewButton = buildPreviewButton(rowModel);
        if (!hasCurrentValue && previewButton == null) {
            return null;
        }

        LinearLayout supportLine = new LinearLayout(this);
        supportLine.setOrientation(LinearLayout.HORIZONTAL);
        supportLine.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            supportLine.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        supportLine.setBaselineAligned(false);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(4);
        supportLine.setLayoutParams(params);

        if (hasCurrentValue) {
            TextView currentValueChip = buildCurrentValueChip(rowModel.getCurrentValue());
            currentValueChip.setContentDescription(
                    text(R.string.gboard_patches_current_value_label) + ": "
                            + rowModel.getCurrentValue());
            supportLine.addView(currentValueChip, supportChipLayoutParams(0));
        }
        if (previewButton != null) {
            supportLine.addView(previewButton, supportChipLayoutParams(hasCurrentValue ? dp(8) : 0));
        }
        return supportLine;
    }

    private LinearLayout buildToggleSupportLine(
            GboardPatchesSettingsContract.ToggleRow rowModel) {
        View previewButton = buildPreviewButton(rowModel);
        if (previewButton == null) {
            return null;
        }

        LinearLayout supportLine = new LinearLayout(this);
        supportLine.setOrientation(LinearLayout.HORIZONTAL);
        supportLine.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            supportLine.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(10);
        supportLine.setLayoutParams(params);
        supportLine.addView(previewButton);
        return supportLine;
    }

    private TextView buildSupportLineLabel(String text) {
        TextView labelView = new TextView(this);
        labelView.setText(text);
        labelView.setTextColor(palette.textSecondary);
        labelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        labelView.setTypeface(Typeface.DEFAULT_BOLD);
        labelView.setAllCaps(true);
        labelView.setGravity(Gravity.START);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            labelView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        return labelView;
    }

    private TextView buildCurrentValueChip(String text) {
        TextView chipView = new TextView(this);
        chipView.setText(text);
        chipView.setTextColor(palette.accent);
        chipView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        chipView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        chipView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            chipView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        }
        chipView.setMaxLines(1);
        chipView.setEllipsize(TextUtils.TruncateAt.END);
        chipView.setPadding(0, 0, 0, 0);
        return chipView;
    }

    private TextView buildBetaBadge(String text) {
        TextView badgeView = new TextView(this);
        badgeView.setText(text);
        badgeView.setTextColor(palette.accent);
        badgeView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
        badgeView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        badgeView.setAllCaps(true);
        badgeView.setPadding(dp(6), dp(2), dp(6), dp(2));
        badgeView.setGravity(Gravity.CENTER);
        badgeView.setBackground(buildCardDrawable(palette.infoContainer, palette.surfaceStroke, dp(4)));
        return badgeView;
    }

    private TextView buildChevronView() {
        TextView chevronView = new TextView(this);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1
                && getResources().getConfiguration().getLayoutDirection() == View.LAYOUT_DIRECTION_RTL) {
            chevronView.setText("\u2039");
        } else {
            chevronView.setText("\u203a");
        }
        chevronView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        chevronView.setTextColor(palette.textSecondary);
        chevronView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
        chevronView.setTypeface(Typeface.DEFAULT_BOLD);
        chevronView.setGravity(Gravity.CENTER_VERTICAL);
        return chevronView;
    }

    private View buildPreviewButton(GboardPatchesSettingsContract.Row rowModel) {
        GboardPatchesSettingsContract.PreviewSpec previewSpec = rowModel.getPreviewSpec();
        if (previewSpec == null) {
            return null;
        }
        TextView previewButton = new TextView(this);
        previewButton.setText(text(R.string.gboard_patches_preview_label));
        previewButton.setTextColor(palette.accent);
        previewButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        previewButton.setTypeface(Typeface.DEFAULT_BOLD);
        previewButton.setPadding(dp(10), dp(6), dp(10), dp(6));
        previewButton.setBackground(buildChipDrawable(palette.infoContainer, palette.surfaceStroke));
        previewButton.setOnClickListener(view ->
                runSafely("show row preview", () -> showPreviewDialog(previewSpec)));
        previewButton.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return previewButton;
    }

    private LinearLayout.LayoutParams trailingLayoutParams(int rightMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.rightMargin = rightMargin;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            params.setMarginEnd(rightMargin);
        }
        return params;
    }

    private LinearLayout.LayoutParams supportChipLayoutParams(int leftMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.leftMargin = leftMargin;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            params.setMarginStart(leftMargin);
        }
        return params;
    }

    private boolean isLikelyMonospace(String summaryText) {
        return summaryText != null
                && summaryText.contains("\n")
                && (summaryText.contains("|--")
                || summaryText.contains("`--")
                || summaryText.contains("├─")
                || summaryText.contains("└─")
                || summaryText.contains("\n  |")
                || summaryText.startsWith("[PC]")
                || summaryText.startsWith("[This device]")
                || summaryText.startsWith("http://")
                || summaryText.startsWith("https://"));
    }

    private int toneBackground(GboardPatchesSettingsContract.StatusTone tone) {
        if (tone == GboardPatchesSettingsContract.StatusTone.WARNING) {
            return palette.warningContainer;
        }
        if (tone == GboardPatchesSettingsContract.StatusTone.INFO) {
            return palette.infoContainer;
        }
        return palette.surfaceAlt;
    }

    private Drawable buildChipDrawable(int fillColor, int strokeColor) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fillColor);
        drawable.setCornerRadius(dp(999));
        drawable.setStroke(dp(1), strokeColor);
        return drawable;
    }

    private void showConfirmDialog(String title, String message, Runnable confirmAction) {
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title)
                .setMessage(message)
                .setPositiveButton(text(R.string.gboard_patches_confirm_action),
                        (dialogInterface, which) ->
                        runSafely("confirm settings action", confirmAction))
                .setNegativeButton(
                        text(R.string.gboard_patches_dialog_cancel),
                        null)
                .create();
        dialog.setOnDismissListener(ignored -> onManagedDialogDismissed());
        try {
            dialog.show();
            onManagedDialogShown();
            tintDialogButtons(dialog);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to show confirmation dialog", throwable);
        }
    }

    private void tintDialogButtons(AlertDialog dialog) {
        if (dialog == null) {
            return;
        }
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(
                    buildCardDrawable(palette.surfaceAlt, palette.surfaceStroke, dp(28)));
        }
        if (dialog.getListView() != null) {
            ListView listView = dialog.getListView();
            listView.setDivider(null);
            listView.setSelector(buildRippleDrawable(dp(16)));
            listView.setOverScrollMode(View.OVER_SCROLL_NEVER);
            ColorStateList radioTint = new ColorStateList(
                    new int[][] {
                            new int[] { android.R.attr.state_checked },
                            new int[] { -android.R.attr.state_checked }
                    },
                    new int[] {
                            palette.accent,
                            blendAlpha(palette.textSecondary, 0.6f)
                    });
            listView.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                @Override
                public void onChildViewAdded(View parent, View child) {
                    if (child instanceof CheckedTextView) {
                        CheckedTextView checkedView = (CheckedTextView) child;
                        checkedView.setTextColor(palette.textPrimary);
                        checkedView.setCheckMarkTintList(radioTint);
                    }
                }

                @Override
                public void onChildViewRemoved(View parent, View child) {
                }
            });
            for (int i = 0; i < listView.getChildCount(); i++) {
                View child = listView.getChildAt(i);
                if (child instanceof CheckedTextView) {
                    CheckedTextView checkedView = (CheckedTextView) child;
                    checkedView.setTextColor(palette.textPrimary);
                    checkedView.setCheckMarkTintList(radioTint);
                }
            }
        }
        try {
            int titleId = getResources().getIdentifier("alertTitle", "id", "android");
            if (titleId != 0) {
                TextView titleView = dialog.findViewById(titleId);
                if (titleView != null) {
                    titleView.setTextColor(palette.textPrimary);
                }
            }
            TextView messageView = dialog.findViewById(android.R.id.message);
            if (messageView != null) {
                messageView.setTextColor(palette.textSecondary);
            }
        } catch (Throwable ignored) {
        }
        TextView positiveButton = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
        if (positiveButton != null) {
            positiveButton.setTextColor(palette.accent);
        }
        TextView negativeButton = dialog.getButton(AlertDialog.BUTTON_NEGATIVE);
        if (negativeButton != null) {
            negativeButton.setTextColor(palette.accent);
        }
        TextView neutralButton = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        if (neutralButton != null) {
            neutralButton.setTextColor(palette.accent);
        }
    }

    private int parsePositiveInteger(String value) {
        if (value == null) {
            return -1;
        }
        try {
            int parsed = Integer.parseInt(value.trim());
            return parsed > 0 ? parsed : -1;
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    private int resolveCheckedIndex(String[] values, String currentValue) {
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(currentValue)) {
                return i;
            }
        }
        return -1;
    }

    private Drawable buildCardDrawable(int fillColor, int strokeColor, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fillColor);
        drawable.setCornerRadius(radiusDp);
        if (strokeColor != 0) {
            drawable.setStroke(dp(1), strokeColor);
        }
        return drawable;
    }

    private Drawable buildRippleDrawable(int radiusDp) {
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(radiusDp);
        return new RippleDrawable(
                ColorStateList.valueOf(palette.pressedOverlay),
                null,
                mask);
    }

    private static int blendAlpha(int color, float alphaFraction) {
        int alpha = Math.round(Color.alpha(color) * alphaFraction);
        return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
    }

    private String text(int resId) {
        return GboardSettingsText.get(this, resId);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    /**
     * A settings row that TalkBack reads as a single control. When it holds a switch or radio
     * button, the row takes that control's role and checked state and the control itself is
     * hidden, so TalkBack has one stop that says "on" or "off" instead of an unlabelled second
     * stop. A row with a preview offers it in the TalkBack actions menu.
     */
    private static final class AccessibleRow extends LinearLayout {
        // Any id that is not a platform action id works for a custom action.
        private static final int ACTION_PREVIEW = 0x50420001;

        private CompoundButton stateControl;
        private CharSequence accessibilityClassName;
        private CharSequence previewLabel;
        private Runnable previewAction;

        AccessibleRow(Context context) {
            super(context);
        }

        void describeAs(CompoundButton control, Class<?> role) {
            stateControl = control;
            accessibilityClassName = role.getName();
            control.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        }

        void setPreviewAction(CharSequence label, Runnable action) {
            previewLabel = label;
            previewAction = action;
        }

        @Override
        public CharSequence getAccessibilityClassName() {
            return accessibilityClassName != null
                    ? accessibilityClassName
                    : super.getAccessibilityClassName();
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            if (stateControl != null) {
                info.setCheckable(true);
                info.setChecked(stateControl.isChecked());
            }
            if (previewAction != null && isEnabled()) {
                info.addAction(new AccessibilityNodeInfo.AccessibilityAction(
                        ACTION_PREVIEW, previewLabel));
            }
        }

        @Override
        public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(event);
            if (stateControl != null) {
                event.setChecked(stateControl.isChecked());
            }
        }

        @Override
        public boolean performAccessibilityAction(int action, Bundle arguments) {
            if (action == ACTION_PREVIEW && previewAction != null && isEnabled()) {
                previewAction.run();
                return true;
            }
            return super.performAccessibilityAction(action, arguments);
        }
    }

    private static final class PendingTextDocumentWrite {
        final String text;
        final Runnable completionAction;

        PendingTextDocumentWrite(String text, Runnable completionAction) {
            this.text = text;
            this.completionAction = completionAction;
        }
    }

    private static final class PendingBinaryDocumentWrite {
        final byte[] data;
        final Runnable completionAction;

        PendingBinaryDocumentWrite(byte[] data, Runnable completionAction) {
            this.data = data;
            this.completionAction = completionAction;
        }
    }

    private static final class Palette {
        final int windowBackground;
        final int surface;
        final int surfaceAlt;
        final int surfaceStroke;
        final int infoContainer;
        final int warningContainer;
        final int advancedContainer;
        final int textPrimary;
        final int textSecondary;
        final int textDisabled;
        final int accent;
        final int pressedOverlay;

        Palette(int windowBackground, int surface, int surfaceAlt, int surfaceStroke,
                int infoContainer, int warningContainer, int advancedContainer, int textPrimary,
                int textSecondary, int textDisabled, int accent, int pressedOverlay) {
            this.windowBackground = windowBackground;
            this.surface = surface;
            this.surfaceAlt = surfaceAlt;
            this.surfaceStroke = surfaceStroke;
            this.infoContainer = infoContainer;
            this.warningContainer = warningContainer;
            this.advancedContainer = advancedContainer;
            this.textPrimary = textPrimary;
            this.textSecondary = textSecondary;
            this.textDisabled = textDisabled;
            this.accent = accent;
            this.pressedOverlay = pressedOverlay;
        }

        static Palette forConfiguration(Configuration configuration) {
            return forContext(null, configuration);
        }

        static Palette forContext(Context context, Configuration configuration) {
            boolean liquidGlass = context != null && GboardM3Helper.isLiquidGlassUiEnabled(context);
            if (context != null && GboardM3Helper.isAmoledBlackEnabled(context)) {
                if (!liquidGlass) {
                    int accent = 0xFFA8C7FA;
                    int infoContainer = 0xFF0842A0;
                    if (Build.VERSION.SDK_INT >= 31) {
                        try {
                            accent = context.getColor(android.R.color.system_accent1_200);
                            infoContainer = context.getColor(android.R.color.system_accent1_800);
                        } catch (Throwable ignored) {
                        }
                    }
                    return new Palette(
                            0xFF000000,
                            0xFF141518,
                            0xFF1F2126,
                            0x24FFFFFF,
                            infoContainer,
                            0xFF3F2D16,
                            0xFF1F2126,
                            0xFFE6E1E5,
                            0xFFCAC4D0,
                            0x66CAC4D0,
                            accent,
                            GboardM3Helper.blendAlpha(accent, 0.20f));
                }
                return new Palette(
                        0xFF000000,
                        0xFF0A0C12,
                        0xFF10131C,
                        0x40A8C7FA,
                        0xFF142238,
                        0xFF3F2D16,
                        0xFF10131C,
                        0xFFF5F7FF,
                        0xFFB0B8D0,
                        0x66B0B8D0,
                        0xFFA8C7FA,
                        0x33A8C7FA);
            }

            boolean nightMode = (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;

            String selectedTheme = "default";
            if (context != null) {
                try {
                    selectedTheme = GboardM3Helper.getSelectedThemeKey(context);
                } catch (Throwable ignored) {
                }
            }

            int m3Stroke = nightMode ? 0x1FFFFFFF : 0x14000000;
            if ("blush_lilac".equals(selectedTheme)) {
                int s = liquidGlass ? (nightMode ? 0x44D0BCFF : 0x33542983) : m3Stroke;
                if (nightMode) {
                    return new Palette(
                            0xFF181122, 0xFF241C2E, 0xFF322840, s,
                            0xFF4F378B, Color.parseColor("#3F2D16"), 0xFF322840,
                            0xFFF5EEFF, 0xFFCCC2DC, 0x77CCC2DC, 0xFFD0BCFF, 0x33D0BCFF);
                } else {
                    return new Palette(
                            0xFFF7EFFA, 0xFFFFFFFF, 0xFFEBD7FA, s,
                            0xFFEBD7FA, Color.parseColor("#FEF3C7"), 0xFFEBD7FA,
                            0xFF24152F, 0xFF5F4B6E, 0x775F4B6E, 0xFF542983, 0x26542983);
                }
            } else if ("cotton_candy".equals(selectedTheme)) {
                int s = liquidGlass ? (nightMode ? 0x44FF80AB : 0x33B80058) : m3Stroke;
                if (nightMode) {
                    return new Palette(
                            0xFF1F1117, 0xFF2E1922, 0xFF402330, s,
                            0xFF880E4F, Color.parseColor("#3F2D16"), 0xFF402330,
                            0xFFFCE4EC, 0xFFF8BBD0, 0x77F8BBD0, 0xFFFF80AB, 0x33FF80AB);
                } else {
                    return new Palette(
                            0xFFFDE7E9, 0xFFFFFFFF, 0xFFF6B0CA, s,
                            0xFFF6B0CA, Color.parseColor("#FEF3C7"), 0xFFF6B0CA,
                            0xFF2D121B, 0xFF6D4352, 0x776D4352, 0xFFB80058, 0x26B80058);
                }
            } else if ("sunset_peach".equals(selectedTheme) || "rainbow".equals(selectedTheme)) {
                int s = liquidGlass ? (nightMode ? 0x44FF8A65 : 0x33D35A2D) : m3Stroke;
                if (nightMode) {
                    return new Palette(
                            0xFF1C1310, 0xFF281C17, 0xFF372720, s,
                            0xFF5D2416, Color.parseColor("#3F2D16"), 0xFF372720,
                            0xFFFBE9E7, 0xFFFFCCBC, 0x77FFCCBC, 0xFFFF7043, 0x33FF7043);
                } else {
                    return new Palette(
                            0xFFFDE8E7, 0xFFFFFFFF, 0xFFFD987C, s,
                            0xFFFD987C, Color.parseColor("#FEF3C7"), 0xFFFD987C,
                            0xFF2D1610, 0xFF6E443A, 0x776E443A, 0xFFD35A2D, 0x26D35A2D);
                }
            } else if ("fresh_mint".equals(selectedTheme) || "botanical".equals(selectedTheme)) {
                int s = liquidGlass ? (nightMode ? 0x4480CBC4 : 0x33046665) : m3Stroke;
                if (nightMode) {
                    return new Palette(
                            0xFF0E1815, 0xFF162520, 0xFF20342E, s,
                            0xFF0E3E37, Color.parseColor("#3F2D16"), 0xFF20342E,
                            0xFFE0F2F1, 0xFFB2DFDB, 0x77B2DFDB, 0xFF4DB6AC, 0x334DB6AC);
                } else {
                    return new Palette(
                            0xFFEFF5F5, 0xFFFFFFFF, 0xFFD4FAEF, s,
                            0xFFD4FAEF, Color.parseColor("#FEF3C7"), 0xFFD4FAEF,
                            0xFF0E1F1E, 0xFF3F5C5A, 0x773F5C5A, 0xFF046665, 0x26046665);
                }
            } else if ("ocean".equals(selectedTheme)) {
                int s = liquidGlass ? (nightMode ? 0x449FA8DA : 0x263949AB) : m3Stroke;
                if (nightMode) {
                    return new Palette(
                            0xFF101322, 0xFF191D32, 0xFF232845, s,
                            0xFF1E265C, Color.parseColor("#3F2D16"), 0xFF232845,
                            0xFFE8EAF6, 0xFFC5CAE9, 0x77C5CAE9, 0xFF7986CB, 0x337986CB);
                } else {
                    return new Palette(
                            0xFFF6F8FE, 0xFFEEF2FC, 0xFFE0E7FA, s,
                            0xFFE8EAF6, Color.parseColor("#FEF3C7"), 0xFFE0E7FA,
                            0xFF12182E, 0xFF3F4A6A, 0x773F4A6A, 0xFF3949AB, 0x263949AB);
                }
            }

            // Default: Auto-adapt to phone system dynamic colors (Material You / Monet on Android 12+)
            if (Build.VERSION.SDK_INT >= 31 && context != null) {
                try {
                    int acc600 = context.getColor(android.R.color.system_accent1_600);
                    int acc200 = context.getColor(android.R.color.system_accent1_200);
                    int acc100 = context.getColor(android.R.color.system_accent1_100);
                    int acc800 = context.getColor(android.R.color.system_accent1_800);
                    int neu10 = context.getColor(android.R.color.system_neutral1_10);
                    int neu50 = context.getColor(android.R.color.system_neutral1_50);
                    int neu100 = context.getColor(android.R.color.system_neutral1_100);
                    int neu800 = context.getColor(android.R.color.system_neutral1_800);
                    int neu900 = context.getColor(android.R.color.system_neutral1_900);
                    if (!liquidGlass) {
                        if (nightMode) {
                            return new Palette(
                                    GboardM3Helper.blendColor(0xFF121316, neu900, 0.55f),
                                    GboardM3Helper.blendColor(0xFF1E2025, neu800, 0.55f),
                                    GboardM3Helper.blendColor(0xFF282B32, neu800, 0.35f),
                                    0x1FFFFFFF,
                                    acc800,
                                    0xFF3F2D16,
                                    GboardM3Helper.blendColor(0xFF282B32, neu800, 0.35f),
                                    GboardM3Helper.blendColor(0xFFE5E4E9, neu50, 0.55f),
                                    GboardM3Helper.blendColor(0xFFC4C6D0, neu100, 0.35f),
                                    0x66C4C6D0,
                                    acc200,
                                    GboardM3Helper.blendAlpha(acc200, 0.18f));
                        }
                        return new Palette(
                                GboardM3Helper.blendColor(0xFFF3F5F9, neu10, 0.55f),
                                0xFFFFFFFF,
                                GboardM3Helper.blendColor(neu100, neu50, 0.45f),
                                0x14000000,
                                acc100,
                                0xFFFEF3C7,
                                GboardM3Helper.blendColor(neu100, neu50, 0.45f),
                                GboardM3Helper.blendColor(0xFF1B1C1F, neu900, 0.60f),
                                GboardM3Helper.blendColor(0xFF5E626C, neu800, 0.40f),
                                0x885E626C,
                                acc600,
                                GboardM3Helper.blendAlpha(acc600, 0.14f));
                    }
                    if (nightMode) {
                        return new Palette(
                                GboardM3Helper.blendColor(0xFF121520, neu900, 0.50f),
                                GboardM3Helper.blendColor(0xFF1A1E2B, neu800, 0.50f),
                                GboardM3Helper.blendColor(0xFF212636, acc800, 0.36f),
                                GboardM3Helper.blendAlpha(acc200, 0.28f),
                                acc800,
                                0xFF3F2D16,
                                GboardM3Helper.blendColor(0xFF212636, acc800, 0.36f),
                                GboardM3Helper.blendColor(0xFFF5F7FF, neu50, 0.40f),
                                GboardM3Helper.blendColor(0xFFB8C0D6, acc100, 0.32f),
                                0x66B8C0D6,
                                acc200,
                                GboardM3Helper.blendAlpha(acc200, 0.22f));
                    }
                    return new Palette(
                            GboardM3Helper.blendColor(0xFFEFEFF6, neu50, 0.45f),
                            GboardM3Helper.blendColor(0xFFF9FAFE, neu10, 0.45f),
                            GboardM3Helper.blendColor(0xFFF9FAFE, acc100, 0.32f),
                            0xFFDCE1F0,
                            GboardM3Helper.blendColor(0xFFEAEFFF, acc100, 0.55f),
                            0xFFFEF3C7,
                            GboardM3Helper.blendColor(0xFFF9FAFE, acc100, 0.32f),
                            GboardM3Helper.blendColor(0xFF181F36, neu900, 0.45f),
                            GboardM3Helper.blendColor(0xFF525A70, neu800, 0.25f),
                            0x88525A70,
                            acc600,
                            GboardM3Helper.blendAlpha(acc600, 0.16f));
                } catch (Throwable ignored) {
                }
            }

            if (!liquidGlass) {
                if (nightMode) {
                    return new Palette(
                            0xFF141519, 0xFF1E2026, 0xFF282B33, 0x1FFFFFFF,
                            0xFF0842A0, 0xFF3F2D16, 0xFF282B33,
                            0xFFE4E2E6, 0xFFC5C6D0, 0x66C5C6D0, 0xFFA8C7FA, 0x22A8C7FA);
                }
                return new Palette(
                        0xFFF3F5F9, 0xFFFFFFFF, 0xFFE9EDF6, 0x14000000,
                        0xFFD3E3FD, 0xFFFEF3C7, 0xFFE9EDF6,
                        0xFF1B1C1F, 0xFF5E626C, 0x885E626C, 0xFF1A73E8, 0x1A1A73E8);
            }

            if (nightMode) {
                return new Palette(
                        0xFF121520,
                        0xFF1A1E2B,
                        0xFF212636,
                        0x33A8C7FA,
                        0xFF1B2B4B,
                        0xFF3F2D16,
                        0xFF212636,
                        0xFFF5F7FF,
                        0xFFB8C0D6,
                        0x66B8C0D6,
                        0xFFA8C7FA,
                        0x33A8C7FA);
            }
            return new Palette(
                    0xFFEFEFF6,
                    0xFFF9FAFE,
                    0xFFF9FAFE,
                    0xFFDCE1F0,
                    0xFFEAEFFF,
                    0xFFFEF3C7,
                    0xFFF9FAFE,
                    0xFF181F36,
                    0xFF525A70,
                    0x88525A70,
                    0xFF283CF5,
                    0x20283CF5);
        }

        private static int resolveThemeColor(Context context, int attrId, int fallback) {
            if (context == null) {
                return fallback;
            }
            TypedValue typedValue = new TypedValue();
            if (context.getTheme().resolveAttribute(attrId, typedValue, true)) {
                if (typedValue.type >= TypedValue.TYPE_FIRST_COLOR_INT
                        && typedValue.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                    return typedValue.data;
                }
                if (typedValue.resourceId != 0) {
                    try {
                        return context.getColor(typedValue.resourceId);
                    } catch (Throwable ignored) {
                    }
                }
            }
            return fallback;
        }
    }
}

