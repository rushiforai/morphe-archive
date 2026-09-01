package app.morphe.extension.monument;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Runtime logic for the "Login with token" setup option.
 *
 * <p>Compiled into a standalone DEX ({@code monument-login.mpe}) and merged into the app by the
 * {@code Login with token} bytecode patch. It writes preferences using only STABLE contracts,
 * never obfuscated symbols:
 * <ul>
 *   <li>Multi-process prefs go through the app's exported {@code MultiProvider} ContentProvider
 *       (authority and URI scheme are derived from the application id, so they survive R8).</li>
 *   <li>The single normal-pref key ({@code service.type}) is written straight to the
 *       {@code monument.preferences} SharedPreferences file.</li>
 * </ul>
 * This mirrors exactly what {@code SharedPrefsHelper} does, so the app reads the values back
 * through its own helper without any change.
 *
 * <p>{@link #install(View)} is invoked from {@code CloudConnectOptionsDialog.onViewCreated} with
 * the bottom sheet's root {@code LinearLayout}.
 */
@SuppressWarnings("unused")
public final class LoginWithTokenPatch {

    // ----- Storage contract (must match the app; see MultiProvider / Preferences) -----
    private static final String APP_ID = "com.getmonument.android";
    private static final String AUTHORITY = APP_ID + ".utils.multi_preferences.MultiProvider";
    private static final String MULTI_PREFS = "monument.multiprocess_preferences";
    private static final String NORMAL_PREFS = "monument.preferences";

    private static final String KEY_SETUP_COMPLETED = "monument.key.setup_completed";
    private static final String KEY_SERIAL = "monument.key.serial_number";
    private static final String KEY_CLIENT_ID = "monument.key.client_id";
    private static final String KEY_SECRET_KEY = "monument.key.secret_key";
    private static final String KEY_FIRMWARE_BUILD = "monument.key.firmware_version";
    private static final String KEY_API_SPEC = "monument.key.monument_api_spec_version";
    private static final String KEY_DEVICE_VERSION = "device.version";
    private static final String KEY_SERVICE_TYPE = "service.type";
    private static final String KEY_LOCAL_ADDRESS = "monument.key.local_address";
    private static final String KEY_CURRENT_ADDRESS_TYPE = "monument.key.current_client_address_type";

    // MultiProvider ContentValues column names.
    private static final String CV_KEY = "key";
    private static final String CV_VALUE = "value";

    // ----- Values that mark a completed local (Monument 2) setup -----
    private static final int DEVICE_VERSION_M2 = 2;
    private static final String SERVICE_TYPE_DEVICE = "device";
    /** Above MINIMUM_FIRMWARE_BUILD_REQUIRED_M2 (6065): skips the firmware-update screen and
     *  enables the secure-connection path. Overwritten by the app once it reaches the device. */
    private static final int FIRMWARE_BUILD = 999999;
    private static final int API_SPEC_VERSION = 12;

    private LoginWithTokenPatch() {
    }

    public static void install(final View root) {
        if (!(root instanceof ViewGroup)) {
            return;
        }
        final ViewGroup container = (ViewGroup) root;
        final Context context = root.getContext();

        final TextView option = new TextView(context);
        option.setText("Login with token");
        option.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        option.setGravity(Gravity.CENTER_VERTICAL);
        final int padH = dp(context, 24);
        option.setPadding(padH, 0, padH, 0);
        option.setClickable(true);
        option.setFocusable(true);
        applySelectableBackground(context, option);
        option.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));

        option.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(final View v) {
                showDialog(context);
            }
        });

        container.addView(option);
    }

    private static void showDialog(final Context context) {
        final int pad = dp(context, 24);
        final LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(pad, dp(context, 8), pad, 0);

        final EditText serialInput = new EditText(context);
        serialInput.setHint("Device serial");
        serialInput.setSingleLine(true);

        final EditText clidInput = new EditText(context);
        clidInput.setHint("Client ID");
        clidInput.setInputType(InputType.TYPE_CLASS_NUMBER);
        clidInput.setText("1");
        clidInput.setSingleLine(true);

        final EditText tokenInput = new EditText(context);
        tokenInput.setHint("Access token (secret key hex)");
        tokenInput.setSingleLine(true);

        final EditText ipInput = new EditText(context);
        ipInput.setHint("Device IP address (optional)");
        ipInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        ipInput.setSingleLine(true);

        layout.addView(serialInput);
        layout.addView(clidInput);
        layout.addView(tokenInput);
        layout.addView(ipInput);

        new android.app.AlertDialog.Builder(context)
                .setTitle("Login with token")
                .setView(layout)
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Ok", (dialog, which) -> {
                    final String serial = serialInput.getText().toString().trim();
                    final String clidStr = clidInput.getText().toString().trim();
                    // Normalize: device authenticates with lower-case hex(secretkey);
                    // SQLite hex() yields upper-case, so lower-case it here.
                    final String token = tokenInput.getText().toString().trim()
                            .replaceAll("\\s", "").toLowerCase(java.util.Locale.US);
                    final String ip = ipInput.getText().toString().trim();

                    if (serial.isEmpty() || clidStr.isEmpty() || token.isEmpty()) {
                        toast(context, "Serial, client id and token are all required");
                        return;
                    }

                    final int clid;
                    try {
                        clid = Integer.parseInt(clidStr);
                    } catch (final NumberFormatException e) {
                        toast(context, "Client id must be a number");
                        return;
                    }

                    try {
                        applyLogin(context, serial, clid, token, ip);
                    } catch (final Throwable t) {
                        toast(context, "Login failed: " + t.getMessage());
                        return;
                    }

                    relaunch(context);
                })
                .show();
    }

    private static void applyLogin(final Context context, final String serial, final int clid,
                                   final String token, final String ip) {
        final Context app = context.getApplicationContext();
        final ContentResolver resolver = app.getContentResolver();

        // Start from a clean multi-process store so no stale login/cloud state remains.
        clearMulti(resolver);

        // Everything the app needs to treat the device as set up and to authenticate every
        // client API call (clid + Authorization = SHA-256(secretKey)).
        putBoolean(resolver, KEY_SETUP_COMPLETED, true);
        putString(resolver, KEY_SERIAL, serial);
        putInt(resolver, KEY_CLIENT_ID, clid);
        putString(resolver, KEY_SECRET_KEY, token);
        putInt(resolver, KEY_DEVICE_VERSION, DEVICE_VERSION_M2);
        putInt(resolver, KEY_FIRMWARE_BUILD, FIRMWARE_BUILD);
        putInt(resolver, KEY_API_SPEC, API_SPEC_VERSION);

        // Optional: pin the device's local address so the app connects directly instead of
        // relying on LAN discovery. Mirrors SharedPrefsHelper.setMonumentAddress(ip, LOCAL):
        // store the address and point the current-address-type at the local-address key.
        if (ip != null && !ip.isEmpty()) {
            putString(resolver, KEY_LOCAL_ADDRESS, ip);
            putString(resolver, KEY_CURRENT_ADDRESS_TYPE, KEY_LOCAL_ADDRESS);
        }

        // serviceType lives in the normal (single-process) prefs file.
        final SharedPreferences normal = app.getSharedPreferences(NORMAL_PREFS, Context.MODE_PRIVATE);
        normal.edit().putString(KEY_SERVICE_TYPE, SERVICE_TYPE_DEVICE).commit();
    }

    /**
     * Relaunch into the launcher (Splash) with a cleared task. The process is kept alive so the
     * SharedPreferences writes flush normally; the app's configuration manager reads these values
     * live (it does not cache them before setup completes), and Splash routes to the main screen.
     * The device is then discovered on the LAN by its serial.
     */
    private static void relaunch(final Context context) {
        final Context app = context.getApplicationContext();
        final Intent intent = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
        if (intent != null) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            app.startActivity(intent);
        }
    }

    // ----- MultiProvider helpers (content://<authority>/<type>/<file>/<key>) -----

    private static void putString(final ContentResolver r, final String key, final String value) {
        final ContentValues cv = new ContentValues();
        cv.put(CV_KEY, key);
        cv.put(CV_VALUE, value);
        r.update(uri("string", key), cv, null, null);
    }

    private static void putInt(final ContentResolver r, final String key, final int value) {
        final ContentValues cv = new ContentValues();
        cv.put(CV_KEY, key);
        cv.put(CV_VALUE, value);
        r.update(uri("integer", key), cv, null, null);
    }

    private static void putBoolean(final ContentResolver r, final String key, final boolean value) {
        final ContentValues cv = new ContentValues();
        cv.put(CV_KEY, key);
        cv.put(CV_VALUE, value);
        r.update(uri("boolean", key), cv, null, null);
    }

    private static void clearMulti(final ContentResolver r) {
        // CODE_PREFS delete URI: content://<authority>/prefs/<file>/
        final Uri clearUri = Uri.parse("content://" + AUTHORITY + "/prefs/" + MULTI_PREFS + "/");
        try {
            r.delete(clearUri, null, null);
        } catch (final Throwable ignored) {
            // Non-fatal: if the clear fails we still overwrite the keys we care about below.
        }
    }

    private static Uri uri(final String type, final String key) {
        return Uri.parse("content://" + AUTHORITY + "/" + type + "/" + MULTI_PREFS + "/" + key);
    }

    // ----- misc UI helpers -----

    private static int dp(final Context context, final int value) {
        final float density = context.getResources().getDisplayMetrics().density;
        return Math.round(value * density);
    }

    private static void applySelectableBackground(final Context context, final View view) {
        try {
            final TypedValue tv = new TypedValue();
            context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, tv, true);
            view.setBackgroundResource(tv.resourceId);
        } catch (final Throwable ignored) {
        }
    }

    private static void toast(final Context context, final String message) {
        Toast.makeText(context, message, Toast.LENGTH_LONG).show();
    }
}
