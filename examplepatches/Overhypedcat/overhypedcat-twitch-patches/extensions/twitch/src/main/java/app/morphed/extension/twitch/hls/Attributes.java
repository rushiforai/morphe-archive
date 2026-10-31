package app.morphed.extension.twitch.hls;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Parses HLS attribute lists such as {@code RESOLUTION=1920x1080,CODECS="avc1.64002A,mp4a.40.2"}.
 */
final class Attributes {
    private static final Pattern ATTRIBUTE = Pattern.compile("([A-Z0-9-]+)=(\"[^\"]*\"|[^,]*)");

    private Attributes() {
    }

    static Map<String, String> parse(String line) {
        int colon = line.indexOf(':');
        String list = line.startsWith("#") && colon >= 0 ? line.substring(colon + 1) : line;

        Map<String, String> attributes = new HashMap<>();
        Matcher matcher = ATTRIBUTE.matcher(list);
        while (matcher.find()) {
            String value = matcher.group(2);
            if (value.length() >= 2 && value.startsWith("\"") && value.endsWith("\"")) {
                value = value.substring(1, value.length() - 1);
            }
            attributes.put(matcher.group(1), value);
        }
        return attributes;
    }
}
