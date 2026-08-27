package app.morphe.extension.discord.bunny.recovery;

import android.util.Base64;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.LinkedHashSet;
import java.util.Set;

/** Versioned, deterministic and non-executable Bunny configuration backup. */
final class BunnyBackup {
    static final String FORMAT = "bunny-backup";
    static final int SCHEMA_VERSION = 1;
    static final long MAX_IMPORT_BYTES = 384L * 1024L * 1024L;
    static final long MAX_PORTABLE_BYTES = 256L * 1024L * 1024L;
    static final long MAX_ENTRY_BYTES = 64L * 1024L * 1024L;

    /*
     * Keep portable modern-plugin payloads aligned with Recovery's existing
     * PluginRollbackManager component bound.
     */
    private static final long MAX_PLUGIN_PAYLOAD_BYTES = 16L * 1024L * 1024L;
    private static final long MAX_PLUGIN_PROVENANCE_BYTES = 4L * 1024L * 1024L;
    static final String CATEGORY_SETTINGS = "settings";
    static final String CATEGORY_PLUGINS = "plugins";
    static final String CATEGORY_THEMES = "themes";
    static final String CATEGORY_FONTS = "fonts";
    private static final Set<String> ALL_CATEGORIES = Collections.unmodifiableSet(
            new LinkedHashSet<>(Arrays.asList(
                    CATEGORY_SETTINGS,
                    CATEGORY_PLUGINS,
                    CATEGORY_THEMES,
                    CATEGORY_FONTS
            ))
    );

    private static final List<String> EXACT_FILES = Arrays.asList(
            "loader.json", "fonts.json", "current-theme.json",
            "bunny-theme-creator-colors.json", "plugins/settings.json", "plugins/repositories.json",
            "plugins/provenance.json", "themes/colors/preferences.json"
    );
    private static final List<String> PORTABLE_ROOTS = Arrays.asList(
            "vd_mmkv/", "plugins/storage/", "downloads/fonts/",
            "downloads/backgrounds/"
    );

    static JSONObject create(File bunnyRoot, String bunnyVersion) throws Exception {
        return create(bunnyRoot, bunnyVersion, ALL_CATEGORIES);
    }

    static JSONObject create(File bunnyRoot, String bunnyVersion, Set<String> requestedCategories) throws Exception {
        Set<String> selected = normalizeCategories(requestedCategories);
        List<Entry> entries = collect(bunnyRoot, selected);
        JSONArray serialized = new JSONArray();
        long total = 0L;
        for (Entry entry : entries) {
            total += entry.data.length;
            requirePortableSize(total);
            JSONObject item = new JSONObject();
            item.put("path", entry.path);
            item.put("encoding", entry.json ? "utf8-json" : "base64");
            item.put("sha256", sha256(entry.data));
            item.put("data", entry.json
                    ? new String(entry.data, StandardCharsets.UTF_8)
                    : Base64.encodeToString(entry.data, Base64.NO_WRAP));
            serialized.put(item);
        }

        JSONObject contents = new JSONObject();
        contents.put("entries", serialized);
        contents.put("categories", categories(entries));
        contents.put("selectedCategories", new JSONArray(selected));
        JSONObject root = new JSONObject();
        root.put("format", FORMAT);
        root.put("schemaVersion", SCHEMA_VERSION);
        root.put("createdAt", System.currentTimeMillis());
        root.put("createdWithBunnyVersion", bunnyVersion == null ? "unknown" : bunnyVersion);
        root.put("contents", contents);
        return root;
    }

    static Validated validateAndMigrate(byte[] bytes) throws Exception {
        if (bytes == null || bytes.length == 0) {
            throw new IOException("Backup is empty");
        }
        requireImportSize(bytes.length);
        JSONObject root = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
        if (!FORMAT.equals(root.optString("format"))) throw new IOException("Not a Bunny backup");
        int version = root.optInt("schemaVersion", -1);
        root = BackupMigrations.migrate(root, version);
        JSONObject contents = root.optJSONObject("contents");
        JSONArray items = contents == null ? null : contents.optJSONArray("entries");
        if (items == null) throw new IOException("Backup contents are missing");

        List<Entry> entries = new ArrayList<>();
        long total = 0L;
        String previous = null;
        for (int index = 0; index < items.length(); index++) {
            JSONObject item = items.optJSONObject(index);
            if (item == null) throw new IOException("Malformed backup entry");
            String path = normalizePath(item.optString("path", ""));
            if (!isAllowedPath(path)) throw new IOException("Unsupported backup path: " + path);
            if (previous != null && previous.compareTo(path) >= 0) {
                throw new IOException("Backup entries are duplicated or not deterministic");
            }
            previous = path;
            String encoding = item.optString("encoding", "");
            byte[] data;
            boolean json;
            if ("utf8-json".equals(encoding)) {
                json = true;
                Object parsed = new org.json.JSONTokener(item.optString("data", "")).nextValue();
                if (!(parsed instanceof JSONObject) && !(parsed instanceof JSONArray)) {
                    throw new IOException("Expected JSON object or array at " + path);
                }
                data = canonicalJson(parsed).getBytes(StandardCharsets.UTF_8);
            } else if ("base64".equals(encoding)) {
                json = false;
                data = Base64.decode(item.optString("data", ""), Base64.DEFAULT);
            } else {
                throw new IOException("Unsupported encoding at " + path);
            }
            if (data.length > MAX_ENTRY_BYTES) throw new IOException("Backup entry is too large: " + path);
            if (!json) validatePortableBinary(path, data);
            total += data.length;
            requirePortableSize(total);
            if (!sha256(data).equalsIgnoreCase(item.optString("sha256", ""))) {
                throw new IOException("Checksum mismatch at " + path);
            }
            entries.add(new Entry(path, data, json));
        }
        validateLocalPluginPayloadSet(entries);
        return new Validated(root, entries);
    }

    private static List<Entry> collect(File root, Set<String> selected) throws Exception {
        List<File> files = new ArrayList<>();
        for (String relative : EXACT_FILES) addIfFile(new File(root, relative), files);
        for (String relative : PORTABLE_ROOTS) collectFiles(new File(root, relative), files);

        /*
         * Local modern plugins are executable payloads, so enumerate them
         * deliberately rather than making all plugins/manifests and
         * plugins/scripts content portable.
         */
        collectInstalledLocalPluginPayloads(root, files);

        List<Entry> entries = new ArrayList<>();
        String rootPath = root.getCanonicalPath() + File.separator;
        for (File file : files) {
            String canonical = file.getCanonicalPath();
            if (!canonical.startsWith(rootPath)) throw new IOException("Backup path escaped Bunny storage");
            String path = normalizePath(canonical.substring(rootPath.length()));
            if (!isAllowedPath(path)) continue;
            if (!selected.contains(categoryForPath(path))) continue;
            byte[] data = readBounded(file);
            boolean json = isJsonPath(path);
            if (json) {
                Object parsed = new org.json.JSONTokener(new String(data, StandardCharsets.UTF_8)).nextValue();
                parsed = sanitize(parsed, "");
                data = canonicalJson(parsed).getBytes(StandardCharsets.UTF_8);
            }
            entries.add(new Entry(path, data, json));
        }
        Collections.sort(entries, Comparator.comparing(value -> value.path));
        return entries;
    }

    private static Object sanitize(Object value, String parent) throws JSONException {
        if (value instanceof JSONObject) {
            JSONObject input = (JSONObject) value;
            JSONObject output = new JSONObject();
            List<String> keys = new ArrayList<>();
            Iterator<String> iterator = input.keys();
            while (iterator.hasNext()) keys.add(iterator.next());
            Collections.sort(keys);
            for (String key : keys) {
                String lower = key.toLowerCase(Locale.ROOT);
                if (lower.equals("js") || lower.equals("script") || lower.equals("code") || lower.equals("hash")
                        || lower.contains("password") || lower.contains("discordtoken")
                        || lower.equals("token") || lower.contains("session")
                        || lower.contains("authorization") || lower.contains("cookie")
                        || lower.equals("email") || lower.equals("messages")
                        || lower.equals("privateMessages".toLowerCase(Locale.ROOT))) continue;
                output.put(key, sanitize(input.opt(key), key));
            }
            return output;
        }
        if (value instanceof JSONArray) {
            JSONArray input = (JSONArray) value;
            JSONArray output = new JSONArray();
            for (int i = 0; i < input.length(); i++) output.put(sanitize(input.opt(i), parent));
            return output;
        }
        if (value instanceof String) {
            String text = (String) value;
            if (text.startsWith("mfa.")
                    || text.matches("[A-Za-z0-9_-]{20,}\\.[A-Za-z0-9_-]{5,}\\.[A-Za-z0-9_-]{20,}")) {
                return "[redacted-secret]";
            }
            return text.replaceAll(
                    "(?i)([?&](?:token|auth|authorization|session|password|cookie)=)[^&#]*",
                    "$1[redacted]"
            );
        }
        return value == null ? JSONObject.NULL : value;
    }

    private static String canonicalJson(Object value) throws JSONException {
        Object sanitized = sanitize(value, "");
        return sanitized instanceof JSONObject
                ? ((JSONObject) sanitized).toString()
                : ((JSONArray) sanitized).toString();
    }

    private static JSONObject categories(List<Entry> entries) throws JSONException {
        JSONObject result = new JSONObject();
        for (Entry entry : entries) {
            String category = categoryForPath(entry.path);
            result.put(category, result.optInt(category, 0) + 1);
        }
        return result;
    }

    static Set<String> parseCategories(String value) throws IOException {
        if (value == null || value.trim().isEmpty() || "all".equalsIgnoreCase(value.trim())) {
            return ALL_CATEGORIES;
        }
        LinkedHashSet<String> selected = new LinkedHashSet<>();
        for (String part : value.split(",")) {
            String category = part.trim().toLowerCase(Locale.ROOT);
            if (!ALL_CATEGORIES.contains(category)) {
                throw new IOException("Unsupported backup category: " + category);
            }
            selected.add(category);
        }
        if (selected.isEmpty()) throw new IOException("Choose at least one backup category");
        return Collections.unmodifiableSet(selected);
    }

    static Set<String> allCategories() {
        return ALL_CATEGORIES;
    }

    static void requirePortableSize(long bytes) throws IOException {
        if (bytes > MAX_PORTABLE_BYTES) {
            throw new IOException("Portable Bunny data exceeds 256 MB");
        }
    }

    static void requireImportSize(long bytes) throws IOException {
        if (bytes > MAX_IMPORT_BYTES) {
            throw new IOException("Backup exceeds 384 MB");
        }
    }

    private static Set<String> normalizeCategories(Set<String> requested) throws IOException {
        if (requested == null || requested.isEmpty()) throw new IOException("Choose at least one backup category");
        LinkedHashSet<String> selected = new LinkedHashSet<>();
        for (String category : ALL_CATEGORIES) {
            if (requested.contains(category)) selected.add(category);
        }
        if (selected.size() != requested.size()) throw new IOException("Unsupported backup category selection");
        return Collections.unmodifiableSet(selected);
    }

    private static String categoryForPath(String path) {
        String upper = path.toUpperCase(Locale.ROOT);
        if (path.startsWith("plugins/") || upper.contains("VENDETTA_PLUGIN")) return CATEGORY_PLUGINS;
        if (path.equals("fonts.json") || path.startsWith("downloads/fonts/") || upper.contains("FONT")) {
            return CATEGORY_FONTS;
        }
        if (path.equals("current-theme.json")
                || path.equals("bunny-theme-creator-colors.json")
                || path.startsWith("themes/")
                || path.startsWith("downloads/backgrounds/")
                || upper.contains("THEME")) {
            return CATEGORY_THEMES;
        }
        return CATEGORY_SETTINGS;
    }

    private static boolean isAllowedPath(String path) {
        if (EXACT_FILES.contains(path)) return true;
        if (isPortableLocalPluginPayloadPath(path)) return true;
        for (String root : PORTABLE_ROOTS) if (path.startsWith(root)) return true;
        return false;
    }

    private static boolean isJsonPath(String path) {
        /*
         * Preserve executable/plugin identity bytes exactly.
         *
         * provenance.json is also handled as bounded raw bytes because its
         * top-level keys are semantic plugin IDs; the generic JSON sanitizer
         * intentionally filters credential-looking key names and must not
         * reinterpret a legitimate plugin ID.
         */
        return !path.startsWith("downloads/")
                && !path.equals("plugins/provenance.json")
                && !path.startsWith("plugins/manifests/")
                && !path.startsWith("plugins/scripts/");
    }

    private static void validatePortableBinary(String path, byte[] data) throws IOException {
        if (path.equals("plugins/provenance.json")) {
            validatePluginProvenance(data);
        } else if (path.startsWith("plugins/manifests/")) {
            validatePortableLocalPluginManifest(path, data);
        } else if (path.startsWith("plugins/scripts/")) {
            validatePortableLocalPluginScript(path, data);
        } else if (path.startsWith("downloads/fonts/")) {
            boolean ttf = data.length >= 4 && data[0] == 0 && data[1] == 1 && data[2] == 0 && data[3] == 0;
            boolean otto = startsWith(data, new byte[]{'O', 'T', 'T', 'O'});
            boolean collection = startsWith(data, new byte[]{'t', 't', 'c', 'f'});
            if (!ttf && !otto && !collection) throw new IOException("Invalid portable font: " + path);
        } else if (path.startsWith("downloads/backgrounds/")) {
            boolean png = startsWith(data, new byte[]{(byte) 0x89, 'P', 'N', 'G'});
            boolean jpeg = data.length >= 3 && data[0] == (byte) 0xff && data[1] == (byte) 0xd8 && data[2] == (byte) 0xff;
            boolean gif = startsWith(data, new byte[]{'G', 'I', 'F', '8'});
            boolean webp = data.length >= 12 && startsWith(data, new byte[]{'R', 'I', 'F', 'F'})
                    && data[8] == 'W' && data[9] == 'E' && data[10] == 'B' && data[11] == 'P';
            if (!png && !jpeg && !gif && !webp) throw new IOException("Invalid portable background: " + path);
        }
    }

    private static void collectInstalledLocalPluginPayloads(
            File root,
            List<File> output
    ) throws Exception {
        File settingsFile = new File(root, "plugins/settings.json");

        if (!settingsFile.isFile()) {
            return;
        }

        JSONObject settings =
                new JSONObject(
                        new String(
                                readBounded(settingsFile),
                                StandardCharsets.UTF_8
                        )
                );

        File manifestsDirectory =
                new File(
                        root,
                        "plugins/manifests"
                );

        File[] manifests =
                manifestsDirectory.listFiles();

        if (manifests == null) {
            return;
        }

        Arrays.sort(
                manifests,
                Comparator.comparing(File::getName)
        );

        for (File manifestFile : manifests) {
            if (
                    !manifestFile.isFile()
                            || !manifestFile.getName().endsWith(".json")
                            || manifestFile.length() <= 0
                            || manifestFile.length() > MAX_PLUGIN_PAYLOAD_BYTES
            ) {
                continue;
            }

            byte[] manifestBytes =
                    readBounded(manifestFile);

            final JSONObject manifest;

            try {
                manifest =
                        new JSONObject(
                                new String(
                                        manifestBytes,
                                        StandardCharsets.UTF_8
                                )
                        );
            } catch (Throwable error) {
                continue;
            }

            if (!manifest.optBoolean("__bunnyLocal", false)) {
                continue;
            }

            String id =
                    manifest.optString(
                            "id",
                            ""
                    );

            if (
                    !isSafePluginId(id)
                            || !manifestFile.getName().equals(id + ".json")
            ) {
                throw new IOException(
                        "Installed local plugin has an invalid manifest identity"
                );
            }

            if (
                    !settings.has(id)
                            || settings.isNull(id)
            ) {
                /*
                 * Ignore inert/stale committed payloads that are not installed.
                 */
                continue;
            }

            validatePortableLocalPluginManifest(
                    "plugins/manifests/" + id + ".json",
                    manifestBytes
            );

            File scriptFile =
                    new File(
                            root,
                            "plugins/scripts/" + id + ".js"
                    );

            if (
                    !scriptFile.isFile()
                            || scriptFile.length() <= 0
                            || scriptFile.length() > MAX_PLUGIN_PAYLOAD_BYTES
            ) {
                throw new IOException(
                        "Installed local plugin payload is incomplete: " + id
                );
            }

            /*
             * Preserve exact manifest/script bytes. addIfFile's global
             * MAX_ENTRY_BYTES gate remains an additional bound.
             */
            addIfFile(
                    manifestFile,
                    output
            );

            addIfFile(
                    scriptFile,
                    output
            );
        }
    }

    private static boolean isPortableLocalPluginPayloadPath(
            String path
    ) {
        if (
                path.startsWith("plugins/manifests/")
                        && path.endsWith(".json")
        ) {
            String id =
                    path.substring(
                            "plugins/manifests/".length(),
                            path.length() - ".json".length()
                    );

            return isSafePluginId(id);
        }

        if (
                path.startsWith("plugins/scripts/")
                        && path.endsWith(".js")
        ) {
            String id =
                    path.substring(
                            "plugins/scripts/".length(),
                            path.length() - ".js".length()
                    );

            return isSafePluginId(id);
        }

        return false;
    }

    private static boolean isSafePluginId(
            String id
    ) {
        return id != null
                && !id.isEmpty()
                && !".".equals(id)
                && !"..".equals(id)
                && id.indexOf('/') < 0
                && id.indexOf('\\') < 0
                && id.indexOf('\u0000') < 0;
    }

    private static String localPluginIdFromPayloadPath(
            String path
    ) throws IOException {
        if (
                path.startsWith("plugins/manifests/")
                        && path.endsWith(".json")
        ) {
            String id =
                    path.substring(
                            "plugins/manifests/".length(),
                            path.length() - ".json".length()
                    );

            if (isSafePluginId(id)) {
                return id;
            }
        }

        if (
                path.startsWith("plugins/scripts/")
                        && path.endsWith(".js")
        ) {
            String id =
                    path.substring(
                            "plugins/scripts/".length(),
                            path.length() - ".js".length()
                    );

            if (isSafePluginId(id)) {
                return id;
            }
        }

        throw new IOException(
                "Invalid local plugin backup path: " + path
        );
    }

    private static void validatePortableLocalPluginManifest(
            String path,
            byte[] data
    ) throws IOException {
        if (
                data.length <= 0
                        || data.length > MAX_PLUGIN_PAYLOAD_BYTES
        ) {
            throw new IOException(
                    "Portable local plugin manifest is too large: " + path
            );
        }

        String id =
                localPluginIdFromPayloadPath(path);

        final JSONObject manifest;

        try {
            manifest =
                    new JSONObject(
                            new String(
                                    data,
                                    StandardCharsets.UTF_8
                            )
                    );
        } catch (Throwable error) {
            throw new IOException(
                    "Portable local plugin manifest is malformed: " + path,
                    error
            );
        }

        if (
                !manifest.optBoolean("__bunnyLocal", false)
                        || !id.equals(manifest.optString("id", ""))
                        || manifest.optInt("spec", -1) != 3
                        || !"plugin".equals(manifest.optString("type", ""))
                        || manifest.optString("version", "").isEmpty()
                        || manifest.optString("main", "").isEmpty()
        ) {
            throw new IOException(
                    "Portable local plugin manifest is invalid: " + path
            );
        }

        if (manifest.has("parentRepository")) {
            throw new IOException(
                    "Portable local plugin must not become repository-backed: " + id
            );
        }

        String expectedScript =
                "plugins/scripts/" + id + ".js";

        if (
                !expectedScript.equals(
                        manifest.optString(
                                "jsPath",
                                ""
                        )
                )
        ) {
            throw new IOException(
                    "Portable local plugin script path is invalid: " + id
            );
        }
    }

    private static void validatePortableLocalPluginScript(
            String path,
            byte[] data
    ) throws IOException {
        localPluginIdFromPayloadPath(path);

        if (
                data.length <= 0
                        || data.length > MAX_PLUGIN_PAYLOAD_BYTES
        ) {
            throw new IOException(
                    "Portable local plugin script is too large: " + path
            );
        }

        /*
         * Ensure restored scripts are valid UTF-8 text without executing or
         * evaluating them.
         */
        try {
            StandardCharsets.UTF_8
                    .newDecoder()
                    .onMalformedInput(
                            java.nio.charset.CodingErrorAction.REPORT
                    )
                    .onUnmappableCharacter(
                            java.nio.charset.CodingErrorAction.REPORT
                    )
                    .decode(
                            java.nio.ByteBuffer.wrap(data)
                    );
        } catch (java.nio.charset.CharacterCodingException error) {
            throw new IOException(
                    "Portable local plugin script is not valid UTF-8: " + path,
                    error
            );
        }
    }

    private static void validatePluginProvenance(
            byte[] data
    ) throws IOException {
        if (data.length > MAX_PLUGIN_PROVENANCE_BYTES) {
            throw new IOException(
                    "Plugin provenance exceeds Bunny's portable size limit"
            );
        }

        final JSONObject root;

        try {
            root =
                    new JSONObject(
                            new String(
                                    data,
                                    StandardCharsets.UTF_8
                            )
                    );
        } catch (Throwable error) {
            throw new IOException(
                    "Plugin provenance is malformed",
                    error
            );
        }

        Iterator<String> ids =
                root.keys();

        while (ids.hasNext()) {
            String id =
                    ids.next();

            if (!isSafePluginId(id)) {
                throw new IOException(
                        "Plugin provenance contains an invalid plugin ID"
                );
            }

            JSONObject entry =
                    root.optJSONObject(id);

            if (entry == null) {
                throw new IOException(
                        "Plugin provenance entry is malformed: " + id
                );
            }

            JSONObject installedFrom =
                    entry.optJSONObject(
                            "installedFrom"
                    );

            if (
                    installedFrom == null
                            || !"local-file".equals(
                                    installedFrom.optString(
                                            "kind",
                                            ""
                                    )
                            )
            ) {
                throw new IOException(
                        "Plugin provenance has an unsupported install source: " + id
                );
            }

            if (
                    entry.has("updateSource")
                            && !entry.isNull("updateSource")
            ) {
                throw new IOException(
                        "Local plugin provenance must not invent an update source: " + id
                );
            }

            if (
                    entry.has("repository")
                            && !entry.isNull("repository")
            ) {
                String repository =
                        entry.optString(
                                "repository",
                                ""
                        );

                try {
                    java.net.URI uri =
                            java.net.URI.create(
                                    repository
                            );

                    if (
                            !"https".equalsIgnoreCase(
                                    uri.getScheme()
                            )
                                    || uri.getHost() == null
                                    || uri.getHost().isEmpty()
                                    || uri.getUserInfo() != null
                    ) {
                        throw new IllegalArgumentException();
                    }
                } catch (Throwable error) {
                    throw new IOException(
                            "Plugin provenance repository is not safe HTTPS: " + id
                    );
                }
            }
        }
    }

    private static void validateLocalPluginPayloadSet(
            List<Entry> entries
    ) throws IOException {
        java.util.HashSet<String> manifests =
                new java.util.HashSet<>();

        java.util.HashSet<String> scripts =
                new java.util.HashSet<>();

        for (Entry entry : entries) {
            if (
                    entry.path.startsWith("plugins/manifests/")
                            && entry.path.endsWith(".json")
            ) {
                manifests.add(
                        localPluginIdFromPayloadPath(
                                entry.path
                        )
                );
            } else if (
                    entry.path.startsWith("plugins/scripts/")
                            && entry.path.endsWith(".js")
            ) {
                scripts.add(
                        localPluginIdFromPayloadPath(
                                entry.path
                        )
                );
            }
        }

        if (!manifests.equals(scripts)) {
            throw new IOException(
                    "Portable local plugin manifest/script pairs are incomplete"
            );
        }
    }
    private static boolean startsWith(byte[] data, byte[] prefix) {
        if (data.length < prefix.length) return false;
        for (int index = 0; index < prefix.length; index++) if (data[index] != prefix[index]) return false;
        return true;
    }

    private static String normalizePath(String path) throws IOException {
        String value = path.replace('\\', '/');
        if (value.startsWith("/") || value.contains("../") || value.equals("..") || value.contains("\u0000")) {
            throw new IOException("Unsafe backup path");
        }
        return value;
    }

    private static void collectFiles(File directory, List<File> output) {
        File[] children = directory.listFiles();
        if (children == null) return;
        Arrays.sort(children, Comparator.comparing(File::getName));
        for (File child : children) {
            if (child.isDirectory()) collectFiles(child, output);
            else addIfFile(child, output);
        }
    }

    private static void addIfFile(File file, List<File> output) {
        if (file.isFile() && file.length() <= MAX_ENTRY_BYTES) output.add(file);
    }

    private static byte[] readBounded(File file) throws IOException {
        if (file.length() > MAX_ENTRY_BYTES) throw new IOException("File is too large: " + file);
        ByteArrayOutputStream output = new ByteArrayOutputStream((int) file.length());
        try (FileInputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[16 * 1024];
            int count;
            while ((count = input.read(buffer)) != -1) {
                output.write(buffer, 0, count);
                if (output.size() > MAX_ENTRY_BYTES) throw new IOException("File grew while backing up: " + file);
            }
        }
        return output.toByteArray();
    }

    private static String sha256(byte[] data) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(data);
        StringBuilder value = new StringBuilder(digest.length * 2);
        for (byte item : digest) value.append(String.format(Locale.ROOT, "%02x", item & 0xff));
        return value.toString();
    }

    static final class Entry {
        final String path;
        final byte[] data;
        final boolean json;
        Entry(String path, byte[] data, boolean json) { this.path = path; this.data = data; this.json = json; }
    }

    static final class Validated {
        final JSONObject root;
        final List<Entry> entries;
        Validated(JSONObject root, List<Entry> entries) { this.root = root; this.entries = entries; }
        JSONObject categories() { return root.optJSONObject("contents").optJSONObject("categories"); }
    }
}
