package app.ahmedyarub.extension.x;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.Process;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.view.Window;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;

import app.morphe.extension.shared.Logger;

/**
 * The patches' own settings, opened from the "Morphe settings" shortcut on the app icon. Each
 * section is shown when the patch it belongs to is applied.
 */
@SuppressWarnings("unused")
public final class SettingsActivity extends Activity {

    /** Rewritten to true by Filter posts by keyword. */
    private static boolean keywordsEnabled() { return false; }

    /** Rewritten to true by Import/Export login token. */
    private static boolean loginEnabled() { return false; }

    /** Rewritten to true by Delete from database. */
    private static boolean databaseEnabled() { return false; }

    /** Rewritten to true by Feed filters. */
    private static boolean feedFiltersEnabled() { return false; }

    private static final String ACCOUNT_TYPE = "com.twitter.android.auth.login";
    private static final String TOKEN = "com.twitter.android.oauth.token";
    private static final String SECRET = "com.twitter.android.oauth.token.secret";
    private static final String[] USER_DATA = {
            "account_user_id", "com.twitter.android.username", "com.twitter.android.name",
            "com.x.android.lite.version", "com.x.android.lite.account.settings", "com.x.android.lite.can_access_payments",
    };

    private LinearLayout list;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);

        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        ScrollView scroll = new ScrollView(this);
        scroll.setFitsSystemWindows(true);
        scroll.addView(list);
        setContentView(scroll);

        TextView title = new TextView(this);
        title.setText("Morphe settings");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        title.setPadding(dp(20), dp(16), dp(20), dp(8));
        list.addView(title);

        if (feedFiltersEnabled()) {
            header("Feed Filters");
            toggle("Media only", "Only show posts with images, videos, or GIFs.",
                    TimelineFilter.isMediaOnlyEnabled(), TimelineFilter::setMediaOnly);
            toggle("Hide followed profiles", "Hide posts from profiles you follow.",
                    TimelineFilter.isHideFollowedEnabled(), TimelineFilter::setHideFollowed);
            row("Include keywords", "Only show posts containing at least one of these words.", this::editIncludeKeywords);
            row("Exclude keywords", "Hide posts containing any of these words.", this::editKeywords);
        }
        if (keywordsEnabled() && !feedFiltersEnabled()) {
            header("Timeline");
            row("Filtered keywords", "Posts containing any of these are hidden.", this::editKeywords);
        }
        if (loginEnabled()) {
            header("Login");
            row("Export login", "Copies the signed-in accounts' tokens to the clipboard. Anyone with them can use your account.",
                    this::exportLogin);
            row("Import login", "Signs in with tokens exported from another install, then restarts the app.", this::importLogin);
        }
        if (databaseEnabled()) {
            header("Database");
            row("Delete cached promoted entries", "Removes cached promoted posts, then restarts the app.",
                    () -> confirm("Delete cached promoted entries?", () -> deleteFromDatabase(false)));
            row("Clear cached timelines", "Empties every cached timeline, then restarts the app.",
                    () -> confirm("Clear cached timelines?", () -> deleteFromDatabase(true)));
        }
        if (list.getChildCount() == 0) header("No settings");
    }

    // region Layout

    private int dp(int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics());
    }

    private void header(String title) {
        TextView view = new TextView(this);
        view.setText(title);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        view.setTextColor(0xFF1D9BF0);
        view.setPadding(dp(20), dp(20), dp(20), dp(6));
        list.addView(view);
    }

    private void row(String title, String summary, Runnable action) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(20), dp(12), dp(20), dp(12));
        row.setClickable(true);
        TypedValue ripple = new TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true);
        row.setBackgroundResource(ripple.resourceId);
        row.setOnClickListener(v -> action.run());

        TextView titleView = new TextView(this);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        row.addView(titleView);

        TextView summaryView = new TextView(this);
        summaryView.setText(summary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        summaryView.setAlpha(0.7f);
        row.addView(summaryView);

        list.addView(row);
    }

    @SuppressWarnings("deprecation")
    private void toggle(String title, String summary, boolean checked, java.util.function.Consumer<Boolean> onChange) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(dp(20), dp(12), dp(20), dp(12));
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setClickable(true);
        TypedValue ripple = new TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true);
        row.setBackgroundResource(ripple.resourceId);

        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);

        TextView titleView = new TextView(this);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        texts.addView(titleView);

        TextView summaryView = new TextView(this);
        summaryView.setText(summary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        summaryView.setAlpha(0.7f);
        texts.addView(summaryView);

        Switch toggle = new Switch(this);
        toggle.setChecked(checked);
        toggle.setOnCheckedChangeListener((v, isChecked) -> {
            onChange.accept(isChecked);
            Toast.makeText(this, "Refresh a timeline to apply.", Toast.LENGTH_SHORT).show();
        });

        row.addView(texts, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(toggle, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        row.setOnClickListener(v -> toggle.toggle());
        list.addView(row);
    }

    private void confirm(String question, Runnable action) {
        new AlertDialog.Builder(this)
                .setMessage(question)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> action.run())
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private EditText editor(String text, String hint) {
        EditText editor = new EditText(this);
        editor.setText(text);
        editor.setHint(hint);
        editor.setMinLines(4);
        editor.setGravity(Gravity.TOP | Gravity.START);
        return editor;
    }

    private View padded(View view) {
        FrameLayout frame = new FrameLayout(this);
        frame.setPadding(dp(20), dp(8), dp(20), 0);
        frame.addView(view);
        return frame;
    }

    // endregion

    private void editIncludeKeywords() {
        EditText editor = editor(TimelineFilter.includeKeywordsText(), "One keyword or phrase per line");
        new AlertDialog.Builder(this)
                .setTitle("Include keywords")
                .setMessage("When set, only posts containing at least one of these are shown.")
                .setView(padded(editor))
                .setPositiveButton("Save", (dialog, which) -> {
                    TimelineFilter.setIncludeKeywords(editor.getText().toString());
                    Toast.makeText(this, "Saved. Refresh a timeline to apply.", Toast.LENGTH_SHORT).show();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void editKeywords() {
        EditText editor = editor(TimelineFilter.keywordsText(), "One keyword or phrase per line");
        new AlertDialog.Builder(this)
                .setTitle("Filtered keywords")
                .setView(padded(editor))
                .setPositiveButton("Save", (dialog, which) -> {
                    TimelineFilter.setKeywords(editor.getText().toString());
                    Toast.makeText(this, "Saved. Refresh a timeline to apply.", Toast.LENGTH_SHORT).show();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    // region Login

    private SharedPreferences appPreferences() {
        return getSharedPreferences(getPackageName() + "_preferences", Context.MODE_PRIVATE);
    }

    private void exportLogin() {
        try {
            AccountManager manager = AccountManager.get(this);
            JSONArray accounts = new JSONArray();
            for (Account account : manager.getAccountsByType(ACCOUNT_TYPE)) {
                JSONObject entry = new JSONObject();
                entry.put("name", account.name);
                JSONObject data = new JSONObject();
                for (String key : USER_DATA) {
                    String value = manager.getUserData(account, key);
                    if (value != null) data.put(key, value);
                }
                entry.put("userData", data);
                entry.put("token", manager.peekAuthToken(account, TOKEN));
                entry.put("secret", manager.peekAuthToken(account, SECRET));
                accounts.put(entry);
            }
            if (accounts.length() == 0) {
                Toast.makeText(this, "No account is signed in", Toast.LENGTH_SHORT).show();
                return;
            }

            SharedPreferences preferences = appPreferences();
            JSONObject export = new JSONObject();
            export.put("accounts", accounts);
            export.put("kdt", preferences.getString("kdt", null));
            export.put("currentUserId", preferences.getLong("current_user_id", 0));

            ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText("X login", export.toString()));
            Toast.makeText(this, "Login copied. Keep it private.", Toast.LENGTH_LONG).show();
        } catch (Exception ex) {
            Logger.printException(() -> "Export login failure", ex);
            Toast.makeText(this, "Export failed: " + ex.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private void importLogin() {
        EditText editor = editor("", "Paste an exported login");
        new AlertDialog.Builder(this)
                .setTitle("Import login")
                .setView(padded(editor))
                .setPositiveButton("Import", (dialog, which) -> {
                    try {
                        importLogin(new JSONObject(editor.getText().toString().trim()));
                        restart();
                    } catch (Exception ex) {
                        Logger.printException(() -> "Import login failure", ex);
                        Toast.makeText(this, "Import failed: " + ex.getMessage(), Toast.LENGTH_LONG).show();
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void importLogin(JSONObject export) throws Exception {
        AccountManager manager = AccountManager.get(this);
        JSONArray accounts = export.getJSONArray("accounts");
        for (int i = 0; i < accounts.length(); i++) {
            JSONObject entry = accounts.getJSONObject(i);
            JSONObject data = entry.getJSONObject("userData");

            Bundle userData = new Bundle();
            for (String key : USER_DATA) {
                if (data.has(key)) userData.putString(key, data.getString(key));
            }

            Account account = new Account(entry.getString("name"), ACCOUNT_TYPE);
            if (!manager.addAccountExplicitly(account, null, userData)) {
                for (String key : USER_DATA) {
                    if (data.has(key)) manager.setUserData(account, key, data.getString(key));
                }
            }
            manager.setAuthToken(account, TOKEN, entry.getString("token"));
            manager.setAuthToken(account, SECRET, entry.getString("secret"));
        }

        SharedPreferences.Editor preferences = appPreferences().edit();
        if (!export.isNull("kdt")) preferences.putString("kdt", export.getString("kdt"));
        if (export.optLong("currentUserId", 0) != 0) preferences.putLong("current_user_id", export.getLong("currentUserId"));
        preferences.commit();
    }

    // endregion

    // region Database

    /**
     * Deletes cached timeline rows from the signed-in account's database: all of them, or the
     * promoted ones. The app only reads them again once restarted.
     */
    private void deleteFromDatabase(boolean everything) {
        long userId = appPreferences().getLong("current_user_id", 0);
        File file = getDatabasePath(userId + "-database");
        if (userId == 0 || !file.exists()) {
            Toast.makeText(this, "No cached timelines", Toast.LENGTH_SHORT).show();
            return;
        }

        try (SQLiteDatabase database = SQLiteDatabase.openDatabase(file.getPath(), null, SQLiteDatabase.OPEN_READWRITE)) {
            int deleted;
            if (everything) {
                database.delete("module_items", null, null);
                deleted = database.delete("timeline_entry", null, null);
            } else {
                deleted = database.delete("timeline_entry", "promoted_metadata IS NOT NULL", null);
            }
            Toast.makeText(this, deleted + " cached entries deleted", Toast.LENGTH_SHORT).show();
            restart();
        } catch (Exception ex) {
            Logger.printException(() -> "Delete from database failure", ex);
            Toast.makeText(this, "Delete failed: " + ex.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    // endregion

    /** Relaunches the app in a new process, so it reads what was changed. */
    private void restart() {
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch != null) {
            startActivity(launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK));
        }
        finishAffinity();
        Process.killProcess(Process.myPid());
    }
}
