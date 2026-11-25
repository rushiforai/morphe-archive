package app.template.extension.stayfree;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Persistent state of the local sync server, kept as one JSON file in the app's private storage:
 * <pre>
 * {
 *   "local_install_id": "...",                        // the phone's own StayFree install id
 *   "devices": { "&lt;install id&gt;": { "name": "..." } },
 *   "groups":  { "&lt;key&gt;": { "members": [ids], "config": { GroupConfig JSON } } },
 *   "web":     { "&lt;install id&gt;": { "&lt;domain&gt;": [[timestampSec, durationSec], ...] } },
 *   "web_last_upload": { "&lt;install id&gt;": epochSec }
 * }
 * </pre>
 * Field names inside "config" are the ones the StayFree server returns from {@code sync/config}
 * (Gson {@code LOWER_CASE_WITH_UNDERSCORES} on Android, plain JSON in the extension).
 */
final class LocalSyncStore {
    static final class HttpError extends Exception {
        final int status;

        HttpError(int status, String message) {
            super(message);
            this.status = status;
        }
    }

    private static final long CODE_TTL_MS = 15 * 60 * 1000L;
    private static final int MAX_FAILED_VALIDATIONS = 10;
    private static final long LOCKOUT_MS = 10 * 60 * 1000L;
    private static final long WEB_RETENTION_SEC = 180L * 24 * 60 * 60;

    private static final class PendingCode {
        final String installId;
        final long expiresAtMs;

        PendingCode(String installId, long expiresAtMs) {
            this.installId = installId;
            this.expiresAtMs = expiresAtMs;
        }
    }

    private final File file;
    private final SecureRandom random = new SecureRandom();
    private final Map<String, PendingCode> codes = new HashMap<>();
    private JSONObject state;
    private int failedValidations;
    private long lockoutUntilMs;

    LocalSyncStore(File file) {
        this.file = file;
        this.state = load(file);
    }

    // region Devices

    synchronized void noteLocalInstallId(String installId) {
        if (isBlank(installId) || installId.equals(state.optString("local_install_id"))) return;
        put(state, "local_install_id", installId);
        save();
    }

    synchronized String localInstallId() {
        String id = state.optString("local_install_id", "");
        return id.isEmpty() ? null : id;
    }

    synchronized void registerDevice(String installId, String name) {
        if (isBlank(installId) || isBlank(name)) return;
        JSONObject device = obj(obj(state, "devices"), installId);
        if (name.equals(device.optString("name"))) return;
        put(device, "name", name);
        save();
    }

    synchronized String deviceName(String installId) {
        JSONObject device = obj(state, "devices").optJSONObject(installId);
        return device == null ? null : device.optString("name", null);
    }

    // endregion

    // region Pairing

    synchronized JSONObject generateCode(String installId) throws HttpError {
        if (isBlank(installId)) throw new HttpError(400, "install_id required");
        long now = System.currentTimeMillis();
        pruneCodes(now);
        String code;
        do {
            code = String.format(Locale.US, "%06d", random.nextInt(1_000_000));
        } while (codes.containsKey(code));
        long expiresAt = now + CODE_TTL_MS;
        codes.put(code, new PendingCode(installId, expiresAt));

        JSONObject response = new JSONObject();
        put(response, "code", code);
        put(response, "expiration", expiresAt / 1000);
        return response;
    }

    /**
     * Joins {@code installId} with the device that generated {@code code}. Mirrors the StayFree
     * server: 404 for an unknown/expired code, 403 when both devices already belong to
     * different groups.
     */
    synchronized String validateCode(String installId, String code) throws HttpError {
        if (isBlank(installId) || isBlank(code)) throw new HttpError(400, "install_id and code required");
        long now = System.currentTimeMillis();
        if (now < lockoutUntilMs) throw new HttpError(429, "Too many invalid codes, try again later");
        pruneCodes(now);

        PendingCode pending = codes.get(code.trim());
        if (pending == null || pending.installId.equals(installId)) {
            if (++failedValidations >= MAX_FAILED_VALIDATIONS) {
                // Brute-force guard: a 6-digit code is only safe on a LAN if guesses are capped.
                failedValidations = 0;
                lockoutUntilMs = now + LOCKOUT_MS;
                codes.clear();
            }
            throw new HttpError(404, "Invalid code");
        }

        String generatorGroup = groupOf(pending.installId);
        String joinerGroup = groupOf(installId);
        String key;
        if (generatorGroup != null && joinerGroup != null) {
            if (!generatorGroup.equals(joinerGroup)) throw new HttpError(403, "Both devices already belong to a device group");
            key = generatorGroup;
        } else if (generatorGroup != null) {
            key = generatorGroup;
            addMember(key, installId);
        } else if (joinerGroup != null) {
            key = joinerGroup;
            addMember(key, pending.installId);
        } else {
            key = newGroupKey();
            JSONObject group = obj(obj(state, "groups"), key);
            put(group, "members", new JSONArray());
            put(group, "config", defaultConfig());
            addMember(key, pending.installId);
            addMember(key, installId);
        }

        codes.remove(code.trim());
        failedValidations = 0;
        save();
        return key;
    }

    synchronized String groupOf(String installId) {
        if (isBlank(installId)) return null;
        JSONObject groups = obj(state, "groups");
        Iterator<String> keys = groups.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (members(key).contains(installId)) return key;
        }
        return null;
    }

    synchronized List<String> members(String key) {
        List<String> result = new ArrayList<>();
        JSONObject group = isBlank(key) ? null : obj(state, "groups").optJSONObject(key);
        JSONArray members = group == null ? null : group.optJSONArray("members");
        if (members == null) return result;
        for (int i = 0; i < members.length(); i++) result.add(members.optString(i));
        return result;
    }

    synchronized boolean isMember(String key, String installId) {
        return !isBlank(installId) && members(key).contains(installId);
    }

    synchronized void removeMember(String key, String installId) throws HttpError {
        JSONObject group = isBlank(key) ? null : obj(state, "groups").optJSONObject(key);
        if (group == null) throw new HttpError(404, "Not in a device group");
        JSONArray kept = new JSONArray();
        for (String member : members(key)) if (!member.equals(installId)) kept.put(member);
        if (kept.length() < 2) {
            // A group of one is not a group; the remaining device is unpaired too.
            obj(state, "groups").remove(key);
        } else {
            put(group, "members", kept);
        }
        obj(state, "web").remove(installId);
        obj(state, "web_last_upload").remove(installId);
        save();
    }

    private void addMember(String key, String installId) {
        JSONObject group = obj(obj(state, "groups"), key);
        JSONArray members = group.optJSONArray("members");
        if (members == null) {
            members = new JSONArray();
            put(group, "members", members);
        }
        for (int i = 0; i < members.length(); i++) if (installId.equals(members.optString(i))) return;
        members.put(installId);
    }

    private void pruneCodes(long now) {
        Iterator<Map.Entry<String, PendingCode>> it = codes.entrySet().iterator();
        while (it.hasNext()) if (it.next().getValue().expiresAtMs < now) it.remove();
    }

    private String newGroupKey() {
        byte[] bytes = new byte[16];
        random.nextBytes(bytes);
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) sb.append(String.format(Locale.US, "%02x", b));
        return sb.toString();
    }

    // endregion

    // region Shared group config

    synchronized JSONObject config(String key) throws HttpError {
        JSONObject group = isBlank(key) ? null : obj(state, "groups").optJSONObject(key);
        if (group == null) throw new HttpError(404, "Not in a device group");
        JSONObject config = group.optJSONObject("config");
        if (config == null) {
            config = defaultConfig();
            put(group, "config", config);
        }
        return config;
    }

    /**
     * Applies one {@code sync/config/<op>} write. Body fields are the snake_case names both
     * clients send (Android: Gson LOWER_CASE_WITH_UNDERSCORES of DeviceGroupConfigAdd/Remove).
     */
    synchronized void updateConfig(String op, JSONObject body) throws HttpError {
        JSONObject config = config(body.optString("key"));
        switch (op) {
            case "reset_time":
                put(config, "reset_time", body.optLong("timestamp", config.optLong("reset_time")));
                break;
            case "daily_reset_time":
                if (body.has("hour")) put(config, "daily_reset_time", body.opt("hour"));
                else if (body.has("daily_reset_time")) put(config, "daily_reset_time", body.opt("daily_reset_time"));
                break;
            case "ignore_list/add":
                union(config, "ignored_apps", body.optJSONArray("apps"));
                union(config, "ignored_websites", body.optJSONArray("websites"));
                union(config, "ignored_desktop_apps", body.optJSONArray("desktop_apps"));
                break;
            case "ignore_list/remove":
                subtract(config, "ignored_apps", body.optJSONArray("apps"));
                subtract(config, "ignored_websites", body.optJSONArray("websites"));
                subtract(config, "ignored_desktop_apps", body.optJSONArray("desktop_apps"));
                break;
            case "usage_limit/add":
                upsertById(config, "usage_limits", body.optJSONArray("usage_limits"));
                break;
            case "usage_limit/remove":
                removeById(config, "usage_limits", body.optJSONArray("limit_ids"));
                break;
            case "generic_limit/add":
                upsertById(config, "generic_usage_limits", body.optJSONArray("generic_limits"));
                break;
            case "generic_limit/remove":
                removeById(config, "generic_usage_limits", body.optJSONArray("limit_ids"));
                break;
            case "categories/add":
                upsertById(config, "categories", body.optJSONArray("categories"));
                break;
            case "categories/remove":
                removeById(config, "categories", body.optJSONArray("category_ids"));
                break;
            case "user_category_types/add":
                upsertById(config, "user_category_types", body.optJSONArray("user_category_types"));
                break;
            case "user_category_types/remove":
                removeById(config, "user_category_types", body.optJSONArray("user_category_type_ids"));
                break;
            default:
                throw new HttpError(404, "Unknown config operation " + op);
        }
        save();
    }

    private static JSONObject defaultConfig() {
        JSONObject config = new JSONObject();
        put(config, "reset_time", 0);
        put(config, "ignored_apps", new JSONArray());
        put(config, "ignored_websites", new JSONArray());
        put(config, "ignored_desktop_apps", new JSONArray());
        put(config, "usage_limits", new JSONArray());
        put(config, "generic_usage_limits", new JSONArray());
        put(config, "categories", new JSONArray());
        put(config, "user_category_types", new JSONArray());
        return config;
    }

    private static void union(JSONObject config, String field, JSONArray add) {
        if (add == null) return;
        Set<String> values = strings(config.optJSONArray(field));
        for (int i = 0; i < add.length(); i++) values.add(add.optString(i));
        put(config, field, new JSONArray(values));
    }

    private static void subtract(JSONObject config, String field, JSONArray remove) {
        if (remove == null) return;
        Set<String> values = strings(config.optJSONArray(field));
        for (int i = 0; i < remove.length(); i++) values.remove(remove.optString(i));
        put(config, field, new JSONArray(values));
    }

    private static void upsertById(JSONObject config, String field, JSONArray items) {
        if (items == null) return;
        JSONArray current = config.optJSONArray(field);
        JSONArray result = new JSONArray();
        Set<String> incomingIds = new LinkedHashSet<>();
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.optJSONObject(i);
            if (item != null && item.has("id")) incomingIds.add(item.optString("id"));
        }
        if (current != null) {
            for (int i = 0; i < current.length(); i++) {
                JSONObject item = current.optJSONObject(i);
                if (item == null || !incomingIds.contains(item.optString("id"))) result.put(current.opt(i));
            }
        }
        for (int i = 0; i < items.length(); i++) result.put(items.opt(i));
        put(config, field, result);
    }

    private static void removeById(JSONObject config, String field, JSONArray ids) {
        if (ids == null) return;
        Set<String> remove = strings(ids);
        JSONArray current = config.optJSONArray(field);
        if (current == null) return;
        JSONArray result = new JSONArray();
        for (int i = 0; i < current.length(); i++) {
            JSONObject item = current.optJSONObject(i);
            if (item == null || !remove.contains(item.optString("id"))) result.put(current.opt(i));
        }
        put(config, field, result);
    }

    // endregion

    // region Web sessions uploaded by paired browsers

    /**
     * Stores {@code websites} as sent by the extension's {@code web/upload}:
     * {@code {"example.com": {"sessions": [{"timestamp": sec, "duration": sec}]}}}.
     */
    synchronized void storeWebSessions(String installId, JSONObject websites) {
        JSONObject web = obj(obj(state, "web"), installId);
        long cutoff = System.currentTimeMillis() / 1000 - WEB_RETENTION_SEC;
        Iterator<String> domains = websites.keys();
        while (domains.hasNext()) {
            String domain = domains.next();
            JSONObject entry = websites.optJSONObject(domain);
            JSONArray sessions = entry == null ? null : entry.optJSONArray("sessions");
            if (sessions == null) continue;

            Map<Long, Long> merged = new HashMap<>();
            JSONArray existing = web.optJSONArray(domain);
            if (existing != null) {
                for (int i = 0; i < existing.length(); i++) {
                    JSONArray pair = existing.optJSONArray(i);
                    if (pair != null) merged.put(pair.optLong(0), pair.optLong(1));
                }
            }
            for (int i = 0; i < sessions.length(); i++) {
                JSONObject session = sessions.optJSONObject(i);
                if (session == null) continue;
                long timestamp = session.optLong("timestamp");
                long duration = session.optLong("duration");
                if (timestamp > 0 && duration > 0) merged.put(timestamp, duration);
            }

            JSONArray stored = new JSONArray();
            for (Map.Entry<Long, Long> e : merged.entrySet()) {
                if (e.getKey() < cutoff) continue;
                JSONArray pair = new JSONArray();
                pair.put(e.getKey());
                pair.put(e.getValue());
                stored.put(pair);
            }
            put(web, domain, stored);
        }
        put(obj(state, "web_last_upload"), installId, System.currentTimeMillis() / 1000);
        save();
    }

    synchronized void appendWebSessions(JSONObject out, String installId, long startSec, long endSec, Set<String> appIds) {
        JSONObject web = obj(state, "web").optJSONObject(installId);
        if (web == null) return;
        Iterator<String> domains = web.keys();
        while (domains.hasNext()) {
            String domain = domains.next();
            if (appIds != null && !appIds.contains(domain)) continue;
            JSONArray stored = web.optJSONArray(domain);
            if (stored == null) continue;
            for (int i = 0; i < stored.length(); i++) {
                JSONArray pair = stored.optJSONArray(i);
                if (pair == null) continue;
                long timestamp = pair.optLong(0);
                long duration = pair.optLong(1);
                if (timestamp + duration < startSec || timestamp > endSec) continue;
                addSession(out, domain, timestamp, duration, installId);
            }
        }
    }

    synchronized long lastWebUpload(String installId) {
        return obj(state, "web_last_upload").optLong(installId, 0);
    }

    // endregion

    static void addSession(JSONObject out, String appId, long timestampSec, long durationSec, String installId) {
        JSONObject app = obj(out, appId);
        JSONArray sessions = app.optJSONArray("sessions");
        if (sessions == null) {
            sessions = new JSONArray();
            put(app, "sessions", sessions);
        }
        JSONObject session = new JSONObject();
        put(session, "timestamp", timestampSec);
        put(session, "duration", durationSec);
        put(session, "install_id", installId);
        sessions.put(session);
    }

    // region JSON helpers

    static JSONObject obj(JSONObject parent, String name) {
        JSONObject child = parent.optJSONObject(name);
        if (child == null) {
            child = new JSONObject();
            put(parent, name, child);
        }
        return child;
    }

    static void put(JSONObject target, String name, Object value) {
        try {
            target.put(name, value);
        } catch (JSONException e) {
            throw new IllegalArgumentException(e);
        }
    }

    private static Set<String> strings(JSONArray array) {
        Set<String> values = new LinkedHashSet<>();
        if (array != null) for (int i = 0; i < array.length(); i++) values.add(array.optString(i));
        return values;
    }

    static boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }

    private static JSONObject load(File file) {
        if (!file.exists()) return new JSONObject();
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] data = new byte[(int) file.length()];
            int read = 0;
            while (read < data.length) {
                int n = in.read(data, read, data.length - read);
                if (n < 0) break;
                read += n;
            }
            return new JSONObject(new String(data, 0, read, StandardCharsets.UTF_8));
        } catch (IOException | JSONException e) {
            Log.e(LocalSync.TAG, "Discarding unreadable sync state", e);
            return new JSONObject();
        }
    }

    private void save() {
        File tmp = new File(file.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) {
            out.write(state.toString().getBytes(StandardCharsets.UTF_8));
            out.getFD().sync();
        } catch (IOException e) {
            Log.e(LocalSync.TAG, "Could not save sync state", e);
            return;
        }
        if (!tmp.renameTo(file)) Log.e(LocalSync.TAG, "Could not replace sync state file");
    }

    // endregion
}
