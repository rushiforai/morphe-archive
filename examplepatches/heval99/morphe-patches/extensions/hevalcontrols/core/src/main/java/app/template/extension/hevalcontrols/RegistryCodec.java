package app.template.extension.hevalcontrols;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Decodes the feature registry that the patch writes into {@link Registry#encoded()} at patch
 * time. The Kotlin encoder is {@code HevalRegistryCodec} in
 * {@code patches/.../shared/hevalcontrols/HevalFeature.kt}; both sides are pinned by the shared
 * fixture {@code core/src/test/resources/registry-v1.txt}.
 *
 * <p>Format, version 1 (UTF-16 string in the dex, so any text is fine):
 * <pre>
 * hevalcontrols-registry:1
 * id TAB name TAB description TAB category TAB default TAB restart TAB buildTimeOnly TAB deps
 * ...
 * </pre>
 * One record per line. Booleans are {@code 0} or {@code 1}; deps are comma-separated ids (may be
 * empty). In text fields a backslash escapes {@code \\}, {@code \t}, {@code \n} and {@code \r}, so
 * a raw tab or line feed is always a separator.
 *
 * <p>An optional ninth field is the feature kind (added 2026-11-03 for list settings):
 * {@code list} for a "pick items to hide" list ({@link Feature#KIND_LIST}); empty, missing or any
 * other value is a switch. The encoder writes it only for list features, so a registry of switches
 * is byte-for-byte what it was before, and the version stays 1. A list record with
 * buildTimeOnly {@code 1} is malformed and skipped; its default is always off. Fields after the
 * ninth are ignored, so a version-1 reader keeps working when a later bundle appends fields.
 *
 * <p>The decoder never throws: a malformed record is skipped, an unknown header version yields an
 * empty, unsupported registry (every hook then answers stock).
 */
public final class RegistryCodec {
    public static final String HEADER_PREFIX = "hevalcontrols-registry:";
    public static final int VERSION = 1;
    private static final int FIELDS_V1 = 8;
    /** Index of the optional kind field. */
    private static final int KIND_FIELD = 8;

    /** Result of {@link #decode(String)}. */
    public static final class Result {
        /** The header's version; 0 when the registry is empty, -1 when the header is unreadable. */
        public final int version;
        /** False when the header names a version this decoder cannot read. */
        public final boolean supported;
        public final List<Feature> features;
        /** Records dropped as malformed or duplicate. */
        public final int skipped;

        Result(int version, boolean supported, List<Feature> features, int skipped) {
            this.version = version;
            this.supported = supported;
            this.features = Collections.unmodifiableList(features);
            this.skipped = skipped;
        }
    }

    public static Result decode(String encoded) {
        try {
            return decodeUnchecked(encoded);
        } catch (RuntimeException unexpected) {
            return new Result(-1, false, new ArrayList<Feature>(), 0);
        }
    }

    private static Result decodeUnchecked(String encoded) {
        List<Feature> features = new ArrayList<>();
        if (encoded == null || encoded.isEmpty()) return new Result(0, true, features, 0);

        String[] lines = encoded.split("\n", -1);
        String header = stripCr(lines[0]);
        if (!header.startsWith(HEADER_PREFIX)) return new Result(-1, false, features, 0);
        int version;
        try {
            version = Integer.parseInt(header.substring(HEADER_PREFIX.length()).trim());
        } catch (NumberFormatException unreadable) {
            return new Result(-1, false, features, 0);
        }
        if (version != VERSION) return new Result(version, false, features, 0);

        Set<String> seen = new HashSet<>();
        int skipped = 0;
        for (int i = 1; i < lines.length; i++) {
            String line = stripCr(lines[i]);
            if (line.isEmpty()) continue;
            Feature feature = parseRecord(line);
            if (feature == null || !seen.add(feature.id)) {
                skipped++;
                continue;
            }
            features.add(feature);
        }
        return new Result(version, true, features, skipped);
    }

    /** One version-1 record, or null when it is malformed. */
    private static Feature parseRecord(String line) {
        String[] fields = line.split("\t", -1);
        if (fields.length < FIELDS_V1) return null;
        String id = unescape(fields[0]);
        String name = unescape(fields[1]);
        String description = unescape(fields[2]);
        String category = unescape(fields[3]);
        int defaultOn = flag(fields[4]), restart = flag(fields[5]), buildTime = flag(fields[6]);
        if (id == null || name == null || description == null || category == null) return null;
        if (defaultOn < 0 || restart < 0 || buildTime < 0 || !Feature.isValidId(id)) return null;
        boolean list = fields.length > KIND_FIELD && Feature.KIND_LIST.equals(fields[KIND_FIELD]);
        if (list && buildTime == 1) return null;

        List<String> dependencies = new ArrayList<>();
        if (!fields[7].isEmpty()) {
            for (String dependency : fields[7].split(",", -1)) {
                // An invalid dependency id is dropped, not the whole feature.
                if (Feature.isValidId(dependency) && !dependency.equals(id) && !dependencies.contains(dependency)) {
                    dependencies.add(dependency);
                }
            }
        }
        return new Feature(id, name, description, category, defaultOn == 1, restart == 1, buildTime == 1, dependencies,
                list ? Feature.KIND_LIST : Feature.KIND_SWITCH);
    }

    private static int flag(String field) {
        if ("1".equals(field)) return 1;
        if ("0".equals(field)) return 0;
        return -1;
    }

    private static String stripCr(String line) {
        return line.endsWith("\r") ? line.substring(0, line.length() - 1) : line;
    }

    /** Reverses the encoder's escaping; null for an unknown or dangling escape. */
    static String unescape(String field) {
        if (field.indexOf('\\') < 0) return field;
        StringBuilder out = new StringBuilder(field.length());
        for (int i = 0; i < field.length(); i++) {
            char c = field.charAt(i);
            if (c != '\\') {
                out.append(c);
                continue;
            }
            if (++i >= field.length()) return null;
            char escaped = field.charAt(i);
            switch (escaped) {
                case '\\': out.append('\\'); break;
                case 't': out.append('\t'); break;
                case 'n': out.append('\n'); break;
                case 'r': out.append('\r'); break;
                default: return null;
            }
        }
        return out.toString();
    }

    private RegistryCodec() { }
}
