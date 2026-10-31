package com.sj010.gboardclipboard.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.PersistableBundle;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.Log;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;

/**
 * Native Material 3 Clipboard History Activity.
 * Matches PixelBoard quality with Monet dynamic palette, custom drawables, and lifecycle management.
 */
public final class GboardClipboardHistoryActivity extends Activity {

    private static final String TAG = "GboardClipboard";
    private static final int EXPORT_REQUEST_CODE = 1001;
    private static final int MAX_VISIBLE_ENTRIES = 25;
    private static final int PREVIEW_LENGTH = 72;
    private static final int THUMBNAIL_SIZE_DP = 44;
    private static final int THUMBNAIL_CACHE_ENTRIES = 40;
    private static final long REFRESH_INTERVAL_MS = 5000L;

    /** Danger and warning accents. They stay the same in light and dark mode. */
    private static final int COLOR_DANGER = 0xFFEF4444;
    private static final int COLOR_WARNING_TEXT = 0xFF92400E;
    private static final int COLOR_WARNING_TEXT_MUTED = 0xFF78350F;

    private Palette palette;
    private LinearLayout toolbar;
    private ScrollView contentScrollView;
    private LinearLayout contentColumn;

    private final LruCache<String, Bitmap> thumbnailCache = new LruCache<>(THUMBNAIL_CACHE_ENTRIES);
    private final ExecutorService backgroundExecutor = Executors.newFixedThreadPool(2);
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private boolean isResumed = false;

    private long lastLoadedLatestTimestamp = -1L;
    private int lastLoadedTotalCount = -1;

    private final Runnable refreshRunnable = new Runnable() {
        @Override
        public void run() {
            if (!isResumed) {
                return;
            }
            checkAndRefreshIfChanged();
            mainHandler.postDelayed(this, REFRESH_INTERVAL_MS);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(resolveActivityTheme());
        super.onCreate(savedInstanceState);
        palette = Palette.forContext(this, getResources().getConfiguration());
        configureWindow();

        View contentView = buildContentView();
        setContentView(contentView);
        installWindowInsetsHandling(contentView);
    }

    @Override
    protected void onResume() {
        super.onResume();
        isResumed = true;
        GboardClipboardBackfill.backfillPrimaryClip(this);
        renderAll();
        mainHandler.removeCallbacks(refreshRunnable);
        mainHandler.postDelayed(refreshRunnable, REFRESH_INTERVAL_MS);
    }

    @Override
    protected void onPause() {
        super.onPause();
        isResumed = false;
        mainHandler.removeCallbacks(refreshRunnable);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mainHandler.removeCallbacksAndMessages(null);
        backgroundExecutor.shutdownNow();
        thumbnailCache.evictAll();
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        palette = Palette.forContext(this, newConfig);
        configureWindow();
        if (contentColumn != null) {
            renderAll();
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

    private void configureWindow() {
        if (getActionBar() != null) {
            getActionBar().hide();
        }
        Window window = getWindow();
        window.setBackgroundDrawable(new ColorDrawable(palette.windowBackground));
        // This screen shows the access token and the clip contents. Keep it out
        // of screenshots, screen recordings and the recent apps preview.
        window.setFlags(WindowManager.LayoutParams.FLAG_SECURE,
                WindowManager.LayoutParams.FLAG_SECURE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false);
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                boolean nightMode = (getResources().getConfiguration().uiMode
                        & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
                controller.setSystemBarsAppearance(
                        nightMode ? 0 : WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS,
                        WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS);
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.setStatusBarColor(palette.windowBackground);
            window.setNavigationBarColor(palette.windowBackground);
        }
    }

    private View buildContentView() {
        FrameLayout root = new FrameLayout(this);
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

        toolbar = buildToolbar();
        shell.addView(toolbar);

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
        contentColumn.setPadding(0, 0, 0, dp(24));
        contentColumn.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        contentScrollView.addView(contentColumn);
        shell.addView(contentScrollView);

        return root;
    }

    private LinearLayout buildToolbar() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(4), dp(4), dp(16), dp(4));
        bar.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        View backButton = buildBackButton();
        bar.addView(backButton);

        TextView titleView = new TextView(this);
        titleView.setText("Clipboard history");
        titleView.setTextColor(palette.textPrimary);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setSingleLine(true);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        titleView.setPadding(dp(12), 0, dp(8), 0);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        bar.addView(titleView, titleParams);

        // Export button in toolbar
        TextView exportButton = new TextView(this);
        exportButton.setText("Export");
        exportButton.setTextColor(palette.accent);
        exportButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        exportButton.setTypeface(Typeface.DEFAULT_BOLD);
        exportButton.setBackground(buildCardDrawable(palette.surfaceAlt, palette.surfaceStroke, 16));
        exportButton.setPadding(dp(14), dp(7), dp(14), dp(7));
        exportButton.setClickable(true);
        exportButton.setFocusable(true);
        exportButton.setForeground(buildRippleDrawable(16));
        exportButton.setOnClickListener(v -> startExportHistory());
        bar.addView(exportButton);

        return bar;
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
        backButton.setContentDescription("Navigate up");
        backButton.setLayoutParams(new LinearLayout.LayoutParams(dp(48), dp(48)));
        backButton.setBackground(buildRippleDrawable(dp(24)));
        backButton.setOnClickListener(view -> finish());
        return backButton;
    }

    private void installWindowInsetsHandling(View root) {
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            try {
                int topInset = resolveTopInset(insets);
                int bottomInset = resolveBottomInset(insets);
                if (toolbar != null) {
                    toolbar.setPadding(dp(4), topInset + dp(4), dp(16), dp(4));
                }
                if (contentScrollView != null) {
                    contentScrollView.setPadding(0, 0, 0, bottomInset);
                }
            } catch (Throwable ignored) {
            }
            return insets;
        });
    }

    private static int resolveTopInset(WindowInsets insets) {
        if (insets == null) return 0;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            android.graphics.Insets bars = insets.getInsets(
                    WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            return bars.top;
        }
        return insets.getSystemWindowInsetTop();
    }

    private static int resolveBottomInset(WindowInsets insets) {
        if (insets == null) return 0;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
            return bars.bottom;
        }
        return insets.getSystemWindowInsetBottom();
    }

    private void checkAndRefreshIfChanged() {
        try {
            boolean includeSensitive = GboardClipboardHistorySettings.isSensitiveIncluded(this);
            GboardClipboardHistoryRepository.HistorySnapshot snapshot =
                    GboardClipboardHistoryRepository.loadSnapshot(this, includeSensitive, 1);
            List<GboardClipboardHistoryRepository.ClipboardEntry> latestList =
                    snapshot.getEntries();
            long latestTimestamp = latestList.isEmpty() ? 0L : latestList.get(0).getTimestamp();

            if (snapshot.getTotalCount() != lastLoadedTotalCount
                    || latestTimestamp != lastLoadedLatestTimestamp) {
                renderAll();
            }
        } catch (Throwable ignored) {
        }
    }

    private void renderAll() {
        if (contentColumn == null) {
            return;
        }
        contentColumn.removeAllViews();
        contentColumn.addView(buildHeaderCard());

        boolean includeSensitive = GboardClipboardHistorySettings.isSensitiveIncluded(this);
        GboardClipboardHistoryRepository.HistorySnapshot snapshot =
                GboardClipboardHistoryRepository.loadSnapshot(this, includeSensitive, MAX_VISIBLE_ENTRIES);

        if (!snapshot.isAvailable()) {
            contentColumn.addView(buildStatusBlock(
                    "Clipboard history unavailable",
                    "The clipboard history database could not be read.",
                    StatusTone.WARNING));
        } else {
            List<GboardClipboardHistoryRepository.ClipboardEntry> entries = snapshot.getEntries();
            lastLoadedTotalCount = snapshot.getTotalCount();
            lastLoadedLatestTimestamp = entries.isEmpty() ? 0L : entries.get(0).getTimestamp();

            if (entries.isEmpty()) {
                contentColumn.addView(buildStatusBlock(
                        "Clipboard is empty",
                        "Copies made while Gboard is the active keyboard show up here. Copy some text or an image, then reopen this screen.",
                        StatusTone.NEUTRAL));
            } else {
                contentColumn.addView(buildRecentEntriesSection(entries, snapshot.getTotalCount()));
            }
        }

        contentColumn.addView(buildExternalAccessSection());
        contentColumn.addView(buildDangerZoneSection());
    }

    private View buildHeaderCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(buildCardDrawable(palette.surfaceAlt, palette.surfaceStroke, 24));
        card.setPadding(dp(20), dp(20), dp(20), dp(20));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(dp(16), dp(16), dp(16), dp(12));
        card.setLayoutParams(params);

        // Pill badge "GBOARD"
        TextView badge = new TextView(this);
        badge.setText("GBOARD");
        badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        badge.setTypeface(Typeface.DEFAULT_BOLD);
        badge.setTextColor(palette.accent);
        badge.setPadding(dp(8), dp(3), dp(8), dp(3));
        badge.setBackground(buildCardDrawable(palette.infoContainer, palette.surfaceStroke, 12));
        LinearLayout.LayoutParams badgeParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        card.addView(badge, badgeParams);

        TextView titleView = new TextView(this);
        titleView.setText("Clipboard history");
        titleView.setTextColor(palette.textPrimary);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setPadding(0, dp(10), 0, 0);
        card.addView(titleView);

        TextView summaryView = new TextView(this);
        summaryView.setText("Entries captured by the keyboard, with optional read access for companion apps.");
        summaryView.setTextColor(palette.textSecondary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        summaryView.setPadding(0, dp(4), 0, 0);
        card.addView(summaryView);

        return card;
    }

    private enum StatusTone {
        NEUTRAL,
        WARNING
    }

    private View buildStatusBlock(String title, String summary, StatusTone tone) {
        LinearLayout block = new LinearLayout(this);
        block.setOrientation(LinearLayout.VERTICAL);
        int bg = tone == StatusTone.WARNING ? palette.warningContainer : palette.surfaceAlt;
        int stroke = tone == StatusTone.WARNING ? 0 : palette.surfaceStroke;
        block.setBackground(buildCardDrawable(bg, stroke, 20));
        block.setPadding(dp(18), dp(16), dp(18), dp(16));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(dp(16), dp(4), dp(16), dp(12));
        block.setLayoutParams(params);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tvTitle.setTypeface(Typeface.DEFAULT_BOLD);
        tvTitle.setTextColor(tone == StatusTone.WARNING ? COLOR_WARNING_TEXT : palette.textPrimary);
        block.addView(tvTitle);

        TextView tvSummary = new TextView(this);
        tvSummary.setText(summary);
        tvSummary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tvSummary.setTextColor(tone == StatusTone.WARNING
                ? COLOR_WARNING_TEXT_MUTED
                : palette.textSecondary);
        tvSummary.setPadding(0, dp(4), 0, 0);
        block.addView(tvSummary);

        return block;
    }

    private View buildRecentEntriesSection(
            List<GboardClipboardHistoryRepository.ClipboardEntry> entries, int totalCount) {
        List<View> rows = new ArrayList<>();
        for (GboardClipboardHistoryRepository.ClipboardEntry entry : entries) {
            rows.add(createEntryRow(entry));
        }

        if (totalCount > entries.size()) {
            rows.add(createDetailRow(
                    "Older entries hidden",
                    String.format("Showing the %1$d most recent of %2$d entries.", entries.size(), totalCount),
                    false));
        }

        return createSectionView(
                "Recent entries",
                "Only copies made while Gboard is the active keyboard are recorded.",
                rows);
    }

    private View createEntryRow(final GboardClipboardHistoryRepository.ClipboardEntry entry) {
        final boolean isImage = isImageEntry(entry);
        String title = describeEntry(entry);
        String relativeTime = describeTimestamp(entry.getTimestamp());

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(12), dp(16), dp(12));
        row.setClickable(true);
        row.setFocusable(true);
        row.setBackground(buildRippleDrawable(0));

        if (isImage) {
            View thumbnail = buildRowThumbnail(entry.getUri());
            if (thumbnail != null) {
                row.addView(thumbnail);
            }
        }

        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);
        textCol.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextColor(palette.textPrimary);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tvTitle.setMaxLines(2);
        tvTitle.setEllipsize(TextUtils.TruncateAt.END);
        textCol.addView(tvTitle);

        TextView tvTime = new TextView(this);
        tvTime.setText(relativeTime);
        tvTime.setTextColor(palette.textSecondary);
        tvTime.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        tvTime.setPadding(0, dp(3), 0, 0);
        textCol.addView(tvTime);

        row.addView(textCol);

        row.setOnClickListener(v -> {
            if (isImage) {
                openImageUri(entry.getUri());
            } else {
                copyTextToClipboard("Clipboard entry", entry.getPasteableText(), "Clipboard entry copied.", false);
            }
        });

        if (!isImage) {
            row.setOnLongClickListener(v -> {
                showFullClipDialog(entry);
                return true;
            });
        }

        return row;
    }

    private View buildExternalAccessSection() {
        List<View> rows = new ArrayList<>();

        boolean externalAccessEnabled = GboardClipboardHistorySettings.isExternalAccessEnabled(this);
        rows.add(createToggleRow(
                "Allow external apps to read clipboard history",
                "Lets companion apps read this history through a content provider.",
                externalAccessEnabled,
                (buttonView, isChecked) -> {
                    GboardClipboardHistorySettings.setExternalAccessEnabled(this, isChecked);
                    renderAll();
                }));

        boolean sensitiveIncluded = GboardClipboardHistorySettings.isSensitiveIncluded(this);
        rows.add(createToggleRow(
                "Include sensitive clips",
                "Include entries copied from password fields. Disabled by default.",
                sensitiveIncluded,
                (buttonView, isChecked) -> {
                    GboardClipboardHistorySettings.setSensitiveIncluded(this, isChecked);
                    renderAll();
                }));

        final String token = GboardClipboardHistorySettings.getAccessToken(this);
        rows.add(createCopyRow(
                "Access token",
                "Token: " + GboardClipboardHistorySettings.maskAccessToken(token),
                "Tap to copy the token for a companion app. Anyone holding it can read the whole "
                        + "history, so regenerate it when it leaks.",
                true,
                () -> copyAccessTokenToClipboard(token)));

        rows.add(createCommandRow(
                "Regenerate access token",
                "Invalidates the token that was shared before.",
                () -> {
                    GboardClipboardHistorySettings.regenerateAccessToken(this);
                    Toast.makeText(this, "New access token generated.", Toast.LENGTH_SHORT).show();
                    renderAll();
                }));

        final String providerUri = "content://" + GboardClipboardHistorySettings.resolveAuthority(this);
        rows.add(createCopyRow(
                "Provider URI",
                providerUri,
                "Tap to copy the provider URI.",
                true,
                () -> copyTextToClipboard("Provider URI", providerUri, "Provider URI copied.", false)));

        rows.add(createDetailRow(
                "Endpoints",
                "/clips · /clips/{id} · /primary",
                true));

        rows.add(createDetailRow(
                "Permission",
                GboardClipboardHistorySettings.resolvePermission(this),
                true));

        return createSectionView(
                "External access",
                "A read-only content provider lets companion apps read this history. It stays closed until the toggle below is on.",
                rows);
    }

    private View buildDangerZoneSection() {
        List<View> rows = new ArrayList<>();
        rows.add(createDangerRow(
                "Clear clipboard history",
                "Delete every captured clipboard entry.",
                "Clear clipboard history?",
                "Every captured clipboard entry will be deleted. This cannot be undone.",
                () -> {
                    GboardClipboardHistoryRepository.clearHistory(this);
                    Toast.makeText(this, "Clipboard history cleared.", Toast.LENGTH_SHORT).show();
                    renderAll();
                }));

        return createSectionView("Danger zone", null, rows);
    }

    private View createSectionView(String title, String description, List<View> rows) {
        LinearLayout section = new LinearLayout(this);
        section.setOrientation(LinearLayout.VERTICAL);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextColor(palette.accent);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        tvTitle.setTypeface(Typeface.DEFAULT_BOLD);
        tvTitle.setPadding(dp(20), dp(16), dp(20), dp(4));
        section.addView(tvTitle);

        if (description != null) {
            TextView tvDesc = new TextView(this);
            tvDesc.setText(description);
            tvDesc.setTextColor(palette.textSecondary);
            tvDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            tvDesc.setPadding(dp(20), 0, dp(20), dp(8));
            section.addView(tvDesc);
        }

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(buildCardDrawable(palette.surfaceAlt, palette.surfaceStroke, 24));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            card.setClipToOutline(true);
        }
        LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardParams.setMargins(dp(16), 0, dp(16), dp(12));
        card.setLayoutParams(cardParams);

        for (int i = 0; i < rows.size(); i++) {
            if (i > 0) {
                View divider = new View(this);
                divider.setBackgroundColor(palette.surfaceStroke);
                LinearLayout.LayoutParams divParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, dp(1));
                divParams.setMargins(dp(16), 0, dp(16), 0);
                card.addView(divider, divParams);
            }
            card.addView(rows.get(i));
        }

        section.addView(card);
        return section;
    }

    /**
     * Builds one row of a card: the text column on the left and an optional
     * trailing widget on the right. Every row of the screen goes through here,
     * so the padding, the ripple and the alignment stay the same everywhere.
     */
    private LinearLayout buildRow(LinearLayout textColumn, View trailingView) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(14), dp(16), dp(14));
        row.setClickable(true);
        row.setFocusable(true);
        row.setBackground(buildRippleDrawable(0));

        row.addView(textColumn);

        if (trailingView != null) {
            LinearLayout.LayoutParams trailingParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            trailingParams.leftMargin = dp(12);
            row.addView(trailingView, trailingParams);
        }

        return row;
    }

    /**
     * Builds the text column of a row: the title, and optionally a value, a
     * summary and a hint. The parts that a row does not use stay null.
     */
    private LinearLayout buildRowTextColumn(
            String title, String summary, String value, String hint,
            int titleColor, boolean boldTitle, boolean monospaceValue) {
        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);
        textCol.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextColor(titleColor);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        if (boldTitle) {
            tvTitle.setTypeface(Typeface.DEFAULT_BOLD);
        }
        textCol.addView(tvTitle);

        if (value != null) {
            TextView tvValue = new TextView(this);
            tvValue.setText(value);
            tvValue.setTextColor(palette.textSecondary);
            tvValue.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            if (monospaceValue) {
                tvValue.setTypeface(Typeface.MONOSPACE);
            }
            tvValue.setPadding(0, dp(3), 0, 0);
            textCol.addView(tvValue);
        }

        if (summary != null) {
            TextView tvSummary = new TextView(this);
            tvSummary.setText(summary);
            tvSummary.setTextColor(palette.textSecondary);
            tvSummary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            tvSummary.setPadding(0, dp(3), 0, 0);
            textCol.addView(tvSummary);
        }

        if (hint != null) {
            TextView tvHint = new TextView(this);
            tvHint.setText(hint);
            tvHint.setTextColor(palette.textDisabled);
            tvHint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            tvHint.setPadding(0, dp(2), 0, 0);
            textCol.addView(tvHint);
        }

        return textCol;
    }

    private View createToggleRow(
            String title, String summary, boolean isChecked, CompoundButton.OnCheckedChangeListener listener) {
        Switch switchView = new Switch(this);
        switchView.setTrackDrawable(new Material3SwitchTrackDrawable());
        switchView.setThumbDrawable(new Material3SwitchThumbDrawable());
        switchView.setSplitTrack(false);
        switchView.setChecked(isChecked);
        switchView.setOnCheckedChangeListener(listener);
        switchView.setClickable(false);
        switchView.setFocusable(false);

        LinearLayout row = buildRow(
                buildRowTextColumn(title, summary, null, null, palette.textPrimary, false, false),
                switchView);
        row.setOnClickListener(v -> switchView.toggle());

        return row;
    }

    private View createCopyRow(
            String title, String value, String hint, boolean monospace, final Runnable onCopyAction) {
        TextView chip = new TextView(this);
        chip.setText("Copy");
        chip.setTextColor(palette.accent);
        chip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        chip.setTypeface(Typeface.DEFAULT_BOLD);
        chip.setBackground(buildCardDrawable(palette.infoContainer, palette.surfaceStroke, 12));
        chip.setPadding(dp(10), dp(4), dp(10), dp(4));

        LinearLayout row = buildRow(
                buildRowTextColumn(title, null, value, hint, palette.textPrimary, false, monospace),
                chip);
        row.setOnClickListener(v -> {
            if (onCopyAction != null) {
                onCopyAction.run();
            }
        });

        return row;
    }

    private View createCommandRow(String title, String summary, final Runnable action) {
        LinearLayout row = buildRow(
                buildRowTextColumn(title, summary, null, null, palette.textPrimary, false, false),
                null);
        row.setOnClickListener(v -> {
            if (action != null) {
                action.run();
            }
        });

        return row;
    }

    private View createDetailRow(String title, String value, boolean monospace) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(16), dp(12), dp(16), dp(12));

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextColor(palette.textSecondary);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        row.addView(tvTitle);

        TextView tvValue = new TextView(this);
        tvValue.setText(value);
        tvValue.setTextColor(palette.textPrimary);
        tvValue.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        if (monospace) {
            tvValue.setTypeface(Typeface.MONOSPACE);
        }
        tvValue.setPadding(0, dp(3), 0, 0);
        row.addView(tvValue);

        return row;
    }

    private View createDangerRow(
            String title, String summary, final String dialogTitle, final String dialogMessage, final Runnable onConfirm) {
        LinearLayout row = buildRow(
                buildRowTextColumn(title, summary, null, null, COLOR_DANGER, true, false),
                null);
        row.setOnClickListener(v -> {
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setTitle(dialogTitle);
            builder.setMessage(dialogMessage);
            builder.setPositiveButton("Clear", (dialog, which) -> {
                if (onConfirm != null) {
                    onConfirm.run();
                }
            });
            builder.setNegativeButton("Cancel", null);
            AlertDialog dialog = builder.create();
            dialog.show();
            tintDialogButtons(dialog, COLOR_DANGER);
        });

        return row;
    }

    private View buildRowThumbnail(String thumbnailUri) {
        if (TextUtils.isEmpty(thumbnailUri)) {
            return null;
        }
        ImageView thumbnailView = new ImageView(this);
        thumbnailView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        thumbnailView.setBackground(buildCardDrawable(palette.surfaceAlt, palette.surfaceStroke, 10));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            thumbnailView.setClipToOutline(true);
        }
        thumbnailView.setImageResource(android.R.drawable.ic_menu_gallery);
        thumbnailView.setContentDescription("Image clip");

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(THUMBNAIL_SIZE_DP), dp(THUMBNAIL_SIZE_DP));
        params.rightMargin = dp(14);
        thumbnailView.setLayoutParams(params);

        bindThumbnail(thumbnailView, thumbnailUri);
        return thumbnailView;
    }

    private void bindThumbnail(final ImageView thumbnailView, final String thumbnailUri) {
        Bitmap cached = thumbnailCache.get(thumbnailUri);
        if (cached != null) {
            thumbnailView.setImageBitmap(cached);
            return;
        }
        thumbnailView.setTag(thumbnailUri);
        try {
            backgroundExecutor.execute(() -> {
                final Bitmap bitmap = decodeThumbnail(thumbnailUri);
                if (bitmap == null) {
                    return;
                }
                thumbnailCache.put(thumbnailUri, bitmap);
                runOnUiThread(() -> {
                    if (thumbnailUri.equals(thumbnailView.getTag())) {
                        thumbnailView.setImageBitmap(bitmap);
                    }
                });
            });
        } catch (RejectedExecutionException ignored) {
        }
    }

    private Bitmap decodeThumbnail(String thumbnailUri) {
        try {
            Uri uri = Uri.parse(thumbnailUri);
            int targetSize = dp(THUMBNAIL_SIZE_DP) * 2;
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            try (InputStream inputStream = getContentResolver().openInputStream(uri)) {
                if (inputStream == null) {
                    return null;
                }
                BitmapFactory.decodeStream(inputStream, null, bounds);
            }
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0) {
                return null;
            }
            BitmapFactory.Options decodeOptions = new BitmapFactory.Options();
            decodeOptions.inSampleSize = calculateInSampleSize(bounds, targetSize, targetSize);
            try (InputStream inputStream = getContentResolver().openInputStream(uri)) {
                if (inputStream == null) {
                    return null;
                }
                return BitmapFactory.decodeStream(inputStream, null, decodeOptions);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to decode thumbnail: " + thumbnailUri, throwable);
            return null;
        }
    }

    private static int calculateInSampleSize(BitmapFactory.Options options, int reqWidth, int reqHeight) {
        int height = options.outHeight;
        int width = options.outWidth;
        int inSampleSize = 1;
        if (height > reqHeight || width > reqWidth) {
            int halfHeight = height / 2;
            int halfWidth = width / 2;
            while ((halfHeight / inSampleSize) >= reqHeight && (halfWidth / inSampleSize) >= reqWidth) {
                inSampleSize *= 2;
            }
        }
        return inSampleSize;
    }

    private void openImageUri(String uriString) {
        if (TextUtils.isEmpty(uriString)) {
            return;
        }
        try {
            Uri uri = Uri.parse(uriString);
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setDataAndType(uri, "image/*");
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            startActivity(intent);
        } catch (Throwable t) {
            Log.w(TAG, "Failed to open image viewer", t);
            Toast.makeText(this, "No application available to open image.", Toast.LENGTH_SHORT).show();
        }
    }

    private void showFullClipDialog(GboardClipboardHistoryRepository.ClipboardEntry entry) {
        final String text = entry.getPasteableText();
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Clipboard entry");

        ScrollView scroll = new ScrollView(this);
        scroll.setPadding(dp(20), dp(12), dp(20), dp(12));

        TextView tv = new TextView(this);
        tv.setText(text);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        tv.setTextColor(palette.textPrimary);
        tv.setTextIsSelectable(true);
        scroll.addView(tv);

        builder.setView(scroll);
        builder.setPositiveButton("Copy", (dialog, which) -> {
            copyTextToClipboard("Clipboard entry", text, "Clipboard entry copied.", false);
        });
        builder.setNegativeButton("Close", null);
        AlertDialog dialog = builder.create();
        dialog.show();
        tintDialogButtons(dialog, palette.accent);
    }

    private void startExportHistory() {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("text/plain");
        intent.putExtra(Intent.EXTRA_TITLE, "gboard_clipboard_history.txt");
        try {
            startActivityForResult(intent, EXPORT_REQUEST_CODE);
        } catch (Throwable t) {
            Toast.makeText(this, "No document provider available to export file.", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == EXPORT_REQUEST_CODE && resultCode == RESULT_OK && data != null && data.getData() != null) {
            exportHistoryToFile(data.getData());
        }
    }

    private void exportHistoryToFile(Uri uri) {
        try (OutputStream os = getContentResolver().openOutputStream(uri)) {
            if (os == null) {
                Toast.makeText(this, "Failed to open export file.", Toast.LENGTH_SHORT).show();
                return;
            }
            boolean includeSensitive = GboardClipboardHistorySettings.isSensitiveIncluded(this);
            List<GboardClipboardHistoryRepository.ClipboardEntry> clips =
                    GboardClipboardHistoryRepository.loadHistory(this, includeSensitive, 500);
            StringBuilder sb = new StringBuilder();
            sb.append("# Gboard Clipboard History Export\n");
            sb.append("# Exported: ").append(new Date()).append("\n");
            sb.append("# Total entries: ").append(clips.size()).append("\n\n");
            for (GboardClipboardHistoryRepository.ClipboardEntry clip : clips) {
                sb.append("----------------------------------------\n");
                sb.append("Timestamp: ").append(new Date(clip.getTimestamp())).append("\n");
                if (clip.isSensitive()) {
                    sb.append("Sensitive: true\n");
                }
                if (!TextUtils.isEmpty(clip.getUri())) {
                    sb.append("URI: ").append(clip.getUri()).append("\n");
                }
                sb.append("Content:\n");
                sb.append(clip.getPasteableText()).append("\n\n");
            }
            os.write(sb.toString().getBytes(StandardCharsets.UTF_8));
            os.flush();
            Toast.makeText(this, "Exported " + clips.size() + " clips successfully.", Toast.LENGTH_LONG).show();
        } catch (Throwable t) {
            Log.e(TAG, "Failed to export clipboard history", t);
            Toast.makeText(this, "Export failed: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * Copies text to the clipboard.
     *
     * @param sensitive when true the clip is marked sensitive, so it does not
     *     show up in a clipboard preview and does not land in the history as a
     *     normal entry.
     */
    private void copyTextToClipboard(String label, String text, String toastMessage, boolean sensitive) {
        if (text == null) {
            return;
        }
        try {
            ClipboardManager cm = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm == null) {
                return;
            }
            if (sensitive) {
                ClipDescription description = new ClipDescription(
                        label, new String[]{ClipDescription.MIMETYPE_TEXT_PLAIN});
                PersistableBundle extras = new PersistableBundle();
                extras.putBoolean(ClipDescription.EXTRA_IS_SENSITIVE, true);
                description.setExtras(extras);
                cm.setPrimaryClip(new ClipData(description, new ClipData.Item(text)));
            } else {
                cm.setPrimaryClip(ClipData.newPlainText(label, text));
            }
            Toast.makeText(this, toastMessage, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            Log.w(TAG, "Failed to copy to clipboard", t);
        }
    }

    /**
     * Copies the access token and marks the clip as sensitive.
     *
     * The token grants read access to the whole history, so it must not end up
     * as a normal entry in the clipboard history or show up in a clipboard
     * preview on the screen.
     */
    private void copyAccessTokenToClipboard(String token) {
        copyTextToClipboard("Access token", token, "Access token copied.", true);
    }

    private void tintDialogButtons(AlertDialog dialog, int positiveColor) {
        if (dialog == null) return;
        try {
            if (dialog.getWindow() != null) {
                dialog.getWindow().setBackgroundDrawable(
                        buildCardDrawable(palette.surfaceAlt, palette.surfaceStroke, 24));
            }
            Button positive = dialog.getButton(DialogInterface.BUTTON_POSITIVE);
            if (positive != null) {
                positive.setTextColor(positiveColor != 0 ? positiveColor : palette.accent);
            }
            Button negative = dialog.getButton(DialogInterface.BUTTON_NEGATIVE);
            if (negative != null) {
                negative.setTextColor(palette.textSecondary);
            }
        } catch (Throwable ignored) {
        }
    }

    private boolean isImageEntry(GboardClipboardHistoryRepository.ClipboardEntry entry) {
        return TextUtils.isEmpty(entry.getPasteableText()) && !TextUtils.isEmpty(entry.getUri());
    }

    private String describeEntry(GboardClipboardHistoryRepository.ClipboardEntry entry) {
        if (isImageEntry(entry)) {
            return "Image clip";
        }
        String text = entry.getPasteableText();
        if (TextUtils.isEmpty(text)) {
            return "Untitled entry";
        }
        String singleLine = text.replace('\n', ' ').replace('\r', ' ').trim();
        if (singleLine.length() <= PREVIEW_LENGTH) {
            return singleLine;
        }
        return singleLine.substring(0, PREVIEW_LENGTH) + "…";
    }

    private String describeTimestamp(long timestamp) {
        if (timestamp <= 0L) {
            return "Unknown time";
        }
        long now = System.currentTimeMillis();
        long diff = Math.max(0, now - timestamp);
        if (diff < 60_000L) {
            return "Just now";
        }
        return DateUtils.getRelativeTimeSpanString(
                timestamp, now, DateUtils.MINUTE_IN_MILLIS, DateUtils.FORMAT_ABBREV_RELATIVE).toString();
    }

    private Drawable buildCardDrawable(int fillColor, int strokeColor, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fillColor);
        drawable.setCornerRadius(dp(radiusDp));
        if (strokeColor != 0) {
            drawable.setStroke(dp(1), strokeColor);
        }
        return drawable;
    }

    private Drawable buildRippleDrawable(int radiusDp) {
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        if (radiusDp > 0) {
            mask.setCornerRadius(dp(radiusDp));
        }
        return new RippleDrawable(
                ColorStateList.valueOf(palette.pressedOverlay),
                null,
                mask);
    }

    private static int blendAlpha(int color, float alpha) {
        int alphaInt = Math.round(Color.alpha(color) * Math.max(0f, Math.min(1f, alpha)));
        return (color & 0x00FFFFFF) | (alphaInt << 24);
    }

    private int dp(float dp) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, getResources().getDisplayMetrics()));
    }

    private static final class Palette {
        final int windowBackground;
        final int surfaceAlt;
        final int surfaceStroke;
        final int infoContainer;
        final int warningContainer;
        final int textPrimary;
        final int textSecondary;
        final int textDisabled;
        final int accent;
        final int pressedOverlay;

        Palette(int windowBackground, int surfaceAlt, int surfaceStroke,
                int infoContainer, int warningContainer, int textPrimary,
                int textSecondary, int textDisabled, int accent, int pressedOverlay) {
            this.windowBackground = windowBackground;
            this.surfaceAlt = surfaceAlt;
            this.surfaceStroke = surfaceStroke;
            this.infoContainer = infoContainer;
            this.warningContainer = warningContainer;
            this.textPrimary = textPrimary;
            this.textSecondary = textSecondary;
            this.textDisabled = textDisabled;
            this.accent = accent;
            this.pressedOverlay = pressedOverlay;
        }

        static Palette forContext(Context context, Configuration configuration) {
            boolean nightMode = (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;

            if (context != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                try {
                    // One set of roles, two sets of system colors. The night mode
                    // only picks the other resource, so the roles are defined once.
                    int windowBackground = context.getColor(nightMode
                            ? android.R.color.system_neutral1_900
                            : android.R.color.system_neutral1_50);
                    int surfaceAlt = nightMode
                            ? context.getColor(android.R.color.system_neutral1_800)
                            : Color.WHITE;
                    int surfaceStroke = blendAlpha(context.getColor(nightMode
                            ? android.R.color.system_neutral2_700
                            : android.R.color.system_neutral2_200), nightMode ? 0.35f : 0.5f);
                    int accent = context.getColor(nightMode
                            ? android.R.color.system_accent1_200
                            : android.R.color.system_accent1_600);
                    int textPrimary = context.getColor(nightMode
                            ? android.R.color.system_neutral1_100
                            : android.R.color.system_neutral1_900);
                    int rawSecondary = resolveThemeColor(context, android.R.attr.textColorSecondary,
                            context.getColor(nightMode
                                    ? android.R.color.system_neutral2_200
                                    : android.R.color.system_neutral2_700));
                    int textSecondary = blendAlpha(rawSecondary, nightMode ? 0.70f : 0.72f);
                    int textDisabled = blendAlpha(textSecondary, 0.45f);
                    int infoContainer = context.getColor(nightMode
                            ? android.R.color.system_accent1_800
                            : android.R.color.system_accent1_100);
                    int warningContainer = Color.parseColor(nightMode ? "#3F2D16" : "#FEF3C7");
                    int pressedOverlay = blendAlpha(accent, 0.15f);

                    return new Palette(
                            windowBackground, surfaceAlt, surfaceStroke,
                            infoContainer, warningContainer, textPrimary, textSecondary,
                            textDisabled, accent, pressedOverlay);
                } catch (Throwable ignored) {
                }
            }

            if (context != null) {
                try {
                    int themeBg = resolveThemeColor(context, android.R.attr.colorBackground,
                            nightMode ? Color.parseColor("#1D192B") : Color.parseColor("#FEF7FF"));
                    int themePrimary = resolveThemeColor(context, android.R.attr.colorAccent,
                            resolveThemeColor(context, android.R.attr.colorPrimary,
                                    nightMode ? Color.parseColor("#D0BCFF") : Color.parseColor("#6750A4")));
                    int themeTextPri = resolveThemeColor(context, android.R.attr.textColorPrimary,
                            nightMode ? Color.parseColor("#E6E0E9") : Color.parseColor("#1D1B20"));
                    int themeTextSec = blendAlpha(resolveThemeColor(context, android.R.attr.textColorSecondary,
                            nightMode ? Color.parseColor("#CAC4D0") : Color.parseColor("#49454F")), 0.72f);

                    return new Palette(
                            themeBg,
                            nightMode ? Color.parseColor("#2B243B") : Color.WHITE,
                            nightMode ? Color.parseColor("#1FFFFFFF") : Color.parseColor("#00000000"),
                            nightMode ? Color.parseColor("#381E72") : Color.parseColor("#EADDFF"),
                            nightMode ? Color.parseColor("#3F2D16") : Color.parseColor("#FEF3C7"),
                            themeTextPri,
                            themeTextSec,
                            blendAlpha(themeTextSec, 0.5f),
                            themePrimary,
                            blendAlpha(themePrimary, 0.15f));
                } catch (Throwable ignored) {
                }
            }

            if (nightMode) {
                return new Palette(
                        Color.parseColor("#1D192B"),
                        Color.parseColor("#2B243B"),
                        Color.parseColor("#1FFFFFFF"),
                        Color.parseColor("#381E72"),
                        Color.parseColor("#3F2D16"),
                        Color.parseColor("#E6E0E9"),
                        Color.parseColor("#CAC4D0"),
                        Color.parseColor("#938F99"),
                        Color.parseColor("#D0BCFF"),
                        Color.parseColor("#33D0BCFF"));
            }
            return new Palette(
                    Color.parseColor("#FEF7FF"),
                    Color.WHITE,
                    Color.parseColor("#00000000"),
                    Color.parseColor("#EADDFF"),
                    Color.parseColor("#FEF3C7"),
                    Color.parseColor("#1D1B20"),
                    Color.parseColor("#49454F"),
                    Color.parseColor("#79747E"),
                    Color.parseColor("#6750A4"),
                    Color.parseColor("#1F6750A4"));
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

    /**
     * Shared state handling for the Material 3 switch drawables.
     *
     * The track and the thumb follow the same checked and enabled states, so the
     * parsing of the state array and the alpha and color filter plumbing live
     * here instead of in both drawables.
     */
    private abstract static class Material3SwitchDrawable extends Drawable {
        private final List<Paint> paints = new ArrayList<>();
        protected boolean isChecked = false;
        protected boolean isEnabled = true;

        /**
         * Registers a paint that has to follow the alpha and the color filter.
         * The subclasses call this from their constructor, because a field of the
         * subclass cannot be handed to the supertype constructor.
         */
        protected void addPaint(Paint paint) {
            paints.add(paint);
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
        public void setAlpha(int alpha) {
            for (Paint paint : paints) {
                paint.setAlpha(alpha);
            }
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            for (Paint paint : paints) {
                paint.setColorFilter(colorFilter);
            }
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private final class Material3SwitchTrackDrawable extends Material3SwitchDrawable {
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        Material3SwitchTrackDrawable() {
            fillPaint.setStyle(Paint.Style.FILL);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeWidth(dp(2));
            addPaint(fillPaint);
            addPaint(strokePaint);
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
    }

    private final class Material3SwitchThumbDrawable extends Material3SwitchDrawable {
        private final Paint thumbPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint checkPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path checkPath = new Path();

        Material3SwitchThumbDrawable() {
            thumbPaint.setStyle(Paint.Style.FILL);
            checkPaint.setStyle(Paint.Style.STROKE);
            checkPaint.setStrokeCap(Paint.Cap.ROUND);
            checkPaint.setStrokeJoin(Paint.Join.ROUND);
            checkPaint.setStrokeWidth(dp(2.2f));
            addPaint(thumbPaint);
            addPaint(checkPaint);
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
    }
}
