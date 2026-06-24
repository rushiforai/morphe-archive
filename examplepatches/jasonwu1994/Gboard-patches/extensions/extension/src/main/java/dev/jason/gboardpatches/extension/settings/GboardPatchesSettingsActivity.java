package dev.jason.gboardpatches.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.annotation.SuppressLint;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.VideoView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.lang.reflect.Proxy;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.BuildConfig;
import dev.jason.gboardpatches.extension.clipboard.GboardClipboardSettingsFeature;

public final class GboardPatchesSettingsActivity extends Activity
        implements GboardPatchesSettingsContract.Host {
    private static final String TAG = "GboardPatches";
    private static final String ACTION_QS_TILE_PREFERENCES =
            "android.service.quicksettings.action.QS_TILE_PREFERENCES";
    private static final String EXTRA_OPEN_WEB_CLIPBOARD =
            "dev.jason.gboardpatches.extension.extra.OPEN_WEB_CLIPBOARD";
    private static final int TOOLBAR_HEIGHT_DP = 56;
    private static final String TOOLBAR_TITLE_PATCHES = "Patches";
    private static final String HEADER_BADGE = "Gboard";
    private static final String HEADER_TITLE = "Patch settings";
    private static final String HEADER_SUMMARY = "";
    private static final String ERROR_HEADER_TITLE = "Feature unavailable";
    private static final String ERROR_HEADER_SUMMARY =
            "This settings page failed to load and was safely disabled.";
    private static final String ERROR_ROW_TITLE = "Unable to load feature";
    private static final String ERROR_ROW_SUMMARY =
            "The host app stayed alive. Reopen Gboard settings and try again.";
    private static final String FATAL_FALLBACK_TITLE = "Patches temporarily unavailable";
    private static final String FATAL_FALLBACK_SUMMARY =
            "This screen hit an internal error and was safely disabled. "
                    + "Gboard stays alive. Reopen settings and try again.";
    private static final String ABOUT_AUTHOR_TITLE = "Author";
    private static final String ABOUT_PATCH_VERSION_TITLE = "Patch Version";
    private static final String PREFERENCES_SECTION_TITLE = "Preferences";
    private static final String LANGUAGE_TITLE = "Language";
    private static final String LANGUAGE_SUMMARY = "";
    private static final String LANGUAGE_SYSTEM_LABEL = "System default";
    private static final String LANGUAGE_ENGLISH_LABEL = "English";
    private static final String LANGUAGE_TRADITIONAL_CHINESE_LABEL = "Traditional Chinese";
    private static final String DIALOG_SAVE = "Save";
    private static final String DIALOG_CANCEL = "Cancel";
    private static final String DIALOG_CLOSE = "Close";
    private static final String DIALOG_ERROR_POSITIVE = "Enter a positive number.";
    private static final String DIALOG_ERROR_SAVE_FAILED = "Failed to save setting.";
    private static final String PREVIEW_LOAD_FAILED = "Failed to load preview media.";
    private static final String NAVIGATE_UP_LABEL = "Navigate up";
    private static final String CURRENT_VALUE_LABEL = "Current";
    private static final String PREVIEW_LABEL = "Preview";
    private static final String CONFIRM_ACTION = "Confirm";
    private static final String ABOUT_AUTHOR_URL = "https://github.com/jasonwu1994";
    private static final String ABOUT_PATCH_REPOSITORY_URL =
            "https://github.com/jasonwu1994/Gboard-patches";
    private Palette palette;
    private LinearLayout toolbarView;
    private TextView toolbarTitleView;
    private TextView headerBadgeView;
    private TextView headerTitleView;
    private TextView headerSummaryView;
    private LinearLayout panelContainer;
    private ScrollView contentScrollView;
    private LinearLayout contentColumn;
    private List<GboardPatchesSettingsContract.Feature> features;
    private GboardPatchesSettingsContract.Feature currentFeature;
    private final List<GboardPatchesSettingsContract.Feature> featureBackStack =
            new ArrayList<GboardPatchesSettingsContract.Feature>();
    private boolean featuresInitialized;
    private Object backInvokedCallback;
    private boolean fatalFallbackShown;
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
    private int screenBuildGeneration;
    private boolean activityResumed;
    private long currentScreenRefreshIntervalMs;
    private int activeModalDialogCount;
    private boolean scrollToTopOnNextScreenApply = true;
    private boolean initialFeatureFromIntentHandled;

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(GboardSettingsLocaleManager.wrapContext(newBase));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(resolveActivityTheme());
        super.onCreate(savedInstanceState);
        try {
            fatalFallbackShown = false;
            palette = Palette.forConfiguration(getResources().getConfiguration());
            features = Collections.emptyList();
            featuresInitialized = false;
            configureWindow();
            View contentView = buildContentView();
            setContentView(contentView);
            installWindowInsetsHandling(contentView);
            registerBackCallback();
            scheduleDeferredRender();
        } catch (Throwable throwable) {
            showFatalFallbackScreen("Failed to initialize patches settings activity", throwable);
        }
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        initialFeatureFromIntentHandled = false;
        scheduleDeferredRender();
    }

    public static Intent createWebClipboardSettingsIntent(Context context) {
        Intent intent = new Intent(context, GboardPatchesSettingsActivity.class);
        intent.putExtra(EXTRA_OPEN_WEB_CLIPBOARD, true);
        return intent;
    }

    @Override
    protected void onResume() {
        super.onResume();
        activityResumed = true;
        scheduleDeferredRender();
    }

    @Override
    protected void onPause() {
        activityResumed = false;
        invalidatePendingScreenBuilds();
        cancelDeferredRender();
        cancelScheduledScreenRefresh();
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        activityResumed = false;
        cancelDeferredRender();
        cancelScheduledScreenRefresh();
        unregisterBackCallback();
        screenBuildExecutor.shutdownNow();
        backgroundStateExecutor.shutdownNow();
        super.onDestroy();
    }

    @Override
    @SuppressLint("GestureBackNavigation")
    public void onBackPressed() {
        if (navigateToRootIfNeeded()) {
            return;
        }
        super.onBackPressed();
    }

    @Override
    public Context getContext() {
        return this;
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
        activeModalDialogCount++;
        cancelScheduledScreenRefresh();
    }

    public void onManagedDialogDismissed() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runOnUiThread(this::onManagedDialogDismissed);
            return;
        }
        if (activeModalDialogCount > 0) {
            activeModalDialogCount--;
        }
        if (activeModalDialogCount == 0) {
            scheduleScreenRefresh(currentScreenRefreshIntervalMs);
        }
    }

    @Override
    public void openFeature(GboardPatchesSettingsContract.Feature feature) {
        if (feature == null) {
            return;
        }
        if (currentFeature == null) {
            featureBackStack.clear();
        } else {
            featureBackStack.add(currentFeature);
        }
        currentFeature = feature;
        requestScrollToTopOnNextScreenApply();
        initializeFeaturesAndRenderSafely();
    }

    @Override
    public void showChoiceDialog(String title, String[] labels, String[] values,
            String currentValue, String customValue, Runnable customAction,
            GboardPatchesSettingsContract.StringValueConsumer valueConsumer) {
        int checkedIndex = resolveCheckedIndex(values, currentValue);
        final Runnable[] pendingSelectionAction = new Runnable[1];
        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(title)
                .setSingleChoiceItems(labels, checkedIndex, (dialogInterface, which) -> {
                    if (which < 0 || which >= values.length) {
                        return;
                    }
                    String selectedValue = values[which];
                    pendingSelectionAction[0] = () -> runSafely(
                            "handle choice dialog selection",
                            () -> {
                                if (customValue.equals(selectedValue)) {
                                    customAction.run();
                                } else {
                                    valueConsumer.accept(selectedValue);
                                    renderCurrentScreenSafely();
                                }
                            });
                    dialogInterface.dismiss();
                })
                .setNegativeButton(text(R.string.gboard_patches_dialog_cancel, DIALOG_CANCEL), null)
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
                .setPositiveButton(text(R.string.gboard_patches_dialog_save, DIALOG_SAVE), null)
                .setNegativeButton(
                        text(R.string.gboard_patches_dialog_cancel, DIALOG_CANCEL),
                        null)
                .create();
        dialog.setOnShowListener(ignored -> {
            tintDialogButtons(dialog);
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                int value = parsePositiveInteger(input.getText().toString());
                if (value <= 0) {
                    input.setError(text(R.string.gboard_patches_dialog_error_positive,
                            DIALOG_ERROR_POSITIVE));
                    return;
                }
                try {
                    consumer.accept(value);
                    dialog.dismiss();
                    renderCurrentScreenSafely();
                } catch (Throwable throwable) {
                    Log.w(TAG, "Failed to persist positive integer setting", throwable);
                    input.setError(text(R.string.gboard_patches_dialog_error_save_failed,
                            DIALOG_ERROR_SAVE_FAILED));
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
                .setPositiveButton(text(R.string.gboard_patches_dialog_save, DIALOG_SAVE), null)
                .setNegativeButton(
                        text(R.string.gboard_patches_dialog_cancel, DIALOG_CANCEL),
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
                    input.setError(text(R.string.gboard_patches_dialog_error_save_failed,
                            DIALOG_ERROR_SAVE_FAILED));
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
                .setPositiveButton(text(R.string.gboard_patches_dialog_close, DIALOG_CLOSE), null)
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
            errorView.setText(text(R.string.gboard_patches_preview_load_failed,
                    PREVIEW_LOAD_FAILED));
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
        errorView.setText(text(R.string.gboard_patches_preview_load_failed, PREVIEW_LOAD_FAILED));
        errorView.setTextColor(palette.textSecondary);
        errorView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        errorView.setGravity(Gravity.CENTER);

        videoContainer.addView(errorView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER));
    }

    private void configureWindow() {
        if (getActionBar() != null) {
            getActionBar().hide();
        }
        Window window = getWindow();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.setStatusBarColor(palette.windowBackground);
            window.setNavigationBarColor(palette.windowBackground);
        }
    }

    private int resolveActivityTheme() {
        boolean nightMode = (getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return nightMode
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar;
    }

    private View buildContentView() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(palette.windowBackground);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        root.addView(buildToolbar());

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
        contentColumn.setPadding(dp(16), dp(8), dp(16), dp(16));
        contentColumn.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        contentColumn.addView(buildHeaderCard());
        contentColumn.addView(buildPanelCard());

        contentScrollView.addView(contentColumn);
        root.addView(contentScrollView);
        return root;
    }

    private View buildToolbar() {
        toolbarView = new LinearLayout(this);
        toolbarView.setOrientation(LinearLayout.HORIZONTAL);
        toolbarView.setGravity(Gravity.CENTER_VERTICAL);
        toolbarView.setBackgroundColor(palette.windowBackground);
        toolbarView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(TOOLBAR_HEIGHT_DP)));
        toolbarView.setPadding(dp(4), 0, dp(12), 0);

        View backButton = buildBackButton();

        toolbarTitleView = new TextView(this);
        toolbarTitleView.setTextColor(palette.textPrimary);
        toolbarTitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        toolbarTitleView.setTypeface(Typeface.DEFAULT_BOLD);
        toolbarTitleView.setSingleLine(true);
        toolbarTitleView.setLayoutParams(new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f));

        toolbarView.addView(backButton);
        toolbarView.addView(toolbarTitleView);
        return toolbarView;
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
                canvas.drawPath(path, paint);
            }
        };
        backButton.setContentDescription(text(R.string.gboard_patches_navigate_up,
                NAVIGATE_UP_LABEL));
        backButton.setLayoutParams(new LinearLayout.LayoutParams(dp(48), dp(48)));
        backButton.setBackground(buildRippleDrawable(dp(24)));
        backButton.setOnClickListener(view -> goBackOrFinish());
        return backButton;
    }

    private View buildHeaderCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(buildCardDrawable(palette.surfaceAlt, palette.surfaceStroke, dp(24)));
        card.setPadding(dp(20), dp(20), dp(20), dp(20));
        card.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        headerBadgeView = new TextView(this);
        headerBadgeView.setAllCaps(true);
        headerBadgeView.setTextColor(palette.accent);
        headerBadgeView.setTypeface(Typeface.DEFAULT_BOLD);
        headerBadgeView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);

        headerTitleView = new TextView(this);
        headerTitleView.setTextColor(palette.textPrimary);
        headerTitleView.setTypeface(Typeface.DEFAULT_BOLD);
        headerTitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24f);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        titleParams.topMargin = dp(8);
        headerTitleView.setLayoutParams(titleParams);

        headerSummaryView = new TextView(this);
        headerSummaryView.setTextColor(palette.textSecondary);
        headerSummaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        headerSummaryView.setLineSpacing(0f, 1.1f);
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
        panelContainer.setBackground(buildCardDrawable(
                palette.surface,
                palette.surfaceStroke,
                dp(28)));
        LinearLayout.LayoutParams panelParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        panelParams.topMargin = dp(12);
        panelContainer.setLayoutParams(panelParams);
        panelContainer.setPadding(0, dp(6), 0, dp(6));
        return panelContainer;
    }

    private void goBackOrFinish() {
        if (navigateToRootIfNeeded()) {
            return;
        }
        finish();
    }

    private void openExternalUrl(String url) {
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

    private boolean navigateToRootIfNeeded() {
        if (currentFeature == null) {
            return false;
        }
        if (featureBackStack.isEmpty()) {
            currentFeature = null;
        } else {
            currentFeature = featureBackStack.remove(featureBackStack.size() - 1);
        }
        requestScrollToTopOnNextScreenApply();
        renderCurrentScreenSafely();
        return true;
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
            updateToolbarInsets(resolveTopInset(insets));
            if (contentScrollView != null) {
                contentScrollView.setPadding(0, 0, 0, resolveBottomInset(insets));
            }
            return insets;
        });
        root.requestApplyInsets();
    }

    private void scheduleDeferredRender() {
        if (fatalFallbackShown) {
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
        if (fatalFallbackShown) {
            return;
        }
        final int buildGeneration;
        synchronized (screenBuildLock) {
            screenBuildGeneration++;
            buildGeneration = screenBuildGeneration;
        }
        try {
            screenBuildExecutor.execute(() -> buildAndApplyCurrentScreen(buildGeneration));
        } catch (RejectedExecutionException ignored) {
            // Activity is already tearing down.
        }
    }

    private void invalidatePendingScreenBuilds() {
        synchronized (screenBuildLock) {
            screenBuildGeneration++;
        }
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
        if (fatalFallbackShown) {
            return;
        }

        GboardPatchesSettingsContract.Screen screen;
        try {
            ensureFeaturesInitialized();
            openInitialFeatureFromIntentIfNeeded();
            GboardPatchesSettingsContract.Feature featureSnapshot = currentFeature;
            screen = featureSnapshot == null
                    ? buildRootScreen()
                    : featureSnapshot.buildScreen(this);
        } catch (IllegalStateException exception) {
            runOnUiThread(() -> {
                if (!isLatestScreenBuild(buildGeneration) || fatalFallbackShown
                        || isFinishing()) {
                    return;
                }
                Throwable cause = exception.getCause() == null ? exception : exception.getCause();
                showFatalFallbackScreen(exception.getMessage(), cause);
            });
            return;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render settings screen", throwable);
            screen = buildFeatureErrorScreen(currentFeature);
        }

        GboardPatchesSettingsContract.Screen finalScreen = screen;
        runOnUiThread(() -> {
            if (!isLatestScreenBuild(buildGeneration)
                    || fatalFallbackShown
                    || isFinishing()
                    || (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1
                    && isDestroyed())) {
                return;
            }
            applyScreen(finalScreen);
        });
    }

    private boolean isLatestScreenBuild(int buildGeneration) {
        synchronized (screenBuildLock) {
            return buildGeneration == screenBuildGeneration;
        }
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
        toolbarView.setPadding(dp(4), topInset, dp(12), 0);
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

    private void renderCurrentScreenSafely() {
        initializeFeaturesAndRenderSafely();
    }

    private void applyScreen(GboardPatchesSettingsContract.Screen screen) {
        toolbarTitleView.setText(screen.getToolbarTitle());
        headerBadgeView.setText(screen.getHeaderBadge());
        headerTitleView.setText(screen.getHeaderTitle());
        headerSummaryView.setText(screen.getHeaderSummary());
        headerSummaryView.setVisibility(
                TextUtils.isEmpty(screen.getHeaderSummary()) ? View.GONE : View.VISIBLE);
        applyPanelStyle(screen.getPanelStyle());
        panelContainer.removeAllViews();
        for (GboardPatchesSettingsContract.StatusBlock statusBlock : screen.getStatusBlocks()) {
            panelContainer.addView(createStatusBlockView(statusBlock));
        }
        for (GboardPatchesSettingsContract.Section section : screen.getSections()) {
            panelContainer.addView(createSectionView(section));
        }
        currentScreenRefreshIntervalMs = screen.getRefreshIntervalMs();
        scheduleScreenRefresh(currentScreenRefreshIntervalMs);
        if (consumeScrollToTopOnNextScreenApply()) {
            scrollContentToTopAfterLayout();
        }
    }

    private void applyPanelStyle(GboardPatchesSettingsContract.PanelStyle panelStyle) {
        if (panelContainer == null) {
            return;
        }
        GboardPatchesSettingsContract.PanelStyle resolvedStyle =
                panelStyle == null ? GboardPatchesSettingsContract.PanelStyle.CARD : panelStyle;
        if (resolvedStyle == GboardPatchesSettingsContract.PanelStyle.FLAT) {
            panelContainer.setBackground(null);
            panelContainer.setPadding(0, 0, 0, 0);
        } else {
            panelContainer.setBackground(buildCardDrawable(
                    palette.surface,
                    palette.surfaceStroke,
                    dp(28)));
            panelContainer.setPadding(0, dp(6), 0, dp(6));
        }
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
        featureBackStack.clear();
        for (int index = 0; index < sanitizedPath.size() - 1; index++) {
            featureBackStack.add(sanitizedPath.get(index));
        }
        currentFeature = sanitizedPath.get(sanitizedPath.size() - 1);
        requestScrollToTopOnNextScreenApply();
        initializeFeaturesAndRenderSafely();
    }

    private void openInitialFeatureFromIntentIfNeeded() {
        if (initialFeatureFromIntentHandled) {
            return;
        }
        initialFeatureFromIntentHandled = true;
        Intent intent = getIntent();
        if (intent == null) {
            return;
        }
        boolean tilePreferencesIntent = ACTION_QS_TILE_PREFERENCES.equals(intent.getAction());
        boolean openWebClipboard = intent.getBooleanExtra(EXTRA_OPEN_WEB_CLIPBOARD, false);
        if (!tilePreferencesIntent && !openWebClipboard) {
            return;
        }
        GboardClipboardSettingsFeature clipboardFeature = findClipboardFeature();
        if (clipboardFeature == null) {
            return;
        }
        GboardPatchesSettingsContract.Feature webClipboardFeature =
                clipboardFeature.getWebClipboardFeature();
        featureBackStack.clear();
        featureBackStack.add(clipboardFeature);
        currentFeature = webClipboardFeature;
        requestScrollToTopOnNextScreenApply();
    }

    private GboardClipboardSettingsFeature findClipboardFeature() {
        for (GboardPatchesSettingsContract.Feature feature : features) {
            if (GboardClipboardSettingsFeature.class.isInstance(feature)) {
                return (GboardClipboardSettingsFeature) feature;
            }
        }
        return null;
    }

    private void requestScrollToTopOnNextScreenApply() {
        scrollToTopOnNextScreenApply = true;
    }

    private boolean consumeScrollToTopOnNextScreenApply() {
        boolean shouldScrollToTop = scrollToTopOnNextScreenApply;
        scrollToTopOnNextScreenApply = false;
        return shouldScrollToTop;
    }

    private void scrollContentToTopAfterLayout() {
        if (contentScrollView == null) {
            return;
        }
        contentScrollView.scrollTo(0, 0);
        contentScrollView.post(() -> {
            if (contentScrollView == null) {
                return;
            }
            contentScrollView.scrollTo(0, 0);
            contentScrollView.fullScroll(View.FOCUS_UP);
        });
    }

    private void scheduleScreenRefresh(long refreshIntervalMs) {
        cancelScheduledScreenRefresh();
        if (refreshIntervalMs <= 0L || !activityResumed || activeModalDialogCount > 0) {
            return;
        }
        screenRefreshHandler.postDelayed(screenRefreshRunnable, refreshIntervalMs);
    }

    private void cancelScheduledScreenRefresh() {
        screenRefreshHandler.removeCallbacks(screenRefreshRunnable);
    }

    private void showFatalFallbackScreen(String reason, Throwable throwable) {
        cancelScheduledScreenRefresh();
        fatalFallbackShown = true;
        Log.e(TAG, reason, throwable);
        if (palette == null) {
            palette = Palette.forConfiguration(getResources().getConfiguration());
        }
        toolbarView = null;
        toolbarTitleView = null;
        headerBadgeView = null;
        headerTitleView = null;
        headerSummaryView = null;
        panelContainer = null;
        contentScrollView = null;
        contentColumn = null;
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
        titleView.setText(text(R.string.gboard_patches_fatal_fallback_title,
                FATAL_FALLBACK_TITLE));
        titleView.setTextColor(palette.textPrimary);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setGravity(Gravity.CENTER_HORIZONTAL);

        TextView summaryView = new TextView(this);
        summaryView.setText(text(R.string.gboard_patches_fatal_fallback_summary,
                FATAL_FALLBACK_SUMMARY));
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

    private GboardPatchesSettingsContract.Screen buildRootScreen() {
        return createRootScreen(
                this,
                features,
                BuildConfig.PATCH_AUTHOR,
                BuildConfig.PATCH_VERSION,
                () -> openExternalUrl(ABOUT_AUTHOR_URL),
                () -> openExternalUrl(ABOUT_PATCH_REPOSITORY_URL));
    }

    static GboardPatchesSettingsContract.Screen createRootScreen(
            GboardPatchesSettingsContract.Host host,
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
                    () -> host.openFeature(feature)));
        }
        List<GboardPatchesSettingsContract.Row> preferenceRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        preferenceRows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(context, R.string.gboard_patches_language_title,
                        LANGUAGE_TITLE),
                GboardSettingsText.get(context, R.string.gboard_patches_language_summary,
                        LANGUAGE_SUMMARY),
                currentLanguageLabel(context),
                true,
                () -> showLanguageDialog(host)));
        List<GboardPatchesSettingsContract.Row> aboutRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        aboutRows.add(new GboardPatchesSettingsContract.CommandRow(
                GboardSettingsText.get(context, R.string.gboard_patches_about_author_title,
                        ABOUT_AUTHOR_TITLE),
                aboutAuthor,
                true,
                authorAction));
        aboutRows.add(new GboardPatchesSettingsContract.CommandRow(
                GboardSettingsText.get(context,
                        R.string.gboard_patches_about_patch_version_title,
                        ABOUT_PATCH_VERSION_TITLE),
                patchVersion,
                true,
                patchRepositoryAction));
        return new GboardPatchesSettingsContract.Screen(
                GboardSettingsText.get(context, R.string.gboard_patches_activity_title,
                        TOOLBAR_TITLE_PATCHES),
                GboardSettingsText.get(context, R.string.gboard_patches_header_badge,
                        HEADER_BADGE),
                GboardSettingsText.get(context, R.string.gboard_patches_header_title,
                        HEADER_TITLE),
                GboardSettingsText.get(context, R.string.gboard_patches_header_summary,
                        HEADER_SUMMARY),
                Collections.emptyList(),
                Arrays.asList(
                        new GboardPatchesSettingsContract.Section(
                                GboardSettingsText.get(context,
                                        R.string.gboard_patches_section_preferences,
                                        PREFERENCES_SECTION_TITLE),
                                preferenceRows),
                        new GboardPatchesSettingsContract.Section(
                                GboardSettingsText.get(context,
                                        R.string.gboard_patches_section_features,
                                        "Features"),
                                featureRows),
                        new GboardPatchesSettingsContract.Section(
                                GboardSettingsText.get(context,
                                        R.string.gboard_patches_section_about,
                                        "About"),
                                aboutRows)));
    }

    private static void showLanguageDialog(GboardPatchesSettingsContract.Host host) {
        if (host == null) {
            return;
        }
        Context context = host.getContext();
        host.showChoiceDialog(
                GboardSettingsText.get(context, R.string.gboard_patches_language_title,
                        LANGUAGE_TITLE),
                new String[] {
                        GboardSettingsText.get(context,
                                R.string.gboard_patches_language_system_label,
                                LANGUAGE_SYSTEM_LABEL),
                        GboardSettingsText.get(context,
                                R.string.gboard_patches_language_english_label,
                                LANGUAGE_ENGLISH_LABEL),
                        GboardSettingsText.get(context,
                                R.string.gboard_patches_language_traditional_chinese_label,
                                LANGUAGE_TRADITIONAL_CHINESE_LABEL)
                },
                new String[] {
                        GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                        GboardSettingsLocaleManager.LANGUAGE_ENGLISH,
                        GboardSettingsLocaleManager.LANGUAGE_TRADITIONAL_CHINESE
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
                        host.refresh();
                    }
                });
    }

    private static String currentLanguageLabel(Context context) {
        SharedPreferences preferences = context == null
                ? null
                : GboardPatchesSettings.preferences(context);
        String preference = GboardSettingsLocaleManager.readLanguagePreference(preferences);
        if (GboardSettingsLocaleManager.LANGUAGE_TRADITIONAL_CHINESE.equals(preference)) {
            return GboardSettingsText.get(context,
                    R.string.gboard_patches_language_traditional_chinese_label,
                    LANGUAGE_TRADITIONAL_CHINESE_LABEL);
        }
        if (GboardSettingsLocaleManager.LANGUAGE_ENGLISH.equals(preference)) {
            return GboardSettingsText.get(context,
                    R.string.gboard_patches_language_english_label,
                    LANGUAGE_ENGLISH_LABEL);
        }
        String effectiveLanguage = GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                preference,
                Locale.getDefault());
        String effectiveLabel =
                GboardSettingsLocaleManager.LANGUAGE_TRADITIONAL_CHINESE.equals(effectiveLanguage)
                        ? GboardSettingsText.get(context,
                                R.string.gboard_patches_language_traditional_chinese_label,
                                LANGUAGE_TRADITIONAL_CHINESE_LABEL)
                        : GboardSettingsText.get(context,
                                R.string.gboard_patches_language_english_label,
                                LANGUAGE_ENGLISH_LABEL);
        return GboardSettingsText.get(context,
                R.string.gboard_patches_language_system_value,
                "System default (%1$s)",
                effectiveLabel);
    }

    private GboardPatchesSettingsContract.Screen buildFeatureErrorScreen(
            GboardPatchesSettingsContract.Feature feature) {
        String toolbarTitle = feature != null
                ? feature.getEntryTitle()
                : TOOLBAR_TITLE_PATCHES;
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                text(R.string.gboard_patches_error_row_title, ERROR_ROW_TITLE),
                text(R.string.gboard_patches_error_row_summary, ERROR_ROW_SUMMARY),
                GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                toolbarTitle,
                text(R.string.gboard_patches_header_badge, HEADER_BADGE),
                text(R.string.gboard_patches_error_header_title, ERROR_HEADER_TITLE),
                text(R.string.gboard_patches_error_header_summary, ERROR_HEADER_SUMMARY),
                statusBlocks,
                Collections.emptyList());
    }

    private View createRowView(GboardPatchesSettingsContract.Row row) {
        if (row instanceof GboardPatchesSettingsContract.ToggleRow toggleRow) {
            return createToggleRow(toggleRow);
        }
        if (row instanceof GboardPatchesSettingsContract.NavigationRow navigationRow) {
            return createNavigationRow(navigationRow);
        }
        if (row instanceof GboardPatchesSettingsContract.SelectorRow selectorRow) {
            return createSelectorRow(selectorRow);
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
        LinearLayout row = buildBaseRow();
        LinearLayout textColumn = buildRowTextColumn(true);
        TextView titleView = buildRowTitle(rowModel.getTitle());
        TextView summaryView = buildRowSummary(rowModel.getSummary(), false);
        textColumn.addView(titleView);
        textColumn.addView(summaryView);
        LinearLayout toggleSupportLine = buildToggleSupportLine(rowModel);
        if (toggleSupportLine != null) {
            textColumn.addView(toggleSupportLine);
        }

        Switch switchView = new Switch(this);
        switchView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
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
        TextView chevronView = buildChevronView();
        row.addView(chevronView);
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

    private View createDetailRow(GboardPatchesSettingsContract.DetailRow rowModel) {
        LinearLayout row = buildDetailRowContainer();
        TextView titleView = buildRowTitle(rowModel.getTitle());
        TextView summaryView = buildRowSummary(rowModel.getSummary(), rowModel.isMonospace());
        row.addView(titleView);
        row.addView(summaryView);
        titleView.setTextColor(rowModel.isEnabled() ? palette.textPrimary : palette.textDisabled);
        summaryView.setTextColor(rowModel.isEnabled() ? palette.textSecondary : palette.textDisabled);
        row.setAlpha(rowModel.isEnabled() ? 1f : 0.92f);
        return row;
    }

    private View createCommandRow(GboardPatchesSettingsContract.CommandRow rowModel) {
        LinearLayout row = buildBaseRow();
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
        LinearLayout card = buildSectionContainer(false);
        card.setBackground(buildCardDrawable(
                toneBackground(block.getTone()),
                palette.surfaceStroke,
                dp(20)));
        card.addView(buildSectionTitle(block.getTitle()));
        card.addView(buildSectionSummary(block.getSummary(), false));
        return card;
    }

    private View createSectionView(GboardPatchesSettingsContract.Section section) {
        LinearLayout container = buildSectionContainer(
                section.getStyle() == GboardPatchesSettingsContract.SectionStyle.ADVANCED);
        if (section.getTitle() != null && !section.getTitle().isEmpty()) {
            container.addView(buildSectionTitle(section.getTitle()));
        }
        if (section.getDescription() != null && !section.getDescription().isEmpty()) {
            container.addView(buildSectionSummary(section.getDescription(), false));
        }
        boolean first = true;
        for (GboardPatchesSettingsContract.Row item : section.getItems()) {
            View rowView = createRowView(item);
            if (!first) {
                LinearLayout.LayoutParams params =
                        (LinearLayout.LayoutParams) rowView.getLayoutParams();
                params.topMargin = dp(6);
                rowView.setLayoutParams(params);
            }
            container.addView(rowView);
            first = false;
        }
        return container;
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
        int[][] states = new int[][] {
                new int[] { android.R.attr.state_enabled, android.R.attr.state_checked },
                new int[] { android.R.attr.state_enabled, -android.R.attr.state_checked },
                new int[] { -android.R.attr.state_enabled, android.R.attr.state_checked },
                new int[] { -android.R.attr.state_enabled, -android.R.attr.state_checked }
        };
        int[] thumbColors = new int[] {
                palette.accent,
                palette.textPrimary,
                blendAlpha(palette.accent, 0.5f),
                blendAlpha(palette.textDisabled, 0.85f)
        };
        int[] trackColors = new int[] {
                blendAlpha(palette.accent, 0.5f),
                blendAlpha(palette.textSecondary, 0.45f),
                blendAlpha(palette.accent, 0.28f),
                blendAlpha(palette.textDisabled, 0.3f)
        };
        switchView.setThumbTintList(new ColorStateList(states, thumbColors));
        switchView.setTrackTintList(new ColorStateList(states, trackColors));
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

    private LinearLayout buildBaseRow() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(72));
        row.setPadding(dp(18), dp(14), dp(18), dp(14));
        row.setBackground(buildRippleDrawable(dp(18)));
        row.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    private LinearLayout buildDetailRowContainer() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(18), dp(14), dp(18), dp(14));
        row.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    private LinearLayout buildSectionContainer(boolean advanced) {
        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setBackground(buildCardDrawable(
                advanced ? palette.advancedContainer : palette.surface,
                palette.surfaceStroke,
                dp(20)));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(12);
        container.setLayoutParams(params);
        container.setPadding(dp(12), dp(12), dp(12), dp(12));
        return container;
    }

    private LinearLayout buildRowTextColumn(boolean trailingSpacing) {
        LinearLayout textColumn = new LinearLayout(this);
        textColumn.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f);
        textParams.gravity = Gravity.CENTER_VERTICAL;
        textColumn.setLayoutParams(textParams);
        textColumn.setPadding(0, 0, trailingSpacing ? dp(16) : 0, 0);
        return textColumn;
    }

    private TextView buildRowTitle(CharSequence text) {
        TextView titleView = new TextView(this);
        titleView.setTextColor(palette.textPrimary);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        titleView.setText(text);
        return titleView;
    }

    private TextView buildRowSummary(String text, boolean monospace) {
        TextView summaryView = new TextView(this);
        summaryView.setTextColor(palette.textSecondary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
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
        titleView.setTextColor(palette.textSecondary);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setAllCaps(true);
        return titleView;
    }

    private TextView buildSectionSummary(String text, boolean monospace) {
        TextView summaryView = new TextView(this);
        summaryView.setText(text);
        summaryView.setTextColor(palette.textSecondary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(6);
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
        supportLine.setGravity(Gravity.CENTER_VERTICAL);
        supportLine.setBaselineAligned(false);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(10);
        supportLine.setLayoutParams(params);

        if (hasCurrentValue) {
            TextView labelView = buildSupportLineLabel(
                    text(R.string.gboard_patches_current_value_label, CURRENT_VALUE_LABEL));
            supportLine.addView(labelView);
            supportLine.addView(buildCurrentValueChip(rowModel.getCurrentValue()),
                    supportChipLayoutParams(0));
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
        supportLine.setGravity(Gravity.CENTER_VERTICAL);
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
        return labelView;
    }

    private TextView buildCurrentValueChip(String text) {
        TextView chipView = new TextView(this);
        chipView.setText(text);
        chipView.setTextColor(palette.accent);
        chipView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        chipView.setTypeface(Typeface.DEFAULT_BOLD);
        chipView.setMaxLines(1);
        chipView.setEllipsize(TextUtils.TruncateAt.END);
        chipView.setMaxWidth(dp(200));
        chipView.setPadding(dp(12), dp(7), dp(12), dp(7));
        chipView.setBackground(buildChipDrawable(palette.infoContainer, palette.surfaceStroke));
        return chipView;
    }

    private TextView buildChevronView() {
        TextView chevronView = new TextView(this);
        chevronView.setText("\u203a");
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
        previewButton.setText(text(R.string.gboard_patches_preview_label, PREVIEW_LABEL));
        previewButton.setTextColor(palette.accent);
        previewButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        previewButton.setTypeface(Typeface.DEFAULT_BOLD);
        previewButton.setPadding(dp(10), dp(6), dp(10), dp(6));
        previewButton.setBackground(buildChipDrawable(palette.infoContainer, palette.surfaceStroke));
        previewButton.setOnClickListener(view ->
                runSafely("show row preview", () -> showPreviewDialog(previewSpec)));
        return previewButton;
    }

    private LinearLayout.LayoutParams trailingLayoutParams(int rightMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.rightMargin = rightMargin;
        return params;
    }

    private LinearLayout.LayoutParams supportChipLayoutParams(int leftMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.leftMargin = leftMargin;
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
                .setPositiveButton(text(R.string.gboard_patches_confirm_action, CONFIRM_ACTION),
                        (dialogInterface, which) ->
                        runSafely("confirm settings action", confirmAction))
                .setNegativeButton(
                        text(R.string.gboard_patches_dialog_cancel, DIALOG_CANCEL),
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
        drawable.setStroke(dp(1), strokeColor);
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

    private int blendAlpha(int color, float alphaFraction) {
        int alpha = Math.round(Color.alpha(color) * alphaFraction);
        return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
    }

    private String text(int resId, String fallback) {
        return GboardSettingsText.get(this, resId, fallback);
    }

    private String text(int resId, String fallbackFormat, Object... args) {
        return GboardSettingsText.get(this, resId, fallbackFormat, args);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
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
            boolean nightMode = (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            if (nightMode) {
                return new Palette(
                        Color.parseColor("#FF0F1217"),
                        Color.parseColor("#FF161B22"),
                        Color.parseColor("#FF121821"),
                        Color.parseColor("#1FFFFFFF"),
                        Color.parseColor("#172554"),
                        Color.parseColor("#3F2D16"),
                        Color.parseColor("#111A2A"),
                        Color.parseColor("#FFF3F5F8"),
                        Color.parseColor("#FFAAB3C0"),
                        Color.parseColor("#FF657181"),
                        Color.parseColor("#FF8AB4F8"),
                        Color.parseColor("#1F8AB4F8"));
            }
            return new Palette(
                    Color.parseColor("#F5F7FB"),
                    Color.parseColor("#FFFFFFFF"),
                    Color.parseColor("#EEF3FB"),
                    Color.parseColor("#140F172A"),
                    Color.parseColor("#E8F0FE"),
                    Color.parseColor("#FEF3C7"),
                    Color.parseColor("#F7F9FC"),
                    Color.parseColor("#FF101828"),
                    Color.parseColor("#FF5F6B7A"),
                    Color.parseColor("#FFB6BFCC"),
                    Color.parseColor("#FF1A73E8"),
                    Color.parseColor("#141A73E8"));
        }
    }
}

