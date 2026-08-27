package app.morphe.extension.discord.bunny.plugins;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;

/**
 * Parser for Bunny's single-file local plugin transport.
 *
 * <p>The transport does not define a new plugin execution format. It carries
 * Bunny's existing spec-3 manifest and compiled index.js together so Android's
 * document picker can return one content URI.</p>
 *
 * <p>Parsing and validation never execute the supplied script.</p>
 */
public final class LocalPluginPackage {
    public static final String FILE_EXTENSION = ".bunnyplugin";
    public static final String FORMAT = "bunny-plugin";
    public static final int FORMAT_VERSION = 1;

    private final String id;
    private final String manifestJson;
    private final String script;
    private final String projectRepository;

    private LocalPluginPackage(
            String id,
            String manifestJson,
            String script,
            String projectRepository
    ) {
        this.id = id;
        this.manifestJson = manifestJson;
        this.script = script;
        this.projectRepository = projectRepository;
    }

    public String id() {
        return id;
    }

    public String manifestJson() {
        return manifestJson;
    }

    public String script() {
        return script;
    }

    /**
     * Optional project/source repository supplied for provenance display only.
     *
     * <p>This value is deliberately not an update source.</p>
     */
    public String projectRepository() {
        return projectRepository;
    }

    public static LocalPluginPackage parse(byte[] bytes) {
        if (bytes == null || bytes.length == 0) {
            throw invalid("Plugin package is empty");
        }

        final JSONObject root;

        try {
            root = new JSONObject(
                    new String(bytes, StandardCharsets.UTF_8)
            );
        } catch (JSONException error) {
            throw invalid("Plugin package is not valid JSON", error);
        }

        if (!FORMAT.equals(optionalString(root, "format"))) {
            throw invalid("Unsupported Bunny plugin package format");
        }

        Object formatVersion = root.opt("formatVersion");

        if (
                !(formatVersion instanceof Number)
                || ((Number) formatVersion).intValue() != FORMAT_VERSION
        ) {
            throw invalid(
                    "Unsupported Bunny plugin package version"
            );
        }

        Object manifestValue = root.opt("manifest");

        if (!(manifestValue instanceof JSONObject)) {
            throw invalid(
                    "Plugin package does not contain a manifest object"
            );
        }

        JSONObject manifest = (JSONObject) manifestValue;

        String id = requiredString(manifest, "id");
        validateStableId(id);

        Object spec = manifest.opt("spec");

        if (
                !(spec instanceof Number)
                || ((Number) spec).intValue() != 3
        ) {
            throw invalid(
                    "Local plugins must use Bunny plugin manifest spec 3"
            );
        }

        if (!"plugin".equals(requiredString(manifest, "type"))) {
            throw invalid(
                    "Manifest type must be 'plugin'"
            );
        }

        requiredString(manifest, "version");
        requiredString(manifest, "main");

        Object displayValue = manifest.opt("display");

        if (!(displayValue instanceof JSONObject)) {
            throw invalid(
                    "Plugin manifest does not contain display metadata"
            );
        }

        JSONObject display = (JSONObject) displayValue;

        requiredString(display, "name");
        validateOptionalString(display, "description");
        validateAuthors(display);

        Object extras = manifest.opt("extras");

        if (
                extras != null
                && extras != JSONObject.NULL
                && !(extras instanceof JSONObject)
        ) {
            throw invalid(
                    "Plugin manifest extras must be an object"
            );
        }

        /*
         * These are Bunny runtime/internal fields, not distributable manifest
         * metadata. A local package must not be able to masquerade as a
         * repository-installed plugin or choose an arbitrary private path.
         */
        if (
                manifest.has("parentRepository")
                || manifest.has("jsPath")
                || manifest.has("__bunnyLocal")
        ) {
            throw invalid(
                    "Plugin manifest contains reserved Bunny runtime fields"
            );
        }

        Object scriptValue = root.opt("script");

        if (!(scriptValue instanceof String)) {
            throw invalid(
                    "Plugin package does not contain compiled index.js text"
            );
        }

        String script = (String) scriptValue;

        if (script.trim().isEmpty()) {
            throw invalid(
                    "Plugin script is empty"
            );
        }

        String projectRepository = null;
        Object provenanceValue = root.opt("provenance");

        if (
                provenanceValue != null
                && provenanceValue != JSONObject.NULL
        ) {
            if (!(provenanceValue instanceof JSONObject)) {
                throw invalid(
                        "Plugin provenance must be an object"
                );
            }

            JSONObject provenance = (JSONObject) provenanceValue;

            if (provenance.has("repository")) {
                projectRepository = requiredString(
                        provenance,
                        "repository"
                );

                validateHttpsRepository(projectRepository);
            }
        }

        return new LocalPluginPackage(
                id,
                manifest.toString(),
                script,
                projectRepository
        );
    }

    private static void validateStableId(String id) {
        /*
         * Bunny uses the stable ID directly when constructing
         * plugins/manifests/<id>.json and plugins/scripts/<id>.js.
         * Do not impose a new naming convention, but reject path traversal.
         */
        if (
                ".".equals(id)
                || "..".equals(id)
                || id.indexOf('/') >= 0
                || id.indexOf('\\') >= 0
                || id.indexOf('\0') >= 0
        ) {
            throw invalid(
                    "Plugin ID is not safe for Bunny plugin storage"
            );
        }
    }

    private static void validateAuthors(JSONObject display) {
        Object authorsValue = display.opt("authors");

        if (
                authorsValue == null
                || authorsValue == JSONObject.NULL
        ) {
            return;
        }

        if (!(authorsValue instanceof JSONArray)) {
            throw invalid(
                    "Plugin display authors must be an array"
            );
        }

        JSONArray authors = (JSONArray) authorsValue;

        for (int index = 0; index < authors.length(); index++) {
            Object authorValue = authors.opt(index);

            if (!(authorValue instanceof JSONObject)) {
                throw invalid(
                        "Every plugin author must be an object"
                );
            }

            JSONObject author = (JSONObject) authorValue;

            requiredString(author, "name");
            validateOptionalString(author, "id");
        }
    }

    private static void validateHttpsRepository(String value) {
        final URI uri;

        try {
            uri = new URI(value);
        } catch (URISyntaxException error) {
            throw invalid(
                    "Plugin repository is not a valid URL",
                    error
            );
        }

        if (
                !"https".equalsIgnoreCase(uri.getScheme())
                || uri.getHost() == null
                || uri.getHost().trim().isEmpty()
                || uri.getUserInfo() != null
        ) {
            throw invalid(
                    "Plugin repository must be a safe HTTPS URL"
            );
        }
    }

    private static String requiredString(
            JSONObject object,
            String name
    ) {
        Object value = object.opt(name);

        if (!(value instanceof String)) {
            throw invalid(
                    "Required plugin field '" + name + "' is missing"
            );
        }

        String text = ((String) value).trim();

        if (text.isEmpty()) {
            throw invalid(
                    "Required plugin field '" + name + "' is empty"
            );
        }

        return text;
    }

    private static String optionalString(
            JSONObject object,
            String name
    ) {
        Object value = object.opt(name);

        if (
                value == null
                || value == JSONObject.NULL
        ) {
            return null;
        }

        return value instanceof String
                ? ((String) value).trim()
                : null;
    }

    private static void validateOptionalString(
            JSONObject object,
            String name
    ) {
        Object value = object.opt(name);

        if (
                value != null
                && value != JSONObject.NULL
                && !(value instanceof String)
        ) {
            throw invalid(
                    "Plugin field '" + name + "' must be text"
            );
        }
    }

    private static IllegalArgumentException invalid(
            String message
    ) {
        return new IllegalArgumentException(message);
    }

    private static IllegalArgumentException invalid(
            String message,
            Throwable cause
    ) {
        return new IllegalArgumentException(message, cause);
    }
}