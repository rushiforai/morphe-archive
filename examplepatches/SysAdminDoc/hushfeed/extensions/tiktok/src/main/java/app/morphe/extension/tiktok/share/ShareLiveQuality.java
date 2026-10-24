/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.share;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.live.LiveRecordChip;
import app.morphe.extension.tiktok.live.LiveRecordQuality;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * LIVE recording quality in a LIVE room's share sheet (#203), built on the same native Report
 * carrier as Block this creator. A tap lists the quality choices and writes the pick to the
 * setting the recorder reads when its next recording starts. It shows only in LIVE sheets, and
 * only while Record LIVEs you watch is on. The carrier needs no post, so it is built with none.
 */
public final class ShareLiveQuality {
    static final String KEY = "hushfeed_live_record_quality";
    static final String LABEL = "LIVE recording quality";
    private static final String FAMILY = "live recording quality";
    private static final List<Built> BUILT = new ArrayList<>();

    private ShareLiveQuality() {}

    private static final class Built {
        final WeakReference<Object> action;
        final WeakReference<Object> sharePackage;
        volatile boolean retired;

        Built(Object action, Object sharePackage) {
            this.action = new WeakReference<>(action);
            this.sharePackage = new WeakReference<>(sharePackage);
        }
    }

    /** Finished native row. Stale owned actions come out when off or on another surface. */
    public static List<?> actions(Object sharePackage, List<?> actions) {
        if (actions == null) return null;
        List<Object> row = new ArrayList<>(actions.size() + 1);
        try {
            boolean eligible = isLive(sharePackage) && LiveRecordChip.enabled();
            Built reusable = null;
            for (Object item : actions) {
                Built built = find(item);
                if (built == null) row.add(item);
                else if (eligible && reusable == null && !built.retired && built.sharePackage.get() == sharePackage) reusable = built;
                else built.retired = true;
            }
            if (eligible) {
                Object action = reusable == null ? null : reusable.action.get();
                if (action == null) {
                    Activity activity = Utils.getVisibleActivity();
                    if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                        action = newAction(activity);
                        if (action != null) remember(new Built(action, sharePackage));
                    }
                }
                if (action != null) {
                    row.add(action);
                    HookStatus.bound(FAMILY, "share sheet row");
                }
            } else if (reusable != null) reusable.retired = true;
            return sameRow(actions, row) ? actions : row;
        } catch (Throwable failure) {
            row.clear();
            for (Object item : actions) {
                Built built = find(item);
                if (built != null) built.retired = true;
                else row.add(item);
            }
            HookStatus.threw(FAMILY, "share sheet row", failure);
            Logger.printException(() -> "Could not add LIVE recording quality to the share sheet", failure);
            return sameRow(actions, row) ? actions : row;
        }
    }

    private static boolean sameRow(List<?> before, List<?> after) {
        if (before.size() != after.size()) return false;
        for (int i = 0; i < before.size(); i++) if (before.get(i) != after.get(i)) return false;
        return true;
    }

    /** True for the package a LIVE room's share sheet is built from. */
    static boolean isLive(Object sharePackage) {
        return sharePackage != null
                && ShareSurface.of(Reflect.string(sharePackage, "getItemType", "itemType")) == ShareSurface.LIVE;
    }

    private static synchronized Built find(Object action) {
        Built found = null;
        for (Iterator<Built> each = BUILT.iterator(); each.hasNext();) {
            Built built = each.next();
            Object held = built.action.get();
            if (held == null) each.remove();
            else if (held == action) found = built;
        }
        return found;
    }

    private static synchronized void remember(Built built) {
        BUILT.add(built);
    }

    public static boolean owns(Object action) { return action != null && find(action) != null; }
    public static String key(Object action) { return owns(action) ? KEY : null; }
    public static String label(Object action) { return owns(action) ? L10n.t(LABEL) : null; }

    public static void bindIcon(Object action, ImageView image) {
        if (!owns(action)) return;
        Drawable icon = NativeShareIcon.restyle(image.getDrawable(), LiveQualityGlyphDrawable::new);
        if (icon == null) {
            Context context = Utils.getVisibleActivity();
            if (context == null) context = Utils.getContext();
            icon = new LiveQualityGlyphDrawable(SettingsUi.textPrimaryOn(SettingsUi.isDarkContext(context)),
                    SettingsUi.dp(context, 2));
        }
        image.setImageDrawable(icon);
    }

    /** Only owned carriers are consumed, and never fall through to their original Report behavior. */
    public static boolean click(Object action, Context context, Object sharePackage) {
        Built built = find(action);
        if (built == null) return false;
        try {
            if (built.retired || built.sharePackage.get() != sharePackage || !isLive(sharePackage)) return true;
            Context from = context instanceof Activity ? context : Utils.getVisibleActivity();
            if (from == null) return true;
            Picker stand = pickerForTests;
            if (stand != null) stand.pick(from);
            else pick(from);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "share sheet row", failure);
            Logger.printException(() -> "Could not open the LIVE recording quality choice", failure);
        }
        return true;
    }

    /** Lists the choices with the current one marked. A pick is saved and toasted at once. */
    private static void pick(Context context) {
        String[] labels = new String[LiveRecordQuality.LABELS.length];
        for (int i = 0; i < labels.length; i++) labels[i] = L10n.t(LiveRecordQuality.LABELS[i]);
        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(L10n.t(LABEL))
                .setSingleChoiceItems(labels, LiveRecordQuality.indexOf(Settings.LIVE_RECORD_QUALITY.get()),
                        (shown, which) -> {
                            choose(which);
                            shown.dismiss();
                        })
                .create();
        dialog.show();
        SettingsUi.styleStandardAlertDialog(dialog);
    }

    /** Saves choice number {@code which} and says what it is. */
    static void choose(int which) {
        if (which < 0 || which >= LiveRecordQuality.VALUES.length) return;
        Settings.LIVE_RECORD_QUALITY.save(LiveRecordQuality.VALUES[which]);
        Utils.showToastShort(L10n.t(LiveRecordQuality.LABELS[which]));
    }

    interface Native { Object newAction(Activity activity); }
    interface Picker { void pick(Context context); }
    static volatile Native nativeForTests;
    static volatile Picker pickerForTests;

    /** A native Report carrier from the shared bridge the patch fills in; it takes no post. */
    static Object newAction(Activity activity) {
        Native stand = nativeForTests;
        return stand == null ? OwnedShareActions.newAction(activity, null) : stand.newAction(activity);
    }
}
