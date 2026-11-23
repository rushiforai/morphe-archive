package okhttp3;

/** Shape of ChMate 226's okhttp3.Headers as seen by the hook: field namesAndValues, private String[] ctor. */
public final class Headers {
    private final String[] namesAndValues;
    private Headers(String[] namesAndValues) { this.namesAndValues = namesAndValues; }
    public static Headers of(String... namesAndValues) { return new Headers(namesAndValues.clone()); }
    public String get(String name) {
        for (int i = 0; i < namesAndValues.length; i += 2)
            if (namesAndValues[i].equalsIgnoreCase(name)) return namesAndValues[i + 1];
        return null;
    }
    public String[] pairs() { return namesAndValues.clone(); }
}
