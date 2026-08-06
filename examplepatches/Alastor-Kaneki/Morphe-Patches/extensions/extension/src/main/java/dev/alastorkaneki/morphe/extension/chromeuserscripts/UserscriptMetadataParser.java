package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Parses Greasemonkey-compatible metadata using behavior adapted from Violentmonkey's
 * MIT-licensed parseMeta implementation.
 */
public final class UserscriptMetadataParser {
    private static final Pattern SCRIPT_BLOCK = Pattern.compile(
            "(?s)//\\s*==UserScript==\\s*(.*?)//\\s*==/UserScript=="
    );
    private static final Pattern STYLE_BLOCK = Pattern.compile(
            "(?s)/\\*\\s*==UserStyle==\\s*(.*?)==/UserStyle==\\s*\\*/"
    );
    private static final Pattern METADATA_LINE = Pattern.compile(
            "^\\s*(?://|\\*)\\s*@([^\\s]+)(?:[\\t ]+(.*?))?[\\t ]*$"
    );

    private UserscriptMetadataParser() { }

    public static Userscript parse(String source, String fileName, String installUrl) {
        if (source == null) source = "";
        Userscript result = new Userscript();
        result.source = source;
        result.installUrl = installUrl == null ? "" : installUrl;

        Matcher script = SCRIPT_BLOCK.matcher(source);
        Matcher style = STYLE_BLOCK.matcher(source);
        String metadata = "";
        boolean hasMetadata = false;
        if (script.find()) {
            metadata = script.group(1);
            result.kind = Userscript.KIND_JAVASCRIPT;
            hasMetadata = true;
        } else if (style.find()) {
            metadata = style.group(1);
            result.kind = Userscript.KIND_CSS;
            hasMetadata = true;
        } else if (fileName != null
                && fileName.toLowerCase(Locale.US).endsWith(".css")) {
            result.kind = Userscript.KIND_CSS;
        }

        if (hasMetadata) parseLines(metadata, result);

        if (isBlank(result.name) || "Untitled userscript".equals(result.name)) {
            result.name = fileNameToName(fileName, result.kind);
        }
        if (isBlank(result.version)) result.version = "1.0.0";
        if (isBlank(result.runAt)) result.runAt = "document-end";
        if (isBlank(result.injectInto)) result.injectInto = "page";
        if (!hasMetadata || result.matches.isEmpty() && result.includes.isEmpty()) {
            // Violentmonkey also requires valid metadata before taking over a downloaded script.
            result.enabled = false;
        }

        result.id = stableId(result.namespace, result.name);
        result.updatedAt = System.currentTimeMillis();
        return result;
    }

    public static Userscript reparsePreservingState(Userscript previous, String source) {
        Userscript parsed = parse(
                source,
                Userscript.KIND_CSS.equals(previous.kind)
                        ? previous.name + ".user.css"
                        : previous.name + ".user.js",
                previous.installUrl
        );
        parsed.id = previous.id;
        parsed.enabled = previous.enabled;
        parsed.installedAt = previous.installedAt;
        parsed.sortOrder = previous.sortOrder;
        return parsed;
    }

    private static void parseLines(String metadata, Userscript target) {
        String localizedName = "";
        String localizedDescription = "";
        String[] lines = metadata.replace("\r", "").split("\n");
        for (String line : lines) {
            Matcher matcher = METADATA_LINE.matcher(line);
            if (!matcher.matches()) continue;

            String rawKey = matcher.group(1);
            String value = matcher.group(2) == null ? "" : matcher.group(2).trim();
            String[] localeParts = rawKey.split(":", 2);
            String key = normalizeKey(localeParts[0]);
            boolean localized = localeParts.length == 2;

            switch (key) {
                case "name":
                    if (localized) {
                        if (localizedName.isEmpty() && !value.isEmpty()) localizedName = value;
                    } else if (!value.isEmpty()) {
                        target.name = value;
                    }
                    break;
                case "namespace":
                    target.namespace = value;
                    break;
                case "version":
                    if (!value.isEmpty()) target.version = value;
                    break;
                case "description":
                    if (localized) {
                        if (localizedDescription.isEmpty() && !value.isEmpty()) {
                            localizedDescription = value;
                        }
                    } else {
                        target.description = value;
                    }
                    break;
                case "author":
                    target.author = value;
                    break;
                case "icon":
                case "iconurl":
                case "defaulticon":
                    if (target.icon.isEmpty()) target.icon = value;
                    break;
                case "match":
                    add(value, target.matches);
                    break;
                case "include":
                    add(value, target.includes);
                    break;
                case "exclude":
                    add(value, target.excludes);
                    break;
                case "excludematch":
                    add(value, target.excludeMatches);
                    break;
                case "grant":
                    add(value, target.grants);
                    break;
                case "require":
                    add(value, target.requires);
                    break;
                case "resource":
                    add(value, target.resources);
                    break;
                case "tag":
                    add(value, target.tags);
                    break;
                case "connect":
                    add("connect:" + value, target.tags);
                    break;
                case "antifeature":
                    add("antifeature:" + value, target.tags);
                    break;
                case "compatible":
                    add("compatible:" + value, target.tags);
                    break;
                case "runat":
                    target.runAt = normalizeRunAt(value);
                    break;
                case "injectinto":
                    target.injectInto = value.isEmpty() ? "page" : value;
                    break;
                case "updateurl":
                    target.updateUrl = value;
                    break;
                case "downloadurl":
                    target.downloadUrl = value;
                    break;
                case "noframes":
                    target.noFrames = true;
                    break;
                default:
                    break;
            }
        }

        if ((isBlank(target.name) || "Untitled userscript".equals(target.name))
                && !localizedName.isEmpty()) {
            target.name = localizedName;
        }
        if (isBlank(target.description) && !localizedDescription.isEmpty()) {
            target.description = localizedDescription;
        }
    }

    private static String normalizeKey(String value) {
        return value.toLowerCase(Locale.US).replace("-", "").replace("_", "");
    }

    private static String normalizeRunAt(String value) {
        String normalized = value.toLowerCase(Locale.US);
        if ("document-start".equals(normalized)
                || "document-body".equals(normalized)
                || "document-end".equals(normalized)
                || "document-idle".equals(normalized)) {
            return normalized;
        }
        return "document-end";
    }

    private static void add(String value, java.util.List<String> output) {
        if (value != null && !value.isEmpty()) output.add(value);
    }

    private static String fileNameToName(String fileName, String kind) {
        if (fileName == null || fileName.trim().isEmpty()) {
            return Userscript.KIND_CSS.equals(kind)
                    ? "Untitled userstyle"
                    : "Untitled userscript";
        }
        String value = fileName.trim();
        value = value.replaceFirst("(?i)\\.user\\.js$", "");
        value = value.replaceFirst("(?i)\\.user\\.css$", "");
        value = value.replaceFirst("(?i)\\.(js|css)$", "");
        value = value.replace('_', ' ').replace('-', ' ').trim();
        if (value.isEmpty()) {
            return Userscript.KIND_CSS.equals(kind)
                    ? "Untitled userstyle"
                    : "Untitled userscript";
        }
        return value;
    }

    public static String stableId(String namespace, String name) {
        String seed = (namespace == null ? "" : namespace)
                + "\n"
                + (name == null ? "" : name);
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = digest.digest(seed.getBytes(StandardCharsets.UTF_8));
            StringBuilder output = new StringBuilder("ms-");
            for (int index = 0; index < 12; index++) {
                output.append(String.format(Locale.US, "%02x", bytes[index]));
            }
            return output.toString();
        } catch (NoSuchAlgorithmException impossible) {
            return "ms-" + Integer.toHexString(seed.hashCode());
        }
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
