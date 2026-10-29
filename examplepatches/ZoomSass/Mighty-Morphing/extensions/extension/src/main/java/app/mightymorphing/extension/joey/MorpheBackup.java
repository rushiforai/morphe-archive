package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Copies Joey's own preference files. Account lists are stamped with the signed-in
 * username and can be restored only while that same account is signed in.
 */
public final class MorpheBackup {
    private static final int REQUEST_SAVE = 48150;
    private static final int REQUEST_OPEN = 48151;
    private static final int VERSION = 1;

    private static final Group[] GROUPS = {
            group("subscriptions", "Subscriptions", null, true, "sub_subscription"),
            group("multis", "Multis", null, true, "multi_subscription"),
            group("friends", "Friends", null, true, "FRIEND_PREF_NAME"),
            group("blocked", "Blocked", null, true, "BLOCKED_PREF_NAME"),
            group("edit-subs", "Edit subs", null, true, "UNION_SUB_PREF_NAME"),
            group("favorites", "Favorites", "On this device", true, "FAVORITE_SUB_PREF_NAME"),
            group("hidden", "Hidden", "On this device", true, "HIDDEN_SUB_PREF_NAME"),
            group("pinned", "Pinned", "On this device", true, "PINNED_SUB_PREF_NAME"),
            group("local-subs", "Local subs", "On this device", true, "LOCAL_SUB_PREF_NAME"),
            group("default-subs", "Default subs", "On this device", true, "SPECIAL_SUB_PREF_NAME"),
            group("theme", "Theme", "Appearance", false, "THEME_PREFS"),
            group("fonts", "Fonts", "Appearance", false, "font_prefs"),
            group("posts", "Post style", "Appearance", false, "settings"),
            group("drawer", "Left drawer", "Appearance", false, "left_drawer_prefs"),
            group("posts", "Multi column", "Appearance", false, "settings"),
            group("animations", "Animations", "Appearance", false, "animation_prefs"),
            group("morphe", "Morphe Settings", "Content", false, "mighty_morphing"),
            group("posts", "Awards", "Content", false, "settings"),
            group("labels", "Account stats", "Content", false, "USER_TAG_PREF"),
            group("posts", "Posts", "Content", false, "settings"),
            group("comments", "Comments", "Content", false, "comment_preferences"),
            group("links", "Link handling", "Content", false, "link_prefs"),
            group("filters", "Filters", "Content", false, "filter_prefs"),
            group("media", "Media", "Content", false, "media_prefs"),
            group("history", "History", "Content", false, "history_prefs"),
            group("bookmarks", "Bookmarks", "Content", false, "BOOKMARKS_PREF_NAME"),
            group("drafts", "Drafts", "Content", false, "draft_prefs"),
            group("general", "General", "Content", false, "general_prefs"),
            group("gestures", "Gestures", "Content", false, "gesture_preferences"),
            group("data", "Data usage", "Content", false, "data_usage_prefs"),
            group("tts", "Text to speech", "Content", false, "tts_preferences"),
    };

    private static Activity pendingActivity;
    private static List<Group> pendingGroups;
    private static AlertDialog openDialog;

    private MorpheBackup() {
    }

    public static void backup(Activity activity) {
        String account = signedInUsername(activity);
        showPicker(activity, true, null, account, null, chosen -> {
            pendingActivity = activity;
            pendingGroups = chosen;
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/json");
            intent.putExtra(Intent.EXTRA_TITLE, "joey-morphe-backup.json");
            activity.startActivityForResult(intent, REQUEST_SAVE);
        });
    }

    public static void restore(Activity activity) {
        pendingActivity = activity;
        showPicker(activity, false, null, null, null, null);
    }

    public static boolean onActivityResult(int request, int result, Intent intent) {
        if (request != REQUEST_SAVE && request != REQUEST_OPEN) return false;
        Activity activity = pendingActivity;
        if (result != Activity.RESULT_OK || intent == null || intent.getData() == null || activity == null) {
            pendingGroups = null;
            return true;
        }
        Uri uri = intent.getData();
        try {
            if (request == REQUEST_SAVE) writeBackup(activity, uri);
            else readAndOfferRestore(activity, uri);
        } catch (Throwable t) {
            toast(activity, request == REQUEST_SAVE ? "Could not save the backup" : "Could not read the backup");
        }
        return true;
    }

    private static void writeBackup(Activity activity, Uri uri) throws Exception {
        List<Group> chosen = pendingGroups;
        pendingGroups = null;
        if (chosen == null || chosen.isEmpty()) return;
        JSONObject root = new JSONObject();
        root.put("version", VERSION);
        String account = signedInUsername(activity);
        root.put("account", account == null ? JSONObject.NULL : account);
        JSONObject groups = new JSONObject();
        for (Group group : chosen) {
            if (group.account && account == null) continue;
            JSONObject files = new JSONObject();
            for (String name : group.files) files.put(name, snapshot(activity, name));
            groups.put(group.id, files);
        }
        root.put("groups", groups);
        try (OutputStream out = activity.getContentResolver().openOutputStream(uri)) {
            if (out == null) throw new IllegalStateException("no stream");
            out.write(root.toString().getBytes(StandardCharsets.UTF_8));
        }
        toast(activity, "Backup saved");
    }

    private static void readAndOfferRestore(Activity activity, Uri uri) throws Exception {
        String text;
        try (InputStream in = activity.getContentResolver().openInputStream(uri)) {
            if (in == null) throw new IllegalStateException("no stream");
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            text = out.toString(StandardCharsets.UTF_8.name());
        }
        JSONObject root = new JSONObject(text);
        String account = root.isNull("account") ? null : root.optString("account", null);
        JSONObject saved = root.getJSONObject("groups");
        if (saved.has("account")) {
            JSONObject legacy = saved.getJSONObject("account");
            for (Group group : GROUPS) {
                if (!group.account) continue;
                for (String file : group.files) {
                    if (legacy.has(file) && !saved.has(group.id)) {
                        JSONObject one = new JSONObject();
                        one.put(file, legacy.getJSONObject(file));
                        saved.put(group.id, one);
                    }
                }
            }
        }
        List<Group> present = new ArrayList<>();
        for (Group group : GROUPS) {
            if (saved.has(group.id)) present.add(group);
        }
        if (present.isEmpty()) {
            toast(activity, "That file has no settings");
            return;
        }
        String signedIn = signedInUsername(activity);
        String label = uri.getLastPathSegment();
        if (label == null || label.isEmpty()) label = "Backup file";
        showPicker(activity, false, present, account, label, chosen -> {
            List<String> failed = new ArrayList<>();
            int applied = 0;
            for (Group group : chosen) {
                if (group.account && (signedIn == null || account == null || !signedIn.equalsIgnoreCase(account))) {
                    continue;
                }
                JSONObject files = saved.optJSONObject(group.id);
                if (files == null) continue;
                for (String name : group.files) {
                    JSONObject values = files.optJSONObject(name);
                    if (values == null) continue;
                    String error = restoreFile(activity, name, values);
                    if (error == null) applied++;
                    else failed.add(group.title + ": " + error);
                }
            }
            if (failed.isEmpty() && applied == 0) toast(activity, "Nothing was restored");
            else requireRestart(activity, failed);
        });
    }

    private static void showPicker(Activity activity, boolean backup, List<Group> only, String account,
                                   String fileName, Choice choice) {
        String signedIn = signedInUsername(activity);
        int gold = MorpheDialog.GOLD;
        int text = MorpheDialog.TEXT;
        int sub = MorpheDialog.SUB;
        float density = activity.getResources().getDisplayMetrics().density;

        LinearLayout page = MorpheDialog.page(activity, backup ? "Backup settings" : "Restore settings", null);

        boolean fileReady = backup || fileName != null;
        if (!backup) {
            TextView file = new TextView(activity);
            file.setText(fileReady ? fileName : "No backup file selected");
            file.setTextColor(fileReady ? text : sub);
            file.setTextSize(14);
            file.setPadding(0, Math.round(10 * density), 0, 0);
            page.addView(file);
        }

        boolean accountAllowed = backup ? signedIn != null
                : signedIn != null && account != null && signedIn.equalsIgnoreCase(account);
        TextView info = new TextView(activity);
        info.setTextColor(sub);
        info.setTextSize(13);
        info.setPadding(0, Math.round(8 * density), 0, Math.round(12 * density));
        if (!backup && !fileReady) info.setText("The list stays unavailable until a restore file is selected.");
        else if (backup && signedIn == null) info.setText("Sign in to include this account.");
        else if (!backup && account != null && !accountAllowed) {
            info.setText(signedIn == null
                    ? "Sign in as u/" + account + " to restore that account."
                    : "Signed in as u/" + signedIn + ". Sign in as u/" + account + " to restore that account.");
        } else info.setVisibility(View.GONE);
        page.addView(info);

        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        List<View> batch = new ArrayList<>();
        List<CheckBox> boxes = new ArrayList<>();
        List<Group> shown = new ArrayList<>();
        boolean accountHeader = false;
        String accountName = backup ? signedIn : account;
        if (accountName == null || accountName.isEmpty()) accountName = signedIn;
        List<Group> ordered = new ArrayList<>();
        for (Group group : GROUPS) if (group.account) ordered.add(group);
        for (Group group : GROUPS) if (!group.account) ordered.add(group);
        boolean settingsHeader = false;
        String lastSection = null;
        boolean[] linking = {false};
        for (Group group : ordered) {
            boolean inFile = only == null || containsId(only, group.id);
            if (!group.account && !inFile) continue;
            if (group.account && !accountHeader) {
                accountHeader = true;
                flushGrid(rows, batch);
                TextView who = new TextView(activity);
                who.setText(accountName == null || accountName.isEmpty() ? "Not signed in" : "u/" + accountName);
                who.setTextColor(fileReady ? gold : sub);
                who.setTextSize(16);
                who.setTypeface(Typeface.SANS_SERIF, Typeface.ITALIC);
                who.setPadding(0, Math.round(4 * density), 0, Math.round(2 * density));
                rows.addView(who);
                TextView note = new TextView(activity);
                note.setText("From your Reddit account. A restore only updates Joey. The next refresh puts the account's lists back if they differ.");
                note.setTextColor(sub);
                note.setTextSize(12);
                note.setTypeface(Typeface.SANS_SERIF, Typeface.ITALIC);
                note.setPadding(0, 0, 0, Math.round(8 * density));
                rows.addView(note);
            }
            if (!group.account && !settingsHeader) {
                settingsHeader = true;
                lastSection = null;
                flushGrid(rows, batch);
                TextView general = new TextView(activity);
                general.setText("Joey settings");
                general.setTextColor(fileReady ? text : sub);
                general.setTextSize(15);
                general.setTypeface(Typeface.DEFAULT_BOLD);
                general.setPadding(0, Math.round(14 * density), 0, Math.round(6 * density));
                rows.addView(general);
            }
            if (group.section != null && !group.section.equals(lastSection)) {
                lastSection = group.section;
                flushGrid(rows, batch);
                TextView section = new TextView(activity);
                section.setText(group.section);
                section.setTextColor(fileReady ? gold : sub);
                section.setTextSize(13);
                section.setTypeface(Typeface.DEFAULT_BOLD);
                section.setPadding(0, Math.round(8 * density), 0, Math.round(2 * density));
                rows.addView(section);
                if ("On this device".equals(group.section)) {
                    TextView local = new TextView(activity);
                    local.setText("Kept in Joey only. A restore of these stays put.");
                    local.setTextColor(sub);
                    local.setTextSize(12);
                    local.setTypeface(Typeface.SANS_SERIF, Typeface.ITALIC);
                    local.setPadding(0, 0, 0, Math.round(6 * density));
                    rows.addView(local);
                }
            }
            boolean allowed = fileReady && (!group.account || (accountAllowed && (backup || inFile)));
            if (!fileReady || !allowed) {
                TextView locked = new TextView(activity);
                locked.setText(group.title);
                locked.setTextColor(0xFF5C5C5C);
                locked.setTextSize(15);
                locked.setPadding(Math.round(8 * density), Math.round(6 * density), 0, Math.round(6 * density));
                batch.add(locked);
                continue;
            }
            CheckBox box = MorpheDialog.check(activity, group.title, true, null);
            final String shared = group.files.length > 0 ? group.files[0] : group.id;
            box.setOnCheckedChangeListener((button, checked) -> {
                if (linking[0] || !"settings".equals(shared)) return;
                linking[0] = true;
                for (int i = 0; i < shown.size(); i++) {
                    Group other = shown.get(i);
                    if (other.files.length > 0 && shared.equals(other.files[0]) && boxes.get(i).isChecked() != checked) {
                        boxes.get(i).setChecked(checked);
                    }
                }
                linking[0] = false;
            });
            batch.add(box);
            boxes.add(box);
            shown.add(group);
        }
        flushGrid(rows, batch);
        page.addView(MorpheDialog.scroller(activity, rows));

        TextView cancel = MorpheDialog.action(activity, "Cancel", sub);
        String confirmLabel = backup ? "Save backup" : (fileReady ? "Restore" : "Select restore file");
        TextView confirm = MorpheDialog.action(activity, confirmLabel, gold);
        page.addView(MorpheDialog.actions(activity, cancel, confirm));

        AlertDialog dialog = MorpheDialog.show(activity, page);
        cancel.setOnClickListener(v -> dialog.dismiss());
        confirm.setOnClickListener(v -> {
            if (!backup && !fileReady) {
                pendingActivity = activity;
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("*/*");
                activity.startActivityForResult(intent, REQUEST_OPEN);
                dialog.dismiss();
                return;
            }
            if (!fileReady || choice == null) return;
            List<Group> chosen = new ArrayList<>();
            Set<String> seen = new HashSet<>();
            for (int i = 0; i < boxes.size(); i++) {
                if (boxes.get(i).isChecked() && seen.add(shown.get(i).id)) chosen.add(shown.get(i));
            }
            if (chosen.isEmpty()) {
                toast(activity, "Select at least one item");
                return;
            }
            dialog.dismiss();
            choice.onChosen(chosen);
        });
        if (openDialog != null) openDialog.dismiss();
        openDialog = dialog;
    }

    private static void flushGrid(LinearLayout rows, List<View> batch) {
        if (batch.isEmpty()) return;
        MorpheDialog.addGrid(rows, new ArrayList<>(batch));
        batch.clear();
    }

    private static JSONObject snapshot(Context context, String name) throws Exception {
        SharedPreferences prefs = context.getApplicationContext().getSharedPreferences(name, Context.MODE_PRIVATE);
        JSONObject out = new JSONObject();
        for (Map.Entry<String, ?> entry : prefs.getAll().entrySet()) {
            Object value = entry.getValue();
            if (value == null) continue;
            JSONObject wrapped = new JSONObject();
            if (value instanceof String) {
                wrapped.put("t", "s");
                wrapped.put("v", value);
            } else if (value instanceof Integer) {
                wrapped.put("t", "i");
                wrapped.put("v", value);
            } else if (value instanceof Long) {
                wrapped.put("t", "l");
                wrapped.put("v", value);
            } else if (value instanceof Float) {
                wrapped.put("t", "f");
                wrapped.put("v", value);
            } else if (value instanceof Boolean) {
                wrapped.put("t", "b");
                wrapped.put("v", value);
            } else if (value instanceof Set) {
                wrapped.put("t", "set");
                JSONArray array = new JSONArray();
                for (Object item : (Set<?>) value) array.put(String.valueOf(item));
                wrapped.put("v", array);
            } else {
                continue;
            }
            out.put(entry.getKey(), wrapped);
        }
        return out;
    }

    private static String restoreFile(Context context, String name, JSONObject values) {
        try {
            SharedPreferences prefs = context.getApplicationContext().getSharedPreferences(name, Context.MODE_PRIVATE);
            SharedPreferences.Editor editor = prefs.edit();
            java.util.Set<String> keep = new HashSet<>();
            JSONArray names = values.names();
            if (names != null) {
                for (int i = 0; i < names.length(); i++) {
                    String key = names.optString(i, null);
                    JSONObject wrapped = key == null ? null : values.optJSONObject(key);
                    if (key == null || wrapped == null) continue;
                    keep.add(key);
                    String type = wrapped.optString("t");
                    if ("s".equals(type)) editor.putString(key, wrapped.optString("v"));
                    else if ("i".equals(type)) editor.putInt(key, wrapped.optInt("v"));
                    else if ("l".equals(type)) editor.putLong(key, wrapped.optLong("v"));
                    else if ("f".equals(type)) editor.putFloat(key, (float) wrapped.optDouble("v"));
                    else if ("b".equals(type)) editor.putBoolean(key, wrapped.optBoolean("v"));
                    else if ("set".equals(type)) {
                        JSONArray array = wrapped.optJSONArray("v");
                        Set<String> set = new HashSet<>();
                        if (array != null) {
                            for (int j = 0; j < array.length(); j++) set.add(array.optString(j));
                        }
                        editor.putStringSet(key, set);
                    }
                }
            }
            for (String existing : new ArrayList<>(prefs.getAll().keySet())) {
                if (!keep.contains(existing)) editor.remove(existing);
            }
            if (!editor.commit()) return "Joey did not save the file";
            return null;
        } catch (Throwable t) {
            String message = t.getMessage();
            return t.getClass().getSimpleName() + (message == null || message.isEmpty() ? "" : ": " + message);
        }
    }

    private static void requireRestart(Activity activity, List<String> failed) {
        StringBuilder message = new StringBuilder("Joey has to restart before these settings apply fully.");
        if (!failed.isEmpty()) {
            message.append("\n\nNot restored:");
            for (String line : failed) message.append("\n").append(line);
        }
        LinearLayout page = MorpheDialog.page(activity, "Restart required", message.toString());
        TextView restart = MorpheDialog.action(activity, "Restart", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, restart));
        AlertDialog dialog = MorpheDialog.show(activity, page);
        dialog.setCancelable(false);
        dialog.setCanceledOnTouchOutside(false);
        dialog.setOnKeyListener((d, keyCode, event) -> true);
        restart.setOnClickListener(v -> restart(activity));
    }

    private static void restart(Activity activity) {
        Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(launch);
        }
        activity.finishAffinity();
        android.os.Process.killProcess(android.os.Process.myPid());
    }

    private static String signedInUsername(Context context) {
        SharedPreferences auth = context.getApplicationContext().getSharedPreferences("Authentication", Context.MODE_PRIVATE);
        String name = auth.getString("username", "");
        if (name != null) name = name.trim();
        boolean guest = name == null || name.isEmpty() || name.equalsIgnoreCase("Guest");
        if (guest || !auth.getBoolean("logged_in_status", false)) return null;
        return name;
    }

    private static void toast(Context context, String message) {
        Toast.makeText(context.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
    }

    private static boolean containsId(List<Group> groups, String id) {
        for (Group group : groups) if (group.id.equals(id)) return true;
        return false;
    }

    private static Group group(String id, String title, String section, boolean account, String... files) {
        return new Group(id, title, section, account, files);
    }

    private interface Choice {
        void onChosen(List<Group> groups);
    }

    private static final class Group {
        final String id;
        final String title;
        final String section;
        final boolean account;
        final String[] files;

        Group(String id, String title, String section, boolean account, String[] files) {
            this.id = id;
            this.title = title;
            this.section = section;
            this.account = account;
            this.files = files;
        }
    }
}
