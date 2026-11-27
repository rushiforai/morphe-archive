package app.morphe.extension.music.patches.miniplayer;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.util.AttributeSet;
import android.util.Pair;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toolbar;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.theme.ThemeUtils;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.ui.Dim;

/**
 * Registers the "M3 Redesign addon" PreferenceScreen with an M3 icon in Morphe settings,
 * exposes miniplayer/nav/ambient-mode controls, greys out M3 sub-settings when disabled,
 * and harmonizes official Morphe settings (auto-syncing, backing up/restoring, and greying out).
 */
@SuppressWarnings({"unused", "deprecation"})
public class M3NavigationPreference extends Preference {

    private static final int PREF_WITH_ICON_LAYOUT_ID =
            ResourceUtils.getIdentifier(ResourceType.LAYOUT, "morphe_preference_with_icon");

    private static WeakReference<PreferenceGroup> rootSettingsGroupRef = new WeakReference<>(null);

    static {
        M3NavigationFilter.initSettings();
    }

    private boolean nestedScreenAdded = false;

    public M3NavigationPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public M3NavigationPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public M3NavigationPreference(Context context) {
        super(context);
        init();
    }

    private void init() {
        setTitle("M3 Redesign addon");
        applyMenuIconAndLayout(this);
    }

    private static void applyMenuIconAndLayout(Preference target) {
        try {
            if (PREF_WITH_ICON_LAYOUT_ID != 0 && target.getLayoutResource() == 0) {
                target.setLayoutResource(PREF_WITH_ICON_LAYOUT_ID);
            }
            target.setIcon(new M3MenuIconDrawable(ThemeUtils.getAppForegroundColor()));
        } catch (Throwable ignored) {}
    }

    @Override
    protected void onAttachedToActivity() {
        super.onAttachedToActivity();
        if (nestedScreenAdded) return;
        nestedScreenAdded = true;

        try {
            M3NavigationFilter.initSettings(getContext());
            PreferenceManager pm = getPreferenceManager();
            if (pm == null) return;
            PreferenceGroup rootGroup = resolveRootPreferenceScreen(pm);
            if (rootGroup != null) {
                rootSettingsGroupRef = new WeakReference<>(rootGroup);
                M3NavigationFilter.syncOfficialPreferencesUi(rootGroup);
            }
            PreferenceGroup parent = resolveParentGroup(pm, rootGroup);
            if (parent == null) return;

            PreferenceScreen nestedScreen = buildNestedPreferenceScreen(getContext(), pm);
            if (getLayoutResource() != 0) {
                nestedScreen.setLayoutResource(getLayoutResource());
            } else if (PREF_WITH_ICON_LAYOUT_ID != 0) {
                nestedScreen.setLayoutResource(PREF_WITH_ICON_LAYOUT_ID);
            }
            nestedScreen.setIcon(new M3MenuIconDrawable(ThemeUtils.getAppForegroundColor()));
            nestedScreen.setOrder(getOrder());
            parent.addPreference(nestedScreen);

            new Handler(Looper.getMainLooper()).postAtFrontOfQueue(() -> {
                try {
                    parent.removePreference(this);
                    M3NavigationFilter.syncOfficialPreferencesUi(rootSettingsGroupRef.get());
                } catch (Throwable ignored) {}
            });
        } catch (Throwable ignored) {}
    }

    @Nullable
    private static PreferenceGroup resolveRootPreferenceScreen(PreferenceManager pm) {
        try {
            java.lang.reflect.Method m = PreferenceManager.class.getDeclaredMethod("getPreferenceScreen");
            m.setAccessible(true);
            Object rootObj = m.invoke(pm);
            if (rootObj instanceof PreferenceGroup rootGroup) {
                return rootGroup;
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private PreferenceGroup resolveParentGroup(PreferenceManager pm, @Nullable PreferenceGroup rootGroup) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            PreferenceGroup p = getParent();
            if (p != null) return p;
        }
        if (rootGroup != null) {
            return findParentRecursive(rootGroup, this);
        }
        return null;
    }

    private static PreferenceGroup findParentRecursive(PreferenceGroup group, Preference target) {
        for (int i = 0, count = group.getPreferenceCount(); i < count; i++) {
            Preference child = group.getPreference(i);
            if (child == target) return group;
            if (child instanceof PreferenceGroup childGroup) {
                PreferenceGroup found = findParentRecursive(childGroup, target);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static PreferenceScreen buildNestedPreferenceScreen(final Context context, PreferenceManager pm) {
        M3NavigationFilter.initSettings(context);

        final PreferenceScreen screen = pm.createPreferenceScreen(context);
        screen.setKey("morphe_music_m3_navigation_screen");
        screen.setTitle("M3 Redesign addon");

        final List<Preference> m3DependentPrefs = new ArrayList<>();
        final Preference[] rotationSpeedPrefHolder = {null};
        final Preference[] ambientIntensityPrefHolder = {null};
        final Preference[] miniArtRadiusPrefHolder = {null};

        final Runnable refreshAvailability = () -> {
            boolean m3On = M3NavigationFilter.ENABLED.get();
            boolean rotateOn = M3NavigationFilter.ROTATE_SEARCH.get();
            boolean ambientOn = M3NavigationFilter.AMBIENT_MODE.get();
            boolean showArtOn = M3NavigationFilter.SHOW_ALBUM_ART.get();
            for (Preference p : m3DependentPrefs) {
                if (p == rotationSpeedPrefHolder[0]) {
                    p.setEnabled(m3On && rotateOn);
                } else if (p == ambientIntensityPrefHolder[0]) {
                    p.setEnabled(m3On && ambientOn);
                } else if (p == miniArtRadiusPrefHolder[0]) {
                    p.setEnabled(m3On && showArtOn);
                } else {
                    p.setEnabled(m3On);
                }
            }
            M3NavigationFilter.syncOfficialPreferencesUi(rootSettingsGroupRef.get());
        };

        screen.setOnPreferenceClickListener(pref -> {
            refreshAvailability.run();
            styleSubScreenDialogWithToolbar(screen);
            return false;
        });

        // Category 1: M3 Redesign & Miniplayer
        PreferenceCategory generalCat = new PreferenceCategory(context);
        generalCat.setTitle("M3 Redesign & miniplayer");
        screen.addPreference(generalCat);

        SwitchPreference masterSwitch = new SwitchPreference(context);
        masterSwitch.setKey(M3NavigationFilter.ENABLED.key);
        masterSwitch.setPersistent(false);
        masterSwitch.setTitle("Enable M3 Redesign addon");
        masterSwitch.setSummary("Redesign miniplayer & nav bar and automatically harmonize conflicting Morphe settings");
        masterSwitch.setChecked(M3NavigationFilter.ENABLED.get());
        masterSwitch.setOnPreferenceChangeListener((preference, newValue) -> {
            boolean checked = Boolean.TRUE.equals(newValue);
            M3NavigationFilter.setM3Enabled(context, checked);
            refreshAvailability.run();
            M3NavigationFilter.promptRestart(context);
            return true;
        });
        generalCat.addPreference(masterSwitch);

        m3DependentPrefs.add(addSwitch(context, generalCat,
                M3NavigationFilter.SHOW_ALBUM_ART,
                "Show album art in miniplayer",
                "Display the rounded-square song thumbnail inside the miniplayer",
                checked -> refreshAvailability.run()));

        Preference miniArtRadiusPref = addSliderPreference(context, generalCat,
                M3NavigationFilter.MINI_ART_RADIUS_DP,
                "Miniplayer album art corner radius",
                0, 28, "dp", false);
        miniArtRadiusPrefHolder[0] = miniArtRadiusPref;
        m3DependentPrefs.add(miniArtRadiusPref);

        m3DependentPrefs.add(addSwitch(context, generalCat,
                M3NavigationFilter.SHOW_WAVE_SEEKBAR,
                "Show animated wave seekbar",
                "Display the animated sine-wave seekbar below the song title",
                null));

        m3DependentPrefs.add(addSwitch(context, generalCat,
                M3NavigationFilter.DYNAMIC_COLOR,
                "Automatic album colour palette",
                "Extract Material 3 tonal colours from the song artwork (syncs with official miniplayer color)",
                checked -> {
                    M3NavigationFilter.onDynamicColorToggled(context, checked);
                    refreshAvailability.run();
                }));

        m3DependentPrefs.add(addSwitch(context, generalCat,
                M3NavigationFilter.REPLACE_LIB_ACTION,
                "Swap Library with + / Shuffle in Library",
                "Replace the Library icon with New Playlist (+) or Shuffle while viewing Library",
                null));

        m3DependentPrefs.add(addSwitch(context, generalCat,
                M3NavigationFilter.HIDE_PLAYLIST_FAB,
                "Hide playlist floating Play button",
                "Hide the redundant floating Play button inside playlists",
                null));

        // Category 1b: Now Playing Ambient Mode (live-applied without restart)
        PreferenceCategory ambientCat = new PreferenceCategory(context);
        ambientCat.setTitle("Now Playing ambient mode");
        screen.addPreference(ambientCat);

        m3DependentPrefs.add(addSwitch(context, ambientCat,
                M3NavigationFilter.AMBIENT_MODE,
                "Enable ambient mode",
                "Show a soft living album-art glow behind the Now Playing screen (turn off for default background)",
                checked -> refreshAvailability.run(),
                false));

        Preference ambientIntensityPref = addSliderPreference(context, ambientCat,
                M3NavigationFilter.AMBIENT_INTENSITY_PCT,
                "Ambient glow intensity",
                0, 100, "%", false);
        ambientIntensityPrefHolder[0] = ambientIntensityPref;
        m3DependentPrefs.add(ambientIntensityPref);

        // Category 2: Wavy Search Button
        PreferenceCategory searchCat = new PreferenceCategory(context);
        searchCat.setTitle("Wavy Search button");
        screen.addPreference(searchCat);

        m3DependentPrefs.add(addSwitch(context, searchCat,
                M3NavigationFilter.ROTATE_SEARCH,
                "Rotate wavy Search button",
                "Slowly rotate the 12-lobed wavy Search button",
                checked -> refreshAvailability.run()));

        m3DependentPrefs.add(addSwitch(context, searchCat,
                M3NavigationFilter.INVERT_SEARCH,
                "Invert Search button colours",
                "Interchange the background and icon colours on the Search button",
                null));

        // Category 3: Scroll & Wide Screen Layout
        PreferenceCategory behaviorCat = new PreferenceCategory(context);
        behaviorCat.setTitle("Scroll & wide screen layout");
        screen.addPreference(behaviorCat);

        m3DependentPrefs.add(addAutoHideModePreference(context, behaviorCat, M3NavigationFilter.AUTO_HIDE_MODE));

        m3DependentPrefs.add(addSwitch(context, behaviorCat,
                M3NavigationFilter.WIDE_SPLIT_LAYOUT,
                "Tablet & landscape left/right split",
                "Place the M3 navigation bar on the left and the Search button on the right on wide screens",
                null));

        // Category 4: Sizes, Opacity & Blur
        PreferenceCategory sizeCat = new PreferenceCategory(context);
        sizeCat.setTitle("Sizes, opacity & blur");
        screen.addPreference(sizeCat);

        m3DependentPrefs.add(addSliderPreference(context, sizeCat,
                M3NavigationFilter.BAR_HEIGHT_DP,
                "Navigation bar height",
                44, 72, "dp"));

        m3DependentPrefs.add(addSliderPreference(context, sizeCat,
                M3NavigationFilter.MAX_WIDE_WIDTH_DP,
                "Max navigation bar width",
                280, 640, "dp"));

        m3DependentPrefs.add(addSliderPreference(context, sizeCat,
                M3NavigationFilter.BAR_OPACITY_PCT,
                "Navigation bar opacity",
                20, 100, "%"));

        m3DependentPrefs.add(addSliderPreference(context, sizeCat,
                M3NavigationFilter.SEARCH_OPACITY_PCT,
                "Search button opacity",
                20, 100, "%"));

        m3DependentPrefs.add(addSliderPreference(context, sizeCat,
                M3NavigationFilter.SEARCH_SCALE_PCT,
                "Search button size scale",
                90, 165, "%"));

        m3DependentPrefs.add(addSliderPreference(context, sizeCat,
                M3NavigationFilter.SEARCH_LOBE_PERMILLE,
                "Search wavy lobe depth (30 = 0.030f)",
                0, 80, "/ 1000"));

        Preference rotSpeedPref = addSliderPreference(context, sizeCat,
                M3NavigationFilter.SEARCH_ROTATION_SEC,
                "Search rotation speed",
                10, 120, "seconds");
        rotationSpeedPrefHolder[0] = rotSpeedPref;
        m3DependentPrefs.add(rotSpeedPref);

        m3DependentPrefs.add(addSliderPreference(context, sizeCat,
                M3NavigationFilter.BLUR_RADIUS_DP,
                "Background blur radius (0 = off)",
                0, 40, "dp"));

        Preference resetPref = new Preference(context);
        resetPref.setKey("morphe_music_m3_navigation_reset");
        resetPref.setTitle("Reset M3 Redesign settings");
        resetPref.setSummary("Restore defaults and restore any previously saved official Morphe settings");
        resetPref.setOnPreferenceClickListener(pref -> {
            M3NavigationFilter.resetAllSettingsToDefaults(context);
            masterSwitch.setChecked(M3NavigationFilter.ENABLED.get());
            refreshAvailability.run();
            M3NavigationFilter.promptRestart(context);
            return true;
        });
        sizeCat.addPreference(resetPref);

        refreshAvailability.run();
        return screen;
    }

    private static void styleSubScreenDialogWithToolbar(final PreferenceScreen screen) {
        final Dialog dialog = screen.getDialog();
        if (dialog == null || dialog.getWindow() == null) return;

        final Window window = dialog.getWindow();
        final View decor = window.getDecorView();

        if (findToolbarRecursive(decor) != null) return;

        View rawList = decor.findViewById(android.R.id.list);
        if (!(rawList instanceof ListView listView)) return;
        if (!(listView.getParent() instanceof ViewGroup parentGroup)) return;

        final Context context = dialog.getContext();
        final int bgColor = ThemeUtils.getAppBackgroundColor() | 0xFF000000;
        final int fgColor = ThemeUtils.getAppForegroundColor();

        LinearLayout wrapper = new LinearLayout(context);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        wrapper.setBackgroundColor(bgColor);

        Toolbar toolbar = new Toolbar(context);
        toolbar.setBackgroundColor(bgColor);
        toolbar.setTitle("M3 Redesign addon");
        toolbar.setTitleTextColor(fgColor);
        toolbar.setNavigationIcon(new BackArrowDrawable(fgColor));
        toolbar.setNavigationOnClickListener(v -> dialog.dismiss());

        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof TextView tv) {
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
                tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
                tv.setTextColor(fgColor);
            }
        }

        int listIndex = parentGroup.indexOfChild(listView);
        ViewGroup.LayoutParams originalParams = listView.getLayoutParams();
        parentGroup.removeView(listView);

        wrapper.addView(toolbar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Dim.dp(56)));

        listView.setClipToPadding(false);
        listView.setDivider(null);
        listView.setDividerHeight(0);
        wrapper.addView(listView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        parentGroup.addView(wrapper, listIndex, originalParams != null
                ? originalParams
                : new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        wrapper.setOnApplyWindowInsetsListener((v, insets) -> {
            int topInset;
            int bottomInset;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                topInset = insets.getInsets(WindowInsets.Type.statusBars()).top;
                bottomInset = insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
            } else {
                topInset = insets.getSystemWindowInsetTop();
                bottomInset = insets.getSystemWindowInsetBottom();
            }
            v.setPadding(0, topInset, 0, 0);
            listView.setPadding(listView.getPaddingLeft(), listView.getPaddingTop(),
                    listView.getPaddingRight(), bottomInset + Dim.dp(16));
            return insets;
        });
        wrapper.requestApplyInsets();
    }

    @Nullable
    private static Toolbar findToolbarRecursive(View view) {
        if (view instanceof Toolbar tb) return tb;
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                Toolbar found = findToolbarRecursive(vg.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static final class M3MenuIconDrawable extends Drawable {
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF box = new RectF();
        private final RectF pill = new RectF();

        M3MenuIconDrawable(int color) {
            strokePaint.setColor(color);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeWidth(Dim.dp(1.8f));
            strokePaint.setStrokeCap(Paint.Cap.ROUND);
            strokePaint.setStrokeJoin(Paint.Join.ROUND);

            textPaint.setColor(color);
            textPaint.setStyle(Paint.Style.FILL);
            textPaint.setTypeface(Typeface.create("sans-serif-black", Typeface.BOLD));
            textPaint.setTextAlign(Paint.Align.CENTER);
            textPaint.setTextSize(Dim.dp(9.5f));
        }

        @Override public int getIntrinsicWidth() { return Dim.dp(24); }
        @Override public int getIntrinsicHeight() { return Dim.dp(24); }

        @Override
        public void draw(@NonNull Canvas canvas) {
            Rect b = getBounds();
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float halfW = Dim.dp(9.5f);
            float halfH = Dim.dp(8.5f);

            box.set(cx - halfW, cy - halfH, cx + halfW, cy + halfH - Dim.dp(2.5f));
            canvas.drawRoundRect(box, Dim.dp(4f), Dim.dp(4f), strokePaint);

            Paint.FontMetrics fm = textPaint.getFontMetrics();
            float textY = box.centerY() - (fm.ascent + fm.descent) * 0.5f;
            canvas.drawText("M3", cx, textY, textPaint);

            float barTop = cy + halfH - Dim.dp(0.5f);
            float barBottom = cy + halfH + Dim.dp(1.5f);
            pill.set(cx - halfW, barTop, cx + halfW, barBottom);
            canvas.drawRoundRect(pill, Dim.dp(1f), Dim.dp(1f), strokePaint);
        }

        @Override public void setAlpha(int alpha) { strokePaint.setAlpha(alpha); textPaint.setAlpha(alpha); }
        @Override public void setColorFilter(@Nullable ColorFilter colorFilter) { strokePaint.setColorFilter(colorFilter); textPaint.setColorFilter(colorFilter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class BackArrowDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        BackArrowDrawable(int color) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(Dim.dp(2));
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override public int getIntrinsicWidth() { return Dim.dp(24); }
        @Override public int getIntrinsicHeight() { return Dim.dp(24); }

        @Override
        public void draw(@NonNull Canvas canvas) {
            Rect b = getBounds();
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float len = Dim.dp(7);
            canvas.drawLine(cx - len, cy, cx + len, cy, paint);
            canvas.drawLine(cx - len, cy, cx - Dim.dp(1), cy - Dim.dp(6), paint);
            canvas.drawLine(cx - len, cy, cx - Dim.dp(1), cy + Dim.dp(6), paint);
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(@Nullable ColorFilter colorFilter) { paint.setColorFilter(colorFilter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private interface BooleanCallback {
        void onChanged(boolean value);
    }

    private static SwitchPreference addSwitch(
            final Context context,
            PreferenceGroup parent,
            final BooleanSetting setting,
            String title,
            String summary,
            @Nullable final BooleanCallback extraAction
    ) {
        return addSwitch(context, parent, setting, title, summary, extraAction, true);
    }

    private static SwitchPreference addSwitch(
            final Context context,
            PreferenceGroup parent,
            final BooleanSetting setting,
            String title,
            String summary,
            @Nullable final BooleanCallback extraAction,
            final boolean requireRestart
    ) {
        SwitchPreference sw = new SwitchPreference(context);
        sw.setKey(setting.key);
        sw.setPersistent(false);
        sw.setTitle(title);
        sw.setSummary(summary);
        sw.setChecked(setting.get());
        sw.setOnPreferenceChangeListener((preference, newValue) -> {
            boolean checked = Boolean.TRUE.equals(newValue);
            if (extraAction != null) {
                setting.save(checked);
                M3NavigationFilter.syncFromSettings(context);
                extraAction.onChanged(checked);
            } else {
                setting.save(checked);
                M3NavigationFilter.syncFromSettings(context);
            }
            if (requireRestart) {
                M3NavigationFilter.promptRestart(context);
            }
            return true;
        });
        parent.addPreference(sw);
        return sw;
    }

    private static Preference addAutoHideModePreference(
            final Context context,
            PreferenceGroup parent,
            final StringSetting setting
    ) {
        final String[] values = {"BOTH", "SEARCH_ONLY", "NAV_ONLY", "OFF"};
        final String[] labels = {
                "Both (Navigation bar & Search)",
                "Search button only",
                "Navigation bar only",
                "Off (Do not auto-hide)"
        };

        final Preference pref = new Preference(context);
        pref.setKey(setting.key);
        pref.setPersistent(false);
        pref.setTitle("Auto-hide on scroll");
        pref.setSummary(labelForAutoHideValue(setting.get(), values, labels));

        pref.setOnPreferenceClickListener(p -> {
            showAutoHideDialog(context, setting, values, labels, newValue -> {
                setting.save(newValue);
                pref.setSummary(labelForAutoHideValue(newValue, values, labels));
                M3NavigationFilter.syncFromSettings(context);
                M3NavigationFilter.promptRestart(context);
            });
            return true;
        });
        parent.addPreference(pref);
        return pref;
    }

    private static String labelForAutoHideValue(String val, String[] values, String[] labels) {
        for (int i = 0; i < values.length; i++) {
            if (values[i].equalsIgnoreCase(val)) return labels[i];
        }
        return labels[0];
    }

    private interface StringCallback {
        void onSelected(String value);
    }

    private static void showAutoHideDialog(
            Context context,
            final StringSetting setting,
            final String[] values,
            final String[] labels,
            final StringCallback callback
    ) {
        TypedValue accent = new TypedValue();
        context.getTheme().resolveAttribute(android.R.attr.colorAccent, accent, true);
        final int accentColor = accent.data;
        final int fgColor = ThemeUtils.getAppForegroundColor();

        final String current = setting.get();
        final String[] pending = {current};

        RadioGroup radioGroup = new RadioGroup(context);
        radioGroup.setOrientation(RadioGroup.VERTICAL);
        radioGroup.setPadding(0, Dim.dp8, 0, Dim.dp8);

        for (int i = 0; i < values.length; i++) {
            final int idx = i;
            RadioButton rb = new RadioButton(context);
            rb.setId(View.generateViewId());
            rb.setText(labels[i]);
            rb.setTextColor(fgColor);
            rb.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            rb.setButtonTintList(ColorStateList.valueOf(accentColor));
            rb.setPadding(Dim.dp8, Dim.dp(10), Dim.dp8, Dim.dp(10));
            rb.setChecked(values[i].equalsIgnoreCase(current));
            rb.setOnClickListener(v -> pending[0] = values[idx]);
            radioGroup.addView(rb, new RadioGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                context,
                "Auto-hide on scroll",
                null,
                null,
                null,
                () -> callback.onSelected(pending[0]),
                () -> {},
                null,
                null,
                false
        );

        dialogPair.second.addView(radioGroup, 1);
        dialogPair.first.show();
    }

    private static Preference addSliderPreference(
            final Context context,
            PreferenceGroup parent,
            final IntegerSetting setting,
            final String title,
            final int min,
            final int max,
            final String unit
    ) {
        return addSliderPreference(context, parent, setting, title, min, max, unit, true);
    }

    private static Preference addSliderPreference(
            final Context context,
            PreferenceGroup parent,
            final IntegerSetting setting,
            final String title,
            final int min,
            final int max,
            final String unit,
            final boolean requireRestart
    ) {
        final Preference pref = new Preference(context);
        pref.setKey(setting.key);
        pref.setPersistent(false);
        pref.setTitle(title);
        pref.setSummary(String.format(Locale.US, "%d %s", setting.get(), unit));

        pref.setOnPreferenceClickListener(p -> {
            int currentVal = setting.get();
            int defaultVal = setting.defaultValue;
            showMorpheSliderDialog(context, title, min, max, currentVal, defaultVal, unit, newVal -> {
                setting.save(newVal);
                pref.setSummary(String.format(Locale.US, "%d %s", newVal, unit));
                M3NavigationFilter.syncFromSettings(context);
                if (requireRestart) {
                    M3NavigationFilter.promptRestart(context);
                }
            });
            return true;
        });
        parent.addPreference(pref);
        return pref;
    }

    private interface SliderCallback {
        void onValueSelected(int value);
    }

    private static void showMorpheSliderDialog(
            Context context,
            String title,
            final int min,
            final int max,
            int currentVal,
            final int defaultVal,
            final String unit,
            final SliderCallback callback
    ) {
        TypedValue accent = new TypedValue();
        context.getTheme().resolveAttribute(android.R.attr.colorAccent, accent, true);
        final int accentColor = accent.data;

        final int[] pending = {Math.max(min, Math.min(max, currentVal))};

        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, Dim.dp8, 0, Dim.dp8);

        final TextView valueLabel = new TextView(context);
        valueLabel.setTextColor(accentColor);
        valueLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        valueLabel.setGravity(Gravity.CENTER_HORIZONTAL);
        valueLabel.setText(String.format(Locale.US, "%d %s", pending[0], unit));
        content.addView(valueLabel);

        final SeekBar seekBar = new SeekBar(context);
        seekBar.setMax(max - min);
        seekBar.setProgress(pending[0] - min);
        seekBar.setProgressTintList(ColorStateList.valueOf(accentColor));
        seekBar.setThumbTintList(ColorStateList.valueOf(accentColor));
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                pending[0] = min + progress;
                valueLabel.setText(String.format(Locale.US, "%d %s", pending[0], unit));
            }

            @Override public void onStartTrackingTouch(SeekBar bar) {}
            @Override public void onStopTrackingTouch(SeekBar bar) {}
        });
        LinearLayout.LayoutParams sbParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        sbParams.topMargin = Dim.dp8;
        content.addView(seekBar, sbParams);

        Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                context,
                title,
                null,
                null,
                null,
                () -> callback.onValueSelected(pending[0]),
                () -> {},
                "Reset",
                () -> seekBar.setProgress(Math.max(0, Math.min(max - min, defaultVal - min))),
                false
        );

        dialogPair.second.addView(content, 1);
        dialogPair.first.show();
    }
}
