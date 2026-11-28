package com.waze.gw;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Process-local model for settings advertised by a connected HLP device.
 *
 * <p>The device remains the source of truth. Nothing is persisted in the APK: a schema is visible
 * only after the current peer publishes a complete cfg_begin/cfg_item/cfg_end sequence.</p>
 */
final class HudDeviceConfig {
    static final String TOGGLE = "toggle";
    static final String SLIDER = "slider";
    static final String SELECTION = "selection";
    static final String INTEGER = "integer";
    static final String TEXT = "text";
    static final int MAX_ITEMS = 32;
    static final int MAX_OPTIONS = 32;
    static final int MAX_TEXT_LENGTH = 128;

    interface Listener { void onHudDeviceConfigChanged(); }

    static final class Option {
        final String value;
        final String label;

        Option(String value, String label) {
            this.value = value;
            this.label = label;
        }
    }

    static final class Item {
        final String id;
        final String kind;
        final String label;
        final String description;
        final Object value;
        final int min;
        final int max;
        final int step;
        final int maxLength;
        final List<Option> options;

        Item(String id, String kind, String label, String description, Object value,
             int min, int max, int step, int maxLength, List<Option> options) {
            this.id = id;
            this.kind = kind;
            this.label = label;
            this.description = description;
            this.value = value;
            this.min = min;
            this.max = max;
            this.step = step;
            this.maxLength = maxLength;
            this.options = options == null ? Collections.<Option>emptyList()
                    : Collections.unmodifiableList(new ArrayList<Option>(options));
        }

        Item withValue(Object next) {
            return new Item(id, kind, label, description, next, min, max, step, maxLength,
                    options);
        }
    }

    static final class Schema {
        final long revision;
        final String title;
        final List<Item> items;

        Schema(long revision, String title, List<Item> items) {
            this.revision = revision;
            this.title = title;
            this.items = Collections.unmodifiableList(new ArrayList<Item>(items));
        }
    }

    static final class Snapshot {
        static final String IDLE = "idle";
        static final String APPLYING = "applying";
        static final String APPLIED = "applied";
        static final String ERROR = "error";

        final Schema schema;
        final String applyState;
        final String message;
        final long generation;

        Snapshot(Schema schema, String applyState, String message, long generation) {
            this.schema = schema;
            this.applyState = applyState;
            this.message = message == null ? "" : message;
            this.generation = generation;
        }
    }

    /** Per-session atomic schema assembler. */
    static final class Assembler {
        private final long session;
        private long revision = -1L;
        private int expected = -1;
        private String title = I18n.tr("hud_link.hud_device_settings");
        private final LinkedHashMap<String, Item> items = new LinkedHashMap<String, Item>();

        Assembler(long session) { this.session = session; }

        void begin(JSONObject message) throws JSONException {
            long nextRevision = requiredLong(message, "rev");
            int count = message.getInt("count");
            if (count < 0 || count > MAX_ITEMS) throw new JSONException("cfg count out of range");
            revision = nextRevision;
            expected = count;
            title = trim(message.optString("title", I18n.tr("hud_link.hud_device_settings")), 64);
            if (title.length() == 0) title = I18n.tr("hud_link.hud_device_settings");
            items.clear();
        }

        void item(JSONObject message) throws JSONException {
            ensureOpen(message);
            Item item = parseItem(message);
            if (items.containsKey(item.id)) throw new JSONException("duplicate cfg id");
            if (items.size() >= expected) throw new JSONException("too many cfg items");
            items.put(item.id, item);
        }

        void end(JSONObject message) throws JSONException {
            ensureOpen(message);
            if (items.size() != expected) throw new JSONException("incomplete cfg schema");
            publishSchema(session, new Schema(revision, title, new ArrayList<Item>(items.values())));
            revision = -1L;
            expected = -1;
            items.clear();
        }

        private void ensureOpen(JSONObject message) throws JSONException {
            if (expected < 0 || revision < 0) throw new JSONException("cfg schema not started");
            if (requiredLong(message, "rev") != revision) throw new JSONException("cfg rev mismatch");
        }
    }

    private static final CopyOnWriteArrayList<Listener> LISTENERS =
            new CopyOnWriteArrayList<Listener>();
    private static long activeSession;
    private static long generation;
    private static Snapshot snapshot = new Snapshot(null, Snapshot.IDLE, "", 0L);

    private HudDeviceConfig() { }

    static synchronized void beginSession(long session) {
        activeSession = session;
        snapshot = new Snapshot(null, Snapshot.IDLE, "", ++generation);
        notifyListeners();
    }

    static synchronized void endSession(long session) {
        if (activeSession != session) return;
        activeSession = 0L;
        snapshot = new Snapshot(null, Snapshot.IDLE, "", ++generation);
        notifyListeners();
    }

    static synchronized Snapshot snapshot() { return snapshot; }

    static void addListener(Listener listener) {
        if (listener != null) LISTENERS.addIfAbsent(listener);
    }

    static void removeListener(Listener listener) { LISTENERS.remove(listener); }

    static synchronized void applying(long session) {
        if (activeSession != session || snapshot.schema == null) return;
        snapshot = new Snapshot(snapshot.schema, Snapshot.APPLYING, I18n.tr("hud_link.sending_settings"),
                ++generation);
        notifyListeners();
    }

    static synchronized void applyFailed(long session, String message) {
        if (activeSession != session || snapshot.schema == null) return;
        snapshot = new Snapshot(snapshot.schema, Snapshot.ERROR,
                message == null ? I18n.tr("hud_link.the_device_rejected_the_settings") : message, ++generation);
        notifyListeners();
    }

    static synchronized void applyFailedCurrent(String message) {
        if (activeSession == 0L || snapshot.schema == null) return;
        snapshot = new Snapshot(snapshot.schema, Snapshot.ERROR,
                message == null ? I18n.tr("hud_link.couldnt_send_the_settings") : message, ++generation);
        notifyListeners();
    }

    static synchronized void applied(long session, long revision, Map<String, Object> values) {
        if (activeSession != session || snapshot.schema == null) return;
        ArrayList<Item> updated = new ArrayList<Item>();
        for (Item item : snapshot.schema.items) {
            Object value = values != null && values.containsKey(item.id)
                    ? values.get(item.id) : item.value;
            updated.add(item.withValue(value));
        }
        Schema schema = new Schema(revision >= 0 ? revision : snapshot.schema.revision,
                snapshot.schema.title, updated);
        snapshot = new Snapshot(schema, Snapshot.APPLIED, I18n.tr("hud_link.saved_on_the_device"), ++generation);
        notifyListeners();
    }

    private static synchronized void publishSchema(long session, Schema schema) {
        if (activeSession != session) return;
        snapshot = new Snapshot(schema, Snapshot.IDLE, "", ++generation);
        notifyListeners();
    }

    static LinkedHashMap<String, Object> validatedValues(Schema schema,
                                                          Map<String, Object> candidate) {
        if (schema == null || candidate == null) throw new IllegalArgumentException("no schema");
        LinkedHashMap<String, Object> result = new LinkedHashMap<String, Object>();
        for (Item item : schema.items) {
            Object raw = candidate.containsKey(item.id) ? candidate.get(item.id) : item.value;
            result.put(item.id, validateValue(item, raw));
        }
        return result;
    }

    private static Object validateValue(Item item, Object raw) {
        if (TOGGLE.equals(item.kind)) {
            if (raw instanceof Boolean) return raw;
            if (raw instanceof String) return Boolean.valueOf((String) raw);
            throw new IllegalArgumentException(item.id + ": boolean required");
        }
        if (SLIDER.equals(item.kind) || INTEGER.equals(item.kind)) {
            final int value;
            if (raw instanceof Number) value = ((Number) raw).intValue();
            else try { value = Integer.parseInt(String.valueOf(raw)); }
            catch (Throwable error) { throw new IllegalArgumentException(item.id + ": integer required"); }
            if (value < item.min || value > item.max)
                throw new IllegalArgumentException(item.id + ": value out of range");
            if (SLIDER.equals(item.kind) && ((value - item.min) % item.step) != 0)
                throw new IllegalArgumentException(item.id + ": invalid step");
            return Integer.valueOf(value);
        }
        if (SELECTION.equals(item.kind)) {
            String value = String.valueOf(raw == null ? "" : raw);
            for (Option option : item.options) if (option.value.equals(value)) return value;
            throw new IllegalArgumentException(item.id + ": invalid option");
        }
        String value = trim(String.valueOf(raw == null ? "" : raw), item.maxLength);
        return value;
    }

    private static Item parseItem(JSONObject message) throws JSONException {
        String id = message.getString("id");
        if (!id.matches("[A-Za-z0-9_.-]{1,40}")) throw new JSONException("invalid cfg id");
        String kind = message.getString("kind").toLowerCase(java.util.Locale.US);
        if (!TOGGLE.equals(kind) && !SLIDER.equals(kind) && !SELECTION.equals(kind)
                && !INTEGER.equals(kind) && !TEXT.equals(kind))
            throw new JSONException("unsupported cfg kind");
        String label = trim(message.getString("label"), 64);
        if (label.length() == 0) throw new JSONException("empty cfg label");
        String description = trim(message.optString("description", ""), 160);
        int min = message.optInt("min", 0);
        int max = message.optInt("max", 100);
        int step = Math.max(1, message.optInt("step", 1));
        int maxLength = Math.max(1, Math.min(MAX_TEXT_LENGTH,
                message.optInt("maxLength", MAX_TEXT_LENGTH)));
        ArrayList<Option> options = new ArrayList<Option>();
        if (SELECTION.equals(kind)) {
            JSONArray array = message.getJSONArray("options");
            if (array.length() == 0 || array.length() > MAX_OPTIONS)
                throw new JSONException("invalid cfg options");
            for (int i = 0; i < array.length(); i++) {
                JSONObject option = array.getJSONObject(i);
                String value = trim(option.getString("value"), 40);
                String optionLabel = trim(option.getString("label"), 64);
                if (value.length() == 0 || optionLabel.length() == 0)
                    throw new JSONException("empty cfg option");
                options.add(new Option(value, optionLabel));
            }
        }
        if ((SLIDER.equals(kind) || INTEGER.equals(kind)) && min > max)
            throw new JSONException("invalid cfg range");
        Object raw = message.has("value") ? message.get("value") : defaultValue(kind, min, options);
        Item provisional = new Item(id, kind, label, description, raw, min, max, step,
                maxLength, options);
        Object value;
        try { value = validateValue(provisional, raw); }
        catch (IllegalArgumentException error) { throw new JSONException(error.getMessage()); }
        return provisional.withValue(value);
    }

    private static Object defaultValue(String kind, int min, List<Option> options) {
        if (TOGGLE.equals(kind)) return Boolean.FALSE;
        if (SLIDER.equals(kind) || INTEGER.equals(kind)) return Integer.valueOf(min);
        if (SELECTION.equals(kind) && options != null && !options.isEmpty())
            return options.get(0).value;
        return "";
    }

    private static long requiredLong(JSONObject object, String key) throws JSONException {
        if (!object.has(key)) throw new JSONException("missing " + key);
        return object.getLong(key);
    }

    private static String trim(String value, int maxCodePoints) {
        if (value == null) return "";
        String result = value.trim();
        int count = result.codePointCount(0, result.length());
        if (count <= maxCodePoints) return result;
        return result.substring(0, result.offsetByCodePoints(0, maxCodePoints));
    }

    private static void notifyListeners() {
        for (Listener listener : LISTENERS) {
            try { listener.onHudDeviceConfigChanged(); } catch (Throwable ignored) { }
        }
    }
}
