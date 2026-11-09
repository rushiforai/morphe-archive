package app.template.extension.telegram;

import android.content.Context;
import android.content.SharedPreferences;

import app.template.extension.forwarding.ForwardingRule;
import app.template.extension.forwarding.ForwardingRuleStore;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** App-private persistence shared by the Morphe settings screen and forwarding runtime. */
public final class SharedPreferencesForwardingRuleStore implements ForwardingRuleStore {
    public static final String PREFS = "morphe_forwarding";
    public static final String KEY_ENABLED = "enabled";
    private final SharedPreferences preferences;

    public SharedPreferencesForwardingRuleStore(Context context) {
        preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public boolean isEnabled() { return preferences.getBoolean(KEY_ENABLED, false); }
    public void setEnabled(boolean enabled) { preferences.edit().putBoolean(KEY_ENABLED, enabled).apply(); }

    @Override public synchronized List<ForwardingRule> loadRules() {
        return isEnabled() ? loadAllRules() : new ArrayList<ForwardingRule>();
    }

    public synchronized List<ForwardingRule> loadAllRules() {
        ArrayList<ForwardingRule> result = new ArrayList<>();
        String encoded = preferences.getString("rules", "[]");
        try {
            JSONArray array = new JSONArray(encoded);
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.optJSONObject(i);
                if (item == null) continue;
                result.add(new ForwardingRule(
                        item.optString("id"), item.optString("name", "Forwarding rule"),
                        item.optBoolean("enabled", true), readLongs(item.optJSONArray("sources")),
                        readLongs(item.optJSONArray("destinations")), readStrings(item.optJSONArray("include")),
                        readStrings(item.optJSONArray("exclude")),
                        "ALL".equals(item.optString("match")) ? ForwardingRule.MatchMode.ALL : ForwardingRule.MatchMode.ANY,
                        item.optBoolean("caseSensitive", false),
                        "COPY".equals(item.optString("delivery")) ? ForwardingRule.DeliveryMode.COPY : ForwardingRule.DeliveryMode.FORWARD,
                        item.optBoolean("showSenderName", false)));
            }
        } catch (Throwable ignored) { }
        return result;
    }

    @Override public synchronized void saveRules(List<ForwardingRule> rules) {
        JSONArray array = new JSONArray();
        if (rules != null) for (ForwardingRule rule : rules) {
            if (rule == null) continue;
            JSONObject item = new JSONObject();
            try {
                item.put("id", rule.getId());
                item.put("name", rule.getName());
                item.put("enabled", rule.isEnabled());
                item.put("sources", writeLongs(rule.getSourceChatIds()));
                item.put("destinations", writeLongs(rule.getDestinationChatIds()));
                item.put("include", writeStrings(rule.getIncludeKeywords()));
                item.put("exclude", writeStrings(rule.getExcludeKeywords()));
                item.put("match", rule.getMatchMode().name());
                item.put("caseSensitive", rule.isCaseSensitive());
                item.put("delivery", rule.getDeliveryMode().name());
                item.put("showSenderName", rule.isShowSenderName());
                array.put(item);
            } catch (Throwable ignored) { }
        }
        preferences.edit().putString("rules", array.toString()).apply();
    }

    public synchronized void recordAutomation(String ruleId) { increment(ruleId, "automation"); }
    public synchronized void recordForwarded(String ruleId) { increment(ruleId, "forwarded"); }
    public synchronized void recordCopied(String ruleId) { increment(ruleId, "copied"); }

    /** Reset this rule's counters only; rules and statistics for other IDs remain untouched. */
    public synchronized void resetStats(String ruleId) {
        if (ruleId == null || ruleId.trim().isEmpty()) return;
        try {
            JSONObject root = new JSONObject(preferences.getString("rule_stats", "{}"));
            root.remove(ruleId);
            preferences.edit().putString("rule_stats", root.toString()).apply();
        } catch (Throwable ignored) { }
    }

    public synchronized long getCount(String ruleId, String metric) {
        try { JSONObject obj = new JSONObject(preferences.getString("rule_stats", "{}")).optJSONObject(ruleId); return obj == null ? 0 : obj.optLong(metric, 0); }
        catch (Throwable ignored) { return 0; }
    }
    private void increment(String ruleId, String metric) {
        try {
            JSONObject root = new JSONObject(preferences.getString("rule_stats", "{}"));
            JSONObject stats = root.optJSONObject(ruleId);
            if (stats == null) stats = new JSONObject();
            stats.put(metric, stats.optLong(metric, 0) + 1);
            root.put(ruleId, stats);
            preferences.edit().putString("rule_stats", root.toString()).apply();
        } catch (Throwable ignored) { }
    }

    private static Set<Long> readLongs(JSONArray array) {
        LinkedHashSet<Long> values = new LinkedHashSet<>();
        if (array != null) for (int i = 0; i < array.length(); i++) {
            try { values.add(Long.parseLong(array.getString(i).trim())); }
            catch (Throwable ignored) { }
        }
        return values;
    }

    private static List<String> readStrings(JSONArray array) {
        ArrayList<String> values = new ArrayList<>();
        if (array != null) for (int i = 0; i < array.length(); i++) {
            String value = array.optString(i, "").trim();
            if (!value.isEmpty()) values.add(value);
        }
        return values;
    }

    private static JSONArray writeLongs(Set<Long> values) {
        JSONArray array = new JSONArray();
        if (values != null) for (Long value : values) if (value != null) array.put(String.valueOf(value));
        return array;
    }

    private static JSONArray writeStrings(List<String> values) {
        JSONArray array = new JSONArray();
        if (values != null) for (String value : values) if (value != null && !value.trim().isEmpty()) array.put(value.trim());
        return array;
    }
}
