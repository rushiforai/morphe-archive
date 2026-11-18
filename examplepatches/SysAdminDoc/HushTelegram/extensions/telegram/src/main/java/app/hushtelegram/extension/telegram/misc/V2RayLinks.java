/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import androidx.annotation.Nullable;
import app.hushtelegram.extension.shared.L10n;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Reads V2Ray-style share links (#71): ss://, vmess://, vless:// and trojan://, from a pasted line
 * or a whole subscription list, plain or as one block of base64. What {@link V2RayTunnels} can
 * carry becomes a {@link Server}. A link that asks for something it can't, REALITY or gRPC say,
 * is counted by kind in {@link Found#skipped}, and one that doesn't read in
 * {@link Found#unreadable}, so the settings row can say what was left out and why.
 */
final class V2RayLinks {
    static final String SS = "ss";
    static final String VMESS = "vmess";
    static final String VLESS = "vless";
    static final String TROJAN = "trojan";

    /** How many servers one read keeps. */
    static final int MAX_SERVERS = 500;
    private static final int MAX_LINK = 8192;
    private static final int MAX_NAME = 60;

    /** A link wherever it starts, running to the next space or quote. */
    private static final Pattern LINK = Pattern.compile(
            "(?<![A-Za-z0-9+.-])(ssr|ss|vmess|vless|trojan|hysteria2|hysteria|hy2|tuic|wireguard|wg|dnstt)://[^\\s\"'<>`]+",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern NAME_HOST = Pattern.compile("[A-Za-z0-9_](?:[A-Za-z0-9_.-]{0,251}[A-Za-z0-9_])?");
    private static final Pattern IPV6 = Pattern.compile("[0-9A-Fa-f:.]{2,45}");
    private static final Pattern PORT = Pattern.compile("[0-9]{1,5}");
    private static final Pattern ALPN = Pattern.compile("[A-Za-z0-9/._-]{1,32}");

    /** Why a link was left out: something it asks for that this can't do yet. */
    enum Skip {
        REALITY("REALITY"),
        XTLS("XTLS"),
        GRPC("gRPC"),
        HTTP2("HTTP/2"),
        QUIC("QUIC"),
        KCP("mKCP"),
        HTTP_UPGRADE("HTTPUpgrade"),
        XHTTP("XHTTP"),
        TCP_HEADERS(null),
        HYSTERIA("Hysteria"),
        TUIC("TUIC"),
        WIREGUARD("WireGuard"),
        DNSTT("dnstt"),
        SHADOWSOCKS_2022("Shadowsocks 2022"),
        SHADOWSOCKSR("ShadowsocksR"),
        SHADOWSOCKS_PLUGIN(null),
        SHADOWSOCKS_CIPHER(null),
        CHACHA("ChaCha20-Poly1305"),
        VMESS_ALTER_ID("VMess alterId"),
        VLESS_ENCRYPTION(null);

        @Nullable private final String name;

        Skip(@Nullable String name) {
            this.name = name;
        }

        /** How the settings row names it: a protocol's own name, or words for the rest. */
        String label() {
            if (name != null) return name;
            switch (this) {
                case TCP_HEADERS:
                    return L10n.t("TCP with HTTP headers");
                case SHADOWSOCKS_PLUGIN:
                    return L10n.t("Shadowsocks plugins");
                case SHADOWSOCKS_CIPHER:
                    return L10n.t("other Shadowsocks ciphers");
                default:
                    return L10n.t("VLESS encryption");
            }
        }
    }

    /** One server a link names, as the tunnels need it. The link itself is how it's known. */
    static final class Server {
        String kind = "";
        String host = "";
        int port;
        String name = "";
        /** The Shadowsocks or Trojan password, or the VMess or VLESS id. */
        String secret = "";
        /** Shadowsocks: its cipher. VMess: how the body is sealed (aes-128-gcm, chacha20-poly1305, none or zero). */
        String cipher = "";
        boolean ws;
        /** The WebSocket path, "/" when the link has none. */
        String path = "/";
        /** The WebSocket Host header, empty for the server's own name. */
        String hostHeader = "";
        boolean tls;
        /** The name TLS asks for and checks the certificate against, empty for the server's own. */
        String sni = "";
        boolean insecure;
        List<String> alpn = Collections.emptyList();
        String link = "";

        /** The name TLS sends and verifies: the link's sni, else the WebSocket host, else the server. */
        String serverName() {
            if (!sni.isEmpty()) return sni;
            if (ws && !hostHeader.isEmpty()) return hostHeader;
            return host;
        }

        /** A short id for the picker, the same for the same link and never the link itself. */
        String id() {
            return V2RayCrypto.hex(V2RayCrypto.digest("SHA-256", link.getBytes(StandardCharsets.UTF_8))).substring(0, 16);
        }
    }

    /** What a read found: the servers it can use, and counts of the links it couldn't. */
    static final class Found {
        final List<Server> servers = new ArrayList<>();
        final Map<Skip, Integer> skipped = new EnumMap<>(Skip.class);
        int unreadable;
        private final Map<String, Server> byLink = new HashMap<>();

        void add(Found other) {
            for (Server server : other.servers) keep(server);
            for (Map.Entry<Skip, Integer> each : other.skipped.entrySet()) skip(each.getKey(), each.getValue());
            unreadable += other.unreadable;
        }

        int skippedCount() {
            int count = 0;
            for (int each : skipped.values()) count += each;
            return count;
        }

        private void keep(Server server) {
            if (servers.size() >= MAX_SERVERS || byLink.containsKey(server.link)) return;
            byLink.put(server.link, server);
            servers.add(server);
        }

        private void skip(Skip why, int count) {
            Integer before = skipped.get(why);
            skipped.put(why, (before == null ? 0 : before) + count);
        }
    }

    /** Thrown for a link that reads but asks for something left out. */
    static final class Skipped extends Exception {
        final Skip why;

        Skipped(Skip why) {
            super(why.name(), null, false, false);
            this.why = why;
        }
    }

    private V2RayLinks() {
    }

    /**
     * Every link in [text], wherever each starts on a line, or in its decoded form when the whole of
     * it is one block of base64, as subscription lists often are.
     */
    static Found parse(@Nullable String text) {
        Found found = new Found();
        if (text == null || text.isEmpty()) return found;
        collect(text, found);
        if (found.servers.isEmpty() && found.skipped.isEmpty() && found.unreadable == 0) {
            String decoded = FreeProxies.base64(text);
            if (decoded != null) collect(decoded, found);
        }
        return found;
    }

    /** Whether [line] starts with a link this reads, for the paste box. */
    static boolean looksLikeLink(String line) {
        Matcher match = LINK.matcher(line);
        return match.lookingAt();
    }

    private static void collect(String text, Found found) {
        Matcher match = LINK.matcher(text);
        while (match.find()) {
            String link = trimEnd(match.group());
            try {
                found.keep(parseLink(link));
            } catch (Skipped skipped) {
                found.skip(skipped.why, 1);
            } catch (IllegalArgumentException unreadable) {
                found.unreadable++;
            }
        }
    }

    /** A link in a markdown list can carry the list's closing bracket or a full stop. */
    private static String trimEnd(String link) {
        int end = link.length();
        while (end > 0 && ",;)]".indexOf(link.charAt(end - 1)) >= 0) end--;
        return link.substring(0, end);
    }

    /** The server [link] names. Throws {@link Skipped} for one left out and IllegalArgumentException for one that doesn't read. */
    static Server parseLink(String link) throws Skipped {
        if (link.length() > MAX_LINK) throw new IllegalArgumentException("too long");
        int colon = link.indexOf("://");
        if (colon <= 0) throw new IllegalArgumentException("no scheme");
        String scheme = link.substring(0, colon).toLowerCase(Locale.ROOT);
        String body = link.substring(colon + 3);
        Server server;
        switch (scheme) {
            case SS:
                server = shadowsocks(body);
                break;
            case VMESS:
                server = vmess(body);
                break;
            case VLESS:
                server = vless(body);
                break;
            case TROJAN:
                server = trojan(body);
                break;
            case "ssr":
                throw new Skipped(Skip.SHADOWSOCKSR);
            case "hysteria":
            case "hysteria2":
            case "hy2":
                throw new Skipped(Skip.HYSTERIA);
            case "tuic":
                throw new Skipped(Skip.TUIC);
            case "wireguard":
            case "wg":
                throw new Skipped(Skip.WIREGUARD);
            case "dnstt":
                throw new Skipped(Skip.DNSTT);
            default:
                throw new IllegalArgumentException("not a link this reads");
        }
        server.kind = scheme;
        server.link = link;
        return server;
    }

    // ---- Shadowsocks ----------------------------------------------------------------------------

    /** SIP002's base64 or percent-encoded user info, or the older form that's base64 up to the name. */
    private static Server shadowsocks(String body) throws Skipped {
        Server server = new Server();
        String main = body;
        int hash = main.indexOf('#');
        if (hash >= 0) {
            server.name = name(main.substring(hash + 1));
            main = main.substring(0, hash);
        }
        int question = main.indexOf('?');
        Map<String, String> query = question >= 0 ? query(main.substring(question + 1)) : Collections.emptyMap();
        String head = question >= 0 ? main.substring(0, question) : main;
        if (head.endsWith("/")) head = head.substring(0, head.length() - 1);
        String methodAndPassword;
        String hostAndPort;
        int at = head.lastIndexOf('@');
        if (at >= 0) {
            String user = head.substring(0, at);
            String plain = percentDecode(user);
            methodAndPassword = plain.indexOf(':') > 0 ? plain : base64Text(user);
            hostAndPort = head.substring(at + 1);
        } else {
            String decoded = base64Text(head);
            int decodedAt = decoded.lastIndexOf('@');
            if (decodedAt < 0) throw new IllegalArgumentException("no server");
            methodAndPassword = decoded.substring(0, decodedAt);
            hostAndPort = decoded.substring(decodedAt + 1);
        }
        hostAndPort(server, hostAndPort);
        int split = methodAndPassword.indexOf(':');
        if (split <= 0 || split == methodAndPassword.length() - 1) throw new IllegalArgumentException("no password");
        String method = methodAndPassword.substring(0, split).trim().toLowerCase(Locale.ROOT);
        server.secret = methodAndPassword.substring(split + 1);
        if (method.startsWith("2022-")) throw new Skipped(Skip.SHADOWSOCKS_2022);
        String plugin = query.get("plugin");
        if ((plugin != null && !plugin.isEmpty() && !"none".equalsIgnoreCase(plugin)) || query.containsKey("prefix")) {
            throw new Skipped(Skip.SHADOWSOCKS_PLUGIN);
        }
        switch (method) {
            case "aes-128-gcm":
            case "aes-256-gcm":
                server.cipher = method;
                break;
            case "chacha20-ietf-poly1305":
            case "chacha20-poly1305":
                if (!chacha()) throw new Skipped(Skip.CHACHA);
                server.cipher = "chacha20-ietf-poly1305";
                break;
            default:
                throw new Skipped(Skip.SHADOWSOCKS_CIPHER);
        }
        return server;
    }

    // ---- VMess ----------------------------------------------------------------------------------

    /** v2rayN's base64 JSON, Shadowrocket's base64 "security:id@host:port" with parameters, or a plain URL like VLESS's. */
    private static Server vmess(String body) throws Skipped {
        String head = body;
        int cut = firstOf(head, '?', '#');
        String packed = cut >= 0 ? head.substring(0, cut) : head;
        String decoded = packed.indexOf('@') >= 0 ? null : base64TextOrNull(packed);
        if (decoded != null && decoded.trim().startsWith("{")) {
            JSONObject json;
            try {
                json = new JSONObject(decoded.trim());
            } catch (JSONException unreadable) {
                throw new IllegalArgumentException("not JSON");
            }
            return vmessJson(json);
        }
        Server server = new Server();
        if (decoded != null && decoded.indexOf('@') > 0) {
            // Shadowrocket: base64 of "security:id@host:port", then its own parameter names.
            Map<String, String> query = cut >= 0 && head.charAt(cut) == '?' ? query(afterQuestion(head)) : Collections.emptyMap();
            int at = decoded.lastIndexOf('@');
            String user = decoded.substring(0, at);
            int colon = user.indexOf(':');
            hostAndPort(server, decoded.substring(at + 1));
            server.secret = colon >= 0 ? user.substring(colon + 1) : user;
            String security = colon >= 0 ? user.substring(0, colon) : "auto";
            server.name = name(query.containsKey("remarks") ? query.get("remarks") : fragment(head));
            if (parseInt(query.get("alterid"), 0) > 0) throw new Skipped(Skip.VMESS_ALTER_ID);
            Map<String, String> transport = new HashMap<>();
            transport.put("type", "websocket".equalsIgnoreCase(query.get("obfs")) ? "ws" : "tcp");
            transport.put("path", query.get("path"));
            transport.put("host", query.get("obfsparam"));
            transport.put("security", "1".equals(query.get("tls")) ? "tls" : "none");
            transport.put("sni", query.get("peer"));
            transport.put("allowinsecure", query.get("allowinsecure"));
            transport(server, transport, "none");
            vmessSecurity(server, security);
        } else {
            Parts parts = url(body);
            server.host = parts.host;
            server.port = parts.port;
            server.name = parts.name;
            server.secret = percentDecode(parts.user);
            if (parseInt(parts.query.get("alterid"), 0) > 0 || parseInt(parts.query.get("aid"), 0) > 0) {
                throw new Skipped(Skip.VMESS_ALTER_ID);
            }
            transport(server, parts.query, "none");
            String security = parts.query.get("encryption");
            vmessSecurity(server, security == null ? parts.query.get("scy") : security);
        }
        if (V2RayCrypto.uuid(server.secret) == null) throw new IllegalArgumentException("not an id");
        return server;
    }

    private static Server vmessJson(JSONObject json) throws Skipped {
        Server server = new Server();
        server.name = name(json.optString("ps"));
        hostAndPort(server, bracketed(json.optString("add").trim()) + ":" + json.optString("port").trim());
        server.secret = json.optString("id").trim();
        if (parseInt(json.optString("aid").trim(), 0) > 0) throw new Skipped(Skip.VMESS_ALTER_ID);
        Map<String, String> transport = new HashMap<>();
        transport.put("type", json.optString("net", "tcp"));
        transport.put("headertype", json.optString("type"));
        transport.put("host", json.optString("host"));
        transport.put("path", json.optString("path"));
        String tls = json.optString("tls");
        transport.put("security", tls.isEmpty() ? "none" : tls);
        transport.put("sni", json.optString("sni"));
        transport.put("alpn", json.optString("alpn"));
        String insecure = json.optString("allowInsecure", json.optString("skip-cert-verify", json.optString("insecure")));
        transport.put("allowinsecure", insecure);
        // v2rayN's JSON writes the path and host as they are, not percent-encoded.
        transport(server, transport, "none", false);
        vmessSecurity(server, json.optString("scy"));
        if (V2RayCrypto.uuid(server.secret) == null) throw new IllegalArgumentException("not an id");
        return server;
    }

    /** VMess's body sealing. The server takes whichever the client asks for, so auto is AES-128-GCM. */
    private static void vmessSecurity(Server server, @Nullable String security) {
        String asked = security == null ? "" : security.trim().toLowerCase(Locale.ROOT);
        switch (asked) {
            case "":
            case "auto":
            case "aes-128-gcm":
                server.cipher = "aes-128-gcm";
                return;
            case "chacha20-poly1305":
            case "chacha20-ietf-poly1305":
                server.cipher = chacha() ? "chacha20-poly1305" : "aes-128-gcm";
                return;
            case "none":
            case "zero":
                server.cipher = asked;
                return;
            default:
                throw new IllegalArgumentException("not a VMess security");
        }
    }

    // ---- VLESS and Trojan -----------------------------------------------------------------------

    private static Server vless(String body) throws Skipped {
        Parts parts = url(body);
        Server server = new Server();
        server.host = parts.host;
        server.port = parts.port;
        server.name = parts.name;
        server.secret = percentDecode(parts.user);
        if (V2RayCrypto.uuid(server.secret) == null) throw new IllegalArgumentException("not an id");
        String encryption = parts.query.get("encryption");
        transport(server, parts.query, "none");
        if (encryption != null && !encryption.isEmpty() && !"none".equalsIgnoreCase(encryption)) {
            throw new Skipped(Skip.VLESS_ENCRYPTION);
        }
        return server;
    }

    private static Server trojan(String body) throws Skipped {
        Parts parts = url(body);
        Server server = new Server();
        server.host = parts.host;
        server.port = parts.port;
        server.name = parts.name;
        server.secret = percentDecode(parts.user);
        if (server.secret.isEmpty()) throw new IllegalArgumentException("no password");
        transport(server, parts.query, "tls");
        return server;
    }

    // ---- Transport and TLS ----------------------------------------------------------------------

    private static void transport(Server server, Map<String, String> query, String security) throws Skipped {
        transport(server, query, security, true);
    }

    /**
     * The transport and TLS [query] asks for, onto [server], with [security] when it doesn't say.
     * [encoded] says whether its path and host are percent-encoded, as a URL's are.
     */
    private static void transport(Server server, Map<String, String> query, String security, boolean encoded)
            throws Skipped {
        String type = lower(query.get("type"));
        String tls = lower(query.get("security"));
        if (tls.isEmpty()) tls = security;
        String flow = lower(query.get("flow"));
        if ("reality".equals(tls)) throw new Skipped(Skip.REALITY);
        if ("xtls".equals(tls) || (!flow.isEmpty() && !"none".equals(flow))) throw new Skipped(Skip.XTLS);
        switch (type) {
            case "":
            case "tcp":
            case "raw":
            case "original":
                if ("http".equals(lower(query.get("headertype")))) throw new Skipped(Skip.TCP_HEADERS);
                break;
            case "ws":
            case "websocket":
                server.ws = true;
                break;
            case "grpc":
            case "gun":
                throw new Skipped(Skip.GRPC);
            case "h2":
            case "http":
                throw new Skipped(Skip.HTTP2);
            case "quic":
                throw new Skipped(Skip.QUIC);
            case "kcp":
            case "mkcp":
                throw new Skipped(Skip.KCP);
            case "httpupgrade":
                throw new Skipped(Skip.HTTP_UPGRADE);
            case "xhttp":
            case "splithttp":
                throw new Skipped(Skip.XHTTP);
            default:
                throw new IllegalArgumentException("not a transport this reads");
        }
        switch (tls) {
            case "none":
                break;
            case "tls":
            case "ssl":
                server.tls = true;
                break;
            default:
                throw new IllegalArgumentException("not a security this reads");
        }
        if (server.ws) {
            String path = query.get("path");
            if (path != null && encoded) path = percentDecode(path);
            server.path = wsPath(path);
            String host = query.get("host");
            if (host != null && encoded) host = percentDecode(host);
            server.hostHeader = host == null || host.trim().isEmpty() ? "" : hostName(host.trim().split(",")[0].trim());
        }
        String sni = first(query, "sni", "peer", "servername");
        server.sni = sni.isEmpty() ? "" : hostName(sni);
        server.insecure = yes(query.get("allowinsecure")) || yes(query.get("insecure")) || yes(query.get("skip-cert-verify"));
        String alpn = query.get("alpn");
        if (alpn != null && !alpn.trim().isEmpty()) {
            List<String> protocols = new ArrayList<>();
            for (String each : percentDecode(alpn).split(",")) {
                String protocol = each.trim();
                if (ALPN.matcher(protocol).matches() && !protocols.contains(protocol)) protocols.add(protocol);
            }
            server.alpn = Collections.unmodifiableList(protocols);
        }
    }

    /** The path a WebSocket upgrade asks for, less Xray's early-data "ed" parameter, which this doesn't send. */
    static String wsPath(@Nullable String path) {
        if (path == null || path.trim().isEmpty()) return "/";
        String kept = path.trim();
        int question = kept.indexOf('?');
        if (question >= 0) {
            StringBuilder rest = new StringBuilder();
            for (String pair : kept.substring(question + 1).split("&")) {
                if (pair.isEmpty() || pair.toLowerCase(Locale.ROOT).startsWith("ed=")) continue;
                if (rest.length() > 0) rest.append('&');
                rest.append(pair);
            }
            kept = kept.substring(0, question) + (rest.length() > 0 ? "?" + rest : "");
        }
        if (!kept.startsWith("/")) kept = "/" + kept;
        for (int i = 0; i < kept.length(); i++) {
            char c = kept.charAt(i);
            if (c <= ' ' || c > '~') throw new IllegalArgumentException("not a path");
        }
        return kept;
    }

    // ---- URL pieces -----------------------------------------------------------------------------

    /** A link's user@host:port, query and name. */
    static final class Parts {
        String user = "";
        String host = "";
        int port;
        Map<String, String> query = Collections.emptyMap();
        String name = "";
    }

    static Parts url(String body) {
        Parts parts = new Parts();
        String rest = body;
        int hash = rest.indexOf('#');
        if (hash >= 0) {
            parts.name = name(rest.substring(hash + 1));
            rest = rest.substring(0, hash);
        }
        int question = rest.indexOf('?');
        if (question >= 0) {
            parts.query = query(rest.substring(question + 1));
            rest = rest.substring(0, question);
        }
        int at = rest.lastIndexOf('@');
        if (at <= 0) throw new IllegalArgumentException("no user");
        parts.user = rest.substring(0, at);
        rest = rest.substring(at + 1);
        int slash = rest.indexOf('/');
        if (slash >= 0) rest = rest.substring(0, slash);
        Server holder = new Server();
        hostAndPort(holder, rest);
        parts.host = holder.host;
        parts.port = holder.port;
        return parts;
    }

    private static void hostAndPort(Server server, String text) {
        String host;
        String port;
        if (text.startsWith("[")) {
            int end = text.indexOf(']');
            if (end < 0 || end + 1 >= text.length() || text.charAt(end + 1) != ':') {
                throw new IllegalArgumentException("no port");
            }
            host = text.substring(1, end);
            port = text.substring(end + 2);
        } else {
            int colon = text.lastIndexOf(':');
            if (colon <= 0) throw new IllegalArgumentException("no port");
            host = text.substring(0, colon);
            port = text.substring(colon + 1);
        }
        server.host = address(host);
        server.port = port(port);
    }

    private static String bracketed(String host) {
        return host.indexOf(':') >= 0 && !host.startsWith("[") ? "[" + host + "]" : host;
    }

    /** A host name or IP address, lowercased. */
    static String address(String host) {
        if (host.indexOf(':') >= 0) {
            if (!IPV6.matcher(host).matches()) throw new IllegalArgumentException("not an address");
            return host.toLowerCase(Locale.ROOT);
        }
        return hostName(host);
    }

    private static String hostName(String host) {
        if (!NAME_HOST.matcher(host).matches()) throw new IllegalArgumentException("not a host");
        return host.toLowerCase(Locale.ROOT);
    }

    private static int port(String text) {
        if (!PORT.matcher(text).matches()) throw new IllegalArgumentException("not a port");
        int port = Integer.parseInt(text);
        if (port < 1 || port > 65535) throw new IllegalArgumentException("not a port");
        return port;
    }

    /** A query's parameters by lowercased name, values percent-decoded. The first of a name wins. */
    private static Map<String, String> query(String text) {
        Map<String, String> query = new LinkedHashMap<>();
        for (String pair : text.split("&")) {
            if (pair.isEmpty()) continue;
            int equals = pair.indexOf('=');
            String key = (equals >= 0 ? pair.substring(0, equals) : pair).toLowerCase(Locale.ROOT);
            String value = equals >= 0 ? pair.substring(equals + 1) : "";
            // Keep the path and alpn encoded, since a path can hold an encoded "?" of its own.
            if (!"path".equals(key) && !"alpn".equals(key) && !"host".equals(key)) value = percentDecode(value);
            if (!query.containsKey(key)) query.put(key, value);
        }
        return query;
    }

    private static String afterQuestion(String text) {
        String rest = text.substring(text.indexOf('?') + 1);
        int hash = rest.indexOf('#');
        return hash >= 0 ? rest.substring(0, hash) : rest;
    }

    private static String fragment(String text) {
        int hash = text.indexOf('#');
        return hash >= 0 ? text.substring(hash + 1) : "";
    }

    private static int firstOf(String text, char a, char b) {
        int one = text.indexOf(a);
        int two = text.indexOf(b);
        if (one < 0) return two;
        if (two < 0) return one;
        return Math.min(one, two);
    }

    private static String first(Map<String, String> query, String... names) {
        for (String name : names) {
            String value = query.get(name);
            if (value != null && !value.trim().isEmpty()) return value.trim();
        }
        return "";
    }

    private static String lower(@Nullable String value) {
        return value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
    }

    private static boolean yes(@Nullable String value) {
        String asked = lower(value);
        return "1".equals(asked) || "true".equals(asked);
    }

    private static int parseInt(@Nullable String text, int otherwise) {
        if (text == null || text.trim().isEmpty()) return otherwise;
        try {
            return Integer.parseInt(text.trim());
        } catch (NumberFormatException notANumber) {
            throw new IllegalArgumentException("not a number");
        }
    }

    /** A server's name for the picker: decoded, without control characters, cut short. */
    private static String name(@Nullable String raw) {
        if (raw == null) return "";
        String decoded;
        try {
            decoded = percentDecode(raw);
        } catch (IllegalArgumentException notEncoded) {
            decoded = raw;
        }
        StringBuilder name = new StringBuilder();
        for (int i = 0; i < decoded.length() && name.length() < MAX_NAME; i++) {
            char c = decoded.charAt(i);
            name.append(Character.isISOControl(c) ? ' ' : c);
        }
        return name.toString().trim();
    }

    /** %XX sequences decoded as UTF-8. A "+" stays a "+", since passwords and base64 hold them. */
    static String percentDecode(String text) {
        if (text.indexOf('%') < 0) return text;
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(text.length());
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '%') {
                if (i + 2 >= text.length()) throw new IllegalArgumentException("cut short");
                int high = Character.digit(text.charAt(i + 1), 16);
                int low = Character.digit(text.charAt(i + 2), 16);
                if (high < 0 || low < 0) throw new IllegalArgumentException("not hex");
                bytes.write(high << 4 | low);
                i += 2;
            } else {
                byte[] encoded = String.valueOf(c).getBytes(StandardCharsets.UTF_8);
                bytes.write(encoded, 0, encoded.length);
            }
        }
        return new String(bytes.toByteArray(), StandardCharsets.UTF_8);
    }

    private static String base64Text(String text) {
        String decoded = base64TextOrNull(text);
        if (decoded == null) throw new IllegalArgumentException("not base64");
        return decoded;
    }

    /** [text] decoded from base64 in either alphabet, padded or not, or null. */
    @Nullable
    static String base64TextOrNull(String text) {
        String packed = percentDecodeQuietly(text).replaceAll("\\s+", "").replace('-', '+').replace('_', '/');
        if (packed.isEmpty()) return null;
        try {
            return new String(Base64.getDecoder().decode(packed), StandardCharsets.UTF_8);
        } catch (IllegalArgumentException notBase64) {
            return null;
        }
    }

    private static String percentDecodeQuietly(String text) {
        try {
            return percentDecode(text);
        } catch (IllegalArgumentException notEncoded) {
            return text;
        }
    }

    /** Whether ChaCha20-Poly1305 is there, once asked. A test sets false for a phone without it. */
    static volatile Boolean chacha;

    /** Whether this phone's crypto provider has ChaCha20-Poly1305, asked once. */
    private static boolean chacha() {
        Boolean known = chacha;
        if (known == null) chacha = known = V2RayCrypto.chachaAvailable();
        return known;
    }
}
