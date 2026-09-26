/*
 * Ported from the ReVanced patch by Pa1NarK (pixincreate):
 * https://github.com/ReVanced/revanced-patches/commit/421cb2899ef5c0f100fb8007bae8b89137d0e41c keywatch:ignore
 * "feat(Nothing X): Add `Show K1 token(s)` patch (#6490)", 2026-01-22, co-authored by oSumAtrIX.
 * Licensed under CC0 1.0 Universal.
 */
package app.morphe.extension.nothingx.patches;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SuppressWarnings("unused")
public class ShowK1TokensPatch {
    private static final String TAG = "Morpheus";
    private static final String PACKAGE_NAME = "com.nothing.smartcenter";
    private static final String EMPTY_MD5 = "d41d8cd98f00b204e9800998ecf8427e";
    private static final String PREFS_NAME = "morpheus_nothingx_prefs";
    private static final String KEY_DONT_SHOW_DIALOG = "dont_show_k1_dialog";

    private static final int COLOR_BG = 0xFF1E1E1E;
    private static final int COLOR_TEXT_PRIMARY = 0xFFFFFFFF;
    private static final int COLOR_TEXT_SECONDARY = 0xFFB0B0B0;
    private static final int COLOR_TEXT_ON_ACCENT = 0xFF1E1E1E;
    private static final int COLOR_ACCENT = 0xFFFF9500;
    private static final int COLOR_TOKEN_BG = 0xFF3A3A3A;

    private static final float DIALOG_RADIUS_DP = 28f;
    private static final float CARD_RADIUS_DP = 16f;
    private static final float BUTTON_HEIGHT_DP = 40f;
    private static final float STROKE_WIDTH_DP = 1f;

    private static final Pattern K1_STANDALONE_PATTERN =
            Pattern.compile("(?i)(?:k1\\s*[:>]\\s*)([0-9a-f]{32,64})");
    private static final Pattern K1_COMBINED_PATTERN =
            Pattern.compile("(?i)r3\\+k1\\s*:\\s*([0-9a-f]{64})");
    private static final Pattern HEX_32_PATTERN = Pattern.compile("[0-9a-fA-F]{32}");
    private static final Pattern KEYCHAIN_HEX_32_PATTERN = Pattern.compile("^[0-9a-fA-F]{32}$");
    private static final Pattern KEYCHAIN_HEX_64_PATTERN = Pattern.compile("^[0-9a-fA-F]{64}$");

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static final AtomicBoolean scanInProgress = new AtomicBoolean(false);
    private static final AtomicBoolean tokensFound = new AtomicBoolean(false);
    private static final AtomicBoolean dialogShown = new AtomicBoolean(false);

    private static volatile Set<String> foundTokens = new LinkedHashSet<>();
    private static final Set<String> loggedKeychainKeys = new LinkedHashSet<>();
    private static volatile boolean lifecycleCallbacksRegistered = false;
    private static volatile Application registeredApplication;
    private static volatile Application.ActivityLifecycleCallbacks registeredCallbacks;
    private static volatile Activity currentActivity;
    private static volatile Dialog shownDialog;
    private static volatile Activity dialogActivity;
    private static volatile Dialog dialogDismissedByDestroy;
    private static Context appContext;

    /**
     * Starts the token scan from {@code Application.onCreate}, so it must return immediately.
     *
     * The scan runs on a background thread, and the dialog is posted to the main looper.
     */
    public static void showK1Tokens(Context context) {
        Context applicationContext = context.getApplicationContext();
        if (applicationContext == null) applicationContext = context;
        appContext = applicationContext;

        SharedPreferences prefs = applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        if (prefs.getBoolean(KEY_DONT_SHOW_DIALOG, false)) {
            Log.i(TAG, "K1 dialog disabled by preference, skipping scan");
            return;
        }

        registerLifecycleCallbacks();
        startScan();
    }

    /**
     * Receives every value the flutter_secure_storage plugin writes or reads.
     *
     * On Nothing X 3.8.0 the K1 token lives in EncryptedSharedPreferences, so the file
     * and database scans cannot read it. This hook runs inside the app process and sees
     * the plaintext value: the write method receives it before the plugin encrypts it,
     * and the read method returns it after the plugin decrypts it.
     */
    public static void onKeychainEntry(String key, String value) {
        try {
            if (key == null || value == null) return;

            logKeychainEntry(key, value);

            String candidate = k1CandidateFrom(value);
            if (candidate == null) return;

            addFoundToken(candidate);
            MAIN_HANDLER.post(() -> {
                Activity activity = currentActivity;
                if (activity != null) showK1TokensDialog(activity);
            });
        } catch (Throwable t) {
            Log.w(TAG, "failed to handle keychain entry", t);
        }
    }

    /** Logs the key name once per process, with the value masked. */
    private static void logKeychainEntry(String key, String value) {
        synchronized (loggedKeychainKeys) {
            if (!loggedKeychainKeys.add(key)) return;
        }

        // The read hook receives the decrypted value in both arguments, so the key can
        // be the secret itself. Mask it then, and never log the full value.
        String loggedKey = isK1HexValue(key) ? maskKeychainValue(key) : key;

        StringBuilder line = new StringBuilder("keychain entry: ")
                .append(loggedKey)
                .append(" = ")
                .append(maskKeychainValue(value));
        if (KEYCHAIN_HEX_32_PATTERN.matcher(value).matches()) line.append(" HEX32!");
        if (KEYCHAIN_HEX_64_PATTERN.matcher(value).matches()) line.append(" HEX64!");
        Log.i(TAG, line.toString());
    }

    /**
     * Returns the K1 candidate in the value, or null when the entry is not one.
     *
     * Only a plain 32 or 64 hex character value is accepted. The storage keys are
     * obfuscated by flutter_secure_storage, so the key name carries no signal.
     *
     * A 64 hex character value is r3 (first 32 characters) plus K1 (last 32
     * characters), the same layout as the r3+k1 log line.
     */
    private static String k1CandidateFrom(String value) {
        if (!isK1HexValue(value)) return null;

        String candidate = value.length() == 64 ? value.substring(32) : value;
        return candidate.toLowerCase();
    }

    private static boolean isK1HexValue(String value) {
        return KEYCHAIN_HEX_32_PATTERN.matcher(value).matches()
                || KEYCHAIN_HEX_64_PATTERN.matcher(value).matches();
    }

    private static synchronized void addFoundToken(String token) {
        if (foundTokens.contains(token)) return;

        Set<String> tokens = new LinkedHashSet<>(foundTokens);
        tokens.add(token);
        foundTokens = tokens;
        tokensFound.set(true);
    }

    /** Keeps the first 6 characters at most, so the value is never logged in full. */
    private static String maskKeychainValue(String value) {
        int prefixLength = value.length() > 6 ? 6 : 0;
        return value.substring(0, prefixLength) + "… (len " + value.length() + ")";
    }

    private static void startScan() {
        if (tokensFound.get() || dialogShown.get()) return;
        if (!scanInProgress.compareAndSet(false, true)) return;

        new Thread(() -> {
            try {
                Set<String> tokens = collectK1Tokens();
                Log.i(TAG, "scan finished, " + tokens.size() + " token(s)");

                if (tokens.isEmpty()) return;

                int index = 1;
                for (String token : tokens) {
                    Log.i(TAG, "#" + index++ + ": " + token.toUpperCase());
                }

                foundTokens = new LinkedHashSet<>(tokens);
                tokensFound.set(true);

                MAIN_HANDLER.post(() -> {
                    Activity activity = currentActivity;
                    if (activity != null) showK1TokensDialog(activity);
                });
            } catch (Throwable t) {
                Log.w(TAG, "K1 token scan failed", t);
            } finally {
                scanInProgress.set(false);
            }
        }, "morphe-k1-scan").start();
    }

    /**
     * Prefers the log files. A 32 hex character value from a database can be an unrelated
     * cache hash, so it is only used when the logs hold no token.
     */
    private static Set<String> collectK1Tokens() {
        Set<String> logTokens = getK1TokensFromLogFiles();
        if (!logTokens.isEmpty()) return logTokens;

        Set<String> tokens = new LinkedHashSet<>();
        String dbToken = getK1TokensFromDatabase(); // keywatch:ignore
        if (dbToken != null) tokens.add(dbToken);
        return tokens;
    }

    private static void registerLifecycleCallbacks() {
        if (lifecycleCallbacksRegistered || !(appContext instanceof Application)) return;

        Application application = (Application) appContext;
        Application.ActivityLifecycleCallbacks callbacks = new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}
            @Override public void onActivityStarted(Activity activity) {}

            @Override
            public void onActivityResumed(Activity activity) {
                if (activity.isFinishing()) return;

                currentActivity = activity;

                SharedPreferences prefs = activity.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                if (prefs.getBoolean(KEY_DONT_SHOW_DIALOG, false)) {
                    Log.i(TAG, "K1 dialog disabled by preference, unregistering lifecycle callbacks");
                    unregisterLifecycleCallbacks();
                    return;
                }

                if (dialogShown.get()) return;

                if (tokensFound.get()) {
                    showK1TokensDialog(activity);
                    return;
                }

                startScan();
            }

            @Override
            public void onActivityPaused(Activity activity) {
                if (currentActivity == activity) currentActivity = null;
            }

            @Override public void onActivityStopped(Activity activity) {}
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}

            @Override
            public void onActivityDestroyed(Activity activity) {
                if (currentActivity == activity) currentActivity = null;

                Dialog dialog = shownDialog;
                if (dialog != null && dialogActivity == activity) {
                    dialogDismissedByDestroy = dialog;
                    dialogShown.set(false);
                    try {
                        dialog.dismiss();
                    } catch (Throwable t) {
                        Log.w(TAG, "failed to dismiss K1 dialog", t);
                    }
                }
            }
        };

        registeredApplication = application;
        registeredCallbacks = callbacks;
        application.registerActivityLifecycleCallbacks(callbacks);
        lifecycleCallbacksRegistered = true;
        Log.i(TAG, "activity lifecycle callbacks registered");
    }

    private static void unregisterLifecycleCallbacks() {
        Application application = registeredApplication;
        Application.ActivityLifecycleCallbacks callbacks = registeredCallbacks;
        if (application != null && callbacks != null) {
            application.unregisterActivityLifecycleCallbacks(callbacks);
            Log.i(TAG, "activity lifecycle callbacks unregistered");
        }
        registeredApplication = null;
        registeredCallbacks = null;
        lifecycleCallbacksRegistered = false;
    }

    private static void showK1TokensDialog(Activity activity) {
        Set<String> tokens = foundTokens;
        if (tokens.isEmpty()) return;
        if (activity.isFinishing() || activity.isDestroyed()) return;
        if (shownDialog != null && shownDialog.isShowing()) return;

        try {
            Palette palette = new Palette(activity);

            LinearLayout mainLayout = new LinearLayout(activity);
            mainLayout.setOrientation(LinearLayout.VERTICAL);
            // M3 dialog surface: 28 dp rounded surface, the window background stays transparent.
            mainLayout.setBackground(roundedBackground(
                    activity, palette.surface, Color.TRANSPARENT, DIALOG_RADIUS_DP));
            int dialogPadding = dpToPx(activity, 24);
            int dialogPaddingHorizontal = dpToPx(activity, 16);
            mainLayout.setPadding(dialogPaddingHorizontal, dialogPadding, dialogPaddingHorizontal, dialogPadding);

            TextView titleView = new TextView(activity);
            titleView.setText("K1 Token(s) Found");
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24);
            titleView.setTypeface(Typeface.DEFAULT_BOLD);
            titleView.setTextColor(palette.onSurface);
            titleView.setGravity(Gravity.CENTER);
            mainLayout.addView(titleView);

            TextView subtitleView = new TextView(activity);
            subtitleView.setText(tokens.size() == 1 ? "1 token found • Tap to copy" : tokens.size() + " tokens found • Tap to copy");
            subtitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            subtitleView.setTextColor(palette.onSurfaceVariant);
            subtitleView.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            subtitleParams.topMargin = dpToPx(activity, 12);
            mainLayout.addView(subtitleView, subtitleParams);

            ScrollView scrollView = new ScrollView(activity);
            scrollView.setVerticalScrollBarEnabled(false);
            LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, 0, 1.0f);
            scrollParams.topMargin = dpToPx(activity, 12);
            scrollParams.bottomMargin = dpToPx(activity, 12);
            mainLayout.addView(scrollView, scrollParams);

            LinearLayout tokensContainer = new LinearLayout(activity);
            tokensContainer.setOrientation(LinearLayout.VERTICAL);
            scrollView.addView(tokensContainer);

            boolean singleToken = tokens.size() == 1;
            int index = 1;
            for (String token : tokens) {
                LinearLayout tokenCard = createTokenCard(activity, token, index++, singleToken, palette);
                LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
                cardParams.bottomMargin = dpToPx(activity, 12);
                tokensContainer.addView(tokenCard, cardParams);
            }

            LinearLayout buttonRow = new LinearLayout(activity);
            buttonRow.setOrientation(LinearLayout.HORIZONTAL);
            buttonRow.setGravity(Gravity.END);
            LinearLayout.LayoutParams buttonRowParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            mainLayout.addView(buttonRow, buttonRowParams);

            // M3 tonal button for the secondary action.
            Button dontShowButton = createTonalButton(activity, "Don't show again", palette);
            LinearLayout.LayoutParams dontShowParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            dontShowParams.rightMargin = dpToPx(activity, 12);
            buttonRow.addView(dontShowButton, dontShowParams);

            // M3 filled button for the primary action.
            Button okButton = createFilledButton(activity, "OK", palette);
            buttonRow.addView(okButton);

            LinearLayout.LayoutParams mainParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            mainLayout.setLayoutParams(mainParams);

            Dialog dialog = new Dialog(activity);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dialog.setContentView(mainLayout);
            dialog.setCancelable(true);
            dialog.setCanceledOnTouchOutside(true);
            dialog.setOnDismissListener(d -> {
                boolean isCurrent = shownDialog == dialog;
                if (isCurrent) {
                    shownDialog = null;
                    dialogActivity = null;
                    dialogShown.set(false);
                }
                if (dialogDismissedByDestroy == dialog) {
                    dialogDismissedByDestroy = null;
                    return;
                }
                if (!isCurrent && shownDialog != null) return;
                unregisterLifecycleCallbacks();
            });

            shownDialog = dialog;
            dialogActivity = activity;
            dialog.show();
            // The dialog theme re-applies its own window background during show(), so the
            // transparent background and the dim have to be set once the window exists.
            if (dialog.getWindow() != null) {
                dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                dialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                // A MATCH_PARENT window would let the rounded surface span the whole screen,
                // and the content parent drops the root view's margins, so narrow the window.
                int sideGap = dpToPx(activity, 16) * 2;
                int dialogWidth = Math.max(dpToPx(activity, 240),
                        activity.getResources().getDisplayMetrics().widthPixels - sideGap);
                dialog.getWindow().setLayout(dialogWidth, WindowManager.LayoutParams.WRAP_CONTENT);
            }
            dialogShown.set(true);

            dontShowButton.setOnClickListener(v -> {
                SharedPreferences prefs = activity.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                prefs.edit().putBoolean(KEY_DONT_SHOW_DIALOG, true).apply();
                Toast.makeText(activity, "Dialog disabled. Clear app data to re-enable.", Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            });
            okButton.setOnClickListener(v -> dialog.dismiss());
        } catch (Throwable t) {
            Log.w(TAG, "failed to show K1 dialog", t);
        }
    }

    private static LinearLayout createTokenCard(Activity activity, String token, int index,
            boolean singleToken, Palette palette) {
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        // M3 card: 16 dp rounded surfaceContainer with a 1 dp outline.
        card.setBackground(withRipple(roundedBackground(
                activity, palette.surfaceContainer, palette.outline, CARD_RADIUS_DP), palette.onSurface));
        card.setPadding(dpToPx(activity, 16), dpToPx(activity, 16),
                dpToPx(activity, 16), dpToPx(activity, 16));
        card.setClickable(true);
        card.setFocusable(true);

        if (!singleToken) {
            TextView labelView = new TextView(activity);
            labelView.setText("Token #" + index);
            labelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            labelView.setTextColor(palette.primary);
            labelView.setTypeface(Typeface.DEFAULT_BOLD);
            card.addView(labelView);
        }

        TextView tokenView = new TextView(activity);
        tokenView.setText(token.toUpperCase());
        tokenView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tokenView.setTextColor(palette.onSurface);
        tokenView.setTypeface(Typeface.MONOSPACE);
        LinearLayout.LayoutParams tokenParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        if (!singleToken) tokenParams.topMargin = dpToPx(activity, 12);
        card.addView(tokenView, tokenParams);

        TextView hintView = new TextView(activity);
        hintView.setText("Tap to copy");
        hintView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        hintView.setTextColor(palette.onSurfaceVariant);
        LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        hintParams.topMargin = dpToPx(activity, 12);
        card.addView(hintView, hintParams);

        card.setOnClickListener(v -> {
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard == null) return;

            clipboard.setText(token.toUpperCase());

            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
                Toast.makeText(activity, "Token copied!", Toast.LENGTH_SHORT).show();
            }
        });

        return card;
    }

    private static int dpToPx(Context context, float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics());
    }

    /** M3 filled button: primary fill, onPrimary label, pill shape. */
    private static Button createFilledButton(Activity activity, String label, Palette palette) {
        return createPillButton(activity, label, palette.primary, palette.onPrimary);
    }

    /** M3 tonal button: secondaryContainer fill, onSecondaryContainer label, pill shape. */
    private static Button createTonalButton(Activity activity, String label, Palette palette) {
        return createPillButton(activity, label, palette.secondaryContainer, palette.onSecondaryContainer);
    }

    /** Shared button: 14 sp medium label, 40 dp tall pill, 24 dp horizontal padding. */
    private static Button createPillButton(Activity activity, String label, int containerColor, int contentColor) {
        Button button = new Button(activity);
        button.setText(label);
        button.setTextColor(contentColor);
        button.setAllCaps(false);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        button.setMinHeight(dpToPx(activity, BUTTON_HEIGHT_DP));
        button.setPadding(dpToPx(activity, 24), 0, dpToPx(activity, 24), 0);
        button.setBackground(withRipple(roundedBackground(
                activity, containerColor, Color.TRANSPARENT, BUTTON_HEIGHT_DP / 2f), contentColor));
        return button;
    }

    /** Builds a rounded background, with an optional 1 dp stroke. */
    private static GradientDrawable roundedBackground(Context context, int fillColor,
            int strokeColor, float radiusDp) {
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.RECTANGLE);
        background.setCornerRadius(dpToPx(context, radiusDp));
        background.setColor(fillColor);
        if (strokeColor != Color.TRANSPARENT) {
            background.setStroke(dpToPx(context, STROKE_WIDTH_DP), strokeColor);
        }
        return background;
    }

    /** Wraps a background in a ripple tinted with the Material 3 content color. */
    private static Drawable withRipple(Drawable background, int contentColor) {
        return new RippleDrawable(ColorStateList.valueOf(withAlpha(contentColor, 0x33)), background, null);
    }

    /** Applies an alpha channel to a color. */
    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    /**
     * Material 3 color roles resolved from the Android system palette (API 31+).
     *
     * The tones match the Material You roles the Nothing X app uses. android.R.color
     * publishes only coarse tone steps, so each role asks for its Material tone and
     * falls back to the nearest published tone of the same palette family.
     */
    private static final class Palette {
        // M3 surface: neutral1 98 (light) / 6 (dark).
        final int surface;
        // M3 onSurface: neutral1 10 / 90.
        final int onSurface;
        // M3 onSurfaceVariant: neutral2 30 / 80.
        final int onSurfaceVariant;
        // M3 primary: accent1 40 / 80.
        final int primary;
        // M3 onPrimary: accent1 100 / 20.
        final int onPrimary;
        // M3 secondaryContainer: accent1 90 / 30.
        final int secondaryContainer;
        // M3 onSecondaryContainer: accent1 10 / 90.
        final int onSecondaryContainer;
        // M3 surfaceContainer: neutral1 94 / 12.
        final int surfaceContainer;
        // M3 outline: neutral2 50 / 60.
        final int outline;

        Palette(Context context) {
            surface = systemColor(context, "neutral1", 98, 6, COLOR_BG);
            onSurface = systemColor(context, "neutral1", 10, 90, COLOR_TEXT_PRIMARY);
            onSurfaceVariant = systemColor(context, "neutral2", 30, 80, COLOR_TEXT_SECONDARY);
            primary = systemColor(context, "accent1", 40, 80, COLOR_ACCENT);
            onPrimary = systemColor(context, "accent1", 100, 20, COLOR_TEXT_ON_ACCENT);
            secondaryContainer = systemColor(context, "accent1", 90, 30, COLOR_TOKEN_BG);
            onSecondaryContainer = systemColor(context, "accent1", 10, 90, COLOR_TEXT_PRIMARY);
            surfaceContainer = systemColor(context, "neutral1", 94, 12, COLOR_TOKEN_BG);
            outline = systemColor(context, "neutral2", 50, 60, COLOR_TEXT_SECONDARY);
        }
    }

    /** Tones android.R.color publishes; surface tones like 98, 94, 12 or 6 are not exposed. */
    private static final int[] SYSTEM_PALETTE_TONES = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 100};

    /**
     * Resolves a Material tone from the system palette for the current light/dark mode.
     *
     * The resource name is built at runtime, because android.R.color only publishes a
     * coarse tone set. The nearest published tone is used when the exact tone is
     * missing. Falls back when the platform has no dynamic palette (API < 31) or when
     * resolution fails.
     */
    private static int systemColor(Context context, String family, int lightTone, int darkTone, int fallback) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return fallback;
        try {
            boolean night = (context.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            int tone = nearestSystemTone(night ? darkTone : lightTone);
            // Platform suffix: tone 100 is _0, tone 0 is _1000, tone 95 is _50.
            String name = "system_" + family + "_" + (1000 - tone * 10);
            int resourceId = context.getResources().getIdentifier(name, "color", "android");
            if (resourceId == 0) return fallback;
            return context.getColor(resourceId);
        } catch (Throwable t) {
            return fallback;
        }
    }

    private static int nearestSystemTone(int tone) {
        int nearest = SYSTEM_PALETTE_TONES[0];
        for (int candidate : SYSTEM_PALETTE_TONES) {
            if (Math.abs(candidate - tone) < Math.abs(nearest - tone)) nearest = candidate;
        }
        return nearest;
    }

    private static Set<String> getK1TokensFromLogFiles() {
        Set<String> pairingTokens = new LinkedHashSet<>();
        Set<String> reconnectTokens = new LinkedHashSet<>();
        try {
            File logDir = new File("/data/data/" + PACKAGE_NAME + "/files/log");
            if (!logDir.exists() || !logDir.isDirectory()) {
                Log.i(TAG, "log files found: 0");
                return pairingTokens;
            }

            File[] logFiles = logDir.listFiles((dir, name) ->
                    name.endsWith(".log") || name.endsWith(".log.") || name.matches(".*\\.log\\.\\d+"));
            Log.i(TAG, "log files found: " + (logFiles == null ? 0 : logFiles.length));
            if (logFiles == null || logFiles.length == 0) return pairingTokens;

            for (File logFile : logFiles) {
                Log.i(TAG, "log file: " + logFile.getAbsolutePath() + " (" + logFile.length() + " bytes)");
            }

            for (File logFile : logFiles) {
                try (BufferedReader reader = new BufferedReader(new FileReader(logFile))) {
                    String line;
                    int lineCount = 0;
                    while ((line = reader.readLine()) != null) {
                        lineCount++;
                        boolean isPairingContext = line.toLowerCase().contains("watchbind");
                        boolean isReconnectContext = line.toLowerCase().contains("watchreconnect");

                        String k1Token = null;

                        Matcher combinedMatcher = K1_COMBINED_PATTERN.matcher(line);
                        if (combinedMatcher.find()) {
                            String combined = combinedMatcher.group(1);
                            if (combined != null) {
                                Log.i(TAG, "k1 candidate: " + maskKeychainValue(combined)
                                        + ", pattern r3+k1:");
                            }
                            if (combined != null && combined.length() == 64) {
                                k1Token = combined.substring(32).toLowerCase();
                            }
                        }

                        if (k1Token == null) {
                            Matcher standaloneMatcher = K1_STANDALONE_PATTERN.matcher(line);
                            if (standaloneMatcher.find()) {
                                String token = standaloneMatcher.group(1); // keywatch:ignore
                                if (token != null) {
                                    Log.i(TAG, "k1 candidate: " + maskKeychainValue(token)
                                            + ", pattern k1:");
                                    // A 64-char value is r3 (first 32) + K1 (last 32); without this the r3 half is surfaced.
                                    if (token.length() == 64) token = token.substring(32);
                                    if (token.length() == 32) k1Token = token.toLowerCase();
                                }
                            }
                        }

                        if (k1Token != null) {
                            if (isPairingContext && !isReconnectContext) pairingTokens.add(k1Token);
                            else reconnectTokens.add(k1Token);
                        }
                    }
                    Log.i(TAG, "read " + lineCount + " lines from " + logFile.getName());
                } catch (Throwable t) {
                    Log.w(TAG, "failed to read log file " + logFile.getName(), t);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "failed to scan log directory", t);
        }

        if (!pairingTokens.isEmpty()) return pairingTokens;
        return reconnectTokens;
    }

    private static String getK1TokensFromDatabase() {
        try {
            File dbDir = new File("/data/data/" + PACKAGE_NAME + "/databases");
            if (!dbDir.exists() || !dbDir.isDirectory()) {
                Log.i(TAG, "db files found: 0");
                return null;
            }

            File[] dbFiles = dbDir.listFiles((dir, name) -> {
                String lower = name.toLowerCase();
                if (!lower.endsWith(".db")) return false;
                if (lower.startsWith("google_app_measurement") || lower.contains("firebase")) return false;
                if (lower.contains("cache")) return false;
                if (lower.contains("freshchat") || lower.contains("firechat")) return false;
                return true;
            });
            Log.i(TAG, "db files found: " + (dbFiles == null ? 0 : dbFiles.length));
            if (dbFiles == null || dbFiles.length == 0) return null;

            for (File dbFile : dbFiles) {
                Log.i(TAG, "db file: " + dbFile.getAbsolutePath() + " (" + dbFile.length() + " bytes)");
                String token = getK1TokensFromDatabase(dbFile); // keywatch:ignore
                if (token != null) return token;
            }
            return null;
        } catch (Throwable t) {
            Log.w(TAG, "failed to scan databases directory", t);
            return null;
        }
    }

    private static String getK1TokensFromDatabase(File dbFile) {
        SQLiteDatabase db = null;
        try {
            db = SQLiteDatabase.openDatabase(dbFile.getPath(), null, SQLiteDatabase.OPEN_READONLY);
            Cursor cursor = db.rawQuery(
                    "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'", null);

            List<String> tables = new ArrayList<>();
            while (cursor.moveToNext()) tables.add(cursor.getString(0));
            cursor.close();

            for (String table : tables) {
                Cursor schemaCursor = null;
                try {
                    String quotedTable = table.replace("\"", "\"\"");
                    schemaCursor = db.rawQuery("PRAGMA table_info(\"" + quotedTable + "\")", null);
                    List<String> columns = new ArrayList<>();
                    while (schemaCursor.moveToNext()) columns.add(schemaCursor.getString(1));
                    schemaCursor.close();

                    for (String column : columns) {
                        Cursor dataCursor = null;
                        try {
                            dataCursor = db.query(table, new String[]{column}, null, null, null, null, null);
                            while (dataCursor.moveToNext()) {
                                String value = dataCursor.getString(0);
                                if (value != null && value.length() == 32
                                        && HEX_32_PATTERN.matcher(value).matches()) {
                                    if (!value.equalsIgnoreCase(EMPTY_MD5)) {
                                        return value.toLowerCase();
                                    }
                                }
                            }
                        } catch (Throwable t) {
                            Log.w(TAG, "failed to read column " + column + " of table " + table
                                    + " in " + dbFile.getName(), t);
                        } finally {
                            if (dataCursor != null) dataCursor.close();
                        }
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "failed to read table " + table + " in " + dbFile.getName(), t);
                } finally {
                    if (schemaCursor != null && !schemaCursor.isClosed()) schemaCursor.close();
                }
            }
            return null;
        } catch (Throwable t) {
            Log.w(TAG, "failed to scan database " + dbFile.getName(), t);
            return null;
        } finally {
            if (db != null && db.isOpen()) db.close();
        }
    }

}
