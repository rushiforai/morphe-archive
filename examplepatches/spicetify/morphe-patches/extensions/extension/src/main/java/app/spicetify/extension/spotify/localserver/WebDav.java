package app.spicetify.extension.spotify.localserver;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.function.BooleanSupplier;
import java.util.regex.*;
import javax.net.ssl.*;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

/** Bounded WebDAV traversal and byte-exact reads; no persistent audio cache. */
public final class WebDav implements ProviderSession {
    static final int MAX_LISTING_BYTES = 2 * 1024 * 1024;
    static final int MAX_TRACKS = 500;
    private static final int TIMEOUT = 10000;
    private static final Pattern AUDIO_FILE = Pattern.compile(".*\\.(mp3|m4a|aac|flac|ogg|oga|opus|wav|mp4|m4b)$");
    private final ServerConnection config;
    private final BooleanSupplier active;
    private final StrictRangeReader reader;
    private long deadline = Long.MAX_VALUE;

    WebDav(ServerConnection config, BooleanSupplier active) {
        this.config = config; this.active = active;
        reader = new StrictRangeReader(config::resolve, config.authorization(), active, status -> {}, false);
    }
    private void check() throws IOException { if (!active.getAsBoolean() || Thread.currentThread().isInterrupted() || System.nanoTime() > deadline) throw new IOException("Server access was cancelled."); }

    @Override public List<RemoteTrack> scan() throws IOException {
        deadline = System.nanoTime() + 120_000_000_000L;
        List<RemoteTrack> tracks = new ArrayList<>();
        Set<String> trackIds = new HashSet<>();
        Set<URI> visited = new HashSet<>();
        ArrayDeque<Folder> folders = new ArrayDeque<>();
        folders.add(new Folder(config.root, 0));
        int entries = 0;
        while (!folders.isEmpty()) {
            check();
            if (System.nanoTime() > deadline) throw new IOException("The scan exceeded two minutes. Choose a smaller folder.");
            Folder folder = folders.remove();
            if (!visited.add(folder.url)) continue;
            if (visited.size() > 64) throw new IOException("The folder contains too many subfolders.");
            for (Entry entry : parseListing(propfind(folder.url), folder.url)) {
                if (++entries > 2000) throw new IOException("The folder contains too many entries.");
                if (entry.url.equals(folder.url)) continue;
                if (entry.collection) {
                    if (folder.depth >= 6) throw new IOException("The folder nesting exceeds six levels.");
                    if (folders.size() >= 64) throw new IOException("The folder contains too many subfolders.");
                    folders.add(new Folder(entry.url, folder.depth + 1));
                } else if (isAudio(entry.url.getPath())) {
                    if (tracks.size() == MAX_TRACKS) throw new IOException("Choose a folder with at most 500 audio files.");
                    if (entry.size <= 0 || entry.size > 2L * 1024 * 1024 * 1024) throw new IOException("Audio files must report a size between 1 byte and 2 GB.");
                    RemoteTrack track = new RemoteTrack(config, entry.url, entry.size, entry.etag);
                    if (trackIds.add(track.id)) tracks.add(track);
                }
            }
        }
        return tracks;
    }

    static boolean isAudio(String name) { return AUDIO_FILE.matcher(name.toLowerCase(Locale.ROOT)).matches(); }
    private static final class Folder {
        final URI url; final int depth;
        Folder(URI url, int depth) { this.url = url; this.depth = depth; }
    }
    static final class Entry {
        URI url; boolean collection; long size; String etag;
    }

    List<Entry> parseListing(byte[] body, URI request) throws IOException {
        if (body.length > MAX_LISTING_BYTES) throw new IOException("The folder listing is too large.");
        String xml = new String(body, StandardCharsets.UTF_8);
        String upper = xml.toUpperCase(Locale.ROOT);
        if (upper.contains("<!DOCTYPE") || upper.contains("<!ENTITY")) throw new IOException("XML document types and entities are not allowed.");
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(true);
            factory.setExpandEntityReferences(false);
            javax.xml.parsers.DocumentBuilder builder = factory.newDocumentBuilder();
            builder.setEntityResolver((publicId, systemId) -> { throw new org.xml.sax.SAXException("External entities are not allowed."); });
            Document doc = builder.parse(new InputSource(new StringReader(xml)));
            if (!"multistatus".equals(doc.getDocumentElement().getLocalName()) || !"DAV:".equals(doc.getDocumentElement().getNamespaceURI())) throw new IOException("Expected a WebDAV multistatus response.");
            NodeList responses = doc.getElementsByTagNameNS("DAV:", "response");
            if (responses.getLength() > 2000) throw new IOException("The folder listing has too many entries.");
            List<Entry> result = new ArrayList<>();
            for (int i = 0; i < responses.getLength(); i++) {
                Element response = (Element) responses.item(i);
                String href = text(response, "href");
                if (href.isEmpty()) throw new IOException("A WebDAV entry has no URL.");
                Entry entry = new Entry();
                entry.url = config.resolve(request, href);
                NodeList props = response.getElementsByTagNameNS("DAV:", "propstat");
                for (int j = 0; j < props.getLength(); j++) {
                    Element propstat = (Element) props.item(j);
                    if (!text(propstat, "status").matches("HTTP/1\\.[01] 200(?: .*)?")) continue;
                    entry.collection |= propstat.getElementsByTagNameNS("DAV:", "collection").getLength() > 0;
                    String length = text(propstat, "getcontentlength");
                    if (!length.isEmpty()) entry.size = Long.parseLong(length);
                    String etag = text(propstat, "getetag");
                    if (!etag.isEmpty()) entry.etag = etag;
                }
                if (entry.collection && !entry.url.getRawPath().endsWith("/")) entry.url = config.resolve(request, entry.url.toASCIIString() + "/");
                result.add(entry);
            }
            return result;
        } catch (IOException ex) { throw ex; }
        catch (Exception ex) { throw new IOException("The server returned an invalid or out-of-folder listing."); }
    }

    private static String text(Element element, String name) {
        Node node = element.getElementsByTagNameNS("DAV:", name).item(0);
        return node == null ? "" : node.getTextContent().trim();
    }

    private byte[] propfind(URI uri) throws IOException {
        check();
        uri = config.resolve(config.root, uri.toASCIIString());
        int port = uri.getPort() > 0 ? uri.getPort() : ("https".equals(uri.getScheme()) ? 443 : 80);
        byte[] payload = ("<?xml version=\"1.0\"?><d:propfind xmlns:d=\"DAV:\"><d:prop>"
                + "<d:resourcetype/><d:getcontentlength/><d:getetag/></d:prop></d:propfind>").getBytes(StandardCharsets.UTF_8);
        Socket socket = new Socket();
        try {
            socket.connect(new InetSocketAddress(uri.getHost(), port), TIMEOUT);
            socket.setSoTimeout(TIMEOUT);
            if ("https".equals(uri.getScheme())) {
                SSLSocket secure = (SSLSocket) ((SSLSocketFactory) SSLSocketFactory.getDefault()).createSocket(socket, uri.getHost(), port, true);
                socket = secure;
                SSLParameters params = secure.getSSLParameters();
                params.setEndpointIdentificationAlgorithm("HTTPS");
                secure.setSSLParameters(params);
                secure.startHandshake();
            }
            check();
            String auth = config.authorization();
            String header = "PROPFIND " + uri.getRawPath() + " HTTP/1.1\r\nHost: " + uri.getRawAuthority()
                    + "\r\nDepth: 1\r\nContent-Type: application/xml; charset=utf-8\r\nContent-Length: " + payload.length
                    + (auth == null ? "" : "\r\nAuthorization: " + auth) + "\r\nConnection: close\r\n\r\n";
            OutputStream out = socket.getOutputStream();
            out.write(header.getBytes(StandardCharsets.ISO_8859_1)); out.write(payload); out.flush();
            InputStream in = new BufferedInputStream(socket.getInputStream());
            String status = line(in);
            if (!status.matches("HTTP/1\\.[01] 207(?: .*)?")) throw new IOException("The server did not return a WebDAV listing. Check the folder URL and credentials.");
            Map<String, String> headers = new HashMap<>();
            int headerBytes = status.length();
            for (String value = line(in); !value.isEmpty(); value = line(in)) {
                headerBytes += value.length();
                if (headerBytes > 16384) throw new IOException("Response headers are too large.");
                int colon = value.indexOf(':');
                if (colon < 1) throw new IOException("Invalid response header.");
                String key = value.substring(0, colon).toLowerCase(Locale.ROOT);
                if (key.equals("content-length") || key.equals("transfer-encoding") || key.equals("content-encoding")) {
                    if (headers.put(key, value.substring(colon + 1).trim()) != null)
                        throw new IOException("Duplicate response framing header.");
                }
            }
            String transfer = headers.get("transfer-encoding");
            if (transfer != null && !transfer.equalsIgnoreCase("chunked")) throw new IOException("Unsupported transfer encoding.");
            if (headers.containsKey("content-encoding") && !headers.get("content-encoding").equalsIgnoreCase("identity")) throw new IOException("Compressed listings are not supported.");
            ByteArrayOutputStream body = new ByteArrayOutputStream();
            if (transfer != null) {
                while (true) {
                    int count;
                    try { count = Integer.parseInt(line(in).split(";", 2)[0].trim(), 16); }
                    catch (NumberFormatException ex) { throw new IOException("Invalid chunk length."); }
                    if (count < 0 || count > MAX_LISTING_BYTES - body.size()) throw new IOException("The folder listing is too large.");
                    if (count == 0) break;
                    copy(in, body, count);
                    if (!line(in).isEmpty()) throw new IOException("Invalid chunk terminator.");
                }
            } else if (headers.containsKey("content-length")) {
                long length;
                try { length = Long.parseLong(headers.get("content-length")); }
                catch (NumberFormatException ex) { throw new IOException("Invalid content length."); }
                if (length < 0 || length > MAX_LISTING_BYTES) throw new IOException("The folder listing is too large.");
                copy(in, body, (int) length);
            } else {
                byte[] buffer = new byte[8192]; int count;
                while ((count = in.read(buffer)) != -1) {
                    check();
                    if (body.size() + count > MAX_LISTING_BYTES) throw new IOException("The folder listing is too large.");
                    body.write(buffer, 0, count);
                }
            }
            check();
            return body.toByteArray();
        } finally { socket.close(); }
    }

    private void copy(InputStream in, ByteArrayOutputStream out, int size) throws IOException {
        byte[] buffer = new byte[8192];
        while (size > 0) {
            check(); int count = in.read(buffer, 0, Math.min(buffer.length, size));
            if (count < 0) throw new EOFException("Truncated listing.");
            out.write(buffer, 0, count); size -= count;
        }
    }
    private String line(InputStream in) throws IOException {
        ByteArrayOutputStream line = new ByteArrayOutputStream();
        while (line.size() < 8192) {
            check();
            int c = in.read();
            if (c < 0) throw new EOFException("Truncated response.");
            if (c == '\r') { if (in.read() != '\n') throw new IOException("Malformed response."); return line.toString("ISO-8859-1"); }
            line.write(c);
        }
        throw new IOException("Response line is too long.");
    }

    @Override public int read(RemoteTrack track, long offset, int size, byte[] data) throws IOException {
        return reader.read(track.url, track.size, track.etag, offset, size, data);
    }
}
