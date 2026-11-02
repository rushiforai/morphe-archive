package app.morphe.extension.mapsautomotive.patches;

import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Removes what could identify the user or a place from every string of a problem report, on the
 * device and before the preview, so the preview shows what is sent. Rules version 2, in this order:
 * the Send to car extra, map links, URL queries, coordinates, e-mail addresses (MicroG account
 * names), VINs, IP addresses and, from version 2, numbers of 15 or more digits (Maps writes the
 * account's number into paths such as files/users/road_view/<21 digits>/, which reach the report with
 * its logcat lines). Free text such as a street name in the comment is not detected;
 * the preview is the user's control for that. Plain Java, so it can be checked off the device.
 */
final class ReportRedactor {
    static final int RULES_VERSION = 2;
    private static final String[] KEYS = {"send_to_car_extras", "map_links", "url_queries", "coordinates", "emails",
            "vins", "ip_addresses", "long_ids"};
    private static final int SEND_TO_CAR = 0, MAP_LINKS = 1, URL_QUERIES = 2, COORDINATES = 3, EMAILS = 4, VINS = 5,
            IP_ADDRESSES = 6, LONG_IDS = 7;
    // A URL ends at white space, quotes, angle brackets or a closing parenthesis.
    private static final String URL_REST = "[^\\s\"'<>)]*";
    private static final Pattern SEND_TO_CAR_EXTRA = Pattern.compile("\\(send to car: [^)]*\\)");
    private static final Pattern SHORT_MAP_LINK = Pattern.compile("(?i)https?://(maps\\.app\\.goo\\.gl|goo\\.gl/maps)(?:[/?#]" + URL_REST + ")?");
    private static final Pattern MAPS_URL = Pattern.compile(
            "(?i)https?://((?:www\\.)?google\\.[a-z]{2,3}(?:\\.[a-z]{2})?/maps|maps\\.google\\.[a-z]{2,3}(?:\\.[a-z]{2})?)(?:[/?#@]" + URL_REST + ")?");
    private static final Pattern MAP_URI = Pattern.compile("(?i)\\b(geo|google\\.navigation):[^\\s\"'<>)]+");
    private static final Pattern URL_QUERY = Pattern.compile("(?i)(https?://[^\\s/?#\"'<>)]+[^\\s?#\"'<>)]*)[?#]" + URL_REST);
    private static final Pattern COORDINATE_PAIR = Pattern.compile("-?\\d{1,2}\\.\\d{3,}\\s*,\\s*-?\\d{1,3}\\.\\d{3,}");
    // E7 integers included; "latency=" and "latest:" stay.
    private static final Pattern COORDINATE_KEY = Pattern.compile("(?i)\\b(?:lat|lng|lon|latitude|longitude)(?:e7)?\\s*[=:]\\s*-?\\d+(?:\\.\\d+)?");
    private static final Pattern EMAIL = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}");
    private static final Pattern VIN = Pattern.compile("\\b[A-HJ-NPR-Z0-9]{17}\\b");
    // Not part of a longer dotted number such as a version.
    private static final Pattern IPV4 = Pattern.compile("(?<![\\d.])(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})(?!\\.?\\d)");
    private static final Pattern IPV6 = Pattern.compile("(?<![0-9A-Fa-f:])(?:[0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4}(?![0-9A-Fa-f:])");
    // A whole run of digits, not part of a word, a hex string or a dotted number.
    private static final Pattern LONG_ID = Pattern.compile("(?<![0-9A-Za-z.])\\d{15,}(?![0-9A-Za-z.])");

    private final int[] counts = new int[KEYS.length];

    private interface Replacement {
        /** The replacement, or null to keep the match. */
        String of(Matcher match);
    }

    String redact(String text) {
        if (text == null || text.isEmpty()) return text;
        text = replace(text, SEND_TO_CAR_EXTRA, SEND_TO_CAR, match -> "(send to car: <redacted>)");
        text = replace(text, SHORT_MAP_LINK, MAP_LINKS, match -> "https://" + match.group(1).toLowerCase(Locale.ROOT) + "/<link>");
        text = replace(text, MAPS_URL, MAP_LINKS, match -> "https://" + match.group(1).toLowerCase(Locale.ROOT) + "/<path>");
        text = replace(text, MAP_URI, MAP_LINKS, match -> match.group(1) + ":<redacted>");
        text = replace(text, URL_QUERY, URL_QUERIES, match -> match.group(1) + "?<query>");
        text = replace(text, COORDINATE_PAIR, COORDINATES, match -> "<coord>");
        text = replace(text, COORDINATE_KEY, COORDINATES, match -> "<coord>");
        text = replace(text, EMAIL, EMAILS, match -> "<email>");
        text = replace(text, VIN, VINS, match -> hasLetterAndDigit(match.group()) ? "<vin>" : null);
        text = replace(text, IPV4, IP_ADDRESSES, match -> {
            for (int part = 1; part <= 4; part++) if (Integer.parseInt(match.group(part)) > 255) return null;
            return "<ip>";
        });
        text = replace(text, IPV6, IP_ADDRESSES, match -> "<ip>");
        text = replace(text, LONG_ID, LONG_IDS, match -> "<id>");
        return text;
    }

    /** The number of replacements per rule, every rule listed. */
    Map<String, Integer> counts() {
        Map<String, Integer> result = new LinkedHashMap<>();
        for (int rule = 0; rule < KEYS.length; rule++) result.put(KEYS[rule], counts[rule]);
        return result;
    }

    private String replace(String text, Pattern pattern, int rule, Replacement replacement) {
        Matcher match = pattern.matcher(text);
        if (!match.find()) return text;
        StringBuffer out = new StringBuffer(text.length());
        do {
            String value = replacement.of(match);
            if (value == null) continue;
            counts[rule]++;
            match.appendReplacement(out, Matcher.quoteReplacement(value));
        } while (match.find());
        match.appendTail(out);
        return out.toString();
    }

    private static boolean hasLetterAndDigit(String text) {
        boolean letter = false, digit = false;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c >= '0' && c <= '9') digit = true;
            else letter = true;
        }
        return letter && digit;
    }
}
