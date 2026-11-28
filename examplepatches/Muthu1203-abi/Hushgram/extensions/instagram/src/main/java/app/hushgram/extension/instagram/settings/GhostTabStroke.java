/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import android.view.View;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushgram.extension.instagram.download.FeedDownloadButton;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.ResourceIdCache;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BooleanSetting;
import app.hushgram.extension.shared.settings.HushgramPause;

/**
 * Tints the outline of the tab whose long press turns Ghost mode on or off. The icon itself takes
 * the picked Ghost mode tint while Ghost mode is on, HushGram isn't paused, and that tab is chosen.
 * Instagram's tint and color filter are restored in every other state.
 *
 * <p>Tabs are watched as Instagram binds them, and a change of Ghost mode, its tint or the chosen
 * tab repaints them immediately. The tint is applied to the icon drawable only; it doesn't draw a
 * badge or ring over the tab. Main thread only. Never throws into Instagram.
 */
final class GhostTabStroke {
    static final String ROUTE = GhostHeaderButton.ROUTE;
    static final String SHOWN = "Ghost tab stroke shown";
    static final String HIDDEN = "Ghost tab stroke taken off";

    private static final String ICON = "tab_icon";
    private static final ResourceIdCache ids = new ResourceIdCache();
    private static final Map<View, String> watched = new WeakHashMap<>();
    private static final Map<View, Tint> tints = new WeakHashMap<>();

    private GhostTabStroke() { }

    static void watch(@Nullable View view, @Nullable String tab) {
        try {
            if (view == null) return;
            synchronized (watched) {
                if (tab == null || tab.isEmpty()) watched.remove(view);
                else watched.put(view, tab);
            }
            place(view, tab);
        } catch (Throwable t) {
            HookStatus.threw(ROUTE, "ghost tab stroke", t);
        }
    }

    static void watch(@Nullable View view, @Nullable Object tab) {
        watch(view, tab instanceof Enum<?> ? ((Enum<?>) tab).name() : null);
    }

    static void forget(@Nullable View view) {
        try {
            if (view == null) return;
            synchronized (watched) {
                watched.remove(view);
            }
            take(view);
        } catch (Throwable t) {
            HookStatus.threw(ROUTE, "ghost tab stroke", t);
        }
    }

    static void refresh() {
        try {
            List<View> views = new ArrayList<>();
            List<String> tabs = new ArrayList<>();
            synchronized (watched) {
                for (Map.Entry<View, String> entry : watched.entrySet()) {
                    views.add(entry.getKey());
                    tabs.add(entry.getValue());
                }
            }
            for (int i = 0; i < views.size(); i++) place(views.get(i), tabs.get(i));
        } catch (Throwable t) {
            HookStatus.threw(ROUTE, "ghost tab stroke", t);
            Logger.printException(() -> "Ghost mode: could not repaint a tab icon", t);
        }
    }

    static boolean showingForTests(@Nullable View view) {
        if (view == null) return false;
        synchronized (tints) { return tints.containsKey(view); }
    }

    static int colorForTests(@Nullable View view) {
        if (view == null) return 0;
        synchronized (tints) {
            Tint tint = tints.get(view);
            return tint == null ? 0 : tint.color;
        }
    }

    static void forgetForTests() {
        synchronized (watched) { watched.clear(); }
        List<View> views;
        synchronized (tints) { views = new ArrayList<>(tints.keySet()); }
        for (View view : views) take(view);
    }

    private static void place(View tab, String name) {
        ImageView icon = iconOf(tab);
        if (!wanted(name) || icon == null) {
            take(tab);
            return;
        }

        Tint tint;
        synchronized (tints) {
            tint = tints.get(tab);
            ImageView oldIcon = tint == null ? null : tint.icon.get();
            if (tint == null || oldIcon != icon) {
                if (tint != null && oldIcon != null) tint.restore(oldIcon);
                tint = new Tint(icon);
                tints.put(tab, tint);
                HookStatus.counted(ROUTE, SHOWN);
            }
            tint.color = color(icon);
            icon.setImageTintList(null);
            icon.setColorFilter(tint.color, PorterDuff.Mode.SRC_IN);
            icon.invalidate();
        }
    }

    private static void take(View tab) {
        synchronized (tints) {
            Tint tint = tints.remove(tab);
            ImageView icon = tint == null ? null : tint.icon.get();
            if (icon != null) {
                tint.restore(icon);
                icon.invalidate();
                HookStatus.counted(ROUTE, HIDDEN);
            }
        }
    }

    @Nullable
    private static ImageView iconOf(View tab) {
        if (tab instanceof ImageView) return (ImageView) tab;
        int id = ids.resolve(tab.getResources(), tab.getContext().getPackageName(), ICON, false);
        if (id == 0) return null;
        View icon = tab.findViewById(id);
        return icon instanceof ImageView ? (ImageView) icon : null;
    }

    private static boolean wanted(String tab) {
        if (tab == null || !Utils.settingsReady() || HushgramPause.isPaused()) return false;
        if (!Settings.GHOST_TAB_TARGET.get().matches(tab) || !GhostModeEntry.offeredNow()) return false;
        List<BooleanSetting> switches = GhostMode.picked(GhostMode.switches(PatchFamily.inThisBuild()));
        return GhostMode.on(switches);
    }

    private static int color(View icon) {
        GhostIndicatorColor tint = Settings.GHOST_INDICATOR_COLOR.get();
        return tint == GhostIndicatorColor.INSTAGRAM
                ? FeedDownloadButton.iconColor(icon.getContext()) : tint.color;
    }

    private static final class Tint {
        final WeakReference<ImageView> icon;
        final ColorStateList imageTint;
        final PorterDuff.Mode tintMode;
        final android.graphics.ColorFilter colorFilter;
        int color;

        Tint(ImageView icon) {
            this.icon = new WeakReference<>(icon);
            imageTint = icon.getImageTintList();
            tintMode = icon.getImageTintMode();
            colorFilter = icon.getColorFilter();
        }

        void restore(ImageView icon) {
            icon.setColorFilter(colorFilter);
            icon.setImageTintMode(tintMode);
            icon.setImageTintList(imageTint);
        }
    }
}
