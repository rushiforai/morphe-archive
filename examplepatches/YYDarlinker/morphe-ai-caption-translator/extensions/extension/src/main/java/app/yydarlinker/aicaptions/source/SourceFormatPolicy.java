package app.yydarlinker.aicaptions.source;

import java.net.URI;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.Locale;

/** Prefer word-offset JSON3 without changing signed identity or non-format query bytes. */
final class SourceFormatPolicy {

    static final class Profile {

        final String name, url, descriptorUrl;

        Profile(String name, String url, String descriptorUrl) {
            this.name = name;
            this.url = url;
            this.descriptorUrl = descriptorUrl;
        }
    }

    static final class Evidence {

        final String descriptorHash;

        final List<String> parameters, signedParameters;

        final int parameterCount;

        final boolean fragment;

        Evidence(String url) {

            descriptorHash = app.yydarlinker.caption.contracts.CaptionContracts.hash(url);
            fragment = url.indexOf('#') >= 0;

            String head = fragment ? url.substring(0, url.indexOf('#')) : url;
            int q = head.indexOf('?');

            LinkedHashSet<String> names = new LinkedHashSet<>(), signed = new LinkedHashSet<>();
            int count = 0;

            if (q >= 0)
                for (String item : head.substring(q + 1).split("&", -1)) {

                    int eq = item.indexOf('=');
                    String key = decode(eq < 0 ? item : item.substring(0, eq));
                    count++;

                    if (names.size() < 64) names.add(safeName(key));

                    if (eq >= 0 && (key.equals("sparams") || key.equals("lsparams")))
                        for (String field : decode(item.substring(eq + 1)).split(","))
                            if (signed.size() < 64) signed.add(safeName(field));
                }

            parameterCount = count;
            parameters = Collections.unmodifiableList(new ArrayList<>(names));

            signedParameters = Collections.unmodifiableList(new ArrayList<>(signed));
        }

        private static String safeName(String name) {
            return name.matches("[A-Za-z_][A-Za-z0-9_.-]{0,63}")
                    ? name
                    : "unprintable_parameter_name";
        }

        String diagnostic() {

            return "descriptor_hash="
                    + descriptorHash
                    + ";parameter_names="
                    + String.join(",", parameters)
                    + ";signed_parameter_names="
                    + String.join(",", signedParameters)
                    + ";parameter_count="
                    + parameterCount
                    + ";fragment_present="
                    + fragment;
        }
    }

    static String json3(String url) {

        if (url == null) return null;

        return replaceUnsignedFormat(url, "json3");
    }

    /**
     * A small, deterministic negotiation set for reference tracks. Only unsigned format/layout
     *
     * <p>knobs are touched; signed query bytes (including duplicate/encoded parameters) remain byte
     *
     * <p>for byte intact. The caller owns the three-attempt budget.
     */
    static List<Profile> referenceProfiles(String url) {

        List<Profile> result = new ArrayList<>();

        if (url == null) return result;

        add(result, "ORIGINAL_JSON3", json3(url), url);

        String withoutXosf = removeUnsigned(url, "xosf");

        if (!withoutXosf.equals(url)) add(result, "WORD_LAYOUT", json3(withoutXosf), url);

        // srv3 is only a final registered option; never synthesize it when fmt is signed.

        String srv3 = replaceUnsignedFormat(url, "srv3");

        if (!srv3.equals(url)) add(result, "REGISTERED_SRV3", srv3, url);

        return result;
    }

    private static void add(List<Profile> result, String name, String url, String descriptor) {

        if (url == null) return;
        for (Profile p : result) if (p.url.equals(url)) return;
        result.add(new Profile(name, url, descriptor));
    }

    private static String removeUnsigned(String url, String removeKey) {

        if (url == null || signed(url, removeKey)) return url;

        return rewrite(url, (key, item) -> !removeKey.equals(key));
    }

    private static String replaceUnsignedFormat(String url, String format) {

        boolean signed = signed(url, "fmt");
        if (signed) return url;

        String replaced = rewrite(url, (key, item) -> !"fmt".equals(key));

        int hash = replaced.indexOf('#');
        String fragment = hash < 0 ? "" : replaced.substring(hash);

        String head = hash < 0 ? replaced : replaced.substring(0, hash);
        return head + (head.contains("?") ? "&" : "?") + "fmt=" + format + fragment;
    }

    private interface ItemFilter {
        boolean keep(String decodedKey, String rawItem);
    }

    private static String rewrite(String url, ItemFilter filter) {

        if (url == null) return "";
        int hash = url.indexOf('#');
        String fragment = hash < 0 ? "" : url.substring(hash);

        String head = hash < 0 ? url : url.substring(0, hash);
        int q = head.indexOf('?');
        if (q < 0) return url;

        String query = head.substring(q + 1);
        List<String> kept = new ArrayList<>();

        for (String item : query.split("&", -1)) {
            int eq = item.indexOf('=');
            String rawKey = eq < 0 ? item : item.substring(0, eq);
            String key = decode(rawKey);
            if (filter.keep(key, item)) kept.add(item);
        }

        return head.substring(0, q) + "?" + String.join("&", kept) + fragment;
    }

    private static boolean signed(String url, String name) {

        int hash = url.indexOf('#');
        String head = hash < 0 ? url : url.substring(0, hash);
        int q = head.indexOf('?');
        if (q < 0) return false;

        String[] items = head.substring(q + 1).split("&", -1);
        for (String item : items) {
            int eq = item.indexOf('=');
            if (eq < 0) continue;
            String key = decode(item.substring(0, eq));
            if (!"sparams".equals(key) && !"lsparams".equals(key)) continue;
            for (String value : decode(item.substring(eq + 1)).split(","))
                if (name.equals(value)) return true;
        }

        return false;
    }

    private static String decode(String s) {
        try {
            return URLDecoder.decode(s, StandardCharsets.UTF_8.name());
        } catch (Exception e) {
            return s;
        }
    }
}
