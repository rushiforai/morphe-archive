package app.aidan.extension.geocaching;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.text.InputType;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public final class OsmStyleBridge {
    private static final String TAG = "OsmStyleBridge";

    public static final String PREF_KEY_STYLE_URL = "UserMapPrefs.OSM_STYLE_URL";
    public static final String PREF_KEY_CUSTOM_STYLE_URL = "UserMapPrefs.OSM_CUSTOM_STYLE_URL";
    public static final String PREF_KEY_PREFERRED_MAP_TYPE = "UserMapPrefs.PREFERRED_MAP_TYPE";
    public static final String PREFS_NAMESPACE = "UserMapPrefs.NAMESPACE";

    public static final String DEFAULT_STYLE_URL = "https://tiles.openfreemap.org/styles/bright";
    public static final String STYLE_URL_BRIGHT = "https://tiles.openfreemap.org/styles/bright";
    public static final String STYLE_URL_LIBERTY = "https://tiles.openfreemap.org/styles/liberty";
    public static final String STYLE_URL_POSITRON = "https://tiles.openfreemap.org/styles/positron";
    public static final String STYLE_URL_DARK = "https://tiles.openfreemap.org/styles/dark";

    public static final int MAP_TYPE_STREET = 1;     // Liberty
    public static final int MAP_TYPE_SATELLITE = 2;  // Positron
    public static final int MAP_TYPE_TERRAIN = 3;    // Dark
    public static final int MAP_TYPE_HYBRID = 4;     // Custom URL
    public static final int MAP_TYPE_TRAILS = 5;     // Bright

    private OsmStyleBridge() {
    }

    private static SharedPreferences getPrefs(Context context) {
        if (context == null) {
            context = getAppContext();
        }
        if (context != null) {
            return context.getSharedPreferences(PREFS_NAMESPACE, Context.MODE_PRIVATE);
        }
        return null;
    }

    private static Context getAppContext() {
        try {
            Class<?> appClass = Class.forName("com.groundspeak.geocaching.intro.GeoApplication");
            Field instanceField = appClass.getDeclaredField("R");
            instanceField.setAccessible(true);
            Object instance = instanceField.get(null);
            if (instance instanceof Context) {
                return (Context) instance;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to resolve GeoApplication.R", t);
        }
        try {
            Class<?> appClass = Class.forName("com.groundspeak.geocaching.intro.GeoApplication");
            Field lazyField = appClass.getDeclaredField("P");
            lazyField.setAccessible(true);
            Object lazy = lazyField.get(null);
            if (lazy != null) {
                Object value = lazy.getClass().getMethod("get").invoke(lazy);
                if (value instanceof Context) {
                    return (Context) value;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to resolve GeoApplication.P", t);
        }
        return null;
    }

    public static String getSelectedStyleUrl(Context context) {
        SharedPreferences prefs = getPrefs(context);
        if (prefs != null) {
            String url = prefs.getString(PREF_KEY_STYLE_URL, DEFAULT_STYLE_URL);
            if (url != null && !url.trim().isEmpty()) {
                return url.trim();
            }
        }
        return DEFAULT_STYLE_URL;
    }

    public static String getActiveStyleUrl() {
        return getSelectedStyleUrl(null);
    }

    public static void setStyleUrl(Context context, String url) {
        if (url == null || url.trim().isEmpty()) {
            url = DEFAULT_STYLE_URL;
        }
        url = url.trim();
        SharedPreferences prefs = getPrefs(context);
        if (prefs != null) {
            prefs.edit().putString(PREF_KEY_STYLE_URL, url).apply();
            Log.i(TAG, "OSM style URL updated to: " + url);
        }
    }

    public static String getCustomStyleUrl(Context context) {
        SharedPreferences prefs = getPrefs(context);
        if (prefs != null) {
            String url = prefs.getString(PREF_KEY_CUSTOM_STYLE_URL, DEFAULT_STYLE_URL);
            if (url != null && !url.trim().isEmpty()) {
                return url.trim();
            }
        }
        return DEFAULT_STYLE_URL;
    }

    public static void setCustomStyleUrl(Context context, String url) {
        if (url == null || url.trim().isEmpty()) {
            url = DEFAULT_STYLE_URL;
        }
        url = url.trim();
        SharedPreferences prefs = getPrefs(context);
        if (prefs != null) {
            prefs.edit()
                    .putString(PREF_KEY_CUSTOM_STYLE_URL, url)
                    .putString(PREF_KEY_STYLE_URL, url)
                    .putInt(PREF_KEY_PREFERRED_MAP_TYPE, MAP_TYPE_HYBRID)
                    .apply();
            Log.i(TAG, "Custom OSM style URL set to: " + url);
        }
    }

    /**
     * Checks if the style selection is a custom URL (not one of the 4 standard presets).
     */
    public static boolean isCustomUrl(Context context) {
        String current = getSelectedStyleUrl(context);
        return !STYLE_URL_BRIGHT.equals(current)
                && !STYLE_URL_LIBERTY.equals(current)
                && !STYLE_URL_POSITRON.equals(current)
                && !STYLE_URL_DARK.equals(current);
    }

    /**
     * Called when the user clicks a map style option (MapType) from MapTypeSelectionFragment or bottom sheet.
     *   TRAILS (5) -> Bright
     *   STREET (1) -> Liberty
     *   SATELLITE (2) -> Positron
     *   TERRAIN (3) -> Dark
     *   HYBRID (4) -> Custom URL dialog
     */
    public static void onStyleSelected(final Object fragmentObj, int mapTypeId) {
        Log.i(TAG, "onStyleSelected called with mapTypeId: " + mapTypeId);
        final Activity activity = resolveActivity(fragmentObj);
        final Context context = activity != null ? activity : getAppContext();

        switch (mapTypeId) {
            case MAP_TYPE_TRAILS: // 5 -> Bright
                savePreferredMapType(context, MAP_TYPE_TRAILS);
                setStyleUrl(context, STYLE_URL_BRIGHT);
                dismissFragment(fragmentObj);
                promptRestartDialog(activity != null ? activity : context, "Bright");
                break;
            case MAP_TYPE_STREET: // 1 -> Liberty
                savePreferredMapType(context, MAP_TYPE_STREET);
                setStyleUrl(context, STYLE_URL_LIBERTY);
                dismissFragment(fragmentObj);
                promptRestartDialog(activity != null ? activity : context, "Liberty");
                break;
            case MAP_TYPE_SATELLITE: // 2 -> Positron
                savePreferredMapType(context, MAP_TYPE_SATELLITE);
                setStyleUrl(context, STYLE_URL_POSITRON);
                dismissFragment(fragmentObj);
                promptRestartDialog(activity != null ? activity : context, "Positron");
                break;
            case MAP_TYPE_TERRAIN: // 3 -> Dark
                savePreferredMapType(context, MAP_TYPE_TERRAIN);
                setStyleUrl(context, STYLE_URL_DARK);
                dismissFragment(fragmentObj);
                promptRestartDialog(activity != null ? activity : context, "Dark");
                break;
            case MAP_TYPE_HYBRID: // 4 -> Custom URL
                promptCustomStyleUrl(fragmentObj, activity != null ? activity : context);
                break;
            default:
                savePreferredMapType(context, MAP_TYPE_TRAILS);
                setStyleUrl(context, DEFAULT_STYLE_URL);
                dismissFragment(fragmentObj);
                promptRestartDialog(activity != null ? activity : context, "Bright");
                break;
        }
    }

    private static void savePreferredMapType(Context context, int mapTypeId) {
        SharedPreferences prefs = getPrefs(context);
        if (prefs != null) {
            prefs.edit().putInt(PREF_KEY_PREFERRED_MAP_TYPE, mapTypeId).apply();
            Log.i(TAG, "Preferred map type saved: " + mapTypeId);
        }
    }

    private static Activity resolveActivity(Object fragmentObj) {
        if (fragmentObj instanceof Activity) {
            return (Activity) fragmentObj;
        } else if (fragmentObj != null) {
            try {
                Method getActivityMethod = fragmentObj.getClass().getMethod("getActivity");
                Activity act = (Activity) getActivityMethod.invoke(fragmentObj);
                if (act != null) return act;
            } catch (Throwable ignored) {
            }
            try {
                Method getContextMethod = fragmentObj.getClass().getMethod("getContext");
                Object ctx = getContextMethod.invoke(fragmentObj);
                if (ctx instanceof Activity) return (Activity) ctx;
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static void dismissFragment(Object fragmentObj) {
        if (fragmentObj == null) return;
        try {
            Method dismissMethod = fragmentObj.getClass().getMethod("dismiss");
            dismissMethod.invoke(fragmentObj);
            return;
        } catch (Throwable ignored) {
        }
        // The only remaining host is MapLibreFragment's Compose map-settings sheet. Its former
        // boolean StateFlow (SharedMapViewModel.k0) is now a CameraPosition, so there is no
        // reflective dismissal channel; the sheet closes when the user dismisses it.
        Log.d(TAG, "No dismiss() on " + fragmentObj.getClass().getName() + "; leaving sheet open");
    }

    public static void promptCustomStyleUrl(final Object fragmentObj, final Context context) {
        final Activity activity = resolveActivity(fragmentObj);
        final Context dialogContext = activity != null ? activity : context;
        if (dialogContext == null) return;

        final String currentCustomUrl = getCustomStyleUrl(dialogContext);

        final EditText input = new EditText(dialogContext);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://tiles.openfreemap.org/styles/bright");
        input.setText(currentCustomUrl);
        input.selectAll();

        FrameLayout container = new FrameLayout(dialogContext);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        int margin = (int) (24 * dialogContext.getResources().getDisplayMetrics().density);
        params.leftMargin = margin;
        params.rightMargin = margin;
        input.setLayoutParams(params);
        container.addView(input);

        new AlertDialog.Builder(dialogContext)
                .setTitle("Custom Map Style URL")
                .setMessage("Enter the URL of a MapLibre vector style JSON:")
                .setView(container)
                .setPositiveButton("Apply", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        String text = input.getText().toString().trim();
                        if (!text.isEmpty()) {
                            setCustomStyleUrl(dialogContext, text);
                            dismissFragment(fragmentObj);
                            promptRestartDialog(dialogContext, "Custom URL");
                        }
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    /**
     * Prompts the user to restart the app to immediately apply the chosen map style.
     */
    public static void promptRestartDialog(final Context context, String styleName) {
        if (context == null) return;
        try {
            new AlertDialog.Builder(context)
                    .setTitle("Restart Required")
                    .setMessage("Map style updated to " + styleName + ". A restart is required to load the new map style.\n\nRestart now?")
                    .setPositiveButton("Restart Now", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            restartApp(context);
                        }
                    })
                    .setNegativeButton("Later", null)
                    .show();
        } catch (Throwable t) {
            Log.w(TAG, "Failed to show restart dialog", t);
        }
    }

    /**
     * Restarts the application cleanly using makeRestartActivityTask.
     */
    public static void restartApp(Context context) {
        if (context == null) return;
        try {
            PackageManager pm = context.getPackageManager();
            Intent launchIntent = pm.getLaunchIntentForPackage(context.getPackageName());
            if (launchIntent != null) {
                Intent restartIntent = Intent.makeRestartActivityTask(launchIntent.getComponent());
                context.startActivity(restartIntent);
                Runtime.getRuntime().exit(0);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to restart application", t);
        }
    }
}
