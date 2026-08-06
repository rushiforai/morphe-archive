package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/** URL matcher compatible with common userscript @match/@include rules. */
public final class UrlPatternMatcher {
    private UrlPatternMatcher() {
    }

    public static boolean matches(Userscript script, String url) {
        if (script == null || !script.enabled || url == null || url.trim().isEmpty()) return false;
        String normalized = url.trim();
        if (!isInjectableScheme(normalized)) return false;

        boolean positive = false;
        for (String pattern : script.matches) {
            if (matchesChromePattern(pattern, normalized)) {
                positive = true;
                break;
            }
        }
        if (!positive) {
            for (String pattern : script.includes) {
                if (matchesInclude(pattern, normalized)) {
                    positive = true;
                    break;
                }
            }
        }
        if (!positive) return false;

        for (String pattern : script.excludeMatches) {
            if (matchesChromePattern(pattern, normalized)) return false;
        }
        for (String pattern : script.excludes) {
            if (matchesInclude(pattern, normalized)) return false;
        }
        return true;
    }

    public static boolean matchesChromePattern(String pattern, String url) {
        if (pattern == null) return false;
        String value = pattern.trim();
        if (value.isEmpty()) return false;
        if ("<all_urls>".equalsIgnoreCase(value)) return isInjectableScheme(url);

        int schemeSeparator = value.indexOf("://");
        if (schemeSeparator <= 0) return matchesInclude(value, url);

        String patternScheme = value.substring(0, schemeSeparator).toLowerCase(Locale.US);
        String remainder = value.substring(schemeSeparator + 3);
        int slash = remainder.indexOf('/');
        String patternHost = slash >= 0 ? remainder.substring(0, slash) : remainder;
        String patternPath = slash >= 0 ? remainder.substring(slash) : "/*";

        try {
            URI uri = new URI(url);
            String scheme = lower(uri.getScheme());
            String host = lower(uri.getHost());
            String rawPath = uri.getRawPath();
            String query = uri.getRawQuery();
            if (rawPath == null || rawPath.isEmpty()) rawPath = "/";
            String pathAndQuery = query == null ? rawPath : rawPath + "?" + query;

            boolean schemeMatches;
            if ("*".equals(patternScheme)) {
                schemeMatches = "http".equals(scheme) || "https".equals(scheme);
            } else {
                schemeMatches = patternScheme.equals(scheme);
            }
            if (!schemeMatches) return false;

            boolean hostMatches;
            if ("*".equals(patternHost)) {
                hostMatches = host != null && !host.isEmpty();
            } else if (patternHost.startsWith("*.")) {
                String base = lower(patternHost.substring(2));
                hostMatches = host != null && (host.equals(base) || host.endsWith("." + base));
            } else {
                hostMatches = lower(patternHost).equals(host);
            }
            return hostMatches && globMatches(patternPath, pathAndQuery);
        } catch (URISyntaxException ignored) {
            return false;
        }
    }

    public static boolean matchesInclude(String pattern, String url) {
        if (pattern == null) return false;
        String value = pattern.trim();
        if (value.isEmpty()) return false;

        if (value.length() > 2 && value.startsWith("/") && value.endsWith("/")) {
            try {
                return Pattern.compile(value.substring(1, value.length() - 1)).matcher(url).find();
            } catch (PatternSyntaxException ignored) {
                return false;
            }
        }
        return globMatches(value, url);
    }

    public static boolean isInjectableScheme(String url) {
        String normalized = url.toLowerCase(Locale.US);
        return normalized.startsWith("http://") || normalized.startsWith("https://");
    }

    public static int countMatches(List<Userscript> scripts, String url) {
        if (scripts == null) return 0;
        int count = 0;
        for (Userscript script : scripts) {
            if (matches(script, url)) count++;
        }
        return count;
    }

    private static boolean globMatches(String glob, String value) {
        StringBuilder regex = new StringBuilder("^");
        for (int index = 0; index < glob.length(); index++) {
            char character = glob.charAt(index);
            switch (character) {
                case '*':
                    regex.append(".*");
                    break;
                case '?':
                    regex.append('.');
                    break;
                case '\\':
                    regex.append("\\\\");
                    break;
                case '.':
                case '(':
                case ')':
                case '[':
                case ']':
                case '$':
                case '^':
                case '{':
                case '}':
                case '+':
                case '|':
                    regex.append('\\').append(character);
                    break;
                default:
                    regex.append(character);
                    break;
            }
        }
        regex.append('$');
        try {
            return Pattern.compile(regex.toString()).matcher(value).matches();
        } catch (PatternSyntaxException ignored) {
            return false;
        }
    }

    private static String lower(String value) {
        return value == null ? null : value.toLowerCase(Locale.US);
    }
}
