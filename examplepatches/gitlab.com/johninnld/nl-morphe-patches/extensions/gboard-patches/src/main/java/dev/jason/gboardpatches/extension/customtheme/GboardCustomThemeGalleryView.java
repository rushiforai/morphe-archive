package dev.jason.gboardpatches.extension.customtheme;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.GridLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** Rboard pack tabs and two-column gallery matching the validated Android UI. */
final class GboardCustomThemeGalleryView {
    static final String SELECTED_PACK_KEY = "custom_theme_selected_pack_sha256";

    private final GboardPatchesSettingsContract.FeatureHost host;
    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newFixedThreadPool(2);
    private final AtomicBoolean busy = new AtomicBoolean(false);
    private final LinearLayout root;
    private final HorizontalScrollView tabScroller;
    private final LinearLayout tabs;
    private final GridLayout grid;
    private final TextView status;
    private final ProgressBar progress;
    private final List<Bitmap> previews = new ArrayList<Bitmap>();
    private List<GboardCustomThemeCatalog.Pack> packs = new ArrayList<GboardCustomThemeCatalog.Pack>();
    private GboardCustomThemeCatalog.Pack selectedPack;
    private View selectedTab;
    private boolean previewReady;
    private boolean previewDownloading;
    private boolean previewDownloadFailed;
    private boolean closed;

    GboardCustomThemeGalleryView(GboardPatchesSettingsContract.FeatureHost host) {
        this.host = host;
        context = host.getContext();
        int primaryText = resolveColor(android.R.attr.textColorPrimary,
                isNightMode() ? Color.WHITE : Color.BLACK);

        root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(0, 0, 0, dp(16));

        LinearLayout statusRow = new LinearLayout(context);
        statusRow.setOrientation(LinearLayout.HORIZONTAL);
        statusRow.setGravity(Gravity.CENTER_VERTICAL);
        statusRow.setPadding(dp(16), dp(6), dp(12), dp(8));
        progress = new ProgressBar(context);
        progress.setVisibility(View.INVISIBLE);
        statusRow.addView(progress, new LinearLayout.LayoutParams(dp(32), dp(32)));
        status = new TextView(context);
        status.setTextColor(primaryText);
        status.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        status.setSingleLine(true);
        status.setEllipsize(TextUtils.TruncateAt.MARQUEE);
        status.setMarqueeRepeatLimit(-1);
        status.setHorizontallyScrolling(true);
        status.setSelected(true);
        status.setPadding(dp(10), 0, dp(8), 0);
        statusRow.addView(status, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(statusRow, new LinearLayout.LayoutParams(-1, dp(52)));

        LinearLayout tabRow = new LinearLayout(context);
        tabRow.setOrientation(LinearLayout.HORIZONTAL);
        tabRow.setGravity(Gravity.CENTER_VERTICAL);
        tabRow.setPadding(dp(4), 0, dp(4), dp(2));
        tabRow.addView(buildPackPickerButton(primaryText),
                new LinearLayout.LayoutParams(dp(52), dp(48)));

        tabScroller = new HorizontalScrollView(context);
        tabScroller.setHorizontalScrollBarEnabled(false);
        tabScroller.setFillViewport(true);
        tabs = new LinearLayout(context);
        tabs.setOrientation(LinearLayout.HORIZONTAL);
        tabs.setGravity(Gravity.CENTER_VERTICAL);
        tabs.setPadding(dp(8), 0, dp(8), dp(6));
        tabScroller.addView(tabs, new HorizontalScrollView.LayoutParams(-2, -2));
        tabRow.addView(tabScroller, new LinearLayout.LayoutParams(0, -2, 1f));
        root.addView(tabRow);

        grid = new GridLayout(context);
        grid.setColumnCount(2);
        grid.setUseDefaultMargins(false);
        grid.setPadding(dp(8), dp(4), dp(8), dp(96));
        root.addView(grid, new LinearLayout.LayoutParams(-1, -2));
        load();
    }

    View getView() {
        return root;
    }

    void close() {
        if (closed) return;
        closed = true;
        // Keep already-posted completion callbacks alive: a committed apply must still request
        // the shared restart even when the user leaves the gallery before its callback runs.
        worker.shutdownNow();
        grid.removeAllViews();
        releasePreviews();
    }

    private void load() {
        try {
            packs = GboardCustomThemeCatalog.load(context);
            if (packs.isEmpty()) throw new IllegalStateException("Catalog is empty");
            String selected = GboardPatchesSettings.preferences(context)
                    .getString(SELECTED_PACK_KEY, "");
            selectedPack = packs.get(0);
            for (GboardCustomThemeCatalog.Pack pack : packs) {
                if (pack.sha256.equals(selected)) {
                    selectedPack = pack;
                    break;
                }
            }
            rebuildTabs();
            startPreviewDownload();
            rebuildGrid();
        } catch (Throwable failure) {
            status.setText(text(R.string.gboard_patches_custom_theme_catalog_failed));
        }
    }

    private View buildPackPickerButton(int color) {
        View button = new View(context) {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeWidth(dp(2));
            }

            @Override protected void onDraw(Canvas canvas) {
                super.onDraw(canvas);
                paint.setColor(color);
                float left = (getWidth() - dp(24)) / 2f;
                float top = (getHeight() - dp(24)) / 2f;
                canvas.drawLine(left + dp(5), top + dp(7),
                        left + dp(19), top + dp(7), paint);
                canvas.drawLine(left + dp(5), top + dp(12),
                        left + dp(19), top + dp(12), paint);
                canvas.drawLine(left + dp(5), top + dp(17),
                        left + dp(19), top + dp(17), paint);
            }
        };
        button.setContentDescription(text(R.string.gboard_patches_custom_theme_choose_pack));
        button.setOnClickListener(view -> invokeSafely(this::showPackChooser));
        return button;
    }

    private void rebuildTabs() {
        tabs.removeAllViews();
        selectedTab = null;
        int accent = resolveColor(android.R.attr.colorAccent, Color.rgb(66, 133, 244));
        int textColor = resolveColor(android.R.attr.textColorPrimary,
                isNightMode() ? Color.WHITE : Color.BLACK);
        for (GboardCustomThemeCatalog.Pack pack : packs) {
            TextView tab = new TextView(context);
            String marker = GboardCustomThemeRepository.isCachePresent(context, pack)
                    ? "✓ " : "";
            SpannableString label = new SpannableString(
                    marker + pack.name + " (" + pack.themes.size() + ")");
            if (!marker.isEmpty()) {
                label.setSpan(new ForegroundColorSpan(Color.rgb(46, 160, 67)),
                        0, marker.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            tab.setText(label);
            tab.setGravity(Gravity.CENTER);
            tab.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            tab.setPadding(dp(16), dp(10), dp(16), dp(10));
            boolean selected = pack == selectedPack;
            if (selected) selectedTab = tab;
            tab.setTextColor(selected ? accent : textColor);
            GradientDrawable background = new GradientDrawable();
            background.setColor(selected
                    ? Color.argb(36, Color.red(accent), Color.green(accent), Color.blue(accent))
                    : Color.TRANSPARENT);
            background.setCornerRadius(dp(18));
            tab.setBackground(background);
            tab.setOnClickListener(view -> invokeSafely(() -> selectPack(pack)));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, dp(44));
            params.setMargins(dp(4), 0, dp(4), 0);
            tabs.addView(tab, params);
        }
        tabScroller.post(this::scrollSelectedTabIntoView);
    }

    private void selectPack(GboardCustomThemeCatalog.Pack pack) {
        if (closed || busy.get()) return;
        if (pack == selectedPack) {
            tabScroller.post(this::scrollSelectedTabIntoView);
            return;
        }
        selectedPack = pack;
        GboardPatchesSettings.preferences(context).edit()
                .putString(SELECTED_PACK_KEY, pack.sha256).commit();
        rebuildTabs();
        rebuildGrid();
    }

    private void scrollSelectedTabIntoView() {
        if (closed || selectedTab == null) return;
        int target = Math.max(0, selectedTab.getLeft() - tabs.getPaddingLeft());
        int maximum = Math.max(0, tabs.getWidth() - tabScroller.getWidth());
        tabScroller.smoothScrollTo(Math.min(target, maximum), 0);
    }

    private void showPackChooser() {
        if (closed || packs.isEmpty()) return;
        String[] labels = new String[packs.size()];
        int checked = 0;
        for (int index = 0; index < packs.size(); index++) {
            GboardCustomThemeCatalog.Pack pack = packs.get(index);
            labels[index] = (GboardCustomThemeRepository.isCachePresent(context, pack)
                    ? "✓ " : "") + pack.name;
            if (pack == selectedPack) checked = index;
        }
        new AlertDialog.Builder(context)
                .setTitle(text(R.string.gboard_patches_custom_theme_choose_pack))
                .setSingleChoiceItems(labels, checked, (dialog, which) -> invokeSafely(() -> {
                    selectPack(packs.get(which));
                    dialog.dismiss();
                }))
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    void showDeletePacksDialog() {
        try {
            if (closed) return;
            List<GboardCustomThemeCatalog.Pack> cached = new ArrayList<GboardCustomThemeCatalog.Pack>();
            for (GboardCustomThemeCatalog.Pack pack : packs) {
                if (GboardCustomThemeRepository.isCachePresent(context, pack)) cached.add(pack);
            }
            if (cached.isEmpty()) {
                Toast.makeText(context, text(R.string.gboard_patches_custom_theme_no_downloads),
                        Toast.LENGTH_SHORT).show();
                return;
            }
            String[] labels = new String[cached.size()];
            boolean[] checked = new boolean[cached.size()];
            for (int index = 0; index < cached.size(); index++) {
                GboardCustomThemeCatalog.Pack pack = cached.get(index);
                labels[index] = pack.name + " (" + formatBytes(pack.bytes) + ")";
            }
            AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(text(R.string.gboard_patches_custom_theme_delete_downloads))
                .setMultiChoiceItems(labels, checked,
                        (ignored, which, selected) -> invokeSafely(
                                () -> checked[which] = selected))
                .setNeutralButton(text(R.string.gboard_patches_custom_theme_select_all), null)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton(text(R.string.gboard_patches_custom_theme_delete),
                        (ignored, which) -> invokeSafely(() -> {
                            int removed = 0;
                            for (int index = 0; index < cached.size(); index++) {
                                if (checked[index]) {
                                    removed += GboardCustomThemeRepository.deletePackCache(
                                            context, cached.get(index));
                                }
                            }
                            rebuildTabs();
                            refreshStatus();
                            Toast.makeText(context, GboardSettingsText.format(context,
                                    R.string.gboard_patches_custom_theme_deleted, removed),
                                    Toast.LENGTH_SHORT).show();
                        }))
                .create();
            dialog.setOnShowListener(ignored -> invokeSafely(() -> dialog.getButton(
                    AlertDialog.BUTTON_NEUTRAL).setOnClickListener(view -> invokeSafely(() -> {
                        for (int index = 0; index < checked.length; index++) {
                            checked[index] = true;
                            dialog.getListView().setItemChecked(index, true);
                        }
                    }))));
            dialog.show();
        } catch (Throwable ignored) {
            // A stale host/dialog must not take down the settings activity.
        }
    }

    private void rebuildGrid() {
        grid.removeAllViews();
        releasePreviews();
        refreshStatus();
        int width = Math.max(dp(148),
                (context.getResources().getDisplayMetrics().widthPixels - dp(42)) / 2);
        for (GboardCustomThemeCatalog.Theme theme : selectedPack.themes) {
            View card = createThemeCard(theme, width);
            GridLayout.LayoutParams params = new GridLayout.LayoutParams();
            params.width = width;
            params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            params.setMargins(dp(5), dp(5), dp(5), dp(5));
            grid.addView(card, params);
        }
    }

    private void startPreviewDownload() {
        if (closed) return;
        previewReady = GboardCustomThemePreviewRepository.isInstalled(context);
        if (previewReady) {
            previewDownloadFailed = false;
            return;
        }
        previewDownloadFailed = false;
        previewDownloading = true;
        progress.setIndeterminate(true);
        progress.setVisibility(View.VISIBLE);
        status.setText(text(R.string.gboard_patches_custom_theme_preview_downloading));
        worker.execute(() -> {
            try {
                GboardCustomThemePreviewRepository.ensureInstalled(context,
                        new GboardCustomThemePreviewRepository.Progress() {
                            @Override
                            public void update(long downloaded, long total) {
                                postSafely(() -> updatePreviewDownloadProgress(downloaded, total));
                            }

                            @Override
                            public void preparing() {
                                postSafely(() -> {
                                    if (closed || busy.get()) return;
                                    progress.setIndeterminate(true);
                                    status.setText(text(
                                            R.string.gboard_patches_custom_theme_preview_preparing));
                                });
                            }
                        });
                postSafely(() -> {
                    if (closed) return;
                    previewReady = true;
                    previewDownloading = false;
                    previewDownloadFailed = false;
                    if (!busy.get()) progress.setVisibility(View.INVISIBLE);
                    rebuildGrid();
                });
            } catch (Throwable failure) {
                postSafely(() -> {
                    if (closed) return;
                    previewReady = false;
                    previewDownloading = false;
                    previewDownloadFailed = true;
                    if (busy.get()) return;
                    progress.setVisibility(View.INVISIBLE);
                    status.setText(text(R.string.gboard_patches_custom_theme_preview_failed));
                });
            }
        });
    }

    private void updatePreviewDownloadProgress(long downloaded, long total) {
        if (closed || busy.get()) return;
        if (total <= 0L) {
            progress.setIndeterminate(true);
            status.setText(text(R.string.gboard_patches_custom_theme_preview_downloading));
            return;
        }
        int percent = (int) Math.min(100L, downloaded * 100L / total);
        progress.setIndeterminate(false);
        progress.setMax(100);
        progress.setProgress(percent);
        status.setText(GboardSettingsText.format(context,
                R.string.gboard_patches_custom_theme_preview_download_progress, percent));
    }

    private View createThemeCard(GboardCustomThemeCatalog.Theme theme, int width) {
        int textColor = resolveColor(android.R.attr.textColorPrimary,
                isNightMode() ? Color.WHITE : Color.BLACK);
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(8), dp(8), dp(8), dp(8));
        GradientDrawable background = new GradientDrawable();
        background.setColor(resolveColor(android.R.attr.colorBackgroundFloating,
                isNightMode() ? Color.rgb(38, 38, 38) : Color.rgb(245, 245, 245)));
        background.setCornerRadius(dp(16));
        card.setBackground(background);

        Bitmap bitmap = decodePreview(theme.previewAsset, width - dp(16));
        ImageView image = new ImageView(context);
        image.setScaleType(bitmap == null
                ? ImageView.ScaleType.CENTER : ImageView.ScaleType.CENTER_CROP);
        if (bitmap == null) {
            image.setImageResource(android.R.drawable.ic_menu_gallery);
        } else {
            previews.add(bitmap);
            image.setImageBitmap(bitmap);
        }
        card.addView(image, new LinearLayout.LayoutParams(-1, dp(116)));

        TextView name = new TextView(context);
        name.setText(theme.name);
        name.setTextColor(textColor);
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        name.setMaxLines(2);
        name.setPadding(dp(4), dp(8), dp(4), 0);
        card.addView(name);

        TextView pack = new TextView(context);
        pack.setText((GboardCustomThemeRepository.isCachePresent(context, selectedPack)
                ? "✓ " : "") + selectedPack.name);
        pack.setTextColor(textColor);
        pack.setAlpha(0.68f);
        pack.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        pack.setPadding(dp(4), dp(3), dp(4), dp(2));
        card.addView(pack);
        card.setClickable(true);
        card.setFocusable(true);
        card.setContentDescription(GboardSettingsText.format(context,
                R.string.gboard_patches_custom_theme_apply, theme.name));
        card.setOnClickListener(view -> invokeSafely(() -> apply(theme)));
        return card;
    }

    private void apply(GboardCustomThemeCatalog.Theme theme) {
        if (closed || !busy.compareAndSet(false, true)) return;
        if (!GboardCustomThemeSettings.readEnabled(GboardPatchesSettings.preferences(context))) {
            busy.set(false);
            return;
        }
        final GboardCustomThemeCatalog.Pack pack = selectedPack;
        GboardPatchesSettings.preferences(context).edit()
                .putString(SELECTED_PACK_KEY, pack.sha256).commit();
        boolean cached = GboardCustomThemeRepository.isCached(context, pack);
        progress.setIndeterminate(cached);
        progress.setVisibility(View.VISIBLE);
        status.setText(GboardSettingsText.format(context,
                cached ? R.string.gboard_patches_custom_theme_applying
                        : R.string.gboard_patches_custom_theme_downloading,
                cached ? theme.name : pack.name));
        worker.execute(() -> {
            try {
                File inner = GboardCustomThemeRepository.extractTheme(context, pack, theme,
                        (done, total) -> postSafely(
                                () -> updateDownloadProgress(pack, done, total)));
                GboardCustomThemeInstaller.install(context, inner, theme.preferKeyBorder);
                postSafely(() -> handleCommittedInstall(theme.name));
            } catch (Throwable failure) {
                postSafely(() -> {
                    if (closed) return;
                    busy.set(false);
                    progress.setVisibility(View.INVISIBLE);
                    status.setText(GboardSettingsText.format(context,
                            R.string.gboard_patches_custom_theme_failed, theme.name));
                    Toast.makeText(context,
                            text(R.string.gboard_patches_custom_theme_failed_toast),
                            Toast.LENGTH_LONG).show();
                });
            }
        });
    }

    void handleCommittedInstall(String themeName) {
        // Restart after a committed install even if the gallery was closed while the worker was
        // downloading. UI feedback is best-effort only.
        try {
            GboardPatchesSettingsContract.requestTargetRestart(host);
        } catch (Throwable ignored) {
            // The shared restart path must not crash the host process.
        }
        if (closed) return;
        try {
            busy.set(false);
            progress.setVisibility(View.INVISIBLE);
            Toast.makeText(context, GboardSettingsText.format(context,
                    R.string.gboard_patches_custom_theme_applied, themeName),
                    Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // UI feedback is optional after the restart request succeeds.
        }
    }

    private void updateDownloadProgress(GboardCustomThemeCatalog.Pack pack,
            long downloaded, long total) {
        if (closed) return;
        long effectiveTotal = total > 0 ? total : pack.bytes;
        int percent = effectiveTotal > 0
                ? (int) Math.min(100L, downloaded * 100L / effectiveTotal) : 0;
        progress.setIndeterminate(false);
        progress.setMax(100);
        progress.setProgress(percent);
        status.setText(GboardSettingsText.format(context,
                R.string.gboard_patches_custom_theme_download_progress,
                pack.name, percent));
    }

    private void refreshStatus() {
        if (selectedPack == null || previewDownloading || busy.get()) return;
        if (previewDownloadFailed) {
            status.setText(text(R.string.gboard_patches_custom_theme_preview_failed));
            return;
        }
        status.setText(GboardSettingsText.format(context,
                R.string.gboard_patches_custom_theme_pack_loaded,
                selectedPack.name, selectedPack.themes.size(), formatBytes(selectedPack.bytes)));
    }

    private Bitmap decodePreview(String assetPath, int targetWidth) {
        if (!previewReady || assetPath == null || assetPath.isEmpty()) return null;
        try {
            File preview = GboardCustomThemePreviewRepository.resolve(context, assetPath);
            if (preview == null) return null;
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            try (FileInputStream input = new FileInputStream(preview)) {
                BitmapFactory.decodeStream(input, null, bounds);
            }
            int sample = 1;
            while (bounds.outWidth / sample > targetWidth * 2) sample *= 2;
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = Math.max(1, sample);
            options.inPreferredConfig = Bitmap.Config.RGB_565;
            try (FileInputStream input = new FileInputStream(preview)) {
                return BitmapFactory.decodeStream(input, null, options);
            }
        } catch (Throwable ignored) {
            return null;
        }
    }

    private void releasePreviews() {
        // A detached ImageView or RenderThread may retain the previous frame. Let GC reclaim the
        // bitmaps instead of manually recycling memory Android can still be drawing.
        previews.clear();
    }

    private static String formatBytes(long bytes) {
        if (bytes >= 1_000_000L) {
            return String.format(Locale.US, "%.2fMB", bytes / 1_000_000d);
        }
        return Math.max(1L, Math.round(bytes / 1_000d)) + "KB";
    }

    private int resolveColor(int attribute, int fallback) {
        TypedValue value = new TypedValue();
        if (context.getTheme().resolveAttribute(attribute, value, true)) {
            if (value.resourceId != 0) {
                try {
                    return context.getColor(value.resourceId);
                } catch (Throwable ignored) {
                    return fallback;
                }
            }
            return value.data;
        }
        return fallback;
    }

    private boolean isNightMode() {
        return (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    private int dp(int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private String text(int id) {
        return GboardSettingsText.get(context, id);
    }

    /** Contains host-owned click/dialog callbacks so a UI edge case cannot escape into Gboard. */
    private void invokeSafely(Runnable callback) {
        try {
            callback.run();
        } catch (Throwable ignored) {
            // Custom Theme is optional; fail closed when a host callback or dialog is stale.
        }
    }

    private void postSafely(Runnable callback) {
        main.post(() -> invokeSafely(callback));
    }
}
