package app.template.extension.telegram;

import android.app.Activity;
import android.app.AlertDialog;
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

/** Dedicated in-app Morphe settings screen, opened from Telegram's Settings list. */
public final class MorpheSettingsActivity extends Activity {
    private SharedPreferencesForwardingRuleStore store;
    private LinearLayout content;
    private LinearLayout rulesContainer;
    private Switch enabledSwitch;
    private EditText nameInput;
    private EditText sourceInput;
    private EditText destinationInput;
    private EditText includeInput;
    private EditText excludeInput;
    private Spinner matchSpinner;
    private Spinner deliverySpinner;
    private Switch caseSensitiveSwitch;
    private Switch showSenderSwitch;
    private String editingRuleId;
    private final Map<String, TextView> ruleStatsViews = new HashMap<>();
    private final Handler statsHandler = new Handler(Looper.getMainLooper());
    private final Runnable statsRefresh = new Runnable() {
        @Override public void run() {
            if (!isFinishing() && rulesContainer != null) {
                refreshRuleStats();
                statsHandler.postDelayed(this, 1500L);
            }
        }
    };

    @Override protected void onResume() {
        super.onResume();
        statsHandler.removeCallbacks(statsRefresh);
        statsHandler.postDelayed(statsRefresh, 1500L);
    }

    @Override protected void onPause() {
        statsHandler.removeCallbacks(statsRefresh);
        super.onPause();
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        store = new SharedPreferencesForwardingRuleStore(this);
        buildScreen();
        refreshRules();
    }

    private void buildScreen() {
        // Follow Telegram's currently selected palette (including custom themes).
        final int background = 0xfff1f1f3;
        final int surface = Color.WHITE;
        final int primary = 0xff202124;
        final int secondary = 0xff666666;
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
            store.setEnabled(checked);
            Toast.makeText(this, checked ? "Automatic forwarding enabled" : "Automatic forwarding paused", Toast.LENGTH_SHORT).show();
        });
        LinearLayout.LayoutParams masterParams = params(-1, -2);
        masterParams.topMargin = dp(18);
        content.addView(masterCard, masterParams);

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

        Button save = button("Save forwarding rule");
        LinearLayout.LayoutParams saveParams = params(-1, dp(48));
        saveParams.topMargin = dp(14);
        form.addView(save, saveParams);
        save.setOnClickListener(v -> saveRule());

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
        note.setText("Choose source and destination chats from Telegram dialogs, or enter dialog IDs manually. Secret chats and protected/no-forward messages are excluded.");
        note.setTextSize(12);
        note.setTextColor(secondary);
        LinearLayout.LayoutParams noteParams = params(-1, -2);
        noteParams.topMargin = dp(18);
        content.addView(note, noteParams);
    }


    /** Reads the currently loaded Telegram dialogs from the active native account. */
    private void showChatPicker(boolean source) {
        try {
            List<ChatChoice> choices = readTelegramDialogs();
            if (choices.isEmpty()) {
                Toast.makeText(this, "No Telegram dialogs are loaded. Open Chats and retry.", Toast.LENGTH_LONG).show();
                return;
            }
            EditText target = source ? sourceInput : destinationInput;
            Set<Long> selected = parseIds(text(target));
            final android.widget.ListView list = new android.widget.ListView(this);
            list.setChoiceMode(android.widget.ListView.CHOICE_MODE_MULTIPLE);
            final EditText search = new EditText(this);
            search.setSingleLine(true);
            search.setHint("Search chats");
            final ArrayList<ChatChoice> visible = new ArrayList<>(choices);
            final ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                    android.R.layout.simple_list_item_multiple_choice, new ArrayList<String>());
            for (ChatChoice c : visible) adapter.add(c.icon + "  " + c.title + "  ·  " + c.id);
            list.setAdapter(adapter);
            for (int i=0;i<visible.size();i++) list.setItemChecked(i, selected.contains(visible.get(i).id));
            list.setOnItemClickListener((parent, view, position, id) -> {
                long chatId = visible.get(position).id;
                if (list.isItemChecked(position)) selected.add(chatId); else selected.remove(chatId);
            });
            LinearLayout pickerLayout = new LinearLayout(this);
            pickerLayout.setOrientation(LinearLayout.VERTICAL);
            pickerLayout.setPadding(dp(16), dp(8), dp(16), dp(8));
            pickerLayout.addView(search, params(-1, dp(48)));
            pickerLayout.addView(list, params(-1, dp(420)));
            search.addTextChangedListener(new android.text.TextWatcher() {
                public void beforeTextChanged(CharSequence s,int st,int count,int after) {}
                public void onTextChanged(CharSequence s,int st,int before,int count) {
                    String q=s.toString().trim().toLowerCase(java.util.Locale.ROOT);
                    visible.clear(); adapter.clear();
                    for (ChatChoice c:choices) if (q.isEmpty() || c.title.toLowerCase(java.util.Locale.ROOT).contains(q)
                            || String.valueOf(c.id).contains(q)) { visible.add(c); adapter.add(c.icon + "  " + c.title + "  ·  " + c.id); }
                    adapter.notifyDataSetChanged();
                    for (int i=0;i<visible.size();i++) list.setItemChecked(i, selected.contains(visible.get(i).id));
                }
                public void afterTextChanged(android.text.Editable e) {}
            });
            new AlertDialog.Builder(this).setTitle(source ? "Choose source chats" : "Choose destination chats")
                    .setView(pickerLayout)
                    .setNegativeButton("Cancel", null)
                    .setPositiveButton("Apply", (d, which) -> {
                        StringBuilder ids = new StringBuilder();
                        for (Long id : selected) { if (ids.length() > 0) ids.append(", "); ids.append(id); }
                        target.setText(ids.toString());
                    }).show();
        } catch (Throwable e) {
            Toast.makeText(this, "Could not load Telegram chats. Open the Chats screen once, then retry. Details: " + e.getClass().getSimpleName(), Toast.LENGTH_LONG).show();
        }
    }

    private List<ChatChoice> readTelegramDialogs() throws Exception {
        ClassLoader cl = getClassLoader();
        Class<?> userConfig = Class.forName("org.telegram.messenger.UserConfig", false, cl);
        int account = 0;
        try { account = userConfig.getField("selectedAccount").getInt(null); } catch (Throwable ignored) { }

        Class<?> controllerClass = Class.forName("org.telegram.messenger.MessagesController", false, cl);
        Object controller = controllerClass.getMethod("getInstance", int.class).invoke(null, account);
        if (controller == null) throw new IllegalStateException("Telegram MessagesController is unavailable");

        // Do not assume a public field named "dialogs": Telegram forks move/rename this collection.
        java.util.LinkedHashMap<Long, ChatChoice> found = new java.util.LinkedHashMap<>();
        Class<?> type = controller.getClass();
        while (type != null && type != Object.class) {
            for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(controller);
                    collectDialogCandidates(value, controllerClass, controller, found);
                } catch (Throwable ignored) { }
            }
            type = type.getSuperclass();
        }
        ArrayList<ChatChoice> result = new ArrayList<>(found.values());
        java.util.Collections.sort(result, (a, b) -> a.title.compareToIgnoreCase(b.title));
        return result;
    }

    /** Handles Telegram's ArrayList/Map and Android SparseArray/LongSparseArray containers. */
    private void collectDialogCandidates(Object value, Class<?> controllerClass, Object controller,
                                         java.util.Map<Long, ChatChoice> result) {
        if (value == null) return;
        try {
            if (value instanceof Iterable) {
                for (Object item : (Iterable<?>) value) addDialogChoice(item, controllerClass, controller, result);
                return;
            }
            if (value instanceof java.util.Map) {
                for (Object item : ((java.util.Map<?, ?>) value).values()) addDialogChoice(item, controllerClass, controller, result);
                return;
            }
            if (value.getClass().isArray()) {
                int n = java.lang.reflect.Array.getLength(value);
                for (int i = 0; i < n; i++) addDialogChoice(java.lang.reflect.Array.get(value, i), controllerClass, controller, result);
                return;
            }
            // android.util.LongSparseArray, SparseArray and Telegram's sparse containers.
            java.lang.reflect.Method size = findNoArgMethod(value.getClass(), "size");
            java.lang.reflect.Method valueAt = findIndexedMethod(value.getClass(), "valueAt");
            if (size != null && valueAt != null) {
                size.setAccessible(true);
                valueAt.setAccessible(true);
                int count = ((Number) size.invoke(value)).intValue();
                for (int i = 0; i < count; i++) addDialogChoice(valueAt.invoke(value, i), controllerClass, controller, result);
            }
        } catch (Throwable ignored) { }
    }

    private java.lang.reflect.Method findNoArgMethod(Class<?> type, String name) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try { return c.getDeclaredMethod(name); } catch (Throwable ignored) { }
        }
        return null;
    }

    private java.lang.reflect.Method findIndexedMethod(Class<?> type, String name) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            for (java.lang.reflect.Method method : c.getDeclaredMethods()) {
                if (method.getName().equals(name) && method.getParameterTypes().length == 1
                        && method.getParameterTypes()[0] == int.class) return method;
            }
        }
        return null;
    }

    private void addDialogChoice(Object dialog, Class<?> controllerClass, Object controller,
                                 java.util.Map<Long, ChatChoice> result) {
        if (dialog == null) return;
        try {
            // Telegram's concrete TL object is commonly TLRPC$TL_dialog, not TLRPC$Dialog.
            // Test assignability against the base type instead of a case-sensitive class-name substring.
            ClassLoader cl = getClassLoader();
            Class<?> dialogBase = Class.forName("org.telegram.tgnet.TLRPC$Dialog", false, cl);
            if (!dialogBase.isAssignableFrom(dialog.getClass())) return;
            java.lang.reflect.Field idField = findField(dialog.getClass(), "id");
            if (idField == null) return;
            idField.setAccessible(true);
            Object rawId = idField.get(dialog);
            if (!(rawId instanceof Number)) return;
            long id = ((Number) rawId).longValue();
            if (id == 0 || result.containsKey(id)) return;
            ChatChoice choice = resolveChatChoice(controllerClass, controller, id);
            result.put(id, choice);
        } catch (Throwable ignored) { }
    }

    private java.lang.reflect.Field findField(Class<?> type, String name) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try { return c.getDeclaredField(name); } catch (Throwable ignored) { }
        }
        return null;
    }

    /** Resolve dialog names using Telegram's native account controller. Handles int/long APIs and obfuscated forks. */
    private ChatChoice resolveChatChoice(Class<?> mc, Object controller, long dialogId) {
        String title = null;
        String icon = dialogId > 0 ? "👤" : "👥";
        try {
            if (dialogId > 0) {
                Object user = invokeNumericGetter(mc, controller, "getUser", dialogId);
                if (user != null) {
                    String first = readStringField(user, "first_name");
                    String last = readStringField(user, "last_name");
                    title = (first + " " + last).trim();
                    if (title.isEmpty()) title = readStringField(user, "username");
                }
            } else {
                long chatId = dialogId <= -1000000000000L
                        ? -dialogId - 1000000000000L : -dialogId;
                Object chat = invokeNumericGetter(mc, controller, "getChat", chatId);
                if (chat != null) {
                    title = readStringField(chat, "title");
                    // Telegram channel chats expose broadcast/megagroup flags in flags.
                    int flags = readIntField(chat, "flags");
                    boolean channel = chat.getClass().getName().contains("TL_channel")
                            || hasBooleanField(chat, "broadcast") || hasBooleanField(chat, "megagroup");
                    if (channel && hasBooleanFieldValue(chat, "broadcast")) icon = "📢";
                    else if (channel) icon = "📣";
                    else icon = "👥";
                }
            }
        } catch (Throwable ignored) { }
        if (title == null || title.trim().isEmpty() || "null".equals(title)) title = "Chat";
        return new ChatChoice(dialogId, title.trim(), icon);
    }

    private Object invokeNumericGetter(Class<?> owner, Object target, String name, long value) {
        for (Class<?> c = owner; c != null; c = c.getSuperclass()) {
            for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                Class<?>[] p = m.getParameterTypes();
                if (!m.getName().equals(name) || p.length != 1) continue;
                try {
                    Object arg;
                    if (p[0] == int.class || p[0] == Integer.class) arg = (int) value;
                    else if (p[0] == long.class || p[0] == Long.class) arg = value;
                    else continue;
                    m.setAccessible(true);
                    return m.invoke(target, arg);
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    private String readStringField(Object object, String name) {
        java.lang.reflect.Field f = findField(object.getClass(), name);
        if (f == null) return "";
        try { f.setAccessible(true); Object v = f.get(object); return v == null ? "" : String.valueOf(v); }
        catch (Throwable ignored) { return ""; }
    }

    private int readIntField(Object object, String name) {
        java.lang.reflect.Field f = findField(object.getClass(), name);
        if (f == null) return 0;
        try { f.setAccessible(true); Object v = f.get(object); return v instanceof Number ? ((Number) v).intValue() : 0; }
        catch (Throwable ignored) { return 0; }
    }

    private boolean hasBooleanField(Object object, String name) {
        return findField(object.getClass(), name) != null;
    }

    private boolean hasBooleanFieldValue(Object object, String name) {
        java.lang.reflect.Field f = findField(object.getClass(), name);
        if (f == null) return false;
        try { f.setAccessible(true); return f.getBoolean(object); } catch (Throwable ignored) { return false; }
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
                Toast.makeText(this, "Enter at least one source and one destination chat ID", Toast.LENGTH_LONG).show();
                return;
            }
            List<ForwardingRule> rules = new ArrayList<>(store.loadAllRules());
            ForwardingRule rule = new ForwardingRule(editingRuleId == null ? UUID.randomUUID().toString() : editingRuleId, name, editingRuleId == null || findRuleEnabled(editingRuleId),
                    sources, destinations, parseWords(text(includeInput)), parseWords(text(excludeInput)),
                    matchSpinner.getSelectedItemPosition() == 1 ? ForwardingRule.MatchMode.ALL : ForwardingRule.MatchMode.ANY,
                    caseSensitiveSwitch.isChecked(), deliverySpinner.getSelectedItemPosition() == 1
                            ? ForwardingRule.DeliveryMode.COPY : ForwardingRule.DeliveryMode.FORWARD,
                    showSenderSwitch.isChecked());
            if (editingRuleId == null) rules.add(rule);
            else { for (int i=0;i<rules.size();i++) if (rules.get(i).getId().equals(editingRuleId)) { rules.set(i, rule); break; } }
            editingRuleId = null;
            store.saveRules(rules);
            nameInput.setText(""); sourceInput.setText(""); destinationInput.setText("");
            includeInput.setText(""); excludeInput.setText("");
            showSenderSwitch.setChecked(false);
            refreshRules();
            Toast.makeText(this, "Forwarding rule saved", Toast.LENGTH_SHORT).show();
        } catch (Throwable error) {
            Toast.makeText(this, "Could not save rule: " + error.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private void refreshRules() {
        if (rulesContainer == null) return;
        rulesContainer.removeAllViews();
        ruleStatsViews.clear();
        List<ForwardingRule> rules = store.loadAllRules();
        if (rules.isEmpty()) {
            TextView empty = label("No forwarding rules yet.", 0xff777777);
            rulesContainer.addView(empty, params(-1, -2));
            return;
        }
        for (ForwardingRule rule : rules) {
            LinearLayout item = new LinearLayout(this);
            item.setOrientation(LinearLayout.VERTICAL);
            item.setPadding(dp(14), dp(12), dp(14), dp(12));
            item.setBackground(roundBackground(Color.WHITE, dp(14)));
            TextView name = label(rule.getName(), 0xff202124);
            name.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            item.addView(name, params(-1, -2));
            TextView details = label(ruleDetailsText(rule), 0xff666666);
            details.setTextSize(12);
            ruleStatsViews.put(rule.getId(), details);
            LinearLayout.LayoutParams detailsParams = params(-1, -2);
            detailsParams.topMargin = dp(5);
            item.addView(details, detailsParams);
            TextView state = label(rule.isEnabled() ? "Rule is active" : "Rule is paused", rule.isEnabled() ? 0xff2e9d62 : 0xffd58a24);
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
                    .setTitle("Reset automation counter?")
                    .setMessage("This resets Automation and the selected delivery counter for this rule to zero. It does not change the rule.")
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
        String deliveryCount = rule.getDeliveryMode() == ForwardingRule.DeliveryMode.COPY
                ? " · Copied: " + store.getCount(rule.getId(), "copied")
                : " · Forwarded: " + store.getCount(rule.getId(), "forwarded");
        return "Sources: " + rule.getSourceChatIds() + "\nDestinations: " + rule.getDestinationChatIds()
                + "\nAutomation: " + store.getCount(rule.getId(), "automation") + deliveryCount;
    }

    /** Refresh count labels only; do not rebuild cards/buttons while the user is interacting. */
    private void refreshRuleStats() {
        if (store == null || ruleStatsViews.isEmpty()) return;
        for (ForwardingRule rule : store.loadAllRules()) {
            TextView view = ruleStatsViews.get(rule.getId());
            if (view != null) view.setText(ruleDetailsText(rule));
        }
    }

    private void loadRuleForEdit(ForwardingRule rule) {
        editingRuleId = rule.getId();
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
        TextView heading = label(label, 0xff202124);
        parent.addView(heading, params(-1, -2));
        EditText input = new EditText(this);
        input.setSingleLine(false);
        input.setTextSize(14);
        input.setHint(hint);
        input.setTextColor(0xff202124);
        input.setHintTextColor(0xff777777);
        input.setBackgroundTintList(android.content.res.ColorStateList.valueOf(0xff888888));
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
                view.setTextColor(0xff202124);
                return view;
            }
            @Override public View getDropDownView(int position, View convertView, android.view.ViewGroup parent) {
                TextView view = (TextView) super.getDropDownView(position, convertView, parent);
                view.setTextColor(0xff202124);
                view.setBackgroundColor(Color.WHITE);
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
        button.setTextColor(0xff202124);
        button.setBackgroundTintList(android.content.res.ColorStateList.valueOf(0xffd6d8d8));
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

    private static String text(EditText input) { return input.getText() == null ? "" : input.getText().toString().trim(); }
    private int dp(float value) { return Math.round(value * getResources().getDisplayMetrics().density); }
}
