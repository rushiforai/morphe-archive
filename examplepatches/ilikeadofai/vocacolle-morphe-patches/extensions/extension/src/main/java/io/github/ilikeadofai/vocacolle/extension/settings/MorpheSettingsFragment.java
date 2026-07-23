package io.github.ilikeadofai.vocacolle.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import io.github.ilikeadofai.vocacolle.extension.cache.MorpheCache;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.Locale;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Preferences for runtime features supplied by the VocaColle Morphe extension. */
@SuppressWarnings({"deprecation", "SetTextI18n"})
public final class MorpheSettingsFragment extends Fragment {
    private static final ThreadPoolExecutor CACHE_EXECUTOR = createCacheExecutor();

    private SettingsStore settingsStore;
    private Switch runtimeFeaturesSwitch;
    private TextView cacheSummaryView;
    private View clearCacheRow;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Activity activity = getActivity();
        if (activity == null) {
            throw new IllegalStateException("Morphe settings fragment is not attached");
        }
        settingsStore = SettingsStore.from(activity);
    }

    @Override
    public View onCreateView(
            LayoutInflater inflater,
            ViewGroup container,
            Bundle savedInstanceState
    ) {
        Activity activity = getActivity();
        if (activity == null) {
            throw new IllegalStateException("Morphe settings fragment is not attached");
        }

        MorpheSettingsStrings strings = MorpheSettingsStrings.resolve(
                settingsStore.getDisplayLanguage(),
                Locale.getDefault().getLanguage()
        );
        MorpheSettingsTheme.Palette palette = MorpheSettingsTheme.resolve(activity);
        MorpheSettingsTheme.applySystemBars(activity, palette);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(palette.background);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));

        LinearLayout topBar = createTopBar(activity, strings.settingsTitle, palette);
        root.addView(topBar);
        root.addView(createDivider(activity, palette, 0));

        ScrollView scrollView = new ScrollView(activity);
        scrollView.setFillViewport(true);
        scrollView.setClipToPadding(false);
        scrollView.setBackgroundColor(palette.background);
        root.addView(scrollView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                0,
                1f
        ));

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, 0, 0, dp(activity, 28));
        scrollView.addView(content, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        addSectionTitle(content, strings.generalCategory, palette, true);

        RowViews languageRow = createSettingRow(
                activity,
                strings.displayLanguageTitle,
                selectedLanguageLabel(settingsStore.getDisplayLanguage(), strings),
                palette,
                true,
                createChevron(activity, palette)
        );
        languageRow.root.setOnClickListener(ignored ->
                showLanguageDialog(activity, strings, palette)
        );
        content.addView(languageRow.root);
        content.addView(createDivider(activity, palette, dp(activity, 20)));

        runtimeFeaturesSwitch = new Switch(activity);
        runtimeFeaturesSwitch.setChecked(settingsStore.areRuntimeFeaturesEnabled());
        tintSwitch(runtimeFeaturesSwitch, palette);
        RowViews runtimeRow = createSettingRow(
                activity,
                strings.runtimeFeaturesTitle,
                strings.runtimeFeaturesSummary,
                palette,
                true,
                runtimeFeaturesSwitch
        );
        runtimeRow.root.setOnClickListener(ignored ->
                runtimeFeaturesSwitch.setChecked(!runtimeFeaturesSwitch.isChecked())
        );
        runtimeFeaturesSwitch.setOnCheckedChangeListener((ignored, checked) ->
                settingsStore.setRuntimeFeaturesEnabled(checked)
        );
        content.addView(runtimeRow.root);
        content.addView(createDivider(activity, palette, dp(activity, 20)));

        RowViews diagnostics = createSettingRow(
                activity,
                strings.diagnosticsTitle,
                strings.diagnosticsSummary,
                palette,
                false,
                null
        );
        content.addView(diagnostics.root);

        addSectionTitle(content, strings.storageCategory, palette, false);

        final MorpheCache cache = openCache(activity);
        final CacheIoActions cacheActions = cache == null ? null : new CacheIoActions() {
            @Override
            public long sizeBytes() throws IOException {
                return cache.sizeBytes();
            }

            @Override
            public void clear() throws IOException {
                cache.clear();
            }
        };
        String initialCacheSummary;
        if (cacheActions == null) {
            initialCacheSummary = strings.cacheClearFailedMessage;
        } else {
            initialCacheSummary = formatCacheSummary(0L, strings);
        }
        RowViews cacheInfo = createSettingRow(
                activity,
                strings.cacheTitle,
                initialCacheSummary,
                palette,
                false,
                null
        );
        cacheSummaryView = cacheInfo.summary;
        content.addView(cacheInfo.root);
        content.addView(createDivider(activity, palette, dp(activity, 20)));
        if (cacheActions != null) {
            loadCacheSizeAsync(
                    CACHE_EXECUTOR,
                    weakUiExecutor(activity),
                    cacheActions,
                    new CacheUiResult(this, activity, cacheSummaryView, null, strings, false)
            );
        }

        RowViews clearCache = createSettingRow(
                activity,
                strings.clearCacheTitle,
                strings.clearCacheSummary,
                palette,
                cacheActions != null,
                null
        );
        clearCacheRow = clearCache.root;
        setRowEnabled(clearCacheRow, cacheActions != null);
        clearCacheRow.setOnClickListener(ignored -> {
            if (cacheActions == null) return;
            setRowEnabled(clearCacheRow, false);
            clearCacheAsync(
                    CACHE_EXECUTOR,
                    weakUiExecutor(activity),
                    cacheActions,
                    new CacheUiResult(
                            this,
                            activity,
                            cacheSummaryView,
                            clearCacheRow,
                            strings,
                            true
                    )
            );
        });
        content.addView(clearCache.root);

        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int statusBar = insets.getSystemWindowInsetTop();
            int navigationBar = insets.getSystemWindowInsetBottom();
            LinearLayout.LayoutParams topBarParams = (LinearLayout.LayoutParams) topBar.getLayoutParams();
            topBarParams.height = dp(activity, 56) + statusBar;
            topBar.setLayoutParams(topBarParams);
            topBar.setPadding(dp(activity, 4), statusBar, dp(activity, 16), 0);
            root.setPadding(0, 0, 0, navigationBar);
            return insets;
        });
        root.requestApplyInsets();
        return root;
    }

    @Override
    public void onResume() {
        super.onResume();
        if (runtimeFeaturesSwitch != null && settingsStore != null) {
            runtimeFeaturesSwitch.setChecked(settingsStore.areRuntimeFeaturesEnabled());
        }
    }

    @Override
    public void onDestroyView() {
        runtimeFeaturesSwitch = null;
        cacheSummaryView = null;
        clearCacheRow = null;
        super.onDestroyView();
    }

    private void showLanguageDialog(
            Activity activity,
            MorpheSettingsStrings strings,
            MorpheSettingsTheme.Palette palette
    ) {
        int checked = languageIndex(settingsStore.getDisplayLanguage(), strings);
        int dialogTheme = palette.dark
                ? android.R.style.Theme_Material_Dialog_Alert
                : android.R.style.Theme_Material_Light_Dialog_Alert;
        AlertDialog dialog = new AlertDialog.Builder(activity, dialogTheme)
                .setTitle(strings.displayLanguageTitle)
                .setSingleChoiceItems(strings.displayLanguageEntries, checked, null)
                .setNegativeButton(android.R.string.cancel, null)
                .create();
        dialog.setOnShowListener(ignored -> dialog.getListView().setOnItemClickListener(
                (parent, view, position, id) -> {
                    if (position < 0 || position >= strings.displayLanguageEntryValues.length) {
                        return;
                    }
                    handleDisplayLanguageChange(
                            strings.displayLanguageEntryValues[position],
                            settingsStore,
                            new LanguageChangeActions() {
                                @Override
                                public void apply(DisplayLanguage language) {
                                    AppLanguageController.apply(activity, language);
                                }

                                @Override
                                public void recreateHost() {
                                    activity.recreate();
                                }
                            }
                    );
                    dialog.dismiss();
                }
        ));
        dialog.show();
    }

    private static String selectedLanguageLabel(
            DisplayLanguage language,
            MorpheSettingsStrings strings
    ) {
        int index = languageIndex(language, strings);
        return strings.displayLanguageEntries[index];
    }

    private static int languageIndex(
            DisplayLanguage language,
            MorpheSettingsStrings strings
    ) {
        String value = language.persistedValue();
        for (int index = 0; index < strings.displayLanguageEntryValues.length; index++) {
            if (value.equals(strings.displayLanguageEntryValues[index])) {
                return index;
            }
        }
        return 0;
    }

    private static LinearLayout createTopBar(
            Activity activity,
            String title,
            MorpheSettingsTheme.Palette palette
    ) {
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(activity, 4), 0, dp(activity, 16), 0);
        bar.setBackgroundColor(palette.appBar);
        bar.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(activity, 56)
        ));

        ImageButton back = new ImageButton(activity);
        back.setContentDescription("Back");
        back.setImageDrawable(new BackArrowDrawable(palette.primaryText, dp(activity, 24)));
        back.setBackground(createRipple(palette));
        back.setPadding(dp(activity, 12), dp(activity, 12), dp(activity, 12), dp(activity, 12));
        back.setOnClickListener(ignored -> activity.onBackPressed());
        bar.addView(back, new LinearLayout.LayoutParams(dp(activity, 48), dp(activity, 48)));

        TextView titleView = new TextView(activity);
        titleView.setText(title);
        titleView.setTextColor(palette.primaryText);
        titleView.setTextSize(20);
        titleView.setGravity(Gravity.CENTER_VERTICAL);
        titleView.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.MATCH_PARENT,
                1f
        );
        titleParams.leftMargin = dp(activity, 8);
        bar.addView(titleView, titleParams);
        return bar;
    }

    private static void addSectionTitle(
            LinearLayout parent,
            String title,
            MorpheSettingsTheme.Palette palette,
            boolean first
    ) {
        Context context = parent.getContext();
        TextView section = new TextView(context);
        section.setText(title);
        section.setTextColor(palette.accent);
        section.setTextSize(14);
        section.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        section.setGravity(Gravity.CENTER_VERTICAL);
        section.setPadding(dp(context, 20), 0, dp(context, 20), 0);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(context, 40)
        );
        params.topMargin = dp(context, first ? 8 : 20);
        parent.addView(section, params);
    }

    private static RowViews createSettingRow(
            Context context,
            String title,
            String summary,
            MorpheSettingsTheme.Palette palette,
            boolean clickable,
            View trailing
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(context, 20), dp(context, 13), dp(context, 16), dp(context, 13));
        row.setMinimumHeight(dp(context, summary == null ? 56 : 72));
        row.setBackground(clickable ? createRipple(palette) : new ColorDrawable(Color.TRANSPARENT));
        row.setClickable(clickable);
        row.setFocusable(clickable);

        LinearLayout textColumn = new LinearLayout(context);
        textColumn.setOrientation(LinearLayout.VERTICAL);
        textColumn.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(textColumn, new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f
        ));

        TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextColor(palette.primaryText);
        titleView.setTextSize(16);
        titleView.setGravity(Gravity.START);
        textColumn.addView(titleView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        TextView summaryView = new TextView(context);
        if (summary == null || summary.isEmpty()) {
            summaryView.setVisibility(View.GONE);
        } else {
            summaryView.setText(summary);
        }
        summaryView.setTextColor(palette.secondaryText);
        summaryView.setTextSize(14);
        summaryView.setLineSpacing(dp(context, 2), 1f);
        LinearLayout.LayoutParams summaryParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        summaryParams.topMargin = dp(context, 3);
        textColumn.addView(summaryView, summaryParams);

        if (trailing != null) {
            LinearLayout.LayoutParams trailingParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            trailingParams.leftMargin = dp(context, 16);
            row.addView(trailing, trailingParams);
        }
        return new RowViews(row, summaryView);
    }

    private static TextView createChevron(
            Context context,
            MorpheSettingsTheme.Palette palette
    ) {
        TextView chevron = new TextView(context);
        chevron.setText("›");
        chevron.setTextColor(palette.secondaryText);
        chevron.setTextSize(28);
        chevron.setGravity(Gravity.CENTER);
        return chevron;
    }

    private static View createDivider(
            Context context,
            MorpheSettingsTheme.Palette palette,
            int leftInset
    ) {
        FrameLayout holder = new FrameLayout(context);
        holder.setPadding(leftInset, 0, 0, 0);
        View line = new View(context);
        line.setBackgroundColor(palette.divider);
        holder.addView(line, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                Math.max(1, dp(context, 1))
        ));
        holder.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                Math.max(1, dp(context, 1))
        ));
        return holder;
    }

    private static Drawable createRipple(MorpheSettingsTheme.Palette palette) {
        return new RippleDrawable(
                ColorStateList.valueOf(palette.pressed),
                new ColorDrawable(Color.TRANSPARENT),
                new ColorDrawable(Color.WHITE)
        );
    }

    private static void tintSwitch(
            Switch toggle,
            MorpheSettingsTheme.Palette palette
    ) {
        int[][] states = new int[][]{
                new int[]{android.R.attr.state_checked},
                new int[]{-android.R.attr.state_checked}
        };
        int uncheckedThumb = palette.dark ? Color.rgb(189, 189, 189) : Color.rgb(117, 117, 117);
        toggle.setThumbTintList(new ColorStateList(states, new int[]{palette.accent, uncheckedThumb}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{
                Color.argb(110, Color.red(palette.accent), Color.green(palette.accent), Color.blue(palette.accent)),
                palette.dark ? Color.argb(70, 255, 255, 255) : Color.argb(55, 0, 0, 0)
        }));
    }

    private static void setRowEnabled(View row, boolean enabled) {
        row.setEnabled(enabled);
        row.setClickable(enabled);
        row.setAlpha(enabled ? 1f : 0.45f);
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static final class RowViews {
        private final View root;
        private final TextView summary;

        private RowViews(View root, TextView summary) {
            this.root = root;
            this.summary = summary;
        }
    }

    private static final class BackArrowDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int size;

        private BackArrowDrawable(int color, int size) {
            this.size = size;
            paint.setColor(color);
            paint.setStrokeWidth(Math.max(2f, size / 11f));
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.SQUARE);
            paint.setStrokeJoin(Paint.Join.MITER);
        }

        @Override
        public void draw(Canvas canvas) {
            float centerY = getBounds().exactCenterY();
            float left = getBounds().left + size * 0.22f;
            float right = getBounds().right - size * 0.18f;
            float offset = size * 0.28f;
            canvas.drawLine(right, centerY, left, centerY, paint);
            canvas.drawLine(left, centerY, left + offset, centerY - offset, paint);
            canvas.drawLine(left, centerY, left + offset, centerY + offset, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }
    }

    static boolean handleDisplayLanguageChange(
            Object newValue,
            SettingsStore store,
            LanguageChangeActions actions
    ) {
        if (!(newValue instanceof String)) {
            return false;
        }
        String persistedValue = (String) newValue;
        DisplayLanguage language = DisplayLanguage.fromPersistedValue(persistedValue);
        if (!language.persistedValue().equals(persistedValue)) {
            return false;
        }
        try {
            actions.apply(language);
        } catch (RuntimeException failure) {
            return false;
        }
        store.setDisplayLanguage(language);
        actions.recreateHost();
        return true;
    }

    static boolean handleClearCache(CacheActions actions) {
        try {
            actions.clear();
            return true;
        } catch (IOException failure) {
            return false;
        }
    }

    static ThreadPoolExecutor createCacheExecutor() {
        return new ThreadPoolExecutor(
                1,
                1,
                0L,
                TimeUnit.MILLISECONDS,
                new ArrayBlockingQueue<>(8),
                task -> {
                    Thread thread = new Thread(task, "morphe-cache-io");
                    thread.setDaemon(true);
                    return thread;
                },
                new ThreadPoolExecutor.AbortPolicy()
        );
    }

    private static Executor weakUiExecutor(Activity activity) {
        WeakReference<Activity> activityReference = new WeakReference<>(activity);
        return task -> {
            Activity currentActivity = activityReference.get();
            if (currentActivity != null) currentActivity.runOnUiThread(task);
        };
    }

    static void loadCacheSizeAsync(
            Executor backgroundExecutor,
            Executor uiExecutor,
            CacheIoActions cache,
            CacheResultActions result
    ) {
        runCacheOperationAsync(backgroundExecutor, uiExecutor, cache, result, false);
    }

    static void clearCacheAsync(
            Executor backgroundExecutor,
            Executor uiExecutor,
            CacheIoActions cache,
            CacheResultActions result
    ) {
        runCacheOperationAsync(backgroundExecutor, uiExecutor, cache, result, true);
    }

    private static void runCacheOperationAsync(
            Executor backgroundExecutor,
            Executor uiExecutor,
            CacheIoActions cache,
            CacheResultActions result,
            boolean clearFirst
    ) {
        Runnable work = () -> {
            boolean success = true;
            if (clearFirst) {
                try {
                    cache.clear();
                } catch (IOException | RuntimeException failure) {
                    success = false;
                }
            }
            long sizeBytes = 0L;
            try {
                sizeBytes = cache.sizeBytes();
            } catch (IOException | RuntimeException failure) {
                success = false;
            }
            final boolean completedSuccessfully = success;
            final long completedSizeBytes = sizeBytes;
            uiExecutor.execute(() -> result.complete(completedSuccessfully, completedSizeBytes));
        };
        try {
            backgroundExecutor.execute(work);
        } catch (RejectedExecutionException rejected) {
            uiExecutor.execute(() -> result.complete(false, 0L));
        }
    }

    static String formatCacheSize(long bytes) {
        long safeBytes = Math.max(0L, bytes);
        if (safeBytes < 1024L) {
            return safeBytes + " B";
        }
        if (safeBytes < 1024L * 1024L) {
            return String.format(Locale.ROOT, "%.1f KiB", safeBytes / 1024.0);
        }
        if (safeBytes < 1024L * 1024L * 1024L) {
            return String.format(Locale.ROOT, "%.1f MiB", safeBytes / (1024.0 * 1024.0));
        }
        return String.format(Locale.ROOT, "%.1f GiB", safeBytes / (1024.0 * 1024.0 * 1024.0));
    }

    private static MorpheCache openCache(Activity activity) {
        try {
            return MorpheCache.openDefault(activity.getCacheDir());
        } catch (IOException failure) {
            return null;
        }
    }

    private static String formatCacheSummary(long sizeBytes, MorpheSettingsStrings strings) {
        return String.format(
                Locale.ROOT,
                strings.cacheSummaryFormat,
                formatCacheSize(sizeBytes),
                formatCacheSize(MorpheCache.DEFAULT_MAX_TOTAL_BYTES)
        );
    }

    private static final class CacheUiResult implements CacheResultActions {
        private final WeakReference<MorpheSettingsFragment> fragmentReference;
        private final WeakReference<Activity> activityReference;
        private final WeakReference<TextView> cacheSummaryReference;
        private final WeakReference<View> clearCacheReference;
        private final MorpheSettingsStrings strings;
        private final boolean showToast;

        private CacheUiResult(
                MorpheSettingsFragment fragment,
                Activity activity,
                TextView cacheSummary,
                View clearCache,
                MorpheSettingsStrings strings,
                boolean showToast
        ) {
            fragmentReference = new WeakReference<>(fragment);
            activityReference = new WeakReference<>(activity);
            cacheSummaryReference = new WeakReference<>(cacheSummary);
            clearCacheReference = new WeakReference<>(clearCache);
            this.strings = strings;
            this.showToast = showToast;
        }

        @Override
        public void complete(boolean success, long sizeBytes) {
            MorpheSettingsFragment fragment = fragmentReference.get();
            Activity activity = activityReference.get();
            TextView cacheSummary = cacheSummaryReference.get();
            if (fragment == null || activity == null || cacheSummary == null
                    || fragment.getActivity() != activity) {
                return;
            }
            cacheSummary.setText(success || showToast
                    ? formatCacheSummary(sizeBytes, strings)
                    : strings.cacheClearFailedMessage);
            View clearCache = clearCacheReference.get();
            if (clearCache != null) setRowEnabled(clearCache, true);
            if (showToast) {
                Toast.makeText(
                        activity,
                        success ? strings.cacheClearedMessage : strings.cacheClearFailedMessage,
                        Toast.LENGTH_SHORT
                ).show();
            }
        }
    }

    interface LanguageChangeActions {
        void apply(DisplayLanguage language);

        void recreateHost();
    }

    interface CacheActions {
        void clear() throws IOException;
    }

    interface CacheIoActions {
        long sizeBytes() throws IOException;

        void clear() throws IOException;
    }

    interface CacheResultActions {
        void complete(boolean success, long sizeBytes);
    }
}
