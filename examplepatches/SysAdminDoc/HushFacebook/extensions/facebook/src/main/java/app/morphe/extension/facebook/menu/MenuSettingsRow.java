/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;

import androidx.annotation.Nullable;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.SettingsEntry;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The Hushfacebook row at the end of the Settings and privacy group in Facebook's Menu.
 *
 * <p>The group's rows come from one list builder, and every list it hands back passes through
 * {@link #withRow}, which adds this row once, after Facebook's own. The row is one of Facebook's
 * own row items, made by a factory the patch adds to the item class ({@value #FACTORY}), with the
 * first row's icon, the title "Hushfacebook settings" in the phone's language, no address to open
 * and the id {@link #ROW_ID}. The row is known by that id, never by its title. A tap on a row asks
 * {@link #onTap} first, and the row's own tap opens the settings screen the same way the logo long
 * press does. The row's two loggers ask {@link #isRow} and skip it, so Facebook never records a
 * row it didn't make.
 *
 * <p>Like the logo and the launcher shortcut, the row has no switch and stays while Hushfacebook
 * is paused: the settings screen is where a pause is lifted. Any failure in here leaves Facebook's
 * list as it was.
 */
public final class MenuSettingsRow {
    /**
     * The row's id. Facebook's row ids are ids of its own objects, which are never negative, and
     * its tap handler picks special rows by comparing ids, so a negative one never matches them.
     */
    public static final long ROW_ID = -0x4855534846420001L;

    /** The static factory the patch adds to the row item class: (template, title, id) to a new row. */
    static final String FACTORY = "hushfacebookRow";

    /** The static id reader the patch adds to the row item class. */
    static final String ID_READER = "hushfacebookRowId";

    /** The Hook status names of the two hooks. */
    static final String LIST_HOOK = "Settings and privacy rows";
    static final String TAP_HOOK = "Hushfacebook row tap";

    /** The row item class the helpers below were looked up on, and the helpers. */
    @Nullable
    private static volatile Helpers helpers;

    private MenuSettingsRow() {
    }

    private static final class Helpers {
        final Class<?> type;
        final Method factory;
        final Method idReader;

        Helpers(Class<?> type) throws NoSuchMethodException {
            this.type = type;
            this.factory = type.getMethod(FACTORY, Object.class, CharSequence.class, long.class);
            this.idReader = type.getMethod(ID_READER, Object.class);
        }
    }

    private static Helpers helpersFor(Class<?> type) throws NoSuchMethodException {
        Helpers known = helpers;
        if (known != null && known.type == type) return known;
        Helpers found = new Helpers(type);
        helpers = found;
        return found;
    }

    /**
     * Injection point, on each list the Settings and privacy group's builder hands back. Answers
     * the list with the Hushfacebook row after Facebook's rows, or the list as it was when the row
     * is already there, the list is empty or anything fails. Never null and never throws.
     */
    public static List<?> withRow(@Nullable List<?> rows) {
        if (rows == null) return Collections.emptyList();
        try {
            HookStatus.invoked(FamilyNames.MENU_SETTINGS_ROW);
            if (rows.isEmpty()) return rows;
            Object template = rows.get(0);
            if (template == null) return rows;
            Helpers found;
            try {
                found = helpersFor(template.getClass());
            } catch (NoSuchMethodException missing) {
                HookStatus.missingMember(FamilyNames.MENU_SETTINGS_ROW, "method", template.getClass().getName(),
                        FACTORY + " or " + ID_READER);
                return rows;
            }
            for (Object row : rows) {
                if (row != null && row.getClass() == found.type && ROW_ID == (long) found.idReader.invoke(null, row)) {
                    return rows;
                }
            }
            Context context = Utils.getContext();
            if (context == null) return rows;
            Object ours = found.factory.invoke(null, template, L10n.t(context, "Hushfacebook settings"), ROW_ID);
            if (ours == null) return rows;
            HookStatus.bound(FamilyNames.MENU_SETTINGS_ROW, LIST_HOOK);
            List<Object> withOurs = new ArrayList<>(rows.size() + 1);
            withOurs.addAll(rows);
            withOurs.add(ours);
            return withOurs;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MENU_SETTINGS_ROW, LIST_HOOK, failure);
            return rows;
        }
    }

    /**
     * Injection point, first thing in the Menu's row tap handler. True for the Hushfacebook row,
     * which then opens the settings and Facebook does nothing more with the tap. Never throws.
     */
    public static boolean onTap(@Nullable View view, long id) {
        if (id != ROW_ID) return false;
        try {
            HookStatus.invoked(FamilyNames.MENU_SETTINGS_ROW);
            HookStatus.bound(FamilyNames.MENU_SETTINGS_ROW, TAP_HOOK);
            Activity activity = activityOf(view == null ? null : view.getContext());
            if (activity == null || !SettingsEntry.open(activity)) {
                Logger.printInfo(() -> "Hushfacebook in the Menu: the settings didn't open over "
                        + (activity == null ? "no activity" : activity.getClass().getSimpleName()));
                Context context = Utils.getContext();
                if (context != null) {
                    Utils.showToastShort(L10n.t(context, "Hushfacebook settings can't open here. Long-press the Facebook logo instead."));
                }
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MENU_SETTINGS_ROW, TAP_HOOK, failure);
        }
        // The row is ours either way: Facebook has nothing to open for it.
        return true;
    }

    /** Injection point, first thing in the row's loggers. True for the Hushfacebook row, which they skip. */
    public static boolean isRow(long id) {
        return id == ROW_ID;
    }

    /** The activity a view's context wraps, or null. The depth guards against a wrapper that wraps itself. */
    @Nullable
    static Activity activityOf(@Nullable Context context) {
        for (int depth = 0; context != null && depth < 20; depth++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) return null;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /** Forgets the helpers looked up, as a new Facebook process would. For tests. */
    static void forget() {
        helpers = null;
    }
}
