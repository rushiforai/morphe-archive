// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.oauth;

import app.reseam.runtime.Export;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class OAuthRedirect {
    private OAuthRedirect() {}

    @Export
    public static boolean matchesEndpoint(String callback, String redirect) {
        if (callback == null) return false;
        // Match the address even when the query or fragment is syntactically invalid.
        String actual = endpoint(callback);
        String registered = endpoint(redirect);
        if (actual.equals(registered)) return true;

        try {
            URI origin = new URI(registered);
            boolean https = "https".equalsIgnoreCase(origin.getScheme());
            if (!https && !"http".equalsIgnoreCase(origin.getScheme())) return false;

            URI candidate = new URI(actual);
            int defaultPort = https ? 443 : 80;
            String registeredPath = path(origin);
            String actualPath = path(candidate);
            return origin.getScheme().equalsIgnoreCase(candidate.getScheme())
                && sameHost(origin.getHost(), candidate.getHost())
                && candidate.getRawUserInfo() == null
                && port(origin, defaultPort) == port(candidate, defaultPort)
                && (registeredPath.equals(actualPath) || browserPath(registeredPath).equals(actualPath));
        } catch (URISyntaxException ignored) {
            return false;
        }
    }

    private static String endpoint(String address) {
        int end = address.length();
        int query = address.indexOf('?');
        int fragment = address.indexOf('#');
        if (query >= 0) end = query;
        if (fragment >= 0 && fragment < end) end = fragment;
        return address.substring(0, end);
    }

    private static int port(URI uri, int defaultPort) {
        return uri.getPort() == -1 ? defaultPort : uri.getPort();
    }

    private static boolean sameHost(String registered, String actual) {
        if (registered == null || actual == null) return false;
        if (registered.equalsIgnoreCase(actual)) return true;
        // URI has already validated the literals. Keep IPv4-mapped addresses in the IPv6 address space.
        return registered.startsWith("[") && actual.startsWith("[")
            && registered.indexOf('%') < 0 && actual.indexOf('%') < 0
            && Arrays.equals(ipv6(registered), ipv6(actual));
    }

    private static int[] ipv6(String host) {
        String address = host.substring(1, host.length() - 1);
        int compressed = address.indexOf("::");
        int[] groups = new int[8];
        if (compressed < 0) {
            readGroups(address, groups, false);
        } else {
            readGroups(address.substring(0, compressed), groups, false);
            readGroups(address.substring(compressed + 2), groups, true);
        }
        return groups;
    }

    private static void readGroups(String address, int[] groups, boolean alignRight) {
        if (address.isEmpty()) return;
        String[] parts = address.split(":");
        boolean ipv4Tail = parts[parts.length - 1].indexOf('.') >= 0;
        int offset = alignRight ? groups.length - parts.length - (ipv4Tail ? 1 : 0) : 0;
        for (int i = 0; i < parts.length - (ipv4Tail ? 1 : 0); i++) {
            groups[offset + i] = Integer.parseInt(parts[i], 16);
        }
        if (ipv4Tail) {
            String[] octets = parts[parts.length - 1].split("\\.");
            groups[6] = Integer.parseInt(octets[0]) * 256 + Integer.parseInt(octets[1]);
            groups[7] = Integer.parseInt(octets[2]) * 256 + Integer.parseInt(octets[3]);
        }
    }

    private static String path(URI uri) {
        String path = uri.getRawPath();
        return path == null || path.isEmpty() ? "/" : path;
    }

    private static String browserPath(String path) {
        String[] segments = path.substring(1).split("/", -1);
        List<String> result = new ArrayList<>();
        for (int i = 0; i < segments.length; i++) {
            String segment = segments[i];
            boolean parent = segment.equals("..") || segment.equalsIgnoreCase(".%2e")
                || segment.equalsIgnoreCase("%2e.") || segment.equalsIgnoreCase("%2e%2e");
            if (parent || segment.equals(".") || segment.equalsIgnoreCase("%2e")) {
                if (parent && !result.isEmpty()) result.remove(result.size() - 1);
                if (i == segments.length - 1) result.add("");
            } else {
                result.add(segment);
            }
        }
        StringBuilder normalized = new StringBuilder();
        for (String segment : result) normalized.append('/').append(segment);
        return normalized.toString();
    }

    @Export
    public static boolean validResponse(String callback, String redirect) {
        // Called only after the WebView has matched the registered endpoint.
        String query;
        try {
            URI uri = new URI(callback);
            if (uri.getRawFragment() != null) return false;
            query = uri.getRawQuery();
            if (query == null) return false;
        } catch (URISyntaxException ignored) {
            return false;
        }

        int fixedQuery = redirect.indexOf('?');
        if (fixedQuery >= 0) {
            String prefix = redirect.substring(fixedQuery + 1) + "&";
            if (!query.startsWith(prefix)) {
                String scheme = redirect.substring(0, redirect.indexOf(':'));
                if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)) return false;
                prefix = prefix.replace("'", "%27");
                if (!query.startsWith(prefix)) return false;
            }
            query = query.substring(prefix.length());
        }
        boolean state = false;
        boolean result = false;
        for (String parameter : query.split("&", -1)) {
            int separator = parameter.indexOf('=');
            String name = separator < 0 ? parameter : parameter.substring(0, separator);
            // The native handlers look up the literal query names.
            if (name.isEmpty() || name.indexOf('%') >= 0) return false;
            if (name.equals("state")) {
                if (state || separator < 0 || separator == parameter.length() - 1) return false;
                state = true;
            } else if (name.equals("code") || name.equals("error")) {
                if (result || separator < 0 || separator == parameter.length() - 1) return false;
                result = true;
            }
        }
        return state && result;
    }
}
