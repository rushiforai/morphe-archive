package app.afterglow.extension.settings;

import android.util.Xml;
import org.xmlpull.v1.XmlPullParser;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Bounded XML/binary plist values; never instantiates classes from keyed archives. */
public final class PropertyList {
    public static final int MAX_BYTES = 8 * 1024 * 1024;
    private static final int MAX_DEPTH = 32, MAX_NODES = 100000;
    private PropertyList() {}

    public static Object read(byte[] data) throws Exception {
        if (data.length == 0 || data.length > MAX_BYTES) throw invalid();
        if (data.length >= 8 && new String(data, 0, 8, StandardCharsets.US_ASCII).equals("bplist00"))
            return new Binary(data).read();
        XmlPullParser parser = Xml.newPullParser();
        try { parser.setFeature(XmlPullParser.FEATURE_PROCESS_DOCDECL, false); }
        catch (org.xmlpull.v1.XmlPullParserException unsupported) {
            // Older KXML has no DTD support and rejects even an explicit false.
            if (parser.getFeature(XmlPullParser.FEATURE_PROCESS_DOCDECL)) throw unsupported;
        }
        parser.setInput(new ByteArrayInputStream(data), null);
        int event;
        do { event = parser.next(); } while (event != XmlPullParser.START_TAG && event != XmlPullParser.END_DOCUMENT);
        if (event != XmlPullParser.START_TAG) throw invalid();
        boolean wrapped = "plist".equals(parser.getName());
        if (wrapped && parser.nextTag() != XmlPullParser.START_TAG) throw invalid();
        Object result = xmlValue(parser, new Budget(), 0);
        if (wrapped && (parser.nextTag() != XmlPullParser.END_TAG || !"plist".equals(parser.getName()))) throw invalid();
        while ((event = parser.next()) != XmlPullParser.END_DOCUMENT) {
            if (event == XmlPullParser.START_TAG || event == XmlPullParser.END_TAG
                    || (event == XmlPullParser.TEXT && !parser.isWhitespace())) throw invalid();
        }
        return result;
    }

    private static Object xmlValue(XmlPullParser parser, Budget budget, int depth) throws Exception {
        budget.use(depth);
        String tag = parser.getName();
        switch (tag) {
            case "dict": {
                Map<String, Object> result = new LinkedHashMap<>();
                while (parser.nextTag() == XmlPullParser.START_TAG) {
                    if (!"key".equals(parser.getName())) throw invalid();
                    budget.use(depth + 1);
                    String key = parser.nextText();
                    if (result.containsKey(key) || parser.nextTag() != XmlPullParser.START_TAG) throw invalid();
                    result.put(key, xmlValue(parser, budget, depth + 1));
                }
                if (!"dict".equals(parser.getName())) throw invalid();
                return result;
            }
            case "array": {
                List<Object> result = new ArrayList<>();
                while (parser.nextTag() == XmlPullParser.START_TAG) result.add(xmlValue(parser, budget, depth + 1));
                if (!"array".equals(parser.getName())) throw invalid();
                return result;
            }
            case "string": return parser.nextText();
            case "data": return Base64.getDecoder().decode(parser.nextText().replaceAll("[\\t\\r\\n ]", ""));
            case "integer": return integer(new BigInteger(parser.nextText().trim()));
            case "real": {
                String text = parser.nextText().trim();
                if (text.equalsIgnoreCase("nan")) return Double.NaN;
                if (text.equalsIgnoreCase("+infinity") || text.equalsIgnoreCase("infinity")) return Double.POSITIVE_INFINITY;
                if (text.equalsIgnoreCase("-infinity")) return Double.NEGATIVE_INFINITY;
                return Double.parseDouble(text);
            }
            case "date": return Instant.parse(parser.nextText().trim());
            case "true": case "false":
                if (!parser.nextText().trim().isEmpty()) throw invalid();
                return "true".equals(tag);
            default: throw invalid();
        }
    }

    /** Canonical XML keeps data, dates, nested records and integer precision intact. */
    public static byte[] write(Object value) throws IOException {
        StringBuilder out = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                + "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n"
                + "<plist version=\"1.0\">\n");
        append(out, value, new Budget(), 0);
        out.append("</plist>\n");
        byte[] bytes = out.toString().getBytes(StandardCharsets.UTF_8);
        if (bytes.length > MAX_BYTES) throw new IOException("Preferences file is too large.");
        return bytes;
    }

    private static void append(StringBuilder out, Object value, Budget budget, int depth) throws IOException {
        budget.use(depth);
        if (value instanceof Map) {
            out.append("<dict>\n");
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) value).entrySet()) {
                if (!(entry.getKey() instanceof String)) throw invalid();
                budget.use(depth + 1);
                out.append("<key>").append(escape((String) entry.getKey())).append("</key>\n");
                append(out, entry.getValue(), budget, depth + 1);
            }
            out.append("</dict>\n");
        } else if (value instanceof Iterable) {
            out.append("<array>\n");
            for (Object item : (Iterable<?>) value) append(out, item, budget, depth + 1);
            out.append("</array>\n");
        } else if (value instanceof String) out.append("<string>").append(escape((String) value)).append("</string>\n");
        else if (value instanceof Boolean) out.append((Boolean) value ? "<true/>\n" : "<false/>\n");
        else if (value instanceof byte[]) out.append("<data>").append(Base64.getEncoder().encodeToString((byte[]) value)).append("</data>\n");
        else if (value instanceof Instant) out.append("<date>").append(value).append("</date>\n");
        else if (value instanceof Float || value instanceof Double) out.append("<real>").append(value).append("</real>\n");
        else if (value instanceof Byte || value instanceof Short || value instanceof Integer || value instanceof Long || value instanceof BigInteger)
            out.append("<integer>").append(value).append("</integer>\n");
        else throw invalid();
        if (out.length() > MAX_BYTES) throw new IOException("Preferences file is too large.");
    }

    private static String escape(String text) throws IOException {
        for (int i = 0; i < text.length();) {
            int c = text.codePointAt(i);
            if (!(c == 9 || c == 10 || c == 13 || (c >= 32 && c <= 0xD7FF)
                    || (c >= 0xE000 && c <= 0xFFFD) || (c >= 0x10000 && c <= 0x10FFFF))) throw invalid();
            i += Character.charCount(c);
        }
        return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\r", "&#13;");
    }

    private static Number integer(BigInteger value) {
        return value.bitLength() < 64 ? value.longValue() : value;
    }
    private static IOException invalid() { return new IOException("Invalid property list."); }
    private static final class Budget {
        int nodes;
        void use(int depth) throws IOException { if (depth > MAX_DEPTH || ++nodes > MAX_NODES) throw invalid(); }
    }

    /** Format reference: apple-oss-distributions/CF, CFBinaryPList.c object/trailer layout. */
    private static final class Binary {
        final byte[] bytes;
        final int[] offsets;
        final Object[] objects;
        final byte[] states;
        final int refs, table, top;
        final Budget budget = new Budget();

        Binary(byte[] data) throws IOException {
            bytes = data;
            if (data.length < 41) throw invalid();
            int trailer = data.length - 32, width = data[trailer + 6] & 255;
            refs = data[trailer + 7] & 255;
            if (width < 1 || width > 8 || refs < 1 || refs > 8) throw invalid();
            int count = index(unsigned(trailer + 8, 8));
            top = index(unsigned(trailer + 16, 8));
            table = index(unsigned(trailer + 24, 8));
            if (count < 1 || count > MAX_NODES || top >= count || table < 9
                    || (long) table + (long) count * width != trailer) throw invalid();
            offsets = new int[count]; objects = new Object[count]; states = new byte[count];
            for (int i = 0; i < count; i++) {
                offsets[i] = index(unsigned(table + i * width, width));
                if (offsets[i] < 8 || offsets[i] >= table) throw invalid();
            }
        }

        Object read() throws Exception { return object(top, 0); }

        Object object(int ref, int depth) throws Exception {
            budget.use(depth);
            if (ref < 0 || ref >= offsets.length || states[ref] == 1) throw invalid();
            if (states[ref] == 2) return objects[ref];
            states[ref] = 1;
            int pos = offsets[ref], marker = bytes[pos++] & 255, kind = marker >>> 4, small = marker & 15;
            Object result;
            if (marker == 8 || marker == 9) result = marker == 9;
            else if (kind == 1) {
                if (small > 4) throw invalid();
                int size = 1 << small; range(pos, size);
                BigInteger number = size < 8 ? new BigInteger(1, Arrays.copyOfRange(bytes, pos, pos + size))
                        : new BigInteger(Arrays.copyOfRange(bytes, pos, pos + size));
                result = integer(number);
            } else if (marker == 0x22 || marker == 0x23 || marker == 0x33) {
                int size = marker == 0x22 ? 4 : 8; range(pos, size);
                double value = size == 4 ? ByteBuffer.wrap(bytes, pos, size).getFloat() : ByteBuffer.wrap(bytes, pos, size).getDouble();
                if (marker == 0x33) {
                    if (!Double.isFinite(value) || Math.abs(value) > 31556889864403199d) throw invalid();
                    long seconds = (long) Math.floor(value);
                    result = Instant.ofEpochSecond(Math.addExact(seconds, 978307200L), Math.round((value - seconds) * 1_000_000_000));
                } else result = value;
            } else if (kind == 8) {
                int size = small + 1;
                if (size > 8) throw invalid();
                range(pos, size);
                result = Collections.singletonMap("CF$UID", integer(new BigInteger(1, Arrays.copyOfRange(bytes, pos, pos + size))));
            } else if (kind == 4 || kind == 5 || kind == 6 || kind == 10 || kind == 13) {
                int count = small;
                if (small == 15) {
                    range(pos, 1);
                    int lengthMarker = bytes[pos++] & 255;
                    if ((lengthMarker >>> 4) != 1 || (lengthMarker & 15) > 3) throw invalid();
                    int size = 1 << (lengthMarker & 15); range(pos, size);
                    count = index(unsigned(pos, size)); pos += size;
                }
                if (kind == 4) { range(pos, count); result = Arrays.copyOfRange(bytes, pos, pos + count); }
                else if (kind == 5 || kind == 6) {
                    long size = (long) count * (kind == 6 ? 2 : 1); range(pos, size);
                    result = (kind == 6 ? StandardCharsets.UTF_16BE : StandardCharsets.US_ASCII).newDecoder()
                            .onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT)
                            .decode(ByteBuffer.wrap(bytes, pos, (int) size)).toString();
                } else {
                    if (count > MAX_NODES) throw invalid();
                    range(pos, (long) count * refs * (kind == 13 ? 2 : 1));
                    if (kind == 10) {
                        List<Object> values = new ArrayList<>(count);
                        for (int i = 0; i < count; i++) values.add(object(index(unsigned(pos + i * refs, refs)), depth + 1));
                        result = values;
                    } else {
                        Map<String, Object> values = new LinkedHashMap<>();
                        for (int i = 0; i < count; i++) {
                            Object key = object(index(unsigned(pos + i * refs, refs)), depth + 1);
                            if (!(key instanceof String) || values.containsKey(key)) throw invalid();
                            values.put((String) key, object(index(unsigned(pos + (count + i) * refs, refs)), depth + 1));
                        }
                        result = values;
                    }
                }
            } else throw invalid();
            states[ref] = 2; objects[ref] = result; return result;
        }

        void range(int pos, long size) throws IOException {
            if (pos < 8 || size < 0 || size > table || (long) pos + size > table) throw invalid();
        }
        long unsigned(int pos, int size) throws IOException {
            if (pos < 0 || size < 1 || size > 8 || (long) pos + size > bytes.length) throw invalid();
            if (size == 8 && bytes[pos] < 0) throw invalid();
            long result = 0;
            for (int i = 0; i < size; i++) result = (result << 8) | (bytes[pos + i] & 255L);
            return result;
        }
        int index(long value) throws IOException { if (value < 0 || value > Integer.MAX_VALUE) throw invalid(); return (int) value; }
    }
}
