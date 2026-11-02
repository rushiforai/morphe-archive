package patches.gearslip;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.util.Log;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;

/** The phone-side choice of which tiles the car drawer shows. Every tile is shown until unticked. */
public final class DrawerApps {
    private static final String TAG = "GearslipDrawer";
    private static final String PREFS = "morphe_drawer_apps";
    private static final String KEY_HIDDEN = "hidden";
    /** Name of the card the patch adds to Gearslip's CarGroup list. */
    private static final String GROUP = "MORPHE_APPS";

    /** Set while Home works out one card's subtitle, which happens on one thread, in one pass. */
    private static boolean subtitleForApps;

    private DrawerApps() {
    }

    /**
     * The card's title: Gearslip's own translated "Apps". Release builds strip unused strings, so
     * the patch fails if this one is missing rather than letting Home crash on a zero resource ID.
     */
    public static int titleResource() {
        Context context = context();
        return context.getResources().getIdentifier("crumb_apps", "string", context.getPackageName());
    }

    /**
     * Gearslip's subtitle code has no branch for a card it doesn't know, so the Apps card borrows
     * the group before it. {@link #subtitle(String)} then replaces the borrowed text.
     */
    public static int subtitleOrdinal(Enum<?> group) {
        subtitleForApps = GROUP.equals(group.name());
        return subtitleForApps ? group.ordinal() - 1 : group.ordinal();
    }

    public static String subtitle(String original) {
        if (!subtitleForApps) return original;
        return text("Kies welke apps in de auto verschijnen", "Choose which apps appear in the car");
    }

    /** Returns true when the tapped card was the Apps card, so Gearslip opens nothing of its own. */
    public static boolean open(Enum<?> group) {
        if (!GROUP.equals(group.name())) return false;
        Context context = context();
        context.startActivity(new Intent(context, DrawerAppsActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        return true;
    }

    /** Put Apps first in the phone's settings list without modifying enum ordinals or entries. */
    public static Iterator<?> orderedCards(Iterable<?> entries) {
        List<Object> ordered = new ArrayList<>();
        for (Object entry : entries) {
            if (entry instanceof Enum<?> && GROUP.equals(((Enum<?>) entry).name())) ordered.add(0, entry);
            else ordered.add(entry);
        }
        return ordered.iterator();
    }

    /** The drawer's tiles without the unticked ones. Gearslip's own entries and pins are unaffected. */
    public static List<?> visible(List<?> entries) {
        Set<String> hidden = hidden(context());
        if (hidden.isEmpty()) return entries;
        List<Object> shown = new ArrayList<>(entries.size());
        for (Object entry : entries) {
            if (!hidden.contains(componentId(entry))) shown.add(entry);
        }
        return shown;
    }

    static String text(String dutch, String english) {
        return "nl".equals(Locale.getDefault().getLanguage()) ? dutch : english;
    }

    static boolean isHidden(Context context, String id) {
        return hidden(context).contains(id);
    }

    static void setHidden(Context context, String id, boolean hide) {
        Set<String> hidden = new HashSet<>(hidden(context));
        if (hide) hidden.add(id);
        else hidden.remove(id);
        prefs(context).edit().putStringSet(KEY_HIDDEN, hidden).apply();
    }

    /** The installed apps' tiles, before the drawer filter. Slow: call off the main thread. */
    static List<?> scan(Context context) {
        try {
            Class<?> cache = Class.forName("app.seb3thehacker.gearslip.car.LauncherCache");
            Object instance = cache.getField("INSTANCE").get(null);
            return (List<?>) cache.getMethod("load", Context.class, boolean.class).invoke(instance, context, true);
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Could not list Gearslip's apps", error);
            return Collections.emptyList();
        }
    }

    static String componentId(Object entry) {
        try {
            return (String) entry.getClass().getMethod("getComponentId").invoke(entry);
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Could not identify a Gearslip tile", error);
            return null;
        }
    }

    static String label(Object entry) {
        try {
            return (String) entry.getClass().getField("label").get(entry);
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Could not read a Gearslip tile's name", error);
            return "";
        }
    }

    static Bitmap icon(Object entry) {
        try {
            Object icon = entry.getClass().getField("icon").get(entry);
            if (icon == null) return null;
            Field bitmap = icon.getClass().getField("bitmap");
            return (Bitmap) bitmap.get(icon);
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Could not read a Gearslip tile's icon", error);
            return null;
        }
    }

    private static Set<String> hidden(Context context) {
        return prefs(context).getStringSet(KEY_HIDDEN, Collections.emptySet());
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    static Context context() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Gearslip's application is unavailable", error);
        }
    }
}
