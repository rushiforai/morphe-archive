package app.morphe.extension.maps.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.PictureInPictureParams;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.util.Log;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import app.morphe.extension.shared.Utils;

/**
 * Patch-owned Picture-in-picture setting in the main Maps Settings. The row shows On or Off and opens an On/Off
 * dialog. While it is off, Maps' explicit entry from onUserLeaveHint does nothing and its auto-enter request
 * (Android 12+) becomes false. It starts on, as in Maps.
 */
@SuppressWarnings("unused")
public final class PictureInPicturePatch {
    private static final String TAG = "MorphePip";
    private static final String KEY = "morphe_picture_in_picture";
    private static final String PREFERENCES = "morphe_picture_in_picture";
    private static final String ENABLED = "enabled";
    private static final String TITLE = "Picture-in-picture";
    private static volatile Boolean enabled;
    private static WeakReference<AlertDialog> active = new WeakReference<>(null);

    private PictureInPicturePatch() {
    }

    /** Replaces Maps' only enterPictureInPictureMode call; while PiP is on, result and exceptions are unchanged. */
    public static boolean enterPictureInPictureMode(Activity activity, PictureInPictureParams params) {
        if (!isEnabled(activity)) {
            Log.i(TAG, "enter_blocked");
            return false;
        }
        return activity.enterPictureInPictureMode(params);
    }

    /** Filters the value Maps passes to its only PictureInPictureParams.Builder.setAutoEnterEnabled call. */
    public static boolean autoEnter(boolean requested) {
        if (requested && !isEnabled(Utils.getContext())) {
            Log.i(TAG, "auto_enter_blocked");
            return false;
        }
        return requested;
    }

    /** The resolver supplies only names whose public APIs and register flows were proven in the APK. */
    public static void attach(Object fragment, String schema) {
        if (fragment == null || schema == null) return;
        try {
            String[] d = schema.split("\\|", -1);
            if (d.length != 12 || !fragment.getClass().getName().equals(d[0]))
                throw new IllegalArgumentException("settings entry schema");
            Object screen = fragment.getClass().getMethod(d[1]).invoke(fragment);
            Object host = fragment.getClass().getMethod(d[2]).invoke(fragment);
            if (!(host instanceof Activity) || screen == null) return;
            Activity activity = (Activity) host;
            if (activity.isFinishing() || activity.isDestroyed()) return;
            // Without the system feature Maps cannot enter PiP, so the switch would change nothing.
            if (!activity.getPackageManager().hasSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE)) return;
            ClassLoader loader = fragment.getClass().getClassLoader();
            Class<?> preference = Class.forName("androidx.preference.Preference", false, loader);
            Class<?> group = Class.forName("androidx.preference.PreferenceGroup", false, loader);
            if (!group.isInstance(screen)) throw new IllegalArgumentException("settings screen type");
            if (group.getMethod(d[11], CharSequence.class).invoke(screen, KEY) != null) return;
            Context context = (Context) preference.getField(d[3]).get(screen);
            Object row = preference.getConstructor(Context.class).newInstance(context);
            Method summary = preference.getMethod(d[6], CharSequence.class);
            preference.getMethod(d[4], String.class).invoke(row, KEY);
            preference.getMethod(d[5], CharSequence.class).invoke(row, TITLE);
            summary.invoke(row, state(isEnabled(activity)));
            WeakReference<Activity> owner = new WeakReference<>(activity);
            Class<?> click = Class.forName(d[8], false, loader);
            Object listener = Proxy.newProxyInstance(loader, new Class<?>[]{click}, (proxy, method, args) -> {
                if (method.getName().equals(d[9]) && args != null && args.length == 1 && preference.isInstance(args[0])) {
                    Activity current = owner.get();
                    if (current != null) {
                        // Follow the clicked row's theme, as the Vehicle and battery dialog does.
                        Context selected = current;
                        try {
                            Object value = preference.getField(d[3]).get(args[0]);
                            if (value instanceof Context) selected = (Context) value;
                        } catch (ReflectiveOperationException error) {
                            Log.w(TAG, "entry_theme_unavailable", error);
                        }
                        choose(current, selected, args[0], summary);
                    }
                    return true;
                }
                if (method.getDeclaringClass() == Object.class) {
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return args != null && args.length == 1 && proxy == args[0];
                    if (method.getName().equals("toString")) return "Morphe picture-in-picture setting";
                }
                return false;
            });
            preference.getMethod(d[7], click).invoke(row, listener);
            group.getMethod(d[10], preference).invoke(screen, row);
            Log.i(TAG, "entry_attached;screen=" + fragment.getClass().getName());
        } catch (Throwable error) {
            // A settings-entry failure must leave the original Maps screen usable.
            Log.w(TAG, "entry_unavailable", error);
        }
    }

    /** On/Off dialog; choosing an option saves it, updates the row and closes the dialog. */
    private static void choose(Activity activity, Context mapsContext, Object row, Method summary) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        try {
            AlertDialog prior = active.get();
            if (prior != null && prior.isShowing()) return;
            Context context = dialogContext(activity, mapsContext);
            int padding = Math.round(20 * context.getResources().getDisplayMetrics().density);
            LinearLayout body = new LinearLayout(context);
            body.setOrientation(LinearLayout.VERTICAL);
            body.setPadding(padding, padding / 2, padding, 0);
            TextView text = new TextView(context);
            text.setText("Shows navigation in a small window when you leave Maps.");
            text.setTextSize(14);
            body.addView(text);
            RadioGroup group = new RadioGroup(context);
            group.setOrientation(RadioGroup.VERTICAL);
            int onId = View.generateViewId(), offId = View.generateViewId();
            group.addView(option(context, onId, "On"));
            group.addView(option(context, offId, "Off"));
            group.check(isEnabled(activity) ? onId : offId);
            body.addView(group);
            AlertDialog dialog = new AlertDialog.Builder(context)
                    .setTitle(TITLE)
                    .setView(body)
                    .setNegativeButton("Cancel", null)
                    .create();
            // Set after the initial check, so only the user's choice saves.
            group.setOnCheckedChangeListener((ignored, checked) -> {
                boolean value = checked == onId;
                setEnabled(activity.getApplicationContext(), value);
                try {
                    summary.invoke(row, state(value));
                } catch (ReflectiveOperationException error) {
                    Log.w(TAG, "entry_summary_unavailable", error);
                }
                Log.i(TAG, "switched;enabled=" + value);
                dialog.dismiss();
            });
            dialog.setOnDismissListener(ignored -> {
                if (active.get() == dialog) active = new WeakReference<>(null);
            });
            active = new WeakReference<>(dialog);
            dialog.show();
        } catch (Throwable error) {
            Log.w(TAG, "dialog_unavailable", error);
        }
    }

    private static RadioButton option(Context context, int id, String label) {
        RadioButton button = new RadioButton(context);
        button.setId(id);
        button.setText(label);
        return button;
    }

    /** Same theme choice as BydVehicleSettings: the Maps row's day/night theme on a platform dialog theme. */
    private static Context dialogContext(Activity owner, Context mapsContext) {
        Boolean dark = themedDark(mapsContext);
        if (dark == null && mapsContext != owner) dark = themedDark(owner);
        if (dark == null) {
            dark = (mapsContext.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
        }
        return new ContextThemeWrapper(owner, dark
                ? android.R.style.Theme_Material_Dialog_Alert : android.R.style.Theme_Material_Light_Dialog_Alert);
    }

    private static Boolean themedDark(Context context) {
        try {
            int attribute = context.getResources().getIdentifier("isLightTheme", "attr", context.getPackageName());
            TypedValue value = new TypedValue();
            if (attribute != 0 && context.getTheme().resolveAttribute(attribute, value, true)
                    && value.type == TypedValue.TYPE_INT_BOOLEAN) return value.data == 0;
            TypedArray colors = context.obtainStyledAttributes(new int[]{android.R.attr.colorBackground});
            try {
                if (colors.hasValue(0)) {
                    int background = colors.getColor(0, Color.TRANSPARENT);
                    if (Color.alpha(background) == 255) return Color.luminance(background) < 0.5f;
                }
            } finally {
                colors.recycle();
            }
        } catch (RuntimeException error) {
            Log.w(TAG, "theme_attribute_unavailable", error);
        }
        return null;
    }

    private static boolean isEnabled(Context context) {
        Boolean value = enabled;
        if (value != null) return value;
        // Before the setting can be read, keep Maps' original behavior.
        if (context == null) return true;
        try {
            value = preferences(context).getBoolean(ENABLED, true);
        } catch (RuntimeException error) {
            Log.w(TAG, "setting_unavailable", error);
            return true;
        }
        enabled = value;
        return value;
    }

    private static void setEnabled(Context context, boolean value) {
        // The new value applies to this process even if it cannot be saved.
        enabled = value;
        try {
            preferences(context).edit().putBoolean(ENABLED, value).apply();
        } catch (RuntimeException error) {
            Log.w(TAG, "setting_not_saved", error);
        }
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    private static String state(boolean on) {
        return on ? "On" : "Off";
    }
}
