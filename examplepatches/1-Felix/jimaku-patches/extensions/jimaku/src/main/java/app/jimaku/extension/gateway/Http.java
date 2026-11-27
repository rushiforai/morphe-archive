package app.jimaku.extension.gateway;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.GZIPInputStream;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/**
 * A plain HTTP/1.1 request, GET or POST, written out by hand so it carries exactly the headers
 * listed here. The platform's HttpURLConnection adds cookies from any cookie handler the app
 * installs, and has no way to turn that off for one request. No redirects are followed.
 */
public final class Http {
    /** Subtitle documents of long videos, and YouTube's answers, stay well under this. */
    static final int MAX_BODY_BYTES = 8 * 1024 * 1024;
    private static final int MAX_HEADER_LINE = 8 * 1024;
    private static final boolean ON_ANDROID = "Dalvik".equals(System.getProperty("java.vm.name"));

    /** What to send: the method, the address, the headers past the fixed ones, and a POST's body. */
    public static final class Request {
        final String method;
        final URI url;
        final List<String[]> headers;
        final byte[] body;

        private Request(String method, URI url, List<String[]> headers, byte[] body) {
            this.method = method;
            this.url = url;
            this.headers = headers;
            this.body = body;
        }

        public static Request get(URI url) {
            return new Request("GET", url, Collections.emptyList(), null);
        }

        /** A POST of {@code body} as {@code contentType}, or of nothing where {@code body} is null. */
        public static Request post(URI url, String contentType, byte[] body) {
            List<String[]> headers = new ArrayList<>();
            if (body != null) headers.add(new String[]{"Content-Type", contentType});
            return new Request("POST", url, headers, body != null ? body : new byte[0]);
        }

        /** This request with one more header. */
        public Request with(String name, String value) {
            List<String[]> more = new ArrayList<>(headers);
            more.add(new String[]{name, value});
            return new Request(method, url, more, body);
        }
    }

    public static final class Response {
        public final int status;
        /** Header names in lower case. */
        public final Map<String, String> headers;
        public final byte[] body;

        Response(int status, Map<String, String> headers, byte[] body) {
            this.status = status;
            this.headers = headers;
            this.body = body;
        }

        public boolean ok() {
            return status >= 200 && status < 300;
        }

        public String text() {
            return new String(body, StandardCharsets.UTF_8);
        }
    }

    private Http() {
    }

    public static Response send(Request request, String userAgent, int timeoutMillis, Cancellation cancellation) throws IOException {
        URI url = request.url;
        String scheme = url.getScheme();
        boolean tls = "https".equals(scheme);
        if (!tls && !"http".equals(scheme)) throw new IOException("Unsupported scheme " + scheme);
        String host = url.getHost();
        int port = url.getPort() != -1 ? url.getPort() : tls ? 443 : 80;
        String path = url.getRawPath() + (url.getRawQuery() != null ? "?" + url.getRawQuery() : "");
        byte[] head = head(request, path, url.getPort() != -1 ? host + ":" + port : host, userAgent);

        Socket plain = new Socket();
        cancellation.attach(plain);
        Socket socket = plain;
        try {
            plain.connect(new InetSocketAddress(host, port), timeoutMillis);
            plain.setSoTimeout(timeoutMillis);
            if (tls) {
                SSLSocketFactory factory = (SSLSocketFactory) SSLSocketFactory.getDefault();
                SSLSocket ssl = (SSLSocket) factory.createSocket(plain, host, port, true);
                cancellation.attach(ssl);
                socket = ssl;
                SSLParameters parameters = ssl.getSSLParameters();
                parameters.setEndpointIdentificationAlgorithm("HTTPS");
                ssl.setSSLParameters(parameters);
                // The handshake checks the certificate names the host (endpoint identification).
                // Android's default verifier checks it again; a desktop JVM's refuses every host,
                // so the JVM tests rely on the handshake alone.
                ssl.startHandshake();
                if (ON_ANDROID && !HttpsURLConnection.getDefaultHostnameVerifier().verify(host, ssl.getSession())) {
                    throw new IOException("The certificate does not match " + host);
                }
            }

            OutputStream out = socket.getOutputStream();
            out.write(head);
            if (request.body != null) out.write(request.body);
            out.flush();

            InputStream in = new BufferedInputStream(socket.getInputStream());
            int status = readStatus(readLine(in));
            Map<String, String> headers = new HashMap<>();
            for (String line = readLine(in); !line.isEmpty(); line = readLine(in)) {
                int colon = line.indexOf(':');
                if (colon <= 0) throw new IOException("Malformed header");
                headers.put(line.substring(0, colon).trim().toLowerCase(Locale.ROOT), line.substring(colon + 1).trim());
            }
            return new Response(status, headers, decoded(readBody(in, headers), headers));
        } catch (IOException e) {
            if (cancellation.isCancelled()) throw new Cancellation.CancelledException();
            throw e;
        } finally {
            cancellation.detach(plain);
            cancellation.detach(socket);
            Cancellation.closeQuietly(socket);
            Cancellation.closeQuietly(plain);
        }
    }

    /** The request line and headers: Host, User-Agent, Accept, the request's own, a body's length, and Connection. */
    private static byte[] head(Request request, String path, String host, String userAgent) throws IOException {
        StringBuilder head = new StringBuilder(request.method).append(' ').append(path).append(" HTTP/1.1\r\n");
        header(head, "Host", host);
        header(head, "User-Agent", userAgent);
        header(head, "Accept", "application/json");
        for (String[] each : request.headers) header(head, each[0], each[1]);
        if (request.body != null) header(head, "Content-Length", String.valueOf(request.body.length));
        header(head, "Connection", "close");
        return head.append("\r\n").toString().getBytes(StandardCharsets.ISO_8859_1);
    }

    private static void header(StringBuilder head, String name, String value) throws IOException {
        // A value from an answer, as the install's secret is, can't add a header of its own.
        if (value.indexOf('\r') >= 0 || value.indexOf('\n') >= 0) throw new IOException("Malformed header value");
        head.append(name).append(": ").append(value).append("\r\n");
    }

    /** No request asks for compression; a body sent compressed anyway is unpacked. */
    private static byte[] decoded(byte[] body, Map<String, String> headers) throws IOException {
        String encoding = headers.get("content-encoding");
        // An empty answer has nothing to unpack, whatever its encoding says.
        if (body.length == 0 || encoding == null || !encoding.toLowerCase(Locale.ROOT).contains("gzip")) return body;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        copy(new GZIPInputStream(new ByteArrayInputStream(body)), out, -1);
        return out.toByteArray();
    }

    private static int readStatus(String line) throws IOException {
        String[] parts = line.split(" ", 3);
        if (parts.length < 2 || !parts[0].startsWith("HTTP/1.")) throw new IOException("Malformed status line");
        try {
            return Integer.parseInt(parts[1]);
        } catch (NumberFormatException e) {
            throw new IOException("Malformed status line");
        }
    }

    private static byte[] readBody(InputStream in, Map<String, String> headers) throws IOException {
        String transferEncoding = headers.get("transfer-encoding");
        if (transferEncoding != null && transferEncoding.toLowerCase(Locale.ROOT).contains("chunked")) {
            return readChunked(in);
        }
        String length = headers.get("content-length");
        if (length != null) {
            long size;
            try {
                size = Long.parseLong(length);
            } catch (NumberFormatException e) {
                throw new IOException("Malformed Content-Length");
            }
            if (size < 0 || size > MAX_BODY_BYTES) throw new IOException("Body too large");
            byte[] body = new byte[(int) size];
            readFully(in, body);
            return body;
        }
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        copy(in, body, -1);
        return body.toByteArray();
    }

    private static byte[] readChunked(InputStream in) throws IOException {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        while (true) {
            String line = readLine(in);
            int extension = line.indexOf(';');
            String hex = (extension >= 0 ? line.substring(0, extension) : line).trim();
            long size;
            try {
                size = Long.parseLong(hex, 16);
            } catch (NumberFormatException e) {
                throw new IOException("Malformed chunk size");
            }
            if (size < 0 || body.size() + size > MAX_BODY_BYTES) throw new IOException("Body too large");
            if (size == 0) {
                // Skip any trailers up to the empty line that ends the message.
                while (!readLine(in).isEmpty()) {
                    continue;
                }
                return body.toByteArray();
            }
            copy(in, body, size);
            if (!readLine(in).isEmpty()) throw new IOException("Malformed chunk");
        }
    }

    /** Copies {@code size} bytes, or everything up to the end of the stream when it is negative. */
    private static void copy(InputStream in, ByteArrayOutputStream out, long size) throws IOException {
        byte[] buffer = new byte[16 * 1024];
        long left = size;
        while (size < 0 || left > 0) {
            int want = size < 0 ? buffer.length : (int) Math.min(buffer.length, left);
            int read = in.read(buffer, 0, want);
            if (read < 0) {
                if (size < 0) return;
                throw new EOFException("Body ended early");
            }
            out.write(buffer, 0, read);
            left -= read;
            if (out.size() > MAX_BODY_BYTES) throw new IOException("Body too large");
        }
    }

    private static void readFully(InputStream in, byte[] into) throws IOException {
        int offset = 0;
        while (offset < into.length) {
            int read = in.read(into, offset, into.length - offset);
            if (read < 0) throw new EOFException("Body ended early");
            offset += read;
        }
    }

    /** One line ending in CRLF (or a bare LF), without the line ending. */
    private static String readLine(InputStream in) throws IOException {
        StringBuilder line = new StringBuilder();
        while (true) {
            int b = in.read();
            if (b < 0) throw new EOFException("Connection closed");
            if (b == '\n') break;
            if (line.length() >= MAX_HEADER_LINE) throw new IOException("Line too long");
            line.append((char) b);
        }
        int last = line.length() - 1;
        if (last >= 0 && line.charAt(last) == '\r') line.setLength(last);
        return line.toString();
    }
}
