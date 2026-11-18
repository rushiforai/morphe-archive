package app.afterglow.extension.destinations;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import app.afterglow.extension.settings.PropertyList;

/** Local prompt library. The exported schema is the Afterglow iOS AI Home schema. */
public final class AiHomeLibrary {
    public static final int MAX_TEXT = 4000;
    public static final String[] DEFAULT_IDEAS = {
        "Long-form restoration videos with calm narration and no Shorts",
        "Deep dives about space, engineering, and emerging science",
        "Relaxing travel videos focused on local food and quiet places",
        "Thoughtful documentaries about unusual people and forgotten history"
    };
    private final AtomicDocument document, ideasDocument;
    private Map<String, Object> state, ideas;

    public AiHomeLibrary(File directory) {
        document = new AtomicDocument(directory, "history", AiHomeLibrary::validate);
        state = document.read(root());
        ideasDocument = new AtomicDocument(directory, "quick-ideas", value -> {
            if (value.size() != 1 || !(value.get("ideas") instanceof List)) throw new IllegalArgumentException("Invalid quick ideas.");
            List<?> entries = (List<?>) value.get("ideas");
            if (entries.size() > 12) throw new IllegalArgumentException("Use up to 12 quick ideas.");
            for (Object text : entries) if (!(text instanceof String) || !normalize((String) text).equals(text)) throw new IllegalArgumentException("Invalid quick idea.");
        });
        Map<String, Object> defaults = new LinkedHashMap<>();
        defaults.put("ideas", new ArrayList<>(Arrays.asList(DEFAULT_IDEAS)));
        ideas = ideasDocument.read(defaults);
    }

    private static Map<String, Object> root() {
        Map<String, Object> root = new LinkedHashMap<>();
        root.put("schemaVersion", 1L);
        root.put("saved", new ArrayList<>());
        root.put("recent", new ArrayList<>());
        return root;
    }

    public static String normalize(String raw) {
        if (raw == null) throw new IllegalArgumentException("Enter a prompt.");
        String text = raw.replaceAll("[\\s\\p{Z}]+", " ").trim();
        if (text.isEmpty() || text.length() > MAX_TEXT) throw new IllegalArgumentException("Enter a prompt between 1 and 4,000 characters.");
        return text;
    }

    public synchronized List<Map<String, Object>> saved() { return entries(AtomicDocument.copy(state), "saved"); }
    public synchronized List<Map<String, Object>> recent() { return entries(AtomicDocument.copy(state), "recent"); }
    public synchronized List<String> ideas() {
        List<String> copy = new ArrayList<>();
        for (Object value : (List<?>) ideas.get("ideas")) copy.add((String) value);
        return copy;
    }
    public String recoveryMessage() { return document.recoveryMessage(); }

    public synchronized void setIdeas(List<String> values) throws IOException {
        List<String> cleaned = new ArrayList<>();
        for (String value : values) cleaned.add(normalize(value));
        Map<String, Object> next = new LinkedHashMap<>(); next.put("ideas", cleaned);
        ideasDocument.write(next); ideas = next;
    }

    /** Only call after YouTube accepted a native prompt/entry handoff. Copy alone is not a run. */
    public synchronized void recordRun(String raw, long nowMillis) throws IOException {
        String text = normalize(raw);
        Map<String, Object> next = AtomicDocument.copy(state), entry = null;
        for (Map<String, Object> saved : entries(next, "saved")) if (text.equals(saved.get("text"))) { entry = new LinkedHashMap<>(saved); break; }
        if (entry == null) entry = entry(text, "", false, nowMillis);
        entry.put("lastUsedAt", nowMillis / 1000.0);
        List<Map<String, Object>> recent = entries(next, "recent");
        recent.removeIf(row -> text.equals(row.get("text")));
        recent.add(0, entry);
        while (recent.size() > 50) recent.remove(recent.size() - 1);
        commit(next);
    }

    public synchronized void save(String identifier, String raw, String name, boolean favorite, long nowMillis) throws IOException {
        String text = normalize(raw);
        if (name == null || name.length() > 200) throw new IllegalArgumentException("Use a name of up to 200 characters.");
        Map<String, Object> next = AtomicDocument.copy(state);
        List<Map<String, Object>> saved = entries(next, "saved");
        Map<String, Object> entry = entry(text, name.trim(), favorite, nowMillis);
        if (identifier != null) {
            boolean exists = saved.stream().anyMatch(row -> identifier.equals(row.get("identifier")));
            if (!exists) throw new IllegalArgumentException("This saved prompt no longer exists.");
            entry.put("identifier", identifier);
        }
        String id = (String) entry.get("identifier");
        saved.removeIf(row -> id.equals(row.get("identifier")));
        saved.add(0, entry);
        for (Map<String, Object> recent : entries(next, "recent")) {
            if (id.equals(recent.get("identifier")) || text.equals(recent.get("text"))) {
                Object lastUsed = recent.get("lastUsedAt");
                recent.putAll(entry); recent.put("lastUsedAt", lastUsed);
            }
        }
        commit(next);
    }

    public synchronized void delete(String identifier) throws IOException {
        Map<String, Object> next = AtomicDocument.copy(state);
        entries(next, "saved").removeIf(row -> identifier.equals(row.get("identifier")));
        commit(next);
    }
    public synchronized void clearRecent() throws IOException {
        Map<String, Object> next = AtomicDocument.copy(state); next.put("recent", new ArrayList<>()); commit(next);
    }
    public synchronized byte[] exportLibrary() throws IOException { return PropertyList.write(AtomicDocument.copy(state)); }
    public synchronized void importLibrary(byte[] bytes) throws Exception {
        Map<String, Object> imported = AtomicDocument.map(PropertyList.read(bytes));
        validate(imported); commit(AtomicDocument.copy(imported));
    }
    private void commit(Map<String, Object> next) throws IOException { document.write(next); state = next; }

    private static Map<String, Object> entry(String text, String name, boolean favorite, long now) {
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("identifier", UUID.randomUUID().toString()); result.put("text", text);
        result.put("name", name); result.put("favorite", favorite); result.put("lastUsedAt", now / 1000.0);
        return result;
    }
    @SuppressWarnings("unchecked")
    private static List<Map<String, Object>> entries(Map<String, Object> root, String key) { return (List<Map<String, Object>>) root.get(key); }

    private static void validate(Map<String, Object> root) {
        if (!root.keySet().equals(new HashSet<>(Arrays.asList("schemaVersion", "saved", "recent")))
                || !(root.get("schemaVersion") instanceof Number) || ((Number) root.get("schemaVersion")).doubleValue() != 1) throw new IllegalArgumentException("Unsupported prompt library.");
        for (String group : new String[]{"saved", "recent"}) {
            if (!(root.get(group) instanceof List)) throw new IllegalArgumentException("Invalid prompt list.");
            List<?> list = (List<?>) root.get(group);
            if (list.size() > (group.equals("saved") ? 10000 : 50)) throw new IllegalArgumentException("Too many prompts.");
            Set<String> seen = new HashSet<>();
            for (Object value : list) {
                Map<String, Object> row = AtomicDocument.map(value);
                if (!row.keySet().equals(new HashSet<>(Arrays.asList("identifier", "text", "name", "favorite", "lastUsedAt")))) throw new IllegalArgumentException("Invalid prompt fields.");
                Object id = row.get("identifier"), raw = row.get("text"), name = row.get("name"), time = row.get("lastUsedAt");
                if (!(id instanceof String) || ((String) id).isEmpty() || ((String) id).length() > 128
                        || !(raw instanceof String) || !normalize((String) raw).equals(raw)
                        || !(name instanceof String) || ((String) name).length() > 200
                        || !(row.get("favorite") instanceof Boolean) || !(time instanceof Number)
                        || !Double.isFinite(((Number) time).doubleValue())) throw new IllegalArgumentException("Invalid saved prompt.");
                if (!seen.add((String) (group.equals("saved") ? id : raw))) throw new IllegalArgumentException("Duplicate prompt entry.");
            }
        }
    }
}
