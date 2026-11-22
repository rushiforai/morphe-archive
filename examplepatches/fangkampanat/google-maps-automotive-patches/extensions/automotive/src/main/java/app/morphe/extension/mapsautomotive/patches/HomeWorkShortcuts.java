package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.view.View;

import org.json.JSONException;
import org.json.JSONObject;

import app.morphe.extension.shared.Utils;

/**
 * Home and Work shortcuts (patch "Home and Work shortcuts", switch "home_work").
 * <p>
 * The icons under the search box come from Google's server, one per search category (on the Dolphin: charging,
 * restaurants, shopping, cafes). While the switch is on, the third and fourth become Home and Work: Maps' own labels and
 * icons, and a tap sends Maps' own link google.navigation:place=home (or work) to MapsActivity. Maps then routes to the
 * place saved in the Google account; when it is not set, Maps asks for it (signed in) or opens the saved places
 * (signed out). A charging or gas station icon in those places stays, since the server's order differs by car and fuel
 * type. Other icons and fewer than three icons stay as they are.
 * <p>
 * Maps builds an icon in one constructor call, label first, then the icon, then the tap. {@link #label} decides from
 * the category's icon key and the position and keeps the decision for this thread; {@link #icon} and {@link #click}
 * take it, so the three parts of an icon always agree.
 */
@SuppressWarnings("unused")
public final class HomeWorkShortcuts {
    private static final String TAG = "MorpheHomeWork";
    /** Positions in the row, from 0. */
    static final int HOME_POSITION = 2, WORK_POSITION = 3;
    /** Keys of Maps' Home and Work icons in its icon lookup, and of the categories that stay. */
    static final int HOME_ICON = 6, WORK_ICON = 7, EV_CHARGING_ICON = 61979, GAS_STATION_ICON = 61956;
    private static final String MAPS_ACTIVITY = "com.google.android.maps.MapsActivity";

    private static volatile Boolean on;
    private static volatile String homeLabel, workLabel;
    private static volatile int made, kept, taps, failures;
    private static volatile String lastTap;
    /** The decision for the icon this thread is building: "home", "work" or null. */
    private static final ThreadLocal<String> building = new ThreadLocal<>();

    private HomeWorkShortcuts() {
    }

    /**
     * Injection point: the icon's label (also its content description), with the category's icon key and the icon's
     * position. Decides for the whole icon.
     */
    public static String label(String maps, int key, int position) {
        building.remove();
        try {
            String place = place(key, position);
            if (place == null) {
                if ((position == HOME_POSITION || position == WORK_POSITION) && isKept(key)) kept++;
                return maps;
            }
            String text = "home".equals(place) ? homeLabel() : workLabel();
            building.set(place);
            return text;
        } catch (Throwable error) {
            building.remove();
            return maps;
        }
    }

    /** Injection point: the key Maps looks the icon up by. */
    public static int icon(int maps) {
        try {
            String place = building.get();
            if (place == null) return maps;
            return "home".equals(place) ? HOME_ICON : WORK_ICON;
        } catch (Throwable error) {
            return maps;
        }
    }

    /** Injection point: the icon's tap, Maps' category search. Ends the icon's decision. */
    public static View.OnClickListener click(View.OnClickListener maps) {
        try {
            String place = building.get();
            building.remove();
            if (place == null) return maps;
            made++;
            return new Shortcut(place);
        } catch (Throwable error) {
            return maps;
        }
    }

    private static boolean isKept(int key) {
        return key == EV_CHARGING_ICON || key == GAS_STATION_ICON;
    }

    /** "home", "work" or null (another position, a category that stays, or switched off). Plain Java but the switch. */
    static String place(int key, int position) {
        if (position != HOME_POSITION && position != WORK_POSITION) return null;
        if (isKept(key)) return null;
        if (!enabled()) return null;
        return position == HOME_POSITION ? "home" : "work";
    }

    private static boolean enabled() {
        Boolean feature = on;
        return feature != null ? feature : decide();
    }

    private static synchronized boolean decide() {
        Boolean feature = on;
        if (feature == null) {
            feature = SafeMode.on(SafeMode.HOME_WORK);
            on = feature;
            ReportLog.i(TAG, "Home and Work shortcuts " + (feature ? "on" : "off (switched off)"));
        }
        return feature;
    }

    private static String homeLabel() {
        String label = homeLabel;
        if (label == null) homeLabel = label = mapsString("HOME_LOCATION", "บ้าน", "Home");
        return label;
    }

    private static String workLabel() {
        String label = workLabel;
        if (label == null) workLabel = label = mapsString("WORK_LOCATION", "ที่ทำงาน", "Work");
        return label;
    }

    /**
     * Maps' own string [name] in the app's language, else the Thai or English text. Maps' resources keep their
     * original package name, so the name is looked up in the package of the app's icon.
     */
    private static String mapsString(String name, String thai, String english) {
        Context context = Utils.getContext();
        try {
            Resources resources = context.getResources();
            int icon = context.getApplicationInfo().icon;
            String resourcePackage = icon != 0 ? resources.getResourcePackageName(icon) : context.getPackageName();
            int id = resources.getIdentifier(name, "string", resourcePackage);
            if (id != 0) {
                String text = resources.getString(id);
                if (!text.trim().isEmpty()) return text;
            }
            ReportLog.w(TAG, "Maps' " + name + " not found, own text used");
        } catch (Throwable error) {
            ReportLog.w(TAG, "Maps' " + name + " unreadable, own text used", error);
        }
        boolean useThai;
        try {
            useThai = context != null && UiDensityPatch.isThai(context);
        } catch (Throwable error) {
            useThai = false;
        }
        return useThai ? thai : english;
    }

    /** The tap: Maps' own navigation link to MapsActivity, which routes to the saved place. */
    private static final class Shortcut implements View.OnClickListener {
        private final String place;

        Shortcut(String place) {
            this.place = place;
        }

        @Override
        public void onClick(View view) {
            try {
                Context context = view.getContext();
                Activity activity = UiDensityPatch.findActivity(context);
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("google.navigation:place=" + place))
                        .setClassName(context.getPackageName(), MAPS_ACTIVITY);
                if (activity == null) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                (activity != null ? activity : context).startActivity(intent);
                taps++;
                lastTap = place;
                ReportLog.i(TAG, place + " tapped, Maps' route to it requested");
            } catch (Throwable error) {
                failures++;
                ReportLog.w(TAG, place + " tapped, Maps not reached", error);
            }
        }
    }

    /** For the problem report (main process). */
    static JSONObject report() throws JSONException {
        Boolean feature = on;
        String tap = lastTap;
        return new JSONObject()
                .put("on", feature != null ? feature : JSONObject.NULL)
                .put("icons_made", made)
                .put("kept", kept)
                .put("taps", taps)
                .put("last_tap", tap != null ? tap : JSONObject.NULL)
                .put("failures", failures);
    }
}
