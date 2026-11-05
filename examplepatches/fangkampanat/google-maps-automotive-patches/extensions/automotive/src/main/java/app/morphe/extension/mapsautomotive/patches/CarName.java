package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.InputFilter;
import android.text.InputType;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.Toast;

import app.morphe.extension.shared.Utils;

/**
 * The car's name in phone Maps: its vehicle chip in driving directions and the Send to car list.
 * <p>
 * Maps puts that name into its vehicle-info upload to the Google account. It builds it from the car's
 * make and model, and without them (DiLink reports neither) it is "Vehicle 1". The patch passes the
 * name through {@link #vehicleName}, which gives the name chosen in Maps' Settings (row "Car name for
 * Send to car"); nothing else in the upload changes. Maps sends the vehicle info about 20 s after it
 * starts and then at intervals its server sets, so a new name reaches the account after a restart.
 * Part of Send to car: with Send to car switched off, Maps' own name is sent.
 * <p>
 * The chosen name is not written to the log or the problem report, only its length.
 */
@SuppressWarnings("unused")
public final class CarName {
    private static final String TAG = "MorpheSendToCar";
    private static final String PREFERENCES = "morphe_car_name";
    private static final String KEY_NAME = "name";
    /** The name Maps built itself, last seen in its upload; the Settings row shows it. */
    private static final String KEY_MAPS_NAME = "maps_name";
    /** Maps' name for a car without make and model, shown until Maps' upload has run once. */
    private static final String MAPS_FALLBACK = "Vehicle 1";
    /** In UTF-16 units, as the text field counts. Google's own limit is unknown. */
    static final int MAX_LENGTH = 30;
    private static volatile String lastMapsName;
    private static volatile String lastLogged;

    private CarName() {
    }

    /** Injection point: the vehicle name Maps writes into its vehicle-info upload. */
    public static String vehicleName(String mapsName) {
        try {
            Context context = Utils.isContextSet() ? Utils.getContext() : null;
            if (context == null) return mapsName;
            rememberMapsName(context, mapsName);
            String name = SafeMode.on(context, SafeMode.SEND_TO_CAR) ? storedName(context) : null;
            String logged = name == null ? "maps:" + mapsName : "own:" + name.length();
            if (!logged.equals(lastLogged)) {
                lastLogged = logged;
                ReportLog.i(TAG, name == null
                        ? "car name: Maps' own (" + mapsName + ")"
                        : "car name: the one set in Settings (" + name.length() + " characters) instead of Maps' own");
            }
            return name == null ? mapsName : name;
        } catch (Throwable error) {
            ReportLog.w(TAG, "car name left to Maps", error);
            return mapsName;
        }
    }

    /**
     * Trimmed, with each run of spaces as one space, without control characters, unpaired surrogates and
     * invisible format characters (bidi controls, zero-width spaces), cut at {@link #MAX_LENGTH} without
     * splitting a surrogate pair. Joiners and tag characters stay inside emoji sequences. Null when
     * nothing is left.
     */
    static String sanitize(String value) {
        if (value == null) return null;
        StringBuilder out = new StringBuilder();
        boolean space = false;
        for (int index = 0; index < value.length(); ) {
            int codePoint = value.codePointAt(index);
            index += Character.charCount(codePoint);
            if (Character.isWhitespace(codePoint) || Character.isSpaceChar(codePoint)) {
                trimTrailingFormat(out);
                space = out.length() > 0;
                continue;
            }
            int type = Character.getType(codePoint);
            if (type == Character.CONTROL || type == Character.SURROGATE) continue;
            if (type == Character.FORMAT && (!joinsSequence(codePoint) || space || out.length() == 0)) continue;
            int needed = (space ? 1 : 0) + Character.charCount(codePoint);
            if (out.length() + needed > MAX_LENGTH) break;
            if (space) out.append(' ');
            space = false;
            out.appendCodePoint(codePoint);
        }
        trimTrailingFormat(out);
        return out.length() == 0 ? null : out.toString();
    }

    /** Format characters that belong to emoji sequences: zero-width (non-)joiners and tag characters. */
    private static boolean joinsSequence(int codePoint) {
        return codePoint == 0x200C || codePoint == 0x200D || codePoint >= 0xE0020 && codePoint <= 0xE007F;
    }

    /**
     * A joiner, or a tag sequence without its closing cancel tag (U+E007F), before a space or at the end
     * joins nothing.
     */
    private static void trimTrailingFormat(StringBuilder out) {
        while (out.length() > 0) {
            int last = Character.codePointBefore(out, out.length());
            if (!joinsSequence(last) || last == 0xE007F) return;
            out.delete(out.length() - Character.charCount(last), out.length());
        }
    }

    /** Only spaces, by the same rule as {@link #sanitize}. */
    private static boolean isBlank(String value) {
        for (int index = 0; index < value.length(); ) {
            int codePoint = value.codePointAt(index);
            if (!Character.isWhitespace(codePoint) && !Character.isSpaceChar(codePoint)) return false;
            index += Character.charCount(codePoint);
        }
        return true;
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    /** The name chosen in Settings, or null for Maps' own. */
    static String storedName(Context context) {
        try {
            return sanitize(preferences(context).getString(KEY_NAME, null));
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not read the car name", exception);
            return null;
        }
    }

    private static void rememberMapsName(Context context, String mapsName) {
        if (mapsName == null || mapsName.equals(lastMapsName)) return;
        lastMapsName = mapsName;
        try {
            SharedPreferences preferences = preferences(context);
            if (!mapsName.equals(preferences.getString(KEY_MAPS_NAME, null))) {
                preferences.edit().putString(KEY_MAPS_NAME, mapsName).apply();
            }
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not keep Maps' car name", exception);
        }
    }

    /** Maps' own name, as last seen in its upload. */
    private static String mapsName(Context context) {
        String name = lastMapsName;
        if (name == null) {
            try {
                name = preferences(context).getString(KEY_MAPS_NAME, null);
            } catch (RuntimeException exception) {
                name = null;
            }
        }
        return name == null || name.isEmpty() ? MAPS_FALLBACK : name;
    }

    // Settings row. The patch adds it to Maps' Settings list, before About & help.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "ชื่อรถสำหรับ Send to car" : "Car name for Send to car";
    }

    /** Injection point: the row subtitle, the name phone Maps gets. */
    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        if (!SafeMode.on(context, SafeMode.SEND_TO_CAR)) {
            return thai ? "ใช้ชื่อของ Maps ชั่วคราว · สวิตช์ใน Report Maps Car" : "Maps' name for now · switch in Report Maps Car";
        }
        String name = storedName(context);
        if (name != null) return name;
        return mapsName(context) + (thai ? " · ชื่อของ Maps" : " · Maps' name");
    }

    /**
     * Injection point: the row's click action. The container view of the Settings screen, if the
     * patch found one, gives the activity when the given context is not one.
     */
    public static Runnable getSettingsAction(Context context, View container) {
        return () -> showEditor(context, container);
    }

    private static void showEditor(Context context, View container) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the car name editor: " + context);
            return;
        }
        Activity host = activity;
        boolean thai = UiDensityPatch.isThai(host);
        String current = storedName(host);

        EditText input = new EditText(host);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_WORDS);
        input.setImeOptions(EditorInfo.IME_ACTION_DONE);
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(MAX_LENGTH)});
        input.setHint(mapsName(host));
        if (current != null) {
            input.setText(current);
            input.setSelection(input.getText().length());
        }
        FrameLayout frame = new FrameLayout(host);
        int padding = Math.round(24 * host.getResources().getDisplayMetrics().density);
        frame.setPadding(padding, 0, padding, 0);
        frame.addView(input);

        AlertDialog.Builder builder = new AlertDialog.Builder(host)
                .setTitle(getSettingsTitle(host))
                .setMessage(thai
                        ? "Google Maps ในมือถือแสดงชื่อนี้สำหรับรถคันนี้ ในหน้าเส้นทางและในส่งไปที่รถยนต์ ชื่อนี้เก็บในบัญชี"
                        + " Google ของคุณ จึงไม่ควรใส่ชื่อคนหรือเลขทะเบียนรถ เว้นว่างไว้เพื่อใช้ชื่อของ Maps"
                        : "Phone Google Maps shows this name for the car in directions and in Send to car. It is saved"
                        + " in your Google account, so leave out people's names and the plate number. Leave it empty"
                        + " to use Maps' own name.")
                .setView(frame)
                .setPositiveButton(thai ? "บันทึก" : "Save", (dialog, which) -> saveTyped(host, input.getText().toString(), current))
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null);
        if (current != null) {
            builder.setNeutralButton(thai ? "ใช้ชื่อของ Maps" : "Use Maps' name", (dialog, which) -> save(host, null, current));
        }
        AlertDialog dialog = builder.create();
        // Typed text is lost on an outside tap; Cancel and Back still close it.
        dialog.setCanceledOnTouchOutside(false);
        // The keyboard's Done (or Enter) saves, as the Save button does.
        input.setOnEditorActionListener((view, actionId, event) -> {
            boolean enter = event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER && event.getAction() == KeyEvent.ACTION_DOWN;
            if (actionId != EditorInfo.IME_ACTION_DONE && !enter) return false;
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            return true;
        });
        dialog.show();
    }

    private static void saveTyped(Activity activity, String typed, String current) {
        String name = sanitize(typed);
        if (name == null && typed != null && !isBlank(typed)) {
            // Only invisible characters: keep the name there was.
            toast(activity, UiDensityPatch.isThai(activity)
                    ? "ชื่อนี้ไม่มีตัวอักษรที่มองเห็นได้ จึงไม่ได้บันทึก" : "The name has no visible characters, so it was not saved.");
            return;
        }
        save(activity, name, current);
    }

    private static void save(Activity activity, String name, String current) {
        if (name == null ? current == null : name.equals(current)) return;
        SharedPreferences.Editor editor = preferences(activity).edit();
        // commit, not apply: a restart may follow at once.
        boolean saved = (name == null ? editor.remove(KEY_NAME) : editor.putString(KEY_NAME, name)).commit();
        ReportLog.i(TAG, (name == null ? "car name cleared, Maps' own again" : "car name set (" + name.length() + " characters)")
                + ", saved " + saved);
        boolean thai = UiDensityPatch.isThai(activity);
        if (SafeMode.on(activity, SafeMode.SEND_TO_CAR)) {
            confirmRestart(activity);
        } else if (name == null) {
            // Maps' own name is what goes up while Send to car is off anyway.
            toast(activity, thai ? "บันทึกแล้ว" : "Saved.");
        } else {
            new AlertDialog.Builder(activity)
                    .setTitle(getSettingsTitle(activity))
                    .setMessage(thai
                            ? "บันทึกแล้ว Maps Car จะใช้ชื่อนี้เมื่อเปิด Send to car อีกครั้งใน Report Maps Car"
                            : "Saved. Maps Car uses this name once Send to car is switched on again in Report Maps Car.")
                    .setPositiveButton(thai ? "ตกลง" : "OK", null)
                    .show();
        }
    }

    // Maps sends the vehicle info about 20 s after it starts; a restart sends the new name now.
    private static void confirmRestart(Activity activity) {
        boolean thai = UiDensityPatch.isThai(activity);
        String later = thai ? "บันทึกแล้ว จะส่งชื่อตอนเปิด Maps Car ครั้งถัดไป" : "Saved. The name is sent at the next start.";
        new AlertDialog.Builder(activity)
                .setTitle(getSettingsTitle(activity))
                .setMessage(thai
                        ? "บันทึกแล้ว Maps Car ส่งชื่อขึ้นบัญชี Google ราว 20 วินาทีหลังเริ่มแอป เริ่มใหม่ตอนนี้เลยไหม"
                        + " (การนำทางที่กำลังทำงานจะหยุด) ไม่อย่างนั้นจะส่งตอนเปิดครั้งถัดไป"
                        : "Saved. Maps Car sends the name to your Google account about 20 s after it starts. Restart now"
                        + " (active navigation stops), or it is sent at the next start.")
                .setPositiveButton(thai ? "เริ่มใหม่" : "Restart", (dialog, which) -> {
                    ReportLog.i(TAG, "restarting for the car name");
                    Utils.restartApp(activity);
                })
                // The Settings row keeps its old text until Settings opens again, so Later and Back say it was saved.
                .setNegativeButton(thai ? "ภายหลัง" : "Later", (dialog, which) -> toast(activity, later))
                .setOnCancelListener(dialog -> toast(activity, later))
                .show();
    }

    private static void toast(Context context, String text) {
        try {
            Toast.makeText(context, text, Toast.LENGTH_LONG).show();
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not show a toast", exception);
        }
    }
}
