package android.util;

import java.util.regex.Pattern;

public final class Patterns {
    public static final Pattern WEB_URL = Pattern.compile("https?://[^\\s]+", Pattern.CASE_INSENSITIVE);
    public static final Pattern IP_ADDRESS = Pattern.compile("((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[0-9]))");
    public static final Pattern DOMAIN_NAME = Pattern.compile("[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}");
    private Patterns() {}
}
