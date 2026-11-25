package app.template.extension.telegram;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import app.template.extension.forwarding.ForwardingRule;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.Map;
import java.util.HashMap;
import java.util.UUID;
import java.lang.reflect.Field;
import android.net.Uri;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;

/** Dedicated in-app Morphe settings screen, opened from Telegram's Settings list. */
public final class MorpheSettingsActivity extends Activity {
    private SharedPreferencesForwardingRuleStore store;
    private LinearLayout content;
    private LinearLayout rulesContainer;
    private TextView runtimeStatusView;
    private Switch enabledSwitch;
    private boolean syncingEnabledSwitch;
    private boolean enabledPreferenceListenerRegistered;
    private final android.content.SharedPreferences.OnSharedPreferenceChangeListener enabledPreferenceListener =
            (preferences, key) -> {
                if (!SharedPreferencesForwardingRuleStore.KEY_ENABLED.equals(key)) return;
                runOnUiThread(() -> {
                    if (store == null || isFinishing()) return;
                    syncMasterSwitch();
                });
            };
    private EditText nameInput;
    private EditText sourceInput;
    private EditText destinationInput;
    private EditText includeInput;
    private EditText excludeInput;
    private Spinner matchSpinner;
    private Spinner deliverySpinner;
    private Switch caseSensitiveSwitch;
    private Switch showSenderSwitch;
    private static final int REQUEST_EXPORT_RULES = 73151;
    private static final int REQUEST_IMPORT_RULES = 73152;
    private Button saveRuleButton;
    private Button cancelEditButton;
    private int colorBackground;
    private int colorSurface;
    private int colorPrimary;
    private int colorSecondary;
    private int colorAccent;
    private int colorHint;
    private String editingRuleId;
    private final Map<String, TextView> ruleStatsViews = new HashMap<>();
    private final Handler statsHandler = new Handler(Looper.getMainLooper());
    private final Runnable statsRefresh = new Runnable() {
        @Override public void run() {
            if (!isFinishing() && rulesContainer != null) {
                refreshRuleStats();
                if (runtimeStatusView != null) runtimeStatusView.setText(store.getRuntimeStatus());
                statsHandler.postDelayed(this, 1500L);
            }
        }
    };

    @Override protected void onResume() {
        super.onResume();
        registerEnabledPreferenceListener();
        syncMasterSwitch();
        statsHandler.removeCallbacks(statsRefresh);
        statsHandler.postDelayed(statsRefresh, 1500L);
    }

    @Override protected void onPause() {
        statsHandler.removeCallbacks(statsRefresh);
        unregisterEnabledPreferenceListener();
        super.onPause();
    }

    @Override protected void onDestroy() {
        unregisterEnabledPreferenceListener();
        statsHandler.removeCallbacks(statsRefresh);
        super.onDestroy();
    }

    private void registerEnabledPreferenceListener() {
        if (enabledPreferenceListenerRegistered || store == null) return;
        storePreferences().registerOnSharedPreferenceChangeListener(enabledPreferenceListener);
        enabledPreferenceListenerRegistered = true;
    }

    private void unregisterEnabledPreferenceListener() {
        if (!enabledPreferenceListenerRegistered || store == null) return;
        storePreferences().unregisterOnSharedPreferenceChangeListener(enabledPreferenceListener);
        enabledPreferenceListenerRegistered = false;
    }

    private android.content.SharedPreferences storePreferences() {
        return getSharedPreferences(SharedPreferencesForwardingRuleStore.PREFS, MODE_PRIVATE);
    }

    @Override public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus && store != null && enabledSwitch != null) {
            syncMasterSwitch();
        }
    }

    private void syncMasterSwitch() {
        if (enabledSwitch == null || store == null) return;
        syncingEnabledSwitch = true;
        try { enabledSwitch.setChecked(store.isEnabled()); }
        finally { syncingEnabledSwitch = false; }
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        store = new SharedPreferencesForwardingRuleStore(this);
        MorpheRulesBackup.schedule(this);
        buildScreen();
        refreshRules();
    }

    private void buildScreen() {
        // Follow Telegram's active theme instead of forcing a separate monochrome
        // palette. This keeps text, controls, status/navigation bars and dialogs in
        // the same color family as the host Settings screen.
        int hostBackground = resolveThemeColor(android.R.attr.colorBackground, 0xfffafafa);
        // Telegram's light Settings uses a #FAFAFA page with distinct white rounded
        // cards. Some Telegram forks report pure white as colorBackground; normalize
        // light mode so the section cards remain visibly separated from the page.
        colorBackground = isColorDark(hostBackground) ? hostBackground : 0xfffafafa;
        // Use a fixed Telegram-style neutral typography palette so no inherited host magenta
        // text colors leak into Morphe Settings. Keep teal controls and rule states.
        colorPrimary = 0xff212121;
        colorSecondary = 0xff616161;
        colorAccent = 0xff008577; // Telegram-style teal for controls and active rules.
        colorHint = 0xff757575;
        boolean dark = isColorDark(colorBackground);
        colorSurface = dark ? blend(colorBackground, Color.WHITE, 0.08f) : Color.WHITE;
        final int background = colorBackground;
        final int surface = colorSurface;
        final int primary = colorPrimary;
        final int secondary = colorSecondary;
        if (android.os.Build.VERSION.SDK_INT >= 21) {
            getWindow().setStatusBarColor(background);
            getWindow().setNavigationBarColor(background);
        }
        if (android.os.Build.VERSION.SDK_INT >= 23) {
            int flags = getWindow().getDecorView().getSystemUiVisibility();
            if (!dark) flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            else flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            if (android.os.Build.VERSION.SDK_INT >= 26) {
                if (!dark) flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                else flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            }
            getWindow().getDecorView().setSystemUiVisibility(flags);
        }
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(18), dp(16), dp(18), dp(28));
        content.setBackgroundColor(background);

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.addView(content, new ScrollView.LayoutParams(-1, -2));
        setContentView(scroll);

        TextView title = new TextView(this);
        title.setText("Morphe Settings");
        title.setTextSize(24);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setTextColor(primary);
        content.addView(title, params(-1, -2));

        TextView subtitle = new TextView(this);
        subtitle.setText("Automatic message forwarding using your existing Telegram account.");
        subtitle.setTextSize(14);
        subtitle.setTextColor(secondary);
        LinearLayout.LayoutParams subtitleParams = params(-1, -2);
        subtitleParams.topMargin = dp(6);
        content.addView(subtitle, subtitleParams);

        LinearLayout masterCard = card(surface);
        enabledSwitch = new Switch(this);
        enabledSwitch.setText("Enable automatic forwarding");
        enabledSwitch.setTextSize(16);
        enabledSwitch.setTextColor(primary);
        enabledSwitch.setChecked(store.isEnabled());
        masterCard.addView(enabledSwitch, params(-1, -2));
        enabledSwitch.setOnCheckedChangeListener((button, checked) -> {
            if (syncingEnabledSwitch) return;
            store.setEnabled(checked);
            Toast.makeText(this, checked ? "Automatic forwarding enabled" : "Automatic forwarding paused", Toast.LENGTH_SHORT).show();
        });
        LinearLayout.LayoutParams masterParams = params(-1, -2);
        masterParams.topMargin = dp(18);
        content.addView(masterCard, masterParams);

        runtimeStatusView = label(store.getRuntimeStatus(), secondary);
        runtimeStatusView.setTextSize(12);
        LinearLayout.LayoutParams statusParams = params(-1, -2);
        statusParams.topMargin = dp(8);
        content.addView(runtimeStatusView, statusParams);

        LinearLayout preferencesCard = card(surface);
        Button exportRules = button("Export all rules (backup)");
        preferencesCard.addView(exportRules, params(-1, dp(44)));
        exportRules.setOnClickListener(v -> exportRules());
        Button importRules = button("Restore rules from backup");
        LinearLayout.LayoutParams importParams = params(-1, dp(44)); importParams.topMargin = dp(6);
        preferencesCard.addView(importRules, importParams);
        importRules.setOnClickListener(v -> importRules());
        TextView backupNote = label("Automatic private backup: every 24 hours, retaining the 7 most recent snapshots. Manual export creates a portable JSON file.", secondary);
        backupNote.setTextSize(12);
        LinearLayout.LayoutParams noteParams = params(-1, -2); noteParams.topMargin = dp(6);
        preferencesCard.addView(backupNote, noteParams);
        LinearLayout.LayoutParams prefParams = params(-1, -2); prefParams.topMargin = dp(10);
        content.addView(preferencesCard, prefParams);

        addSectionTitle("Create forwarding rule", primary);
        LinearLayout form = card(surface);
        nameInput = addInput(form, "Rule name", "e.g. News forwarding");
        sourceInput = addInput(form, "Source chats", "Choose chats or edit dialog IDs");
        Button pickSources = button("Choose source chats");
        form.addView(pickSources, params(-1, dp(44)));
        pickSources.setOnClickListener(v -> showChatPicker(true));
        destinationInput = addInput(form, "Destination chats", "Choose chats or edit dialog IDs");
        Button pickDestinations = button("Choose destination chats");
        form.addView(pickDestinations, params(-1, dp(44)));
        pickDestinations.setOnClickListener(v -> showChatPicker(false));
        includeInput = addInput(form, "Include keywords (optional)", "Comma-separated words or phrases");
        excludeInput = addInput(form, "Exclude keywords (optional)", "Comma-separated words or phrases");

        TextView matchLabel = label("Keyword matching", primary);
        form.addView(matchLabel, params(-1, -2));
        matchSpinner = spinner(new String[]{"Match any included keyword", "Match all included keywords"});
        form.addView(matchSpinner, params(-1, dp(48)));

        TextView deliveryLabel = label("Delivery mode", primary);
        LinearLayout.LayoutParams deliveryLabelParams = params(-1, -2);
        deliveryLabelParams.topMargin = dp(12);
        form.addView(deliveryLabel, deliveryLabelParams);
        deliverySpinner = spinner(new String[]{"Forward (preserve attribution)", "Copy (send as a new message)"});
        form.addView(deliverySpinner, params(-1, dp(48)));

        showSenderSwitch = new Switch(this);
        showSenderSwitch.setText("Show original sender name (forward mode)");
        showSenderSwitch.setTextColor(primary);
        showSenderSwitch.setTextSize(14);
        form.addView(showSenderSwitch, params(-1, -2));

        caseSensitiveSwitch = new Switch(this);
        caseSensitiveSwitch.setText("Case-sensitive keyword matching");
        caseSensitiveSwitch.setTextColor(primary);
        caseSensitiveSwitch.setTextSize(14);
        LinearLayout.LayoutParams caseParams = params(-1, -2);
        caseParams.topMargin = dp(10);
        form.addView(caseSensitiveSwitch, caseParams);

        LinearLayout editActions = actionRow();
        saveRuleButton = button("Save forwarding rule");
        cancelEditButton = compactButton("Cancel edit");
        cancelEditButton.setVisibility(View.GONE);
        editActions.addView(saveRuleButton, new LinearLayout.LayoutParams(0, dp(48), 1f));
        LinearLayout.LayoutParams cancelParams = new LinearLayout.LayoutParams(0, dp(48), 0.55f);
        cancelParams.leftMargin = dp(6);
        editActions.addView(cancelEditButton, cancelParams);
        LinearLayout.LayoutParams saveParams = params(-1, dp(48));
        saveParams.topMargin = dp(14);
        form.addView(editActions, saveParams);
        saveRuleButton.setOnClickListener(v -> saveRule());
        cancelEditButton.setOnClickListener(v -> clearEditor());

        LinearLayout.LayoutParams formParams = params(-1, -2);
        formParams.topMargin = dp(10);
        content.addView(form, formParams);

        addSectionTitle("Your rules", primary);
        rulesContainer = new LinearLayout(this);
        rulesContainer.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams rulesParams = params(-1, -2);
        rulesParams.topMargin = dp(8);
        content.addView(rulesContainer, rulesParams);

        TextView note = new TextView(this);
        note.setText("Choose source and destination chats from Telegram dialogs, or enter dialog IDs manually. Secret chats and service messages are excluded. Forward mode follows Telegram’s native forwarding eligibility; copy mode sends supported text as a new message.");
        note.setTextSize(12);
        note.setTextColor(secondary);
        LinearLayout.LayoutParams forwardingNoteParams = params(-1, -2);
        forwardingNoteParams.topMargin = dp(18);
        content.addView(note, forwardingNoteParams);
    }


    /** Searchable multi-select dialog for choosing source or destination chats. */
    private void exportRules() {
        try {
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/json");
            intent.putExtra(Intent.EXTRA_TITLE, "morphe-rules-backup.json");
            startActivityForResult(intent, REQUEST_EXPORT_RULES);
        } catch (Throwable error) { Toast.makeText(this, "Could not open backup export: " + error.getClass().getSimpleName(), Toast.LENGTH_LONG).show(); }
    }

    private void importRules() {
        try {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/json");
            startActivityForResult(intent, REQUEST_IMPORT_RULES);
        } catch (Throwable error) { Toast.makeText(this, "Could not open backup picker: " + error.getClass().getSimpleName(), Toast.LENGTH_LONG).show(); }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        try {
            if (requestCode == REQUEST_EXPORT_RULES) {
                String json = store.exportBackupJson();
                try (OutputStream out = getContentResolver().openOutputStream(uri, "w")) {
                    if (out == null) throw new java.io.IOException("Unable to open destination");
                    out.write(json.getBytes(StandardCharsets.UTF_8)); out.flush();
                }
                Toast.makeText(this, "All rules exported", Toast.LENGTH_SHORT).show();
            } else if (requestCode == REQUEST_IMPORT_RULES) {
                String json;
                try (InputStream in = getContentResolver().openInputStream(uri); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                    if (in == null) throw new java.io.IOException("Unable to read backup");
                    byte[] buffer = new byte[8192]; int count;
                    while ((count = in.read(buffer)) != -1) { if (out.size() + count > 4 * 1024 * 1024) throw new java.io.IOException("Backup is too large"); out.write(buffer, 0, count); }
                    json = new String(out.toByteArray(), StandardCharsets.UTF_8);
                }
                final String backupJson = json;
                new AlertDialog.Builder(this).setTitle("Replace current rules?")
                        .setMessage("Restoring this backup replaces all current Morphe forwarding rules and their saved counters. Export a backup first if you may need to undo this.")
                        .setNegativeButton("Cancel", null)
                        .setPositiveButton("Restore", (dialog, which) -> {
                            try {
                                int count = store.importBackupJson(backupJson);
                                refreshRules();
                                if (enabledSwitch != null) enabledSwitch.setChecked(store.isEnabled());
                                Toast.makeText(this, "Restored " + count + " rules", Toast.LENGTH_LONG).show();
                            } catch (Throwable error) { Toast.makeText(this, "Restore failed; current rules were preserved. " + error.getClass().getSimpleName(), Toast.LENGTH_LONG).show(); }
                        }).show();
            }
        } catch (Throwable error) { Toast.makeText(this, "Backup operation failed; existing rules were preserved. " + error.getClass().getSimpleName(), Toast.LENGTH_LONG).show(); }
    }

    private void showChatPicker(final boolean sources) {
        final List<ChatChoice> all;
        try {
            all = readTelegramDialogs();
        } catch (Throwable error) {
            new AlertDialog.Builder(this)
                    .setTitle("Telegram chats unavailable")
                    .setMessage("Couldn't load Telegram chats. Open the chats screen once and retry.\n\n"
                            + (error.getMessage() == null ? error.getClass().getSimpleName() : error.getMessage()))
                    .setPositiveButton(android.R.string.ok, null)
                    .show();
            return;
        }
        if (all.isEmpty()) {
            Toast.makeText(this, "No chats are available yet. Open the chats screen and retry.", Toast.LENGTH_LONG).show();
            return;
        }

        final EditText target = sources ? sourceInput : destinationInput;
        final LinkedHashSet<Long> selected = new LinkedHashSet<>();
        try { selected.addAll(parseIds(text(target))); } catch (Throwable ignored) { }
        final ArrayList<ChatChoice> filtered = new ArrayList<>(all);
        final ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_multiple_choice) {
            @Override public int getCount() { return filtered.size(); }
            @Override public String getItem(int position) {
                ChatChoice choice = filtered.get(position);
                return choice.icon + "  " + choice.title + "  ·  " + choice.id;
            }
        };

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(18), dp(8), dp(18), dp(4));
        final EditText search = new EditText(this);
        search.setSingleLine(true);
        search.setTextSize(15);
        search.setTextColor(colorPrimary);
        search.setHintTextColor(colorHint);
        search.setHint("Search chats and channels");
        root.addView(search, params(-1, dp(48)));
        final ListView list = new ListView(this);
        list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
        list.setAdapter(adapter);
        int maxListHeight = Math.max(dp(180), Math.min(dp(420), getResources().getDisplayMetrics().heightPixels * 2 / 3));
        root.addView(list, new LinearLayout.LayoutParams(-1, maxListHeight));
        for (int i = 0; i < filtered.size(); i++) list.setItemChecked(i, selected.contains(filtered.get(i).id));
        list.setOnItemClickListener((parent, view, position, id) -> {
            long chatId = filtered.get(position).id;
            if (list.isItemChecked(position)) selected.add(chatId); else selected.remove(chatId);
        });
        search.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence value, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence value, int start, int before, int count) {
                String query = value == null ? "" : value.toString().trim().toLowerCase(java.util.Locale.ROOT);
                filtered.clear();
                for (ChatChoice choice : all) {
                    if (query.isEmpty() || choice.title.toLowerCase(java.util.Locale.ROOT).contains(query)
                            || String.valueOf(choice.id).contains(query)) filtered.add(choice);
                }
                adapter.notifyDataSetChanged();
                // Positions change after filtering; clear stale ListView choice bits
                // before restoring selection by stable Telegram dialog ID.
                list.clearChoices();
                for (int i = 0; i < filtered.size(); i++) {
                    list.setItemChecked(i, selected.contains(filtered.get(i).id));
                }
            }
            @Override public void afterTextChanged(android.text.Editable value) { }
        });

        new AlertDialog.Builder(this)
                .setTitle(sources ? "Choose source chats" : "Choose destination chats")
                .setView(root)
                .setPositiveButton("Apply", (dialog, which) -> target.setText(joinIds(selected)))
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private static String readStringField(Object object, String fieldName) {
        if (object == null) return "";
        try {
            Field field = findField(object.getClass(), fieldName);
            if (field == null) return "";
            field.setAccessible(true);
            Object value = field.get(object);
            return value == null ? "" : String.valueOf(value).trim();
        } catch (Throwable ignored) { return ""; }
    }

    private static boolean readBooleanField(Object object, String fieldName) {
        if (object == null) return false;
        try {
            Field field = findField(object.getClass(), fieldName);
            if (field == null) return false;
            field.setAccessible(true);
            Object value = field.get(object);
            return value instanceof Boolean && (Boolean) value;
        } catch (Throwable ignored) { return false; }
    }

    private static long readLongField(Object object, String fieldName) {
        if (object == null) return 0L;
        try {
            Field field = findField(object.getClass(), fieldName);
            if (field == null) return 0L;
            field.setAccessible(true);
            Object value = field.get(object);
            return value instanceof Number ? ((Number) value).longValue() : 0L;
        } catch (Throwable ignored) { return 0L; }
    }

    private static String telegramPeerKind(Object peer) {
        for (Class<?> type = peer == null ? null : peer.getClass(); type != null; type = type.getSuperclass()) {
            String name = type.getName().toLowerCase(java.util.Locale.ROOT);
            if (name.endsWith("tl_peeruser") || name.endsWith("peeruser")) return "user";
            if (name.endsWith("tl_peerchannel") || name.endsWith("peerchannel")) return "channel";
            if (name.endsWith("tl_peerchat") || name.endsWith("peerchat")) return "group";
        }
        return "unknown";
    }

    private static Field findField(Class<?> type, String fieldName) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredField(fieldName);
            } catch (NoSuchFieldException ignored) {
                // Continue through the superclass chain.
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static java.lang.reflect.Method findMethod(Class<?> type, String name, Class<?>... parameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredMethod(name, parameters);
            } catch (NoSuchMethodException ignored) {
                // Continue through the superclass chain.
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    /**
     * Android/Web 13.2.2 keep the loaded dialog objects in MessagesController.R,
     * an R8-renamed LongSparseArray implementation (La0/h: m() = size, n(i) = valueAt).
     * The controller's y:ArrayList is NOT the dialog collection: DEX shows it is a
     * separate pending/migration list. Reading y caused the picker to show only a
     * narrow subset of chats and misrepresent their types.
     */
    private static ArrayList<Object> readDialogObjects(Object controller, Class<?> dialogBase) throws Exception {
        // Current Telegram/Web: controller.R is La0/h (m() / n(int)).
        // Current Plus: controller.v0 is Lu/k (n() / q(int)).
        String[][] mapShapes = {
                {"R", "m", "n"},
                {"v0", "n", "q"},
        };
        for (String[] shape : mapShapes) {
            Field mapField = findField(controller.getClass(), shape[0]);
            if (mapField == null) continue;
            mapField.setAccessible(true);
            Object map = mapField.get(controller);
            if (map == null) continue;
            java.lang.reflect.Method size = findMethod(map.getClass(), shape[1]);
            java.lang.reflect.Method valueAt = findMethod(map.getClass(), shape[2], int.class);
            if (size == null || valueAt == null) continue;
            size.setAccessible(true);
            valueAt.setAccessible(true);
            int count = ((Number) size.invoke(map)).intValue();
            ArrayList<Object> dialogs = new ArrayList<>(Math.max(0, count));
            for (int i = 0; i < count; i++) {
                Object value = valueAt.invoke(map, i);
                if (dialogBase.isInstance(value)) dialogs.add(value);
            }
            if (!dialogs.isEmpty()) return dialogs;
        }

        // Named legacy Telegram exposes an ArrayList<Dialog> named dialogs.
        Field legacyField = findField(controller.getClass(), "dialogs");
        if (legacyField != null) {
            legacyField.setAccessible(true);
            Object value = legacyField.get(controller);
            if (value instanceof java.util.List) {
                ArrayList<Object> dialogs = new ArrayList<>();
                for (Object item : (java.util.List<?>) value) {
                    if (dialogBase.isInstance(item)) dialogs.add(item);
                }
                if (!dialogs.isEmpty()) return dialogs;
            }
        }
        throw new IllegalStateException("The loaded Telegram dialog map could not be resolved; refusing to use a non-dialog list");
    }

    /** Reads the actual dialog list from the verified Telegram 13.2.2 controller. */
    private List<ChatChoice> readTelegramDialogs() throws Exception {
        ClassLoader cl = getClassLoader();
        final int account;
        try {
            int selectedAccount;
            // Telegram 13.3.1 moved the selected-account slot into the current
            // UserConfig R8 classes. The previous d20.t0 lookup belongs to 13.2.x.
            try {
                Class<?> config = Class.forName("org.telegram.messenger.y10", false, cl);
                Field selected = findField(config, "t0");
                if (selected == null) throw new NoSuchFieldException("y10.t0");
                selected.setAccessible(true);
                selectedAccount = selected.getInt(null);
            } catch (Throwable notAndroid1331) {
                try {
                    Class<?> config = Class.forName("org.telegram.messenger.a20", false, cl);
                    Field selected = findField(config, "t0");
                    if (selected == null) throw new NoSuchFieldException("a20.t0");
                    selected.setAccessible(true);
                    selectedAccount = selected.getInt(null);
                } catch (Throwable notWeb1331) {
                    try {
                        // Telegram Android/Web 13.2.2 legacy profile.
                        Class<?> config = Class.forName("org.telegram.messenger.d20", false, cl);
                        Field selected = findField(config, "t0");
                        if (selected == null) throw new NoSuchFieldException("d20.t0");
                        selected.setAccessible(true);
                        selectedAccount = selected.getInt(null);
                    } catch (Throwable notAndroidWeb) {
                        // Plus 13.2.1.0: jm1.y0 is the persisted selectedAccount value.
                        Class<?> config = Class.forName("org.telegram.messenger.jm1", false, cl);
                        Field selected = findField(config, "y0");
                        if (selected == null) throw new NoSuchFieldException("jm1.y0");
                        selected.setAccessible(true);
                        selectedAccount = selected.getInt(null);
                    }
                }
            }
            account = selectedAccount;
            if (account < 0 || account >= 4) {
                throw new IllegalStateException("Selected Telegram account slot is out of range: " + account);
            }
        } catch (Throwable unavailable) {
            throw new IllegalStateException("Could not resolve the active Telegram account", unavailable);
        }

        String[] controllerNames = {
                "org.telegram.messenger.tp", // Telegram Android 13.3.1 build 73461
                "org.telegram.messenger.pp", // Telegram Web 13.3.1 build 73469
                "org.telegram.messenger.wp", // Telegram Android 13.2.2 build 73031
                "org.telegram.messenger.sp", // Telegram Web 13.2.2 build 73039
                "org.telegram.messenger.ko0", // Plus Messenger 13.2.1.0 build 22678
                "org.telegram.messenger.MessagesController" // named legacy fallback
        };
        Class<?> controllerClass = null;
        Object controller = null;
        Throwable lastError = null;
        for (String name : controllerNames) {
            try {
                Class<?> candidate = Class.forName(name, false, cl);
                String getterName = name.endsWith("MessagesController") ? "getInstance"
                        : (name.endsWith("tp") || name.endsWith("pp") ? "u1"
                        : (name.endsWith("ko0") ? "ud" : "s1"));
                java.lang.reflect.Method getter = findMethod(candidate, getterName, int.class);
                if (getter == null) throw new NoSuchMethodException(name + "." + getterName + "(int)");
                getter.setAccessible(true);
                Object instance = getter.invoke(null, account);
                if (instance != null) {
                    controllerClass = candidate;
                    controller = instance;
                    break;
                }
            } catch (Throwable error) { lastError = error; }
        }
        if (controller == null) {
            throw new IllegalStateException("Telegram MessagesController could not be resolved", lastError);
        }

        Class<?> dialogBase = Class.forName("org.telegram.tgnet.TLRPC$Dialog", false, cl);
        Field idField = findField(dialogBase, "id");
        Field peerField = findField(dialogBase, "peer");
        if (idField == null || peerField == null) {
            throw new IllegalStateException("Telegram Dialog id/peer fields could not be resolved");
        }
        idField.setAccessible(true);
        peerField.setAccessible(true);
        boolean legacyController = controllerClass.getName().endsWith("MessagesController");
        boolean plusController = controllerClass.getName().endsWith("ko0");
        boolean current1331 = controllerClass.getName().endsWith(".tp")
                || controllerClass.getName().endsWith(".pp");
        java.lang.reflect.Method getUser = findMethod(controllerClass,
                legacyController ? "getUser" : (plusController ? "ze" : (current1331 ? "c2" : "a2")), Long.class);
        // Telegram 13.3.1's x1(J) is NOT getChat: it resolves a linked
        // monoforum chat and commonly returns null for ordinary groups/channels.
        // O0(Long) is the actual MessagesController.getChat lookup in both 73461
        // and 73469. Keep the older profile mappings isolated.
        java.lang.reflect.Method getChat = findMethod(controllerClass,
                legacyController ? "getChat" : (plusController ? "tc" : (current1331 ? "O0" : "M0")),
                Long.class);
        if (getUser == null || getChat == null) {
            throw new IllegalStateException("Telegram user/chat lookup methods could not be resolved");
        }
        getUser.setAccessible(true);
        getChat.setAccessible(true);
        ArrayList<Object> dialogs = readDialogObjects(controller, dialogBase);
        java.util.LinkedHashMap<Long, ChatChoice> unique = new java.util.LinkedHashMap<>();
        for (Object dialog : dialogs) {
                if (dialog == null || !dialogBase.isInstance(dialog)) continue;
                Object rawId = idField.get(dialog);
                if (!(rawId instanceof Number)) continue;
                long id = ((Number) rawId).longValue();
                if (id == 0 || unique.containsKey(id)) continue;

                Object peer = peerField.get(dialog);
                String peerKind = telegramPeerKind(peer);
                long userId = readLongField(peer, "user_id");
                long chatId = readLongField(peer, "chat_id");
                long channelId = readLongField(peer, "channel_id");
                long absoluteDialogId = id == Long.MIN_VALUE ? 0L : Math.abs(id);

                // Telegram 13.2.x can expose a null/obfuscated Peer on dialogs which
                // were restored from cache. Dialog.id remains authoritative: users use
                // positive IDs; groups/channels use negative IDs. Resolve the actual
                // User/Chat object before falling back to a generic label.
                if (userId == 0 && "user".equals(peerKind)) userId = absoluteDialogId;
                if (chatId == 0 && "group".equals(peerKind)) chatId = absoluteDialogId;
                if (channelId == 0 && "channel".equals(peerKind)) channelId = absoluteDialogId;
                if (userId == 0 && chatId == 0 && channelId == 0 && absoluteDialogId != 0) {
                    if (id > 0) userId = absoluteDialogId;
                    else chatId = absoluteDialogId;
                }

                String displayName = "";
                String icon = "💬";
                if (userId != 0) {
                    Object user = getUser.invoke(controller, Long.valueOf(userId));
                    displayName = (readStringField(user, "first_name") + " "
                            + readStringField(user, "last_name")).trim();
                    if (displayName.isEmpty()) displayName = readStringField(user, "username");
                    icon = "👤";
                } else if (chatId != 0 || channelId != 0) {
                    long lookupId = channelId != 0 ? channelId : chatId;
                    Object chat = lookupId == 0 ? null : getChat.invoke(controller, Long.valueOf(lookupId));
                    displayName = readStringField(chat, "title");
                    boolean broadcast = readBooleanField(chat, "broadcast");
                    boolean megagroup = readBooleanField(chat, "megagroup");
                    boolean gigagroup = readBooleanField(chat, "gigagroup");
                    // Telegram marks supergroups with megagroup/gigagroup flags too.
                    // Those flags do not make them broadcast channels: keep them
                    // on the group icon. Only a channel peer or broadcast chat
                    // receives the megaphone icon.
                    boolean channel = channelId != 0 || "channel".equals(peerKind) || broadcast;
                    icon = channel ? "📢" : "👥";
                    if (displayName.isEmpty() && chat != null) {
                        displayName = readStringField(chat, "username");
                    }
                }
                if (displayName.isEmpty()) {
                    String kind = userId != 0 ? "User" : (channelId != 0 || "channel".equals(peerKind)
                            ? "Channel" : (chatId != 0 || "group".equals(peerKind) ? "Group" : "Chat"));
                    displayName = kind + " " + id;
                }
                unique.put(id, new ChatChoice(id, displayName, icon));
        }
        ArrayList<ChatChoice> result = new ArrayList<>(unique.values());
        java.util.Collections.sort(result, (a, b) -> a.title.compareToIgnoreCase(b.title));
        return result;
    }

    private static final class ChatChoice {
        final long id; final String title; final String icon;
        ChatChoice(long id, String title, String icon) { this.id = id; this.title = title; this.icon = icon; }
    }

    private void saveRule() {
        try {
            String name = text(nameInput);
            if (name.isEmpty()) name = "Forwarding rule";
            Set<Long> sources = parseIds(text(sourceInput));
            Set<Long> destinations = parseIds(text(destinationInput));
            if (sources.isEmpty() || destinations.isEmpty()) {
                Toast.makeText(this, "Choose at least one source and one destination chat", Toast.LENGTH_LONG).show();
                return;
            }
            List<ForwardingRule> rules = new ArrayList<>(store.loadAllRules());
            String id = editingRuleId == null ? UUID.randomUUID().toString() : editingRuleId;
            ForwardingRule rule = new ForwardingRule(id, name,
                    editingRuleId == null || findRuleEnabled(editingRuleId), sources, destinations,
                    parseWords(text(includeInput)), parseWords(text(excludeInput)),
                    matchSpinner.getSelectedItemPosition() == 1 ? ForwardingRule.MatchMode.ALL : ForwardingRule.MatchMode.ANY,
                    caseSensitiveSwitch.isChecked(), deliverySpinner.getSelectedItemPosition() == 1
                            ? ForwardingRule.DeliveryMode.COPY : ForwardingRule.DeliveryMode.FORWARD,
                    showSenderSwitch.isChecked());
            if (editingRuleId == null) {
                rules.add(rule);
            } else {
                boolean replaced = false;
                for (int i = 0; i < rules.size(); i++) {
                    if (rules.get(i).getId().equals(editingRuleId)) {
                        rules.set(i, rule);
                        replaced = true;
                        break;
                    }
                }
                if (!replaced) {
                    Toast.makeText(this, "This rule no longer exists. Refresh the list and try again.", Toast.LENGTH_LONG).show();
                    clearEditor();
                    return;
                }
            }
            store.saveRules(rules);
            clearEditor();
            refreshRules();
            Toast.makeText(this, "Forwarding rule saved", Toast.LENGTH_SHORT).show();
        } catch (Throwable error) {
            Toast.makeText(this, "Could not save rule: " + error.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private void clearEditor() {
        editingRuleId = null;
        if (nameInput != null) nameInput.setText("");
        if (sourceInput != null) sourceInput.setText("");
        if (destinationInput != null) destinationInput.setText("");
        if (includeInput != null) includeInput.setText("");
        if (excludeInput != null) excludeInput.setText("");
        if (matchSpinner != null) matchSpinner.setSelection(0);
        if (deliverySpinner != null) deliverySpinner.setSelection(0);
        if (caseSensitiveSwitch != null) caseSensitiveSwitch.setChecked(false);
        if (showSenderSwitch != null) showSenderSwitch.setChecked(false);
        if (saveRuleButton != null) saveRuleButton.setText("Save forwarding rule");
        if (cancelEditButton != null) cancelEditButton.setVisibility(View.GONE);
    }

    private void refreshRules() {
        if (rulesContainer == null) return;
        rulesContainer.removeAllViews();
        ruleStatsViews.clear();
        List<ForwardingRule> rules = store.loadAllRules();
        if (rules.isEmpty()) {
            TextView empty = label("No forwarding rules yet.", colorSecondary);
            rulesContainer.addView(empty, params(-1, -2));
            return;
        }
        for (ForwardingRule rule : rules) {
            LinearLayout item = new LinearLayout(this);
            item.setOrientation(LinearLayout.VERTICAL);
            item.setPadding(dp(14), dp(12), dp(14), dp(12));
            item.setBackground(roundBackground(colorSurface, dp(14)));
            TextView name = label(rule.getName(), colorPrimary);
            name.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            item.addView(name, params(-1, -2));
            TextView details = label(ruleDetailsText(rule), colorSecondary);
            details.setTextSize(12);
            ruleStatsViews.put(rule.getId(), details);
            LinearLayout.LayoutParams detailsParams = params(-1, -2);
            detailsParams.topMargin = dp(5);
            item.addView(details, detailsParams);
            TextView state = label(rule.isEnabled() ? "Rule is active" : "Rule is paused", rule.isEnabled() ? 0xff008577 : 0xffff9800);
            state.setTag("rule_state_" + rule.getId());
            state.setTextSize(12);
            state.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            LinearLayout.LayoutParams stateParams = params(-1, -2);
            stateParams.topMargin = dp(4);
            item.addView(state, stateParams);

            LinearLayout firstRow = actionRow();
            Button edit = compactButton("Edit");
            Button pause = compactButton(rule.isEnabled() ? "Pause rule" : "Restart rule");
            firstRow.addView(edit, actionParams());
            firstRow.addView(pause, actionParams());
            LinearLayout.LayoutParams rowParams = params(-1, dp(42));
            rowParams.topMargin = dp(8);
            item.addView(firstRow, rowParams);
            edit.setOnClickListener(v -> loadRuleForEdit(rule));
            pause.setOnClickListener(v -> setRuleEnabled(rule, !rule.isEnabled()));

            LinearLayout secondRow = actionRow();
            Button reset = compactButton("Reset counter");
            Button remove = compactButton("Remove");
            secondRow.addView(reset, actionParams());
            secondRow.addView(remove, actionParams());
            LinearLayout.LayoutParams secondRowParams = params(-1, dp(42));
            secondRowParams.topMargin = dp(6);
            item.addView(secondRow, secondRowParams);
            reset.setOnClickListener(v -> new AlertDialog.Builder(this)
                    .setTitle("Reset rule counters?")
                    .setMessage("This resets the Automation, Forward queued and Copy queued counters for this rule to zero. It does not change the rule.")
                    .setNegativeButton("Cancel", null)
                    .setPositiveButton("Reset", (dialog, which) -> {
                        store.resetStats(rule.getId());
                        refreshRuleStats();
                        Toast.makeText(this, "Rule counters reset", Toast.LENGTH_SHORT).show();
                    }).show());
            remove.setOnClickListener(v -> {
                List<ForwardingRule> current = new ArrayList<>(store.loadAllRules());
                ArrayList<ForwardingRule> kept = new ArrayList<>();
                for (ForwardingRule candidate : current) if (!candidate.getId().equals(rule.getId())) kept.add(candidate);
                store.saveRules(kept);
                if (rule.getId().equals(editingRuleId)) clearEditor();
                refreshRules();
            });
            LinearLayout.LayoutParams itemParams = params(-1, -2);
            itemParams.bottomMargin = dp(8);
            rulesContainer.addView(item, itemParams);
        }
    }


    private LinearLayout actionRow() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        return row;
    }

    private LinearLayout.LayoutParams actionParams() {
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(0, dp(38), 1f);
        p.leftMargin = dp(3);
        p.rightMargin = dp(3);
        return p;
    }

    private Button compactButton(String text) {
        Button b = button(text);
        b.setTextSize(12);
        b.setMinHeight(0);
        b.setMinimumHeight(dp(34));
        b.setPadding(dp(6), 0, dp(6), 0);
        return b;
    }

    private boolean findRuleEnabled(String id) {
        for (ForwardingRule r : store.loadAllRules()) if (r.getId().equals(id)) return r.isEnabled();
        return true;
    }

    private void setRuleEnabled(ForwardingRule target, boolean enabled) {
        ArrayList<ForwardingRule> updated = new ArrayList<>();
        for (ForwardingRule r : store.loadAllRules()) {
            if (!r.getId().equals(target.getId())) { updated.add(r); continue; }
            updated.add(new ForwardingRule(r.getId(), r.getName(), enabled, r.getSourceChatIds(),
                    r.getDestinationChatIds(), r.getIncludeKeywords(), r.getExcludeKeywords(),
                    r.getMatchMode(), r.isCaseSensitive(), r.getDeliveryMode(), r.isShowSenderName()));
        }
        store.saveRules(updated);
        refreshRules();
        Toast.makeText(this, enabled ? "Rule restarted" : "Rule paused", Toast.LENGTH_SHORT).show();
    }

    private String ruleDetailsText(ForwardingRule rule) {
        String deliveryCount = rule.getDeliveryMode() == ForwardingRule.DeliveryMode.FORWARD
                ? "Forward queued: " + store.getCount(rule.getId(), "forwardQueued")
                : "Copy queued: " + store.getCount(rule.getId(), "copyQueued");
        return "Sources: " + rule.getSourceChatIds() + "\nDestinations: " + rule.getDestinationChatIds()
                + "\nAutomation: " + store.getCount(rule.getId(), "automation") + " · " + deliveryCount
                + " · Failed: " + store.getCount(rule.getId(), "failed");
    }

    /** Refresh count labels only; do not rebuild cards/buttons while the user is interacting. */
    private void refreshRuleStats() {
        if (store == null) return;
        for (ForwardingRule rule : store.loadAllRules()) {
            TextView view = ruleStatsViews.get(rule.getId());
            if (view != null) view.setText(ruleDetailsText(rule));
        }
    }

    private void loadRuleForEdit(ForwardingRule rule) {
        editingRuleId = rule.getId();
        if (saveRuleButton != null) saveRuleButton.setText("Update forwarding rule");
        if (cancelEditButton != null) cancelEditButton.setVisibility(View.VISIBLE);
        nameInput.setText(rule.getName());
        sourceInput.setText(joinIds(rule.getSourceChatIds()));
        destinationInput.setText(joinIds(rule.getDestinationChatIds()));
        includeInput.setText(android.text.TextUtils.join(", ", rule.getIncludeKeywords()));
        excludeInput.setText(android.text.TextUtils.join(", ", rule.getExcludeKeywords()));
        matchSpinner.setSelection(rule.getMatchMode() == ForwardingRule.MatchMode.ALL ? 1 : 0);
        deliverySpinner.setSelection(rule.getDeliveryMode() == ForwardingRule.DeliveryMode.COPY ? 1 : 0);
        caseSensitiveSwitch.setChecked(rule.isCaseSensitive());
        showSenderSwitch.setChecked(rule.isShowSenderName());
        Toast.makeText(this, "Rule loaded for editing; save to apply changes", Toast.LENGTH_SHORT).show();
    }
    private String joinIds(Set<Long> ids) {
        StringBuilder out = new StringBuilder();
        for (Long id : ids) { if (out.length() > 0) out.append(", "); out.append(id); }
        return out.toString();
    }

    private void addSectionTitle(String text, int color) {
        TextView heading = new TextView(this);
        heading.setText(text);
        heading.setTextSize(17);
        heading.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        heading.setTextColor(color);
        LinearLayout.LayoutParams p = params(-1, -2);
        p.topMargin = dp(22);
        p.bottomMargin = dp(4);
        content.addView(heading, p);
    }

    private EditText addInput(LinearLayout parent, String label, String hint) {
        TextView heading = label(label, colorPrimary);
        parent.addView(heading, params(-1, -2));
        EditText input = new EditText(this);
        input.setSingleLine(false);
        input.setTextSize(14);
        input.setHint(hint);
        input.setTextColor(colorPrimary);
        input.setHintTextColor(colorHint);
        input.setBackgroundTintList(android.content.res.ColorStateList.valueOf(colorSecondary));
        input.setPadding(dp(10), dp(8), dp(10), dp(8));
        LinearLayout.LayoutParams p = params(-1, -2);
        p.topMargin = dp(3);
        p.bottomMargin = dp(9);
        parent.addView(input, p);
        return input;
    }

    private Spinner spinner(String[] options) {
        Spinner spinner = new Spinner(this);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, Arrays.asList(options)) {
            @Override public View getView(int position, View convertView, android.view.ViewGroup parent) {
                TextView view = (TextView) super.getView(position, convertView, parent);
                view.setTextColor(colorPrimary);
                return view;
            }
            @Override public View getDropDownView(int position, View convertView, android.view.ViewGroup parent) {
                TextView view = (TextView) super.getDropDownView(position, convertView, parent);
                view.setTextColor(colorPrimary);
                view.setBackgroundColor(colorSurface);
                return view;
            }
        };
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        return spinner;
    }

    private LinearLayout card(int color) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(14), dp(14), dp(14), dp(14));
        card.setBackground(roundBackground(color, dp(16)));
        return card;
    }

    private Button button(String text) {
        Button button = new Button(this);
        button.setText(text);
        button.setTextColor(colorPrimary);
        // Match Telegram's neutral Settings buttons: light grey in light theme,
        // with a subtle raised neutral surface in dark theme. Rule state colors
        // remain independent (active teal, paused orange).
        int buttonSurface = isColorDark(colorSurface)
                ? blend(colorSurface, Color.WHITE, 0.14f)
                : 0xffdddddd;
        button.setBackgroundTintList(android.content.res.ColorStateList.valueOf(buttonSurface));
        return button;
    }

    private TextView label(String text, int color) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextSize(14);
        view.setTextColor(color);
        return view;
    }

    private static LinearLayout.LayoutParams params(int width, int height) {
        return new LinearLayout.LayoutParams(width, height);
    }

    private GradientDrawable roundBackground(int color, float radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(radius);
        return drawable;
    }

    private Set<Long> parseIds(String input) {
        LinkedHashSet<Long> ids = new LinkedHashSet<>();
        for (String part : input.split(",")) {
            String value = part.trim();
            if (!value.isEmpty()) ids.add(Long.parseLong(value));
        }
        return ids;
    }

    private List<String> parseWords(String input) {
        ArrayList<String> words = new ArrayList<>();
        for (String part : input.split(",")) if (!part.trim().isEmpty()) words.add(part.trim());
        return words;
    }

    private int resolveThemeColor(int attribute, int fallback) {
        android.util.TypedValue value = new android.util.TypedValue();
        if (!getTheme().resolveAttribute(attribute, value, true)) return fallback;
        if (value.resourceId != 0) {
            try { return getResources().getColor(value.resourceId); }
            catch (Throwable ignored) { }
        }
        if (value.type >= android.util.TypedValue.TYPE_FIRST_COLOR_INT
                && value.type <= android.util.TypedValue.TYPE_LAST_COLOR_INT) return value.data;
        return fallback;
    }

    private static boolean isColorDark(int color) {
        double luminance = 0.2126 * Color.red(color) + 0.7152 * Color.green(color) + 0.0722 * Color.blue(color);
        return luminance < 145.0;
    }

    private static int blend(int from, int to, float amount) {
        float t = Math.max(0f, Math.min(1f, amount));
        return Color.rgb(
                Math.round(Color.red(from) * (1f - t) + Color.red(to) * t),
                Math.round(Color.green(from) * (1f - t) + Color.green(to) * t),
                Math.round(Color.blue(from) * (1f - t) + Color.blue(to) * t));
    }

    private static String text(EditText input) { return input.getText() == null ? "" : input.getText().toString().trim(); }
    private int dp(float value) { return Math.round(value * getResources().getDisplayMetrics().density); }
}
