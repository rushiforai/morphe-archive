package app.template.extension.telegram;

import android.content.Context;
import android.content.SharedPreferences;

import app.template.extension.forwarding.ForwardingRule;
import app.template.extension.forwarding.ForwardingRuleStore;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;

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

    /** Portable versioned backup containing all rules, global switches and per-rule counters. */
    public synchronized String exportBackupJson() throws JSONException {
        JSONObject root = new JSONObject();
        root.put("format", "morphe-forwarding-rules");
        root.put("version", 1);
        root.put("createdAt", System.currentTimeMillis());
        root.put("enabled", isEnabled());
        root.put("rules", new JSONArray(preferences.getString("rules", "[]")));
        root.put("rule_stats", new JSONObject(preferences.getString("rule_stats", "{}")));
        return root.toString(2);
    }

    /** Fully validates before a single commit; malformed backups leave existing data unchanged. */
    public synchronized int importBackupJson(String encoded) throws JSONException {
        if (encoded == null || encoded.trim().isEmpty() || encoded.length() > 4 * 1024 * 1024)
            throw new JSONException("Backup is empty or too large");
        JSONObject root = new JSONObject(encoded);
        if (!"morphe-forwarding-rules".equals(root.optString("format")) || root.optInt("version", -1) != 1)
            throw new JSONException("Unsupported backup format or version");
        JSONArray rules = root.optJSONArray("rules");
        if (rules == null) throw new JSONException("Backup has no rules array");
        if (rules.length() > 1000) throw new JSONException("Backup contains too many rules");
        if (!isBoolean(root, "enabled"))
            throw new JSONException("Backup contains invalid global settings");
        Set<String> ids = new LinkedHashSet<>();
        for (int i = 0; i < rules.length(); i++) {
            JSONObject r = rules.optJSONObject(i);
            if (r == null || r.optString("id").trim().isEmpty() || r.optString("name").trim().isEmpty()
                    || r.optJSONArray("sources") == null || r.optJSONArray("sources").length() == 0
                    || r.optJSONArray("destinations") == null || r.optJSONArray("destinations").length() == 0)
                throw new JSONException("Invalid rule at index " + i);
            String id = r.optString("id").trim();
            if (!ids.add(id)) throw new JSONException("Duplicate rule ID at index " + i);
            try {
                JSONArray sourceArray = r.optJSONArray("sources");
                JSONArray destinationArray = r.optJSONArray("destinations");
                if (sourceArray.length() > 500 || destinationArray.length() > 500)
                    throw new IllegalArgumentException("Too many chats in rule");
                Set<Long> sourceIds = readLongs(sourceArray);
                Set<Long> destinationIds = readLongs(destinationArray);
                if (sourceIds.size() != sourceArray.length() || destinationIds.size() != destinationArray.length()
                        || sourceIds.contains(0L) || destinationIds.contains(0L))
                    throw new IllegalArgumentException("Source/destination IDs must be valid, nonzero and unique");
                String match = r.optString("match", "ANY");
                String delivery = r.optString("delivery", "FORWARD");
                if (!("ANY".equals(match) || "ALL".equals(match)))
                    throw new IllegalArgumentException("Unknown keyword match mode");
                if (!("COPY".equals(delivery) || "FORWARD".equals(delivery)))
                    throw new IllegalArgumentException("Unknown delivery mode");
                if (!isBoolean(r, "enabled") || !isBoolean(r, "caseSensitive") || !isBoolean(r, "showSenderName"))
                    throw new IllegalArgumentException("Invalid rule boolean setting");
                JSONArray include = r.optJSONArray("include");
                JSONArray exclude = r.optJSONArray("exclude");
                if ((include != null && include.length() > 200) || (exclude != null && exclude.length() > 200))
                    throw new IllegalArgumentException("Too many keyword filters");
                new ForwardingRule(id, r.optString("name"), r.optBoolean("enabled", true),
                        sourceIds, destinationIds, readStrings(include), readStrings(exclude),
                        "ALL".equals(match) ? ForwardingRule.MatchMode.ALL : ForwardingRule.MatchMode.ANY,
                        r.optBoolean("caseSensitive", false),
                        "COPY".equals(delivery) ? ForwardingRule.DeliveryMode.COPY : ForwardingRule.DeliveryMode.FORWARD,
                        r.optBoolean("showSenderName", false));
            } catch (RuntimeException invalid) { throw new JSONException("Invalid rule at index " + i + ": " + invalid.getMessage()); }
        }
        JSONObject stats = root.optJSONObject("rule_stats");
        JSONObject cleanStats = validateStats(stats, ids);
        SharedPreferences.Editor e = preferences.edit().putString("rules", rules.toString())
                .putBoolean(KEY_ENABLED, root.optBoolean("enabled", false))
                .putString("rule_stats", cleanStats.toString());
        if (!e.commit()) throw new JSONException("Could not save restored rules");
        return rules.length();
    }


    private static boolean isBoolean(JSONObject object, String key) {
        if (object == null || !object.has(key)) return false;
        return object.opt(key) instanceof Boolean;
    }

    /** Keeps only known counters for restored rule IDs and rejects malformed/negative values. */
    private static JSONObject validateStats(JSONObject stats, Set<String> ruleIds) throws JSONException {
        JSONObject clean = new JSONObject();
        if (stats == null) return clean;
        java.util.Iterator<String> keys = stats.keys();
        while (keys.hasNext()) {
            String id = keys.next();
            if (!ruleIds.contains(id)) continue; // stale counters are not imported
            JSONObject values = stats.optJSONObject(id);
            if (values == null) throw new JSONException("Invalid counters for rule " + id);
            JSONObject accepted = new JSONObject();
            java.util.Iterator<String> metrics = values.keys();
            while (metrics.hasNext()) {
                String metric = metrics.next();
                if (!("automation".equals(metric) || "forwardQueued".equals(metric)
                        || "copyQueued".equals(metric) || "forwarded".equals(metric)
                        || "copied".equals(metric) || "failed".equals(metric))) continue;
                Object raw = values.opt(metric);
                if (!(raw instanceof Number)) throw new JSONException("Invalid counter " + metric + " for rule " + id);
                double number = ((Number) raw).doubleValue();
                if (Double.isNaN(number) || Double.isInfinite(number) || number < 0
                        || number > Long.MAX_VALUE || number != Math.rint(number))
                    throw new JSONException("Invalid counter value for rule " + id);
                accepted.put(metric, (long) number);
            }
            clean.put(id, accepted);
        }
        return clean;
    }

    public void setRuntimeStatus(String status) {
        String value = status == null ? "" : status.trim();
        if (value.length() > 220) value = value.substring(0, 220);
        preferences.edit().putString("runtime_status", value).apply();
    }

    public synchronized void recordQueueFailure(String ruleId) {
        increment(ruleId, "failed");
    }

    public String getRuntimeStatus() {
        return preferences.getString("runtime_status", "Waiting for Telegram listener startup");
    }

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
    /** Counts a native forward request accepted by Telegram's local send queue, not server delivery. */
    public synchronized void recordForwardQueued(String ruleId) { increment(ruleId, "forwardQueued"); }
    /** Counts a native copy/send request accepted by Telegram's local send queue, not server delivery. */
    public synchronized void recordCopyQueued(String ruleId) { increment(ruleId, "copyQueued"); }
    /** Reserved for a future server-acknowledged result callback; not incremented on local enqueue. */
    public synchronized void recordForwarded(String ruleId) { increment(ruleId, "forwarded"); }
    public synchronized void recordCopied(String ruleId) { increment(ruleId, "copied"); }

    /** Reset this rule's counters only; rules and statistics for other IDs remain untouched. */
    public synchronized void resetStats(String ruleId) {
        if (ruleId == null || ruleId.trim().isEmpty()) return;
        // Activity and runtime each own a store wrapper; lock the shared preference
        // instance so a counter increment cannot be lost while the user resets it.
        synchronized (preferences) {
            try {
                JSONObject root = new JSONObject(preferences.getString("rule_stats", "{}"));
                root.remove(ruleId);
                preferences.edit().putString("rule_stats", root.toString()).apply();
            } catch (Throwable ignored) { }
        }
    }

    public synchronized long getCount(String ruleId, String metric) {
        synchronized (preferences) {
            try { JSONObject obj = new JSONObject(preferences.getString("rule_stats", "{}")).optJSONObject(ruleId); return obj == null ? 0 : obj.optLong(metric, 0); }
            catch (Throwable ignored) { return 0; }
        }
    }
    private void increment(String ruleId, String metric) {
        synchronized (preferences) {
            try {
                JSONObject root = new JSONObject(preferences.getString("rule_stats", "{}"));
                JSONObject stats = root.optJSONObject(ruleId);
                if (stats == null) stats = new JSONObject();
                stats.put(metric, stats.optLong(metric, 0) + 1);
                root.put(ruleId, stats);
                preferences.edit().putString("rule_stats", root.toString()).apply();
            } catch (Throwable ignored) { }
        }
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
