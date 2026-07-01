/*
 * Forked from:
 * https://gitlab.com/ReVanced/ravanced-patches/-/raw/main/extensions/nothingx/src/main/java/app/revanced/extension/nothingx/patches/ShowK1TokensPatch.java
 */
package app.morphe.extension.nothingx.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public class ShowK1TokensPatch {
    private static final String TAG = "De-ReVanced";
    private static final String PACKAGE_NAME = "com.nothing.smartcenter";
    private static final String EMPTY_MD5 = "d41d8cd98f00b204e9800998ecf8427e";
    private static final String PREFS_NAME = "derevanced_nothingx_prefs";
    private static final String KEY_DONT_SHOW_DIALOG = "dont_show_k1_dialog";

    private static final int COLOR_BG = 0xFF1E1E1E;
    private static final int COLOR_TEXT_PRIMARY = 0xFFFFFFFF;
    private static final int COLOR_TEXT_SECONDARY = 0xFFB0B0B0;
    private static final int COLOR_ACCENT = 0xFFFF9500;
    private static final int COLOR_TOKEN_BG = 0xFF3A3A3A;
    private static final int COLOR_BUTTON_POSITIVE = 0xFFFF9500;

    private static final Pattern K1_STANDALONE_PATTERN =
            Pattern.compile("(?i)(?:k1\\s*[:>]\\s*)([0-9a-f]{32})");
    private static final Pattern K1_COMBINED_PATTERN =
            Pattern.compile("(?i)r3\\+k1\\s*:\\s*([0-9a-f]{64})");

    private static volatile boolean k1Logged = false;
    private static volatile boolean lifecycleCallbacksRegistered = false;
    private static Context appContext;

    public static void showK1Tokens(Context context) {
        if (k1Logged) return;

        appContext = context.getApplicationContext();
        Set allTokens = new LinkedHashSet<>();

        String dbToken = getK1TokensFromDatabase();
        if (dbToken != null) allTokens.add(dbToken);

        allTokens.addAll(getK1TokensFromLogFiles());

        if (allTokens.isEmpty()) return;

        int index = 1;
        for (Object token : allTokens) {
            Log.i(TAG, "#" + index++ + ": " + token.toString().toUpperCase());
        }

        registerLifecycleCallbacks(allTokens);
        k1Logged = true;
    }

    private static void registerLifecycleCallbacks(Set tokens) {
        if (lifecycleCallbacksRegistered || !(appContext instanceof Application)) return;

        Application application = (Application) appContext;
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}
            @Override public void onActivityStarted(Activity activity) {}

            @Override
            public void onActivityResumed(Activity activity) {
                SharedPreferences prefs = activity.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                if (prefs.getBoolean(KEY_DONT_SHOW_DIALOG, false)) {
                    application.unregisterActivityLifecycleCallbacks(this);
                    lifecycleCallbacksRegistered = false;
                    return;
                }

                if (tokens != null && !tokens.isEmpty()) {
                    activity.runOnUiThread(() -> showK1TokensDialog(activity, tokens));
                    application.unregisterActivityLifecycleCallbacks(this);
                    lifecycleCallbacksRegistered = false;
                }
            }

            @Override public void onActivityPaused(Activity activity) {}
            @Override public void onActivityStopped(Activity activity) {}
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}
            @Override public void onActivityDestroyed(Activity activity) {}
        });

        lifecycleCallbacksRegistered = true;
    }

    private static void showK1TokensDialog(Activity activity, Set tokens) {
        try {
            LinearLayout mainLayout = new LinearLayout(activity);
            mainLayout.setOrientation(LinearLayout.VERTICAL);
            mainLayout.setBackgroundColor(COLOR_BG);
            mainLayout.setPadding(dpToPx(activity, 24), dpToPx(activity, 16),
                    dpToPx(activity, 24), dpToPx(activity, 16));

            TextView titleView = new TextView(activity);
            titleView.setText("K1 Token(s) Found");
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            titleView.setTypeface(Typeface.DEFAULT_BOLD);
            titleView.setTextColor(COLOR_TEXT_PRIMARY);
            titleView.setGravity(Gravity.CENTER);
            mainLayout.addView(titleView);

            TextView subtitleView = new TextView(activity);
            subtitleView.setText(tokens.size() == 1 ? "1 token found • Tap to copy" : tokens.size() + " tokens found • Tap to copy");
            subtitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            subtitleView.setTextColor(COLOR_TEXT_SECONDARY);
            subtitleView.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            subtitleParams.topMargin = dpToPx(activity, 4);
            subtitleParams.bottomMargin = dpToPx(activity, 16);
            mainLayout.addView(subtitleView, subtitleParams);

            ScrollView scrollView = new ScrollView(activity);
            scrollView.setVerticalScrollBarEnabled(false);
            LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, 0, 1.0f);
            scrollParams.topMargin = dpToPx(activity, 8);
            scrollParams.bottomMargin = dpToPx(activity, 16);
            mainLayout.addView(scrollView, scrollParams);

            LinearLayout tokensContainer = new LinearLayout(activity);
            tokensContainer.setOrientation(LinearLayout.VERTICAL);
            scrollView.addView(tokensContainer);

            boolean singleToken = tokens.size() == 1;
            int index = 1;
            for (Object tokenObj : tokens) {
                String token = tokenObj.toString();
                LinearLayout tokenCard = createTokenCard(activity, token, index++, singleToken);
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
            buttonRowParams.topMargin = dpToPx(activity, 16);
            mainLayout.addView(buttonRow, buttonRowParams);

            Button dontShowButton = new Button(activity);
            dontShowButton.setText("Don't show again");
            dontShowButton.setTextColor(Color.WHITE);
            dontShowButton.setBackgroundColor(Color.TRANSPARENT);
            dontShowButton.setAllCaps(false);
            dontShowButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            LinearLayout.LayoutParams dontShowParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            dontShowParams.rightMargin = dpToPx(activity, 8);
            buttonRow.addView(dontShowButton, dontShowParams);

            Button okButton = new Button(activity);
            okButton.setText("OK");
            okButton.setTextColor(Color.BLACK);
            okButton.setBackgroundColor(COLOR_BUTTON_POSITIVE);
            okButton.setAllCaps(false);
            okButton.setTypeface(Typeface.DEFAULT_BOLD);
            okButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            okButton.setPadding(dpToPx(activity, 24), dpToPx(activity, 12),
                    dpToPx(activity, 24), dpToPx(activity, 12));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                okButton.setElevation(dpToPx(activity, 4));
            }
            buttonRow.addView(okButton);

            AlertDialog dialog = new AlertDialog.Builder(activity).setView(mainLayout).create();
            if (dialog.getWindow() != null) {
                dialog.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
            }
            dialog.show();

            dontShowButton.setOnClickListener(v -> {
                SharedPreferences prefs = activity.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                prefs.edit().putBoolean(KEY_DONT_SHOW_DIALOG, true).apply();
                Toast.makeText(activity, "Dialog disabled. Clear app data to re-enable.", Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            });
            okButton.setOnClickListener(v -> dialog.dismiss());
        } catch (Throwable e) {
            Log.e(TAG, "Failed to show K1 dialog", e);
        }
    }

    private static LinearLayout createTokenCard(Activity activity, String token, int index, boolean singleToken) {
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackgroundColor(COLOR_TOKEN_BG);
        card.setPadding(dpToPx(activity, 16), dpToPx(activity, 12),
                dpToPx(activity, 16), dpToPx(activity, 12));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            card.setElevation(dpToPx(activity, 2));
        }
        card.setClickable(true);
        card.setFocusable(true);

        if (!singleToken) {
            TextView labelView = new TextView(activity);
            labelView.setText("Token #" + index);
            labelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            labelView.setTextColor(COLOR_ACCENT);
            labelView.setTypeface(Typeface.DEFAULT_BOLD);
            card.addView(labelView);
        }

        TextView tokenView = new TextView(activity);
        tokenView.setText(token.toUpperCase());
        tokenView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tokenView.setTextColor(COLOR_TEXT_PRIMARY);
        tokenView.setTypeface(Typeface.MONOSPACE);
        LinearLayout.LayoutParams tokenParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        if (!singleToken) tokenParams.topMargin = dpToPx(activity, 8);
        card.addView(tokenView, tokenParams);

        card.setOnClickListener(v -> {
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard != null) {
                clipboard.setText(token.toUpperCase());
                Toast.makeText(activity, "Token copied!", Toast.LENGTH_SHORT).show();
            }
        });

        return card;
    }

    private static int dpToPx(Context context, float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics());
    }

    private static Set getK1TokensFromLogFiles() {
        Set pairingTokens = new LinkedHashSet<>();
        Set reconnectTokens = new LinkedHashSet<>();
        try {
            File logDir = new File("/data/data/" + PACKAGE_NAME + "/files/log");
            if (!logDir.exists() || !logDir.isDirectory()) return pairingTokens;

            File[] logFiles = logDir.listFiles((dir, name) ->
                    name.endsWith(".log") || name.endsWith(".log.") || name.matches(".*\\.log\\.\\d+"));
            if (logFiles == null || logFiles.length == 0) return pairingTokens;

            for (File logFile : logFiles) {
                try (BufferedReader reader = new BufferedReader(new FileReader(logFile))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        boolean isPairingContext = line.toLowerCase().contains("watchbind");
                        boolean isReconnectContext = line.toLowerCase().contains("watchreconnect");

                        String k1Token = null;

                        Matcher combinedMatcher = K1_COMBINED_PATTERN.matcher(line);
                        if (combinedMatcher.find()) {
                            String combined = combinedMatcher.group(1);
                            if (combined != null && combined.length() == 64) {
                                k1Token = combined.substring(32).toLowerCase();
                            }
                        }

                        if (k1Token == null) {
                            Matcher standaloneMatcher = K1_STANDALONE_PATTERN.matcher(line);
                            if (standaloneMatcher.find()) {
                                String token = standaloneMatcher.group(1);
                                if (token != null && token.length() == 32) k1Token = token.toLowerCase();
                            }
                        }

                        if (k1Token != null) {
                            if (isPairingContext && !isReconnectContext) pairingTokens.add(k1Token);
                            else reconnectTokens.add(k1Token);
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable ignored) {
        }

        if (!pairingTokens.isEmpty()) return pairingTokens;
        return reconnectTokens;
    }

    private static String getK1TokensFromDatabase() {
        try {
            File dbDir = new File("/data/data/" + PACKAGE_NAME + "/databases");
            if (!dbDir.exists() || !dbDir.isDirectory()) return null;

            File[] dbFiles = dbDir.listFiles((dir, name) ->
                    name.endsWith(".db") && !name.startsWith("google_app_measurement") && !name.contains("firebase"));
            if (dbFiles == null || dbFiles.length == 0) return null;

            for (File dbFile : dbFiles) {
                String token = getK1TokensFromDatabase(dbFile);
                if (token != null) return token;
            }
            return null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String getK1TokensFromDatabase(File dbFile) {
        SQLiteDatabase db = null;
        try {
            db = SQLiteDatabase.openDatabase(dbFile.getPath(), null, SQLiteDatabase.OPEN_READONLY);
            Cursor cursor = db.rawQuery(
                    "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'", null);

            List tables = new ArrayList<>();
            while (cursor.moveToNext()) tables.add(cursor.getString(0));
            cursor.close();

            for (Object tableObj : tables) {
                String table = tableObj.toString();
                Cursor schemaCursor = db.rawQuery("PRAGMA table_info(" + table + ")", null);
                List columns = new ArrayList<>();
                while (schemaCursor.moveToNext()) columns.add(schemaCursor.getString(1));
                schemaCursor.close();

                for (Object colObj : columns) {
                    String column = colObj.toString();
                    Cursor dataCursor = null;
                    try {
                        dataCursor = db.query(table, new String[]{column}, null, null, null, null, null);
                        while (dataCursor.moveToNext()) {
                            String value = dataCursor.getString(0);
                            if (value != null && value.length() == 32 && value.matches("[0-9a-fA-F]{32}")) {
                                if (!value.equalsIgnoreCase(EMPTY_MD5)) {
                                    dataCursor.close();
                                    db.close();
                                    return value.toLowerCase();
                                }
                            }
                        }
                    } catch (Throwable ignored) {
                    } finally {
                        if (dataCursor != null) dataCursor.close();
                    }
                }
            }
            return null;
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (db != null && db.isOpen()) db.close();
        }
    }
}

