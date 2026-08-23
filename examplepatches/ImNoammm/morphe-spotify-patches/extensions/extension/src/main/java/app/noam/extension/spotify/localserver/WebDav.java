package app.noam.extension.spotify.localserver;

import android.net.Uri;
import android.util.Base64;
import android.util.Xml;

import org.xmlpull.v1.XmlPullParser;

import java.io.IOException;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

import app.noam.extension.spotify.Utils;

/**
 * A small WebDAV client, enough to walk a Nextcloud (or any WebDAV) music folder and read bytes out
 * of it. Nextcloud's files live under {@code /remote.php/dav/files/<user>/}, which is filled in
 * automatically when the user gives just the server address.
 */
public final class WebDav {

    private static final int CONNECT_TIMEOUT_MS = 15000;
    private static final int READ_TIMEOUT_MS = 30000;
    private static final int MAX_DEPTH = 6;

    private static final String[] AUDIO_EXTENSIONS =
            {".mp3", ".m4a", ".aac", ".flac", ".ogg", ".oga", ".opus", ".wav", ".mp4", ".m4b", ".wma"};

    private final String baseUrl;
    private final String username;
    private final String password;

    public WebDav(String baseUrl, String username, String password) {
        this.baseUrl = baseUrl;
        this.username = username;
        this.password = password;
    }

    /**
     * The collection URLs to try, in order, for the folder the user picked.
     *
     * A Nextcloud user normally gives just the server address, whose files actually live under
     * {@code /remote.php/dav/files/<user>/}. Any other WebDAV server serves them straight off the
     * address given. Both are tried rather than guessing from the URL alone.
     */
    public List<String> candidateRoots(String folder) {
        String base = baseUrl == null ? "" : baseUrl.trim();
        while (base.endsWith("/")) base = base.substring(0, base.length() - 1);

        String path = encodePath(folder);

        List<String> candidates = new ArrayList<>();
        candidates.add(base + path + "/");

        if (!base.contains("/remote.php/") && !base.contains("/dav/")) {
            candidates.add(base + "/remote.php/dav/files/"
                    + Uri.encode(username == null ? "" : username) + path + "/");
        }
        return candidates;
    }

    private static String encodePath(String folder) {
        String path = folder == null ? "" : folder.trim();
        if (path.isEmpty() || path.equals("/")) return "";
        while (path.endsWith("/")) path = path.substring(0, path.length() - 1);

        StringBuilder encoded = new StringBuilder();
        for (String segment : path.split("/")) {
            if (segment.isEmpty()) continue;
            encoded.append('/').append(Uri.encode(segment));
        }
        return encoded.toString();
    }

    /**
     * Lists every audio file in the user's folder, trying each candidate root until one answers.
     *
     * @throws IOException with the first failure if none of them do.
     */
    public List<RemoteTrack> listFolder(String folder) throws IOException {
        IOException lastFailure = null;

        for (String root : candidateRoots(folder)) {
            try {
                return listAudioFiles(root);
            } catch (IOException ex) {
                // Keep the latest: the first candidate is a guess, so its error is rarely the useful one.
                lastFailure = ex;
                Utils.log("Listing " + root + " failed: " + ex.getMessage());
            }
        }
        throw lastFailure != null ? lastFailure : new IOException("The folder could not be listed");
    }

    /** Recursively lists every audio file below {@code url}. */
    public List<RemoteTrack> listAudioFiles(String url) throws IOException {
        List<RemoteTrack> tracks = new ArrayList<>();
        collect(url, 0, tracks);
        return tracks;
    }

    private void collect(String url, int depth, List<RemoteTrack> tracks) throws IOException {
        if (depth > MAX_DEPTH) return;

        for (Entry entry : propfind(url)) {
            if (entry.isCollection) {
                collect(entry.url, depth + 1, tracks);
            } else if (isAudio(entry.name)) {
                RemoteTrack track = new RemoteTrack();
                track.url = entry.url;
                track.name = entry.name;
                track.size = entry.size;
                tracks.add(track);
            }
        }
    }

    private static boolean isAudio(String name) {
        String lower = name.toLowerCase(Locale.US);
        for (String extension : AUDIO_EXTENSIONS) {
            if (lower.endsWith(extension)) return true;
        }
        return false;
    }

    private static final class Entry {
        String url;
        String name;
        long size;
        boolean isCollection;
    }

    /**
     * Lists one collection.
     *
     * PROPFIND is sent over a socket rather than through HttpURLConnection. Android's implementation
     * is backed by OkHttp, which refuses the verb outright, and neither workaround survives contact
     * with a real server: forcing the inherited method field is silently ignored, so the request
     * leaves as a GET, and Nextcloud answers POST + X-HTTP-Method-Override with 501. Speaking
     * HTTP/1.1 directly is the only way to be sure the server sees a PROPFIND.
     */
    private List<Entry> propfind(String url) throws IOException {
        String body = "<?xml version=\"1.0\"?>"
                + "<d:propfind xmlns:d=\"DAV:\"><d:prop>"
                + "<d:resourcetype/><d:getcontentlength/><d:getcontenttype/>"
                + "</d:prop></d:propfind>";

        Response response = request(url, body);

        // Only 207 Multi-Status is a listing. A 200 here means something answered that is not
        // WebDAV — treating it as success is how an unnoticed GET looked like an empty folder.
        if (response.status != 207) {
            throw new IOException("PROPFIND returned HTTP " + response.status);
        }

        try {
            return parseMultiStatus(new ByteArrayInputStream(response.body), url);
        } catch (IOException ex) {
            throw ex;
        } catch (Exception ex) {
            throw new IOException("Could not read the folder listing: " + ex.getMessage(), ex);
        }
    }

    private static final class Response {
        int status;
        byte[] body;
    }

    /** Sends a PROPFIND over a socket and reads the whole response. */
    private Response request(String url, String body) throws IOException {
        Uri uri = Uri.parse(url);
        boolean secure = !"http".equalsIgnoreCase(uri.getScheme());
        int port = uri.getPort() > 0 ? uri.getPort() : (secure ? 443 : 80);
        String host = uri.getHost();

        String path = uri.getEncodedPath();
        if (path == null || path.isEmpty()) path = "/";
        if (uri.getEncodedQuery() != null) path = path + "?" + uri.getEncodedQuery();

        byte[] payload = body.getBytes(StandardCharsets.UTF_8);

        StringBuilder head = new StringBuilder();
        head.append("PROPFIND ").append(path).append(" HTTP/1.1\r\n");
        head.append("Host: ").append(host).append(secure && port != 443 || !secure && port != 80
                ? ":" + port : "").append("\r\n");
        head.append("Depth: 1\r\n");
        head.append("Content-Type: application/xml; charset=utf-8\r\n");
        head.append("Content-Length: ").append(payload.length).append("\r\n");
        head.append("Accept: */*\r\n");
        head.append("User-Agent: Morphe-LocalServer\r\n");
        if (username != null && !username.isEmpty()) {
            String credentials = username + ":" + (password == null ? "" : password);
            head.append("Authorization: Basic ").append(
                    Base64.encodeToString(credentials.getBytes(StandardCharsets.UTF_8), Base64.NO_WRAP))
                    .append("\r\n");
        }
        head.append("Connection: close\r\n\r\n");

        Socket socket = null;
        try {
            socket = new Socket();
            socket.connect(new InetSocketAddress(host, port), CONNECT_TIMEOUT_MS);
            socket.setSoTimeout(READ_TIMEOUT_MS);

            if (secure) {
                // Layering TLS over the connected socket keeps the connect timeout and still sends
                // the host as SNI, which shared hosts need to serve the right certificate.
                SSLSocket sslSocket = (SSLSocket) ((SSLSocketFactory) SSLSocketFactory.getDefault())
                        .createSocket(socket, host, port, true);
                sslSocket.startHandshake();

                if (!HttpsURLConnection.getDefaultHostnameVerifier()
                        .verify(host, sslSocket.getSession())) {
                    throw new IOException("The certificate does not match " + host);
                }
                socket = sslSocket;
            }

            OutputStream out = socket.getOutputStream();
            out.write(head.toString().getBytes(StandardCharsets.UTF_8));
            out.write(payload);
            out.flush();

            return readResponse(socket.getInputStream());
        } finally {
            if (socket != null) {
                try {
                    socket.close();
                } catch (IOException ignored) {
                    // The socket is being discarded either way.
                }
            }
        }
    }

    private Response readResponse(InputStream in) throws IOException {
        ByteArrayOutputStream raw = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int count;
        while ((count = in.read(buffer)) > 0) raw.write(buffer, 0, count);

        byte[] bytes = raw.toByteArray();
        int separator = indexOfHeaderEnd(bytes);
        if (separator < 0) throw new IOException("The server sent a malformed response");

        String headers = new String(bytes, 0, separator, StandardCharsets.ISO_8859_1);
        byte[] payload = new byte[bytes.length - (separator + 4)];
        System.arraycopy(bytes, separator + 4, payload, 0, payload.length);

        Response response = new Response();
        response.status = parseStatus(headers);
        response.body = headers.toLowerCase(Locale.US).contains("transfer-encoding: chunked")
                ? dechunk(payload)
                : payload;
        return response;
    }

    private static int indexOfHeaderEnd(byte[] bytes) {
        for (int i = 0; i + 3 < bytes.length; i++) {
            if (bytes[i] == '\r' && bytes[i + 1] == '\n' && bytes[i + 2] == '\r' && bytes[i + 3] == '\n') {
                return i;
            }
        }
        return -1;
    }

    private static int parseStatus(String headers) throws IOException {
        int firstSpace = headers.indexOf(' ');
        if (firstSpace < 0) throw new IOException("The server sent no status line");
        int secondSpace = headers.indexOf(' ', firstSpace + 1);
        if (secondSpace < 0) secondSpace = headers.indexOf('\r', firstSpace + 1);
        try {
            return Integer.parseInt(headers.substring(firstSpace + 1, secondSpace).trim());
        } catch (Exception ex) {
            throw new IOException("The server sent an unreadable status line");
        }
    }

    private static byte[] dechunk(byte[] payload) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int position = 0;
        while (position < payload.length) {
            int lineEnd = position;
            while (lineEnd + 1 < payload.length
                    && !(payload[lineEnd] == '\r' && payload[lineEnd + 1] == '\n')) {
                lineEnd++;
            }
            String sizeLine = new String(payload, position, lineEnd - position, StandardCharsets.ISO_8859_1).trim();
            int semicolon = sizeLine.indexOf(';');
            if (semicolon >= 0) sizeLine = sizeLine.substring(0, semicolon);

            int size;
            try {
                size = Integer.parseInt(sizeLine.trim(), 16);
            } catch (NumberFormatException ex) {
                break;
            }
            if (size <= 0) break;

            position = lineEnd + 2;
            if (position + size > payload.length) size = payload.length - position;
            out.write(payload, position, size);
            position += size + 2;
        }
        return out.toByteArray();
    }

    private List<Entry> parseMultiStatus(InputStream in, String requestUrl) throws Exception {
        List<Entry> entries = new ArrayList<>();

        XmlPullParser parser = Xml.newPullParser();
        parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
        parser.setInput(in, null);

        Entry current = null;
        String href = null;
        boolean inResourceType = false;
        String requestPath = Uri.parse(requestUrl).getPath();

        for (int event = parser.getEventType(); event != XmlPullParser.END_DOCUMENT; event = parser.next()) {
            String name = parser.getName();
            if (name == null) continue;

            if (event == XmlPullParser.START_TAG) {
                switch (name) {
                    case "response":
                        current = new Entry();
                        href = null;
                        break;
                    case "href":
                        href = parser.nextText().trim();
                        break;
                    case "resourcetype":
                        inResourceType = true;
                        break;
                    case "collection":
                        if (current != null && inResourceType) current.isCollection = true;
                        break;
                    case "getcontentlength":
                        if (current != null) {
                            try {
                                current.size = Long.parseLong(parser.nextText().trim());
                            } catch (Exception ignored) {
                                // A missing or unparsable length only affects the reported size.
                            }
                        }
                        break;
                    default:
                        break;
                }
            } else if (event == XmlPullParser.END_TAG) {
                if (name.equals("resourcetype")) {
                    inResourceType = false;
                } else if (name.equals("response") && current != null && href != null) {
                    String path = Uri.parse(href).getPath();
                    // The collection itself is always returned first; skip it.
                    if (path != null && !equalPaths(path, requestPath)) {
                        current.url = absolute(href);
                        current.name = Uri.decode(lastSegment(path));
                        entries.add(current);
                    }
                    current = null;
                }
            }
        }
        return entries;
    }

    private static boolean equalPaths(String a, String b) {
        return trimSlash(Uri.decode(a)).equals(trimSlash(Uri.decode(b == null ? "" : b)));
    }

    private static String trimSlash(String value) {
        while (value.endsWith("/")) value = value.substring(0, value.length() - 1);
        return value;
    }

    private static String lastSegment(String path) {
        String trimmed = trimSlash(path);
        int slash = trimmed.lastIndexOf('/');
        return slash < 0 ? trimmed : trimmed.substring(slash + 1);
    }

    /** Server responses give a path, not a full URL; put the scheme and host back. */
    private String absolute(String href) {
        if (href.startsWith("http://") || href.startsWith("https://")) return href;
        Uri base = Uri.parse(baseUrl);
        String authority = base.getScheme() + "://" + base.getAuthority();
        return authority + (href.startsWith("/") ? href : "/" + href);
    }

    /** Opens a byte range of a remote file. Pass {@code -1} as the end for "until EOF". */
    public HttpURLConnection openRange(String url, long from, long to) throws IOException {
        HttpURLConnection connection = open(url);
        connection.setRequestMethod("GET");
        if (from > 0 || to >= 0) {
            connection.setRequestProperty("Range", "bytes=" + from + "-" + (to >= 0 ? String.valueOf(to) : ""));
        }
        int status = connection.getResponseCode();
        if (status != HttpURLConnection.HTTP_OK && status != HttpURLConnection.HTTP_PARTIAL) {
            connection.disconnect();
            throw new IOException("GET returned HTTP " + status);
        }
        return connection;
    }

    private HttpURLConnection open(String url) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        connection.setInstanceFollowRedirects(true);
        if (username != null && !username.isEmpty()) {
            String credentials = username + ":" + (password == null ? "" : password);
            connection.setRequestProperty("Authorization", "Basic "
                    + Base64.encodeToString(credentials.getBytes(StandardCharsets.UTF_8), Base64.NO_WRAP));
        }
        return connection;
    }

    public static WebDav fromConfig() {
        return new WebDav(
                ServerConfig.getString(ServerConfig.KEY_URL, ""),
                ServerConfig.getString(ServerConfig.KEY_USERNAME, ""),
                ServerConfig.getString(ServerConfig.KEY_PASSWORD, ""));
    }
}
