package app.morphe.extension.chmate;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;

/** Per-image routing decision. Not wired into native downloads until a verified tunnel exists. */
public final class ImageVpnRequestPolicy {
    public static final String TARGET_HOST = "tools.yajuvideo.st";
    public static final String DEFAULT_DOMAINS = TARGET_HOST + "\nwww.activetk.jp\nloggerip.web.app";
    private static volatile java.util.Set<String> domains = parseDomains(DEFAULT_DOMAINS);
    private ImageVpnRequestPolicy() {}

    /** Exact domains only: never turn a shared hosting suffix into a wildcard. No DNS lookup. */
    public static java.util.Set<String> parseDomains(String input) {
        java.util.Set<String> result = new java.util.LinkedHashSet<>();
        if (input == null || input.length() > 16384) throw new IllegalArgumentException("ドメインは16384文字以内で入力してください");
        for (String entry : input.split("[\\s,、]+")) {
            if (entry.isEmpty()) continue;
            String host = entry.toLowerCase(java.util.Locale.ROOT);
            if (host.endsWith(".")) host = host.substring(0, host.length()-1);
            try { host = java.net.IDN.toASCII(host, java.net.IDN.USE_STD3_ASCII_RULES); }
            catch (IllegalArgumentException e) { throw new IllegalArgumentException("ドメイン名を入力してください: " + entry); }
            if (host.length()>253 || !host.contains(".") || host.matches("[0-9.]+")
                    || host.endsWith(".local") || host.endsWith(".localhost"))
                throw new IllegalArgumentException("ドメイン名を入力してください: " + entry);
            for (String label : host.split("\\.", -1))
                if (!label.matches("[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?"))
                    throw new IllegalArgumentException("ドメイン名を入力してください: " + entry);
            result.add(host);
            if (result.size()>128) throw new IllegalArgumentException("登録できるドメインは128件までです");
        }
        return java.util.Collections.unmodifiableSet(result);
    }

    public static void setDomains(String input) { domains = parseDomains(input); }
    public static String normalizeDomains(String input) {
        StringBuilder result=new StringBuilder();
        for(String domain:parseDomains(input)){if(result.length()>0)result.append('\n');result.append(domain);}
        return result.toString();
    }

    public static boolean isTargetHost(String host) {
        if (host == null) return false;
        if (host.endsWith(".")) host = host.substring(0,host.length()-1);
        try { return domains.contains(java.net.IDN.toASCII(host.toLowerCase(java.util.Locale.ROOT))); }
        catch (IllegalArgumentException e) { return false; }
    }

    public interface Tunnel {
        /** The backend must resolve DNS and connect inside the tunnel, never via default sockets. */
        URLConnection open(URL url) throws IOException;
    }

    public static boolean isTarget(URL url) {
        return url != null && isTargetHost(url.getHost());
    }

    public static boolean isProtectedUrl(String value) {
        try {
            URL url = new URL(value);
            validateWebUrl(url);
            return isTarget(url);
        } catch (Exception invalid) { return false; }
    }

    /** A ticket cannot change to direct routing after redirects, disconnects or setting changes. */
    public static Ticket begin(URL imageUrl, boolean enabled) throws IOException {
        validateWebUrl(imageUrl);
        return new Ticket(enabled && isTarget(imageUrl));
    }

    public static final class Ticket {
        private boolean tunnelRequired;
        private int redirects;
        private Ticket(boolean tunnelRequired) { this.tunnelRequired = tunnelRequired; }
        public boolean requiresTunnel() { return tunnelRequired; }

        /** Called before opening any redirect destination; a protected download stays protected. */
        public URL redirect(URL current, String location, boolean protectionEnabled) throws IOException {
            if (++redirects > 5) throw new IOException("IMAGE_VPN_REDIRECT_LIMIT");
            if (location == null || location.trim().isEmpty()) throw new IOException("IMAGE_VPN_INVALID_REDIRECT");
            validateWebUrl(current);
            URL next = new URL(current, location);
            validateWebUrl(next);
            if (protectionEnabled && isTarget(next)) tunnelRequired = true;
            return next;
        }

        /** Protected calls have no direct-connect implementation or automatic fallback. */
        public URLConnection openProtected(URL url, Tunnel tunnel) throws IOException {
            validateWebUrl(url);
            if (!tunnelRequired) throw new IOException("IMAGE_VPN_NOT_A_PROTECTED_REQUEST");
            if (tunnel == null) throw new IOException("IMAGE_VPN_TUNNEL_UNAVAILABLE");
            URLConnection connection = tunnel.open(url);
            if (connection == null) throw new IOException("IMAGE_VPN_TUNNEL_UNAVAILABLE");
            if (connection instanceof java.net.HttpURLConnection) {
                // Redirects must go through redirect() and this same ticket, not a native fallback.
                ((java.net.HttpURLConnection) connection).setInstanceFollowRedirects(false);
            }
            return connection;
        }
    }

    private static void validateWebUrl(URL url) throws IOException {
        if (url == null) throw new IOException("IMAGE_VPN_INVALID_URL");
        try {
            URI uri = url.toURI();
            if (!("http".equalsIgnoreCase(uri.getScheme()) || "https".equalsIgnoreCase(uri.getScheme()))
                    || uri.getHost() == null || uri.getUserInfo() != null || uri.getHost().endsWith(".")
                    || (uri.getPort() != -1 && uri.getPort() != 80 && uri.getPort() != 443)) {
                throw new IOException("IMAGE_VPN_INVALID_URL");
            }
        } catch (URISyntaxException error) {
            throw new IOException("IMAGE_VPN_INVALID_URL", error);
        }
    }
}
