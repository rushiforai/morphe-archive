package app.morphe.extension.tv360;

import android.net.Uri;

import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PushbackInputStream;
import java.util.zip.GZIPInputStream;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.SAXParserFactory;

/** Bounded M3U and optional XMLTV/EPG reader. Does not fetch URLs or decode video. */
final class Tv360IptvCatalog {
    static final int MAX_CHANNELS = 500;
    static final int MAX_M3U_BYTES = 2 * 1024 * 1024;
    static final int MAX_EPG_BYTES = 8 * 1024 * 1024;
    private static final int MAX_PROGRAMMES = 6000;
    private static final Pattern ATTRIBUTES = Pattern.compile(
            "([A-Za-z][A-Za-z0-9_-]*)\\s*=\\s*[\"']([^\"']*)[\"']");
    private static final Pattern XMLTV_DATE = Pattern.compile(
            "^(\\d{12}(?:\\d{2})?)(?:\\s+([+-]\\d{4}))?$");

    static final class Channel {
        final String name;
        final Uri uri;
        final String group;
        final String id;
        final String logo;

        Channel(String name, Uri uri, String group, String id, String logo) {
            this.name = name;
            this.uri = uri;
            this.group = group;
            this.id = id;
            this.logo = logo;
        }
    }

    static final class Playlist {
        final List<Channel> channels;
        final String guideUrl;

        Playlist(List<Channel> channels, String guideUrl) {
            this.channels = Collections.unmodifiableList(channels);
            this.guideUrl = guideUrl;
        }
    }

    static final class Programme {
        final String title;
        final long startMillis;
        final long stopMillis;

        Programme(String title, long startMillis, long stopMillis) {
            this.title = title;
            this.startMillis = startMillis;
            this.stopMillis = stopMillis;
        }
    }

    static final class Guide {
        private final Map<String, List<Programme>> byChannel;

        Guide(Map<String, List<Programme>> byChannel) {
            this.byChannel = byChannel;
        }

        Programme current(String channelId, long nowMillis) {
            List<Programme> events = byChannel.get(channelId);
            if (events == null) return null;
            for (Programme event : events) {
                if (event.startMillis <= nowMillis && event.stopMillis > nowMillis)
                    return event;
            }
            return null;
        }

        Programme next(String channelId, long nowMillis) {
            List<Programme> events = byChannel.get(channelId);
            if (events == null) return null;
            for (Programme event : events) {
                if (event.startMillis > nowMillis) return event;
            }
            return null;
        }

        int channelCount() { return byChannel.size(); }
    }

    private static final class BoundedInput extends FilterInputStream {
        private final long max;
        private long consumed;

        BoundedInput(InputStream source, long max) {
            super(source);
            this.max = max;
        }

        @Override public int read() throws IOException {
            int byteValue = super.read();
            if (byteValue >= 0 && ++consumed > max)
                throw new IOException("Source exceeds size limit");
            return byteValue;
        }

        @Override public int read(byte[] buffer, int offset, int length) throws IOException {
            int count = super.read(buffer, offset,
                    (int) Math.min((long) length, max - consumed + 1));
            if (count > 0 && (consumed += count) > max)
                throw new IOException("Source exceeds size limit");
            return count;
        }
    }

    private static Map<String, String> parseAttributes(String raw) {
        Map<String, String> result = new HashMap<>();
        Matcher matcher = ATTRIBUTES.matcher(raw);
        while (matcher.find())
            result.put(matcher.group(1).toLowerCase(Locale.ROOT), matcher.group(2).trim());
        return result;
    }

    static boolean isRemote(String value) {
        try {
            Uri uri = Uri.parse(value);
            String scheme = uri.getScheme();
            return ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme))
                    && uri.getHost() != null && !uri.getHost().isEmpty();
        } catch (RuntimeException error) {
            return false;
        }
    }

    static Playlist parsePlaylist(InputStream source) throws IOException {
        if (source == null) throw new IOException("Empty playlist");
        BufferedReader reader = new BufferedReader(new InputStreamReader(
                new BoundedInput(source, MAX_M3U_BYTES), StandardCharsets.UTF_8));
        List<Channel> channels = new ArrayList<>();
        String guideUrl = null;
        String title = "";
        String group = "Otros";
        String id = "";
        String logo = "";
        String line;
        boolean header = false;
        while ((line = reader.readLine()) != null) {
            String value = line.trim();
            if (value.startsWith("\uFEFF")) value = value.substring(1);
            if (value.startsWith("#EXTM3U")) {
                header = true;
                Map<String, String> headerAttrs = parseAttributes(value);
                String candidate = headerAttrs.containsKey("url-tvg")
                        ? headerAttrs.get("url-tvg") : headerAttrs.get("x-tvg-url");
                if (candidate != null && isRemote(candidate)) guideUrl = candidate;
                continue;
            }
            if (value.startsWith("#EXTINF:")) {
                int comma = value.lastIndexOf(',');
                title = comma >= 0 ? value.substring(comma + 1).trim() : "";
                Map<String, String> attrs = parseAttributes(value);
                group = fallback(attrs.get("group-title"), "Otros");
                id = fallback(attrs.get("tvg-id"), "");
                logo = fallback(attrs.get("tvg-logo"), "");
                if (title.isEmpty()) title = fallback(attrs.get("tvg-name"), "");
                continue;
            }
            if (value.startsWith("#EXTGRP:")) {
                group = fallback(value.substring("#EXTGRP:".length()), group);
                continue;
            }
            if (value.startsWith("#") || value.isEmpty()) continue;
            if (isRemote(value)) {
                if (!header) throw new IOException("M3U header missing");
                channels.add(new Channel(
                        fallback(title, "Canal " + (channels.size() + 1)),
                        Uri.parse(value), group, id, logo));
                title = "";
                group = "Otros";
                id = "";
                logo = "";
                if (channels.size() >= MAX_CHANNELS) break;
            }
        }
        if (!header || channels.isEmpty()) throw new IOException("No valid IPTV channels");
        return new Playlist(channels, guideUrl);
    }

    private static String fallback(String value, String defaultValue) {
        return value == null || value.trim().isEmpty() ? defaultValue : value.trim();
    }

    private static long xmltvDate(String raw) {
        if (raw == null) return -1L;
        Matcher match = XMLTV_DATE.matcher(raw.trim());
        if (!match.matches()) return -1L;
        String digits = match.group(1);
        if (digits.length() == 12) digits += "00";
        String zone = match.group(2);
        String value = digits + (zone == null ? "" : " " + zone);
        SimpleDateFormat parser = new SimpleDateFormat(
                zone == null ? "yyyyMMddHHmmss" : "yyyyMMddHHmmss Z", Locale.US);
        parser.setLenient(false);
        if (zone == null) parser.setTimeZone(TimeZone.getDefault());
        try {
            Date date = parser.parse(value);
            return date == null ? -1L : date.getTime();
        } catch (ParseException error) {
            return -1L;
        }
    }

    /** Secure SAX parsing; external entities, DTDs and network entities are disabled. */
    static Guide parseGuide(InputStream input, List<Channel> channels) throws Exception {
        if (input == null) throw new IOException("Empty EPG");
        Set<String> accepted = new HashSet<>();
        for (Channel channel : channels)
            if (!channel.id.isEmpty()) accepted.add(channel.id);
        if (accepted.isEmpty()) return new Guide(new HashMap<>());

        // Android's Expat SAX implementation doesn't support all Xerces feature
        // names. Read bounded, possibly gzipped XML first, reject any DTD or
        // entity declaration, and install a deny-all external entity resolver.
        PushbackInputStream probe = new PushbackInputStream(input, 2);
        int first = probe.read();
        int second = probe.read();
        if (second >= 0) probe.unread(second);
        if (first >= 0) probe.unread(first);
        InputStream decompressed = first == 0x1f && second == 0x8b
                ? new GZIPInputStream(probe) : probe;
        ByteArrayOutputStream collected = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int bytes;
        while ((bytes = decompressed.read(buffer)) != -1) {
            if (collected.size() + bytes > MAX_EPG_BYTES)
                throw new IOException("EPG XMLTV too large");
            collected.write(buffer, 0, bytes);
        }
        byte[] xml = collected.toByteArray();
        String documentHeaders = new String(xml, StandardCharsets.ISO_8859_1)
                .replace("\u0000", "").toUpperCase(Locale.ROOT);
        if (documentHeaders.contains("<!DOCTYPE") ||
                documentHeaders.contains("<!ENTITY"))
            throw new IOException("XMLTV DTD and custom entities are prohibited");

        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setNamespaceAware(false);
        factory.setValidating(false);
        XMLReader reader = factory.newSAXParser().getXMLReader();
        reader.setEntityResolver((publicId, systemId) -> {
            throw new SAXException("External XML resources are prohibited");
        });
        final Map<String, List<Programme>> output = new HashMap<>();
        reader.setContentHandler(new DefaultHandler() {
                    private String id;
                    private long start;
                    private long stop;
                    private StringBuilder title;
                    private boolean inTitle;
                    private int count;

                    @Override public void startElement(String uri, String local,
                            String name, Attributes attrs) throws SAXException {
                        if ("programme".equals(name)) {
                            id = attrs.getValue("channel");
                            start = xmltvDate(attrs.getValue("start"));
                            stop = xmltvDate(attrs.getValue("stop"));
                            title = new StringBuilder();
                            inTitle = false;
                        } else if ("title".equals(name) && id != null && accepted.contains(id)) {
                            inTitle = true;
                        }
                    }

                    @Override public void characters(char[] text, int offset, int length) {
                        if (inTitle && title != null && title.length() < 240)
                            title.append(text, offset, Math.min(length, 240 - title.length()));
                    }

                    @Override public void endElement(String uri, String local, String name)
                            throws SAXException {
                        if ("title".equals(name)) inTitle = false;
                        if (!"programme".equals(name)) return;
                        if (id != null && accepted.contains(id) && start >= 0 && stop > start) {
                            if (++count > MAX_PROGRAMMES)
                                throw new SAXException("EPG programme limit exceeded");
                            List<Programme> list = output.get(id);
                            if (list == null) {
                                list = new ArrayList<>();
                                output.put(id, list);
                            }
                            list.add(new Programme(title == null ? "" : title.toString().trim(),
                                    start, stop));
                        }
                        id = null;
                        title = null;
                        inTitle = false;
                    }
                });
        reader.parse(new InputSource(new ByteArrayInputStream(xml)));
        for (List<Programme> programmes : output.values())
            Collections.sort(programmes, Comparator.comparingLong(e -> e.startMillis));
        return new Guide(output);
    }

    private Tv360IptvCatalog() {}
}
