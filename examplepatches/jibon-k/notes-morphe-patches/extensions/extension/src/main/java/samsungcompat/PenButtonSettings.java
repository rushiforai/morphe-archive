package samsungcompat;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;

/**
 * Maps pen side buttons to editor actions. Which keys and which input device count as the pen comes
 * from the patch options ({@link Features}), unless the buttons were learned in the settings dialog.
 */
public final class PenButtonSettings {
    private static final String PREFS = "oneport_pen_buttons";
    private static final int NONE = -1;
    private static final long DOUBLE_MS = 280L;
    private static final long LONG_MS = 500L;
    // Learned buttons: key codes (0 = not learned, -1 = the pen has no such button) and device name.
    private static final String LEARNED_UPPER = "learned_upper";
    private static final String LEARNED_LOWER = "learned_lower";
    private static final String LEARNED_DEVICE = "learned_device";
    /** {@link Features#penDeviceName} value that matches any input device reporting a stylus source. */
    private static final String ANY_STYLUS = "@stylus";

    // Indexes 0-3 are plain key remaps. Indexes 4+ are handled in-process;
    // 4-7 toggle a drawing tool, 8 is a no-op, and 9+ click a button of the
    // composer's handwriting toolbar.
    private static final String[] ACTIONS = {
        "Scroll up", "Scroll down", "First page", "Last page",
        "Toggle eraser / last tool", "Toggle pen / last tool",
        "Toggle highlighter / last tool", "Open pen color picker",
        "Do nothing",
        "Undo", "Redo",
        "Selection mode", "Text mode", "Laser pointer",
        "Tape", "Lock canvas"
    };

    private static final int[] KEY_CODES = {92, 93, 122, 123, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0};

    // 0x7f09xxxx ids from app/res/values/public.xml (hw_toolbar_*).
    private static final int[] CLICK_IDS = {
        0, 0, 0, 0, 0, 0, 0, 0, 0,
        0x7f0908e4, // hw_toolbar_undo
        0x7f0908d7, // hw_toolbar_redo
        0x7f0908d9, // hw_toolbar_selection
        0x7f0908e0, // hw_toolbar_text_mode
        0x7f0908bf, // hw_toolbar_laser_pen
        0x7f0908df, // hw_toolbar_tape_pen
        0x7f0908c1  // hw_toolbar_lock_canvas
    };

    private static final int[] TOOL_IDS = {0x7f0908b8, 0x7f0908c7, 0x7f0908bb};
    private static final int PEN_SETTINGS_ROOT_ID = 0x7f090bdc;
    private static final int PEN_FIXED_COLORS_ID = 0x7f0905e7;
    private static final int PEN_COLOR_PICKER_BUTTON_ID = 0x7f090337;

    // "None" + ACTIONS, used by the double/long press spinners.
    private static final String[] GESTURE_ACTIONS = new String[ACTIONS.length + 1];
    static {
        GESTURE_ACTIONS[0] = "None";
        System.arraycopy(ACTIONS, 0, GESTURE_ACTIONS, 1, ACTIONS.length);
    }

    private static final Handler HANDLER = new Handler(Looper.getMainLooper());
    private static final Gesture UPPER = new Gesture();
    private static final Gesture LOWER = new Gesture();

    private PenButtonSettings() {}

    /** Pending timers for one physical button. Key dispatch and timers run on the main thread. */
    private static final class Gesture {
        Runnable single;
        Runnable longPress;
        boolean longFired;
        boolean awaitingSecond;
        boolean swallowUp;
        long lastUpTime;
    }

    public static void show(Context context) {
        Activity activity = findActivity(context);
        if (activity == null || activity.isFinishing()) return;
        SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        int pad = dp(activity, 20);

        LinearLayout panel = new LinearLayout(activity);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(pad, dp(activity, 4), pad, dp(activity, 4));

        String device = prefs.getString(LEARNED_DEVICE, null);
        TextView source = new TextView(activity);
        source.setText(device != null ? "Pen: " + device + " (learned)"
            : "Pen: " + describeDefaultDevice() + ". Tap Learn buttons if your pen's buttons do nothing.");
        source.setTextSize(13);
        panel.addView(source, new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        addHeader(activity, panel, "Button 1 (" + keyName(upperKey(prefs)) + ")");
        Spinner upSingle = addSpinner(activity, panel, "Single press", ACTIONS,
            clamp(prefs.getInt("page_up", 0), ACTIONS.length));
        Spinner upDouble = addSpinner(activity, panel, "Double press", GESTURE_ACTIONS,
            clamp(prefs.getInt("page_up_double", NONE) + 1, GESTURE_ACTIONS.length));
        Spinner upLong = addSpinner(activity, panel, "Long press", GESTURE_ACTIONS,
            clamp(prefs.getInt("page_up_long", NONE) + 1, GESTURE_ACTIONS.length));

        addHeader(activity, panel, "Button 2 (" + keyName(lowerKey(prefs)) + ")");
        Spinner downSingle = addSpinner(activity, panel, "Single press", ACTIONS,
            clamp(prefs.getInt("page_down", 1), ACTIONS.length));
        Spinner downDouble = addSpinner(activity, panel, "Double press", GESTURE_ACTIONS,
            clamp(prefs.getInt("page_down_double", NONE) + 1, GESTURE_ACTIONS.length));
        Spinner downLong = addSpinner(activity, panel, "Long press", GESTURE_ACTIONS,
            clamp(prefs.getInt("page_down_long", NONE) + 1, GESTURE_ACTIONS.length));

        TextView hint = new TextView(activity);
        hint.setText("Double and long press are optional. Assigning a double press adds a short "
            + "wait (~0.3 s) before the single press is applied. Long press fires while held.");
        hint.setTextSize(12);
        hint.setPadding(0, dp(activity, 12), 0, 0);
        panel.addView(hint, new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        ScrollView scroll = new ScrollView(activity);
        scroll.addView(panel);

        new AlertDialog.Builder(activity)
            .setTitle("Pen button actions")
            .setView(scroll)
            .setNegativeButton("Cancel", null)
            .setNeutralButton("Learn buttons", (dialog, which) -> learn(activity))
            .setPositiveButton("Save", (dialog, which) -> prefs.edit()
                .putInt("page_up", upSingle.getSelectedItemPosition())
                .putInt("page_up_double", upDouble.getSelectedItemPosition() - 1)
                .putInt("page_up_long", upLong.getSelectedItemPosition() - 1)
                .putInt("page_down", downSingle.getSelectedItemPosition())
                .putInt("page_down_double", downDouble.getSelectedItemPosition() - 1)
                .putInt("page_down_long", downLong.getSelectedItemPosition() - 1)
                .apply())
            .show();
    }

    /**
     * Records the pen's buttons: the user presses the upper, then the lower button. Both must come
     * from the same input device, whose name is stored to tell the pen apart from keyboards.
     */
    private static void learn(Activity activity) {
        SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        final int[] upper = {0};
        final String[] device = {null};
        AlertDialog dialog = new AlertDialog.Builder(activity)
            .setTitle("Learn pen buttons")
            .setMessage("Press the pen's upper (first) button.")
            .setNegativeButton("Cancel", null)
            .setNeutralButton("Use defaults", (d, which) -> {
                prefs.edit().remove(LEARNED_UPPER).remove(LEARNED_LOWER).remove(LEARNED_DEVICE).apply();
                show(activity);
            })
            .create();
        dialog.setOnKeyListener((d, keyCode, event) -> {
            if (keyCode == KeyEvent.KEYCODE_BACK) return false;
            if (event.getAction() != KeyEvent.ACTION_DOWN || event.getRepeatCount() > 0) return true;
            InputDevice input = InputDevice.getDevice(event.getDeviceId());
            String name = input != null ? input.getName() : null;
            if (name == null || event.getDeviceId() == KeyCharacterMap.VIRTUAL_KEYBOARD) {
                dialog.setMessage("That key didn't come from a device. Press a button on the pen.");
                return true;
            }
            if (upper[0] == 0) {
                upper[0] = keyCode;
                device[0] = name;
                dialog.setMessage("Upper button: " + keyName(keyCode) + " from " + name
                    + ".\n\nNow press the lower (second) button.");
                dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setText("Only one button");
                dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(v -> {
                    save(activity, prefs, upper[0], -1, device[0]);
                    dialog.dismiss();
                });
            } else if (!name.equals(device[0])) {
                dialog.setMessage("That came from " + name + ", not " + device[0]
                    + ". Press the pen's lower button.");
            } else if (keyCode == upper[0]) {
                dialog.setMessage("That's the upper button again. Press the lower button.");
            } else {
                save(activity, prefs, upper[0], keyCode, name);
                dialog.dismiss();
            }
            return true;
        });
        dialog.show();
    }

    private static void save(Activity activity, SharedPreferences prefs, int upper, int lower, String device) {
        prefs.edit().putInt(LEARNED_UPPER, upper).putInt(LEARNED_LOWER, lower)
            .putString(LEARNED_DEVICE, device).apply();
        android.util.Log.i("OnePortPenButtons", "learned " + keyName(upper) + " / " + keyName(lower)
            + " on " + device);
        show(activity);
    }

    private static int upperKey(SharedPreferences prefs) {
        int learned = prefs.getInt(LEARNED_UPPER, 0);
        return learned != 0 ? learned : Features.penKeyUpper();
    }

    private static int lowerKey(SharedPreferences prefs) {
        int learned = prefs.getInt(LEARNED_LOWER, 0);
        return learned != 0 ? learned : Features.penKeyLower();
    }

    private static String keyName(int keyCode) {
        if (keyCode <= 0) return "none";
        String name = KeyEvent.keyCodeToString(keyCode).replace("KEYCODE_", "").replace('_', ' ').toLowerCase();
        return Character.toUpperCase(name.charAt(0)) + name.substring(1);
    }

    private static String describeDefaultDevice() {
        String name = Features.penDeviceName();
        if (ANY_STYLUS.equals(name)) return "any stylus";
        return name.isEmpty() ? "any device" : name;
    }

    /** Whether [deviceId] is the pen: the learned device, else the patch's device option. */
    private static boolean isPen(SharedPreferences prefs, int deviceId) {
        InputDevice device = InputDevice.getDevice(deviceId);
        String learned = prefs.getString(LEARNED_DEVICE, null);
        if (learned != null) return device != null && learned.equals(device.getName());
        String name = Features.penDeviceName();
        if (name.isEmpty()) return true;
        if (device == null) return false;
        if (ANY_STYLUS.equals(name)) {
            int sources = device.getSources();
            return (sources & InputDevice.SOURCE_STYLUS) == InputDevice.SOURCE_STYLUS
                || (sources & InputDevice.SOURCE_BLUETOOTH_STYLUS) == InputDevice.SOURCE_BLUETOOTH_STYLUS;
        }
        return device.getName().contains(name);
    }

    private static void addHeader(Activity activity, LinearLayout panel, String text) {
        TextView header = new TextView(activity);
        header.setText(text);
        header.setTextSize(17);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(activity, 14);
        panel.addView(header, params);
    }

    private static Spinner addSpinner(Activity activity, LinearLayout panel, String label,
            String[] entries, int selection) {
        TextView title = new TextView(activity);
        title.setText(label);
        title.setTextSize(14);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        labelParams.topMargin = dp(activity, 8);
        panel.addView(title, labelParams);

        Spinner spinner = new Spinner(activity);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(activity,
            android.R.layout.simple_spinner_item, entries);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        spinner.setSelection(selection);
        panel.addView(spinner, new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        return spinner;
    }

    private static int clamp(int value, int size) {
        return value < 0 || value >= size ? 0 : value;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static Activity findActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /**
     * "Pen button actions" patch hook: adds a "Pen button actions" row to the app's main settings screen.
     * [fragment] is the app's PreferenceFragmentCompat; androidx.preference is reached by reflection.
     */
    public static void addSettingsEntry(Object fragment) {
        try {
            Object screen = fragment.getClass().getMethod("getPreferenceScreen").invoke(fragment);
            Context context = (Context) fragment.getClass().getMethod("getContext").invoke(fragment);
            ClassLoader loader = fragment.getClass().getClassLoader();
            Class<?> prefClass = Class.forName("androidx.preference.Preference", true, loader);
            Class<?> listenerClass = Class.forName("androidx.preference.Preference$OnPreferenceClickListener", true, loader);
            Object pref = prefClass.getConstructor(Context.class).newInstance(context);
            prefClass.getMethod("setTitle", CharSequence.class).invoke(pref, "Pen button actions");
            prefClass.getMethod("setSummary", CharSequence.class).invoke(pref, "Choose what the pen buttons do");
            Object listener = java.lang.reflect.Proxy.newProxyInstance(loader, new Class<?>[]{listenerClass},
                (proxy, method, args) -> {
                    if (method.getName().equals("onPreferenceClick")) {
                        show(context);
                        return true;
                    }
                    return method.getName().equals("equals") ? proxy == args[0]
                        : method.getName().equals("hashCode") ? System.identityHashCode(proxy) : null;
                });
            prefClass.getMethod("setOnPreferenceClickListener", listenerClass).invoke(pref, listener);
            Class.forName("androidx.preference.PreferenceGroup", true, loader)
                .getMethod("addPreference", prefClass).invoke(screen, pref);
        } catch (Exception e) {
            android.util.Log.e("OnePortPenButtons", "Unable to add the settings entry", e);
        }
    }

    /** "Pen button actions" patch hook for views (the note list). */
    public static int mapKeyCode(View view, KeyEvent event) {
        return mapKeyCode(view.getContext(), event);
    }

    /** "Pen button actions" patch hook for the editor: true if the pen key was handled. */
    public static boolean handleKey(Context context, KeyEvent event) {
        return mapKeyCode(context, event) == -2;
    }

    /**
     * Returns the key code the app should see for [event], or -2 if a pen action consumed it.
     * Pen keys keep the stored settings names "page_up" (upper) and "page_down" (lower).
     */
    public static int mapKeyCode(Context context, KeyEvent event) {
        int code = event.getKeyCode();
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        boolean upper = code == upperKey(prefs);
        if (!upper && code != lowerKey(prefs)) return code;
        if (!isPen(prefs, event.getDeviceId())) return code;
        // Internally the upper button is "page_up" and the lower one "page_down" (settings names).
        int keyCode = upper ? KeyEvent.KEYCODE_PAGE_UP : KeyEvent.KEYCODE_PAGE_DOWN;

        String key = keyCode == KeyEvent.KEYCODE_PAGE_UP ? "page_up" : "page_down";
        int single = prefs.getInt(key, keyCode == KeyEvent.KEYCODE_PAGE_UP ? 0 : 1);
        int doublePress = prefs.getInt(key + "_double", NONE);
        int longPress = prefs.getInt(key + "_long", NONE);

        // No gestures configured: keep the original, latency-free behaviour.
        if (doublePress == NONE && longPress == NONE) {
            if (single >= 0 && single < 4) return KEY_CODES[single];
            if (event.getAction() == KeyEvent.ACTION_DOWN && event.getRepeatCount() == 0) {
                perform(context, single);
            }
            return -2;
        }

        Gesture gesture = keyCode == KeyEvent.KEYCODE_PAGE_UP ? UPPER : LOWER;
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            if (event.getRepeatCount() > 0) return -2;
            if (gesture.awaitingSecond
                    && SystemClock.uptimeMillis() - gesture.lastUpTime <= DOUBLE_MS) {
                cancel(gesture);
                gesture.awaitingSecond = false;
                gesture.swallowUp = true;
                android.util.Log.i("OnePortPenButtons", "double press key=" + keyCode
                    + " action=" + actionName(doublePress));
                perform(context, doublePress);
                return -2;
            }
            cancel(gesture);
            gesture.longFired = false;
            gesture.awaitingSecond = false;
            gesture.swallowUp = false;
            if (longPress != NONE) {
                final Context app = context;
                gesture.longPress = () -> {
                    gesture.longPress = null;
                    gesture.longFired = true;
                    android.util.Log.i("OnePortPenButtons", "long press key=" + keyCode
                        + " action=" + actionName(longPress));
                    perform(app, longPress);
                };
                HANDLER.postDelayed(gesture.longPress, LONG_MS);
            }
            return -2;
        }

        if (event.getAction() == KeyEvent.ACTION_UP) {
            cancelLong(gesture);
            if (gesture.swallowUp) {
                gesture.swallowUp = false;
                return -2;
            }
            if (gesture.longFired) {
                gesture.longFired = false;
                gesture.awaitingSecond = false;
                return -2;
            }
            if (doublePress != NONE) {
                final Context app = context;
                gesture.lastUpTime = SystemClock.uptimeMillis();
                gesture.awaitingSecond = true;
                gesture.single = () -> {
                    gesture.single = null;
                    gesture.awaitingSecond = false;
                    android.util.Log.i("OnePortPenButtons", "single press key=" + keyCode
                        + " action=" + actionName(single));
                    perform(app, single);
                };
                HANDLER.postDelayed(gesture.single, DOUBLE_MS);
            } else {
                perform(context, single);
            }
            return -2;
        }
        return -2;
    }

    private static String actionName(int action) {
        return action >= 0 && action < ACTIONS.length ? ACTIONS[action] : "None";
    }

    private static void cancel(Gesture gesture) {
        cancelLong(gesture);
        if (gesture.single != null) {
            HANDLER.removeCallbacks(gesture.single);
            gesture.single = null;
        }
    }

    private static void cancelLong(Gesture gesture) {
        if (gesture.longPress != null) {
            HANDLER.removeCallbacks(gesture.longPress);
            gesture.longPress = null;
        }
    }

    private static void perform(Context context, int action) {
        if (action < 0 || action >= ACTIONS.length) return;
        Activity activity = findActivity(context);
        if (activity == null || activity.isFinishing()) return;
        android.util.Log.i("OnePortPenButtons", "perform " + ACTIONS[action]);
        if (action < 4) {
            sendKey(activity, KEY_CODES[action]);
        } else if (action <= 6) {
            toggleTool(activity, action - 4);
        } else if (action == 7) {
            openPenColorPicker(activity);
        } else if (action >= 9) {
            clickToolbarItem(activity, CLICK_IDS[action], ACTIONS[action]);
        }
    }

    /** Used by deferred single presses for the key-remap actions (0-3). */
    private static void sendKey(Activity activity, int code) {
        long now = SystemClock.uptimeMillis();
        activity.dispatchKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, code, 0));
        activity.dispatchKeyEvent(new KeyEvent(now, now + 20, KeyEvent.ACTION_UP, code, 0));
    }

    private static void clickToolbarItem(Activity activity, int viewId, String label) {
        View target = activity.findViewById(viewId);
        if (target == null) {
            android.util.Log.w("OnePortPenButtons", label + ": toolbar item not present");
            return;
        }
        if (!target.isEnabled()) {
            android.util.Log.i("OnePortPenButtons", label + ": toolbar item is disabled");
            return;
        }
        target.performClick();
    }

    private static void toggleTool(Activity activity, int toolIndex) {
        int targetId = TOOL_IDS[toolIndex];
        View target = activity.findViewById(targetId);
        if (target == null) return;
        SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (target.isSelected()) {
            int lastId = prefs.getInt("last_tool", TOOL_IDS[toolIndex == 0 ? 1 : 0]);
            View last = activity.findViewById(lastId);
            if (last != null && last != target) last.performClick();
        } else {
            for (int id : TOOL_IDS) {
                View current = activity.findViewById(id);
                if (current != null && current.isSelected()) {
                    prefs.edit().putInt("last_tool", id).apply();
                    break;
                }
            }
            target.performClick();
        }
    }

    private static void openPenColorPicker(Activity activity) {
        View pen = activity.findViewById(TOOL_IDS[1]);
        if (pen == null) {
            android.util.Log.w("OnePortPenButtons", "pen toolbar button is not present");
            return;
        }
        if (!pen.isSelected()) {
            pen.performClick();
            pen.postDelayed(() -> openPenSettingsAndColorPicker(activity, pen), 160);
        } else {
            openPenSettingsAndColorPicker(activity, pen);
        }
    }

    private static void openPenSettingsAndColorPicker(Activity activity, View pen) {
        if (activity.findViewById(PEN_SETTINGS_ROOT_ID) == null) {
            pen.performClick();
            pen.postDelayed(() -> clickPenColorPicker(activity), 180);
        } else {
            clickPenColorPicker(activity);
        }
    }

    private static void clickPenColorPicker(Activity activity) {
        View fixedColors = activity.findViewById(PEN_FIXED_COLORS_ID);
        View pickerButton = fixedColors == null
            ? null : fixedColors.findViewById(PEN_COLOR_PICKER_BUTTON_ID);
        if (pickerButton == null || !pickerButton.isClickable()) {
            android.util.Log.w("OnePortPenButtons", "color picker button is not available");
            return;
        }
        pickerButton.performClick();
    }
}
