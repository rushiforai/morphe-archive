package app.afterglow.extension.destinations;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import app.afterglow.extension.settings.PropertyList;

/** Durable AB Lab profiles. Native server data is observed separately and never rewritten. */
public final class ExperimentStore {
    public static final String[] TYPES = {"Boolean", "Integer", "Double", "String"};
    private final AtomicDocument document, marker;
    private Map<String, Object> state;
    private boolean recoveryRequired;
    private volatile Map<String, Object> effective = Collections.emptyMap();

    public ExperimentStore(File directory) {
        document = new AtomicDocument(directory, "profiles", ExperimentStore::validate);
        marker = new AtomicDocument(directory, "recovery", value -> {
            if (value.size() != 1 || number(value.get("pendingRevision")) < 0) throw new IllegalArgumentException("Invalid recovery marker.");
        });
        state = document.read(defaults());
        Map<String, Object> empty = new LinkedHashMap<>(); empty.put("pendingRevision", 0L);
        long pending = number(marker.read(empty).get("pendingRevision"));
        recoveryRequired = pending > number(state.get("knownGoodRevision"))
                || document.recoveryMessage() != null || marker.recoveryMessage() != null;
        publish();
    }

    private static Map<String, Object> defaults() {
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("schemaVersion", 1L); result.put("revision", 0L);
        result.put("activeProfile", "Default"); result.put("globalBypass", false);
        Map<String, Object> profiles = new LinkedHashMap<>(); profiles.put("Default", profile("Default")); result.put("profiles", profiles);
        result.put("favorites", new ArrayList<>()); result.put("knownGoodRevision", 0L);
        result.put("knownGoodProfile", "Default"); result.put("knownGoodOverrides", new ArrayList<>());
        return result;
    }
    private static Map<String, Object> profile(String name) {
        Map<String, Object> result = new LinkedHashMap<>(); result.put("name", name); result.put("overrides", new ArrayList<>()); return result;
    }

    public synchronized String activeProfile() { return (String) state.get("activeProfile"); }
    public synchronized List<String> profiles() { return new ArrayList<>(AtomicDocument.map(state.get("profiles")).keySet()); }
    public synchronized List<Map<String, Object>> overrides() { return overrides(AtomicDocument.copy(state), activeProfile()); }
    public synchronized List<String> favorites() {
        List<String> result = new ArrayList<>(); for (Object id : (List<?>) state.get("favorites")) result.add((String) id); return result;
    }
    public synchronized boolean bypass() { return (Boolean) state.get("globalBypass"); }
    public synchronized boolean recoveryRequired() { return recoveryRequired; }
    public synchronized boolean pending() { return number(state.get("revision")) > number(state.get("knownGoodRevision")); }
    public synchronized long revision() { return number(state.get("revision")); }
    public String recoveryMessage() { return document.recoveryMessage(); }
    public Object value(String namespace, long flag, int type) { return effective.get(namespace + ":" + type + ":" + flag); }

    public synchronized void create(String name, boolean duplicate) throws IOException {
        name = name(name);
        Map<String, Object> next = AtomicDocument.copy(state), profiles = AtomicDocument.map(next.get("profiles"));
        if (profiles.containsKey(name)) throw new IllegalArgumentException("A profile with that name already exists.");
        Map<String, Object> profile = profile(name);
        if (duplicate) profile.put("overrides", new ArrayList<>(overrides(next, activeProfile())));
        profiles.put(name, profile); commit(next, false);
    }
    public synchronized void rename(String original, String replacement) throws IOException {
        replacement = name(replacement);
        Map<String, Object> next = AtomicDocument.copy(state), profiles = AtomicDocument.map(next.get("profiles"));
        if (!profiles.containsKey(original)) throw new IllegalArgumentException("This profile no longer exists.");
        if (!original.equals(replacement) && profiles.containsKey(replacement)) throw new IllegalArgumentException("A profile with that name already exists.");
        Map<String, Object> profile = AtomicDocument.map(profiles.remove(original)); profile.put("name", replacement); profiles.put(replacement, profile);
        if (original.equals(next.get("activeProfile"))) next.put("activeProfile", replacement);
        commit(next, false);
    }
    public synchronized void delete(String name) throws IOException {
        if (name.equals(activeProfile())) throw new IllegalArgumentException("Activate another profile before deleting this one.");
        Map<String, Object> next = AtomicDocument.copy(state); AtomicDocument.map(next.get("profiles")).remove(name); commit(next, false);
    }
    public synchronized void activate(String name) throws IOException {
        if (!profiles().contains(name)) throw new IllegalArgumentException("This profile no longer exists.");
        if (name.equals(activeProfile())) return;
        Map<String, Object> next = AtomicDocument.copy(state); next.put("activeProfile", name); commit(next, true);
    }
    public synchronized void setOverride(String namespace, long flag, int type, Object value, boolean enabled) throws IOException {
        validateValue(type, value);
        if (flag <= 0) throw new IllegalArgumentException("Use a positive native flag ID.");
        Map<String, Object> next = AtomicDocument.copy(state);
        List<Map<String, Object>> entries = overrides(next, activeProfile());
        entries.removeIf(entry -> namespace.equals(entry.get("package")) && String.valueOf(flag).equals(entry.get("flag")));
        Map<String, Object> entry = new LinkedHashMap<>();
        entry.put("package", namespace); entry.put("flag", String.valueOf(flag)); entry.put("type", (long) type);
        entry.put("value", value); entry.put("enabled", enabled); entries.add(entry); commit(next, true);
    }
    public synchronized void resetFlag(String namespace, long flag) throws IOException {
        Map<String, Object> next = AtomicDocument.copy(state);
        overrides(next, activeProfile()).removeIf(entry -> namespace.equals(entry.get("package")) && String.valueOf(flag).equals(entry.get("flag")));
        commit(next, true);
    }
    public synchronized void resetActive() throws IOException {
        Map<String, Object> next = AtomicDocument.copy(state); overrides(next, activeProfile()).clear(); commit(next, true);
    }
    @SuppressWarnings("unchecked")
    public synchronized void favorite(String namespace, long flag, boolean favorite) throws IOException {
        Map<String, Object> next = AtomicDocument.copy(state); List<String> favorites = (List<String>) next.get("favorites");
        favorites.remove(namespace + ":" + flag); if (favorite) favorites.add(namespace + ":" + flag); commit(next, false);
    }
    public synchronized void setBypass(boolean value) throws IOException {
        Map<String, Object> next = AtomicDocument.copy(state); next.put("globalBypass", value); commit(next, !value);
    }
    public synchronized void retryPending() throws IOException {
        Map<String, Object> next = AtomicDocument.copy(state); next.put("globalBypass", false);
        commit(next, true); recoveryRequired = false; publish();
    }
    public synchronized void restoreKnownGood() throws IOException {
        Map<String, Object> next = AtomicDocument.copy(state);
        String name = (String) next.get("knownGoodProfile");
        Map<String, Object> profile = profile(name); profile.put("overrides", next.get("knownGoodOverrides"));
        AtomicDocument.map(next.get("profiles")).put(name, profile); next.put("activeProfile", name);
        next.put("globalBypass", false); commit(next, true); recoveryRequired = false; publish();
    }
    /** Called only after an uninterrupted 30 seconds in the foreground at this exact revision. */
    public synchronized void markKnownGood(long expectedRevision) throws IOException {
        if (recoveryRequired || bypass() || revision() != expectedRevision || !pending()) return;
        Map<String, Object> next = AtomicDocument.copy(state);
        next.put("knownGoodRevision", revision()); next.put("knownGoodProfile", activeProfile());
        next.put("knownGoodOverrides", new ArrayList<>(overrides(next, activeProfile())));
        commit(next, false); writeMarker(0);
    }
    public synchronized byte[] exportProfile(String name) throws IOException {
        Map<String, Object> profile = AtomicDocument.copy(AtomicDocument.map(AtomicDocument.map(state.get("profiles")).get(name)));
        profile.put("schemaVersion", 1L); return PropertyList.write(profile);
    }
    public synchronized void importProfile(byte[] bytes) throws Exception {
        Map<String, Object> imported = AtomicDocument.map(PropertyList.read(bytes));
        if (imported.size() != 3 || number(imported.get("schemaVersion")) != 1) throw new IllegalArgumentException("Unsupported experiment profile.");
        String name = name((String) imported.get("name"));
        if (profiles().contains(name)) throw new IllegalArgumentException("A profile with that name already exists.");
        imported.remove("schemaVersion"); validateProfile(imported, name);
        Map<String, Object> next = AtomicDocument.copy(state); AtomicDocument.map(next.get("profiles")).put(name, imported); commit(next, false);
    }

    private void commit(Map<String, Object> next, boolean affectsActive) throws IOException {
        validate(next);
        if (affectsActive) {
            next.put("revision", Math.addExact(revision(), 1));
            // Persist the guard before publishing a potentially dangerous configuration.
            writeMarker(number(next.get("revision")));
        }
        document.write(next); state = next; publish();
    }
    private void writeMarker(long revision) throws IOException {
        Map<String, Object> value = new LinkedHashMap<>(); value.put("pendingRevision", revision); marker.write(value);
    }
    private void publish() {
        Map<String, Object> values = new LinkedHashMap<>();
        if (!recoveryRequired && !bypass()) for (Map<String, Object> entry : overrides(state, activeProfile())) {
            if (Boolean.TRUE.equals(entry.get("enabled"))) values.put(entry.get("package") + ":" + number(entry.get("type")) + ":" + entry.get("flag"), entry.get("value"));
        }
        effective = Collections.unmodifiableMap(values);
    }
    @SuppressWarnings("unchecked")
    private static List<Map<String, Object>> overrides(Map<String, Object> root, String name) {
        return (List<Map<String, Object>>) AtomicDocument.map(AtomicDocument.map(root.get("profiles")).get(name)).get("overrides");
    }
    private static String name(String name) {
        if (name == null || name.trim().isEmpty() || name.length() > 80 || name.chars().anyMatch(Character::isISOControl)) throw new IllegalArgumentException("Use a profile name of 1–80 characters without control characters.");
        return name.trim();
    }
    private static long number(Object value) {
        if (!(value instanceof Byte || value instanceof Short || value instanceof Integer || value instanceof Long)) throw new IllegalArgumentException("Expected an integer.");
        return ((Number) value).longValue();
    }
    public static Object parseValue(int type, String value) {
        Object result;
        switch (type) {
            case 0: if (!value.equals("true") && !value.equals("false")) throw new IllegalArgumentException("Use true or false."); result = Boolean.valueOf(value); break;
            case 1: result = Long.valueOf(value); break;
            case 2: result = Double.valueOf(value); break;
            case 3: result = value; break;
            default: throw new IllegalArgumentException("This native value is view-only.");
        }
        validateValue(type, result); return result;
    }
    private static void validateValue(int type, Object value) {
        boolean valid = type == 0 && value instanceof Boolean
                || type == 1 && (value instanceof Long || value instanceof Integer)
                || type == 2 && value instanceof Number && Double.isFinite(((Number) value).doubleValue())
                || type == 3 && value instanceof String && ((String) value).length() <= 16384;
        if (!valid) throw new IllegalArgumentException("Invalid " + (type >= 0 && type < TYPES.length ? TYPES[type] : "native") + " value.");
    }
    private static boolean validNamespace(Object value) {
        return value instanceof String && !((String) value).isEmpty() && ((String) value).length() <= 512 && !((String) value).chars().anyMatch(Character::isISOControl);
    }
    private static void validateProfile(Map<String, Object> profile, String name) {
        if (profile.size() != 2 || !name.equals(profile.get("name")) || !(profile.get("overrides") instanceof List)) throw new IllegalArgumentException("Invalid experiment profile.");
        List<?> entries = (List<?>) profile.get("overrides");
        if (entries.size() > 10000) throw new IllegalArgumentException("Too many overrides.");
        HashSet<String> seen = new HashSet<>();
        for (Object raw : entries) {
            Map<String, Object> entry = AtomicDocument.map(raw);
            if (entry.size() != 5 || !validNamespace(entry.get("package")) || !(entry.get("flag") instanceof String)
                    || !(entry.get("enabled") instanceof Boolean)) throw new IllegalArgumentException("This profile contains unsupported native flags.");
            long id = Long.parseLong((String) entry.get("flag"));
            if (id <= 0 || !seen.add(entry.get("package") + ":" + id)) throw new IllegalArgumentException("Invalid or duplicate native flag ID.");
            validateValue(Math.toIntExact(number(entry.get("type"))), entry.get("value"));
        }
    }
    private static void validate(Map<String, Object> root) {
        if (root.size() != 9 || number(root.get("schemaVersion")) != 1 || number(root.get("revision")) < 0
                || number(root.get("knownGoodRevision")) < 0 || !(root.get("globalBypass") instanceof Boolean)
                || !(root.get("favorites") instanceof List) || !(root.get("knownGoodOverrides") instanceof List)) throw new IllegalArgumentException("Invalid experiment library.");
        Map<String, Object> profiles = AtomicDocument.map(root.get("profiles"));
        if (profiles.isEmpty() || profiles.size() > 1000 || !profiles.containsKey(root.get("activeProfile"))) throw new IllegalArgumentException("Invalid active profile.");
        for (Map.Entry<String, Object> entry : profiles.entrySet()) validateProfile(AtomicDocument.map(entry.getValue()), name(entry.getKey()));
        for (Object flag : (List<?>) root.get("favorites")) if (!(flag instanceof String) || ((String) flag).length() > 550 || !((String) flag).matches(".+:[0-9]+")) throw new IllegalArgumentException("Invalid favorite.");
        Map<String, Object> known = profile(name((String) root.get("knownGoodProfile"))); known.put("overrides", root.get("knownGoodOverrides")); validateProfile(known, (String) known.get("name"));
    }
}
