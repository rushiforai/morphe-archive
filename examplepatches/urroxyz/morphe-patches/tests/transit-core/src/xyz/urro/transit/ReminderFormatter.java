package xyz.urro.transit;

/** Literal, bounded formatting. Malformed groups and unknown tokens remain literal. */
public final class ReminderFormatter {
    public static final int MAX_LENGTH = 500;
    public static final String STOPS = "Retrieve bike in {N} stop[s].";
    public static final String NEXT = "Retrieve bike SOON. You're next!";
    public static final String CURRENT = "Retrieve bike NOW. It's your stop!";
    public enum Event { STOPS, NEXT, CURRENT, OTHER }
    public static String render(boolean bike, Event event, int stops, String template, String original) {
        if (!bike || event == Event.OTHER || (event == Event.STOPS && stops < 0)) return original;
        String fallback = event == Event.STOPS ? STOPS : event == Event.NEXT ? NEXT : CURRENT;
        String input = template == null || template.trim().isEmpty() || template.length() > MAX_LENGTH ? fallback : template;
        if (event != Event.STOPS) return input;
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < input.length();) {
            if (input.startsWith("{N}", i)) { out.append(stops); i += 3; continue; }
            if (input.charAt(i) == '[') {
                int end = input.indexOf(']', i + 1);
                if (end >= 0 && input.substring(i+1, end).indexOf('[') < 0) {
                    if (stops != 1) out.append(input, i+1, end);
                    i = end + 1; continue;
                }
            }
            out.append(input.charAt(i++));
        }
        return out.toString();
    }
}
