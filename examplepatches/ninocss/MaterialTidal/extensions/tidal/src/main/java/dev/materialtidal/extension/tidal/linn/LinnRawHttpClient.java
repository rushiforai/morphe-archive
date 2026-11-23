package dev.materialtidal.extension.tidal.linn;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.DatagramSocket;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Lightweight raw-{@link Socket} HTTP/1.1 &amp; SOAP client for local LAN UPnP/OpenHome calls.
 * <p>
 * Bypasses Android's {@code network_security_config} cleartext restriction cleanly on
 * {@code targetSdk=36} without altering the APK's security policy or HTTPS behaviour.
 */
public final class LinnRawHttpClient {

    public static final int DEFAULT_CONNECT_TIMEOUT_MS = 3000;
    public static final int DEFAULT_READ_TIMEOUT_MS = 5000;

    public static final class HttpResponse {
        public final int statusCode;
        public final String body;

        HttpResponse(int statusCode, String body) {
            this.statusCode = statusCode;
            this.body = body != null ? body : "";
        }

        public boolean isSuccessful() {
            return statusCode >= 200 && statusCode < 300;
        }
    }

    private LinnRawHttpClient() {
    }

    public static HttpResponse get(String url) throws IOException {
        return execute("GET", url, null, null, DEFAULT_CONNECT_TIMEOUT_MS, DEFAULT_READ_TIMEOUT_MS);
    }

    public static HttpResponse soapPost(
            String url,
            String serviceType,
            String action,
            String innerBodyXml
    ) throws IOException {
        return soapPost(url, serviceType, action, innerBodyXml,
                DEFAULT_CONNECT_TIMEOUT_MS, DEFAULT_READ_TIMEOUT_MS);
    }

    public static HttpResponse soapPost(
            String url,
            String serviceType,
            String action,
            String innerBodyXml,
            int connectTimeoutMs,
            int readTimeoutMs
    ) throws IOException {
        String envelope = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                + "<s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\" "
                + "s:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                + "<s:Body>"
                + "<u:" + action + " xmlns:u=\"" + serviceType + "\">"
                + (innerBodyXml != null ? innerBodyXml : "")
                + "</u:" + action + ">"
                + "</s:Body>"
                + "</s:Envelope>";
        String soapAction = "\"" + serviceType + "#" + action + "\"";
        return execute("POST", url, soapAction, envelope.getBytes(StandardCharsets.UTF_8),
                connectTimeoutMs, readTimeoutMs);
    }

    private static HttpResponse execute(
            String method,
            String url,
            String soapAction,
            byte[] bodyBytes,
            int connectTimeoutMs,
            int readTimeoutMs
    ) throws IOException {
        URI uri = URI.create(url);
        String host = uri.getHost();
        if (host == null || host.isEmpty()) {
            throw new IOException("Invalid URL host: " + url);
        }
        int port = uri.getPort() > 0 ? uri.getPort() : 80;
        String path = uri.getRawPath();
        if (path == null || path.isEmpty()) {
            path = "/";
        }
        if (uri.getRawQuery() != null && !uri.getRawQuery().isEmpty()) {
            path = path + "?" + uri.getRawQuery();
        }
        String hostHeader = (port == 80) ? host : (host + ":" + port);

        try (Socket socket = new Socket()) {
            socket.connect(new InetSocketAddress(host, port), Math.max(100, connectTimeoutMs));
            socket.setSoTimeout(Math.max(100, readTimeoutMs));

            StringBuilder req = new StringBuilder(256);
            req.append(method).append(' ').append(path).append(" HTTP/1.1\r\n");
            req.append("Host: ").append(hostHeader).append("\r\n");
            req.append("Connection: close\r\n");
            if (soapAction != null) {
                req.append("Content-Type: text/xml; charset=\"utf-8\"\r\n");
                req.append("SOAPACTION: ").append(soapAction).append("\r\n");
                req.append("Content-Length: ").append(bodyBytes != null ? bodyBytes.length : 0).append("\r\n");
            }
            req.append("\r\n");

            OutputStream out = socket.getOutputStream();
            out.write(req.toString().getBytes(StandardCharsets.US_ASCII));
            if (bodyBytes != null && bodyBytes.length > 0) {
                out.write(bodyBytes);
            }
            out.flush();

            return readResponse(socket.getInputStream());
        }
    }

    private static HttpResponse readResponse(InputStream rawIn) throws IOException {
        BufferedInputStream in = new BufferedInputStream(rawIn, 8192);
        String headersBlock = readHeaderBlock(in);
        if (headersBlock.isEmpty()) {
            throw new IOException("Empty HTTP response from OpenHome device");
        }

        String[] lines = headersBlock.split("\r?\n");
        int statusCode = parseStatusCode(lines[0]);
        int contentLength = -1;
        boolean chunked = false;

        for (int i = 1; i < lines.length; i++) {
            int colon = lines[i].indexOf(':');
            if (colon <= 0) {
                continue;
            }
            String name = lines[i].substring(0, colon).trim().toLowerCase(Locale.ROOT);
            String value = lines[i].substring(colon + 1).trim();
            if ("content-length".equals(name)) {
                try {
                    contentLength = Integer.parseInt(value);
                } catch (NumberFormatException ignored) {
                }
            } else if ("transfer-encoding".equals(name) && value.toLowerCase(Locale.ROOT).contains("chunked")) {
                chunked = true;
            }
        }

        byte[] payload;
        if (chunked) {
            payload = readChunkedBody(in);
        } else if (contentLength >= 0) {
            payload = readFixedLength(in, contentLength);
        } else {
            payload = readUntilEof(in);
        }
        return new HttpResponse(statusCode, new String(payload, StandardCharsets.UTF_8));
    }

    private static String readHeaderBlock(InputStream in) throws IOException {
        ByteArrayOutputStream headerBytes = new ByteArrayOutputStream(512);
        int state = 0; // tracks \r\n\r\n or \n\n
        int b;
        while ((b = in.read()) != -1) {
            headerBytes.write(b);
            if (headerBytes.size() > 65536) {
                throw new IOException("HTTP response headers too large");
            }
            if (b == '\r') {
                if (state == 0) state = 1;
                else if (state == 2) state = 3;
                else state = 1;
            } else if (b == '\n') {
                if (state == 1) state = 2;
                else if (state == 3) break;
                else if (state == 4) break;
                else state = 4;
            } else {
                state = 0;
            }
        }
        return headerBytes.toString(StandardCharsets.ISO_8859_1.name());
    }

    private static int parseStatusCode(String statusLine) {
        String[] parts = statusLine.trim().split("\\s+");
        if (parts.length >= 2) {
            try {
                return Integer.parseInt(parts[1]);
            } catch (NumberFormatException ignored) {
            }
        }
        return 0;
    }

    private static byte[] readFixedLength(InputStream in, int len) throws IOException {
        byte[] buf = new byte[len];
        int offset = 0;
        while (offset < len) {
            int n = in.read(buf, offset, len - offset);
            if (n < 0) {
                byte[] partial = new byte[offset];
                System.arraycopy(buf, 0, partial, 0, offset);
                return partial;
            }
            offset += n;
        }
        return buf;
    }

    private static byte[] readChunkedBody(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(4096);
        while (true) {
            String line = readAsciiLine(in);
            if (line == null) {
                break;
            }
            int semi = line.indexOf(';');
            String hex = (semi >= 0 ? line.substring(0, semi) : line).trim();
            if (hex.isEmpty()) {
                continue;
            }
            int chunkSize;
            try {
                chunkSize = Integer.parseInt(hex, 16);
            } catch (NumberFormatException e) {
                break;
            }
            if (chunkSize <= 0) {
                break;
            }
            byte[] chunk = readFixedLength(in, chunkSize);
            out.write(chunk, 0, chunk.length);
            readAsciiLine(in); // trailing CRLF
        }
        return out.toByteArray();
    }

    private static String readAsciiLine(InputStream in) throws IOException {
        ByteArrayOutputStream sb = new ByteArrayOutputStream(32);
        int b;
        boolean any = false;
        while ((b = in.read()) != -1) {
            any = true;
            if (b == '\n') {
                break;
            }
            if (b != '\r') {
                sb.write(b);
            }
        }
        return any ? sb.toString(StandardCharsets.US_ASCII.name()) : null;
    }

    private static byte[] readUntilEof(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(4096);
        byte[] buf = new byte[4096];
        int n;
        while ((n = in.read(buf)) != -1) {
            out.write(buf, 0, n);
        }
        return out.toByteArray();
    }

    public static String resolveUrl(String baseUrl, String relativeOrAbsolute) {
        if (relativeOrAbsolute == null || relativeOrAbsolute.trim().isEmpty()) {
            return null;
        }
        String trimmed = relativeOrAbsolute.trim();
        if (trimmed.startsWith("http://") || trimmed.startsWith("https://")) {
            return trimmed;
        }
        try {
            URI base = URI.create(baseUrl);
            if (!trimmed.startsWith("/")) {
                trimmed = "/" + trimmed;
            }
            return base.resolve(trimmed).toString();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Resolves the phone's LAN IPv4 address used to reach {@code targetHost} (without Location permission).
     */
    public static String resolveLocalIpv4ForTarget(String targetHost) {
        if (targetHost != null && !targetHost.isEmpty()) {
            try (DatagramSocket sock = new DatagramSocket()) {
                sock.connect(InetAddress.getByName(targetHost), 1900);
                InetAddress local = sock.getLocalAddress();
                if (local instanceof Inet4Address && !local.isLoopbackAddress() && !local.isAnyLocalAddress()) {
                    return local.getHostAddress();
                }
            } catch (Exception ignored) {
            }
        }
        try {
            String fallback = null;
            Enumeration<NetworkInterface> ifaces = NetworkInterface.getNetworkInterfaces();
            while (ifaces != null && ifaces.hasMoreElements()) {
                NetworkInterface ni = ifaces.nextElement();
                if (!ni.isUp() || ni.isLoopback() || ni.isVirtual()) {
                    continue;
                }
                Enumeration<InetAddress> addrs = ni.getInetAddresses();
                while (addrs.hasMoreElements()) {
                    InetAddress addr = addrs.nextElement();
                    if (addr instanceof Inet4Address && !addr.isLoopbackAddress() && addr.isSiteLocalAddress()) {
                        String name = ni.getName() != null ? ni.getName().toLowerCase(Locale.ROOT) : "";
                        if (name.startsWith("wlan") || name.startsWith("eth")) {
                            return addr.getHostAddress();
                        }
                        if (fallback == null) {
                            fallback = addr.getHostAddress();
                        }
                    }
                }
            }
            if (fallback != null) {
                return fallback;
            }
        } catch (Exception ignored) {
        }
        return "127.0.0.1";
    }

    public static String escapeXml(String text) {
        if (text == null || text.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder(text.length() + 16);
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            switch (c) {
                case '&':
                    sb.append("&amp;");
                    break;
                case '<':
                    sb.append("&lt;");
                    break;
                case '>':
                    sb.append("&gt;");
                    break;
                case '"':
                    sb.append("&quot;");
                    break;
                case '\'':
                    sb.append("&apos;");
                    break;
                default:
                    if (c >= 0x20 || c == '\t' || c == '\n' || c == '\r') {
                        sb.append(c);
                    }
                    break;
            }
        }
        return sb.toString();
    }

    public static String unescapeXml(String xml) {
        if (xml == null || xml.isEmpty()) {
            return "";
        }
        return xml
                .replace("&lt;", "<")
                .replace("&gt;", ">")
                .replace("&quot;", "\"")
                .replace("&apos;", "'")
                .replace("&#39;", "'")
                .replace("&amp;", "&");
    }

    /**
     * Extracts the text content of the first matching XML tag (ignoring optional namespace prefix).
     */
    public static String extractTagValue(String xml, String tagName) {
        if (xml == null || xml.isEmpty() || tagName == null || tagName.isEmpty()) {
            return null;
        }
        String q = Pattern.quote(tagName);
        Pattern p = Pattern.compile(
                "<(?:[A-Za-z0-9_.-]+:)?" + q + "(?:\\s[^>]*)?>(.*?)</(?:[A-Za-z0-9_.-]+:)?" + q + ">",
                Pattern.CASE_INSENSITIVE | Pattern.DOTALL
        );
        Matcher m = p.matcher(xml);
        if (m.find()) {
            return unescapeXml(m.group(1)).trim();
        }
        return null;
    }
}
