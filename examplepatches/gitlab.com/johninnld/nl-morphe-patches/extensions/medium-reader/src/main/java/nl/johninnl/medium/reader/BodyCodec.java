package nl.johninnl.medium.reader;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.nio.ByteBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Bounded non-executable cache format; corruption never becomes an article success. */
final class BodyCodec {
    static final int SCHEMA = 2;
    static final int MAX_BYTES = 8 * 1024 * 1024;
    private static final int MAGIC = 0x4d524442;
    private static final int MAX_STRING = 2 * 1024 * 1024;
    private static final List<String> TYPES = Arrays.asList("P", "H1", "H2", "H3", "H4", "PRE", "ULI", "OLI", "BQ", "PQ", "IMG", "HR", "SECTION_CAPTION");
    private BodyCodec() {}

    static byte[] hash(byte[] bytes) {
        try { return MessageDigest.getInstance("SHA-256").digest(bytes); }
        catch (NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }
    static String hex(byte[] bytes) {
        StringBuilder value = new StringBuilder(bytes.length * 2);
        for (byte item : bytes) { value.append(Character.forDigit((item >>> 4) & 15, 16)); value.append(Character.forDigit(item & 15, 16)); }
        return value.toString();
    }

    static byte[] encode(String key, long fetchedAt, ArticleBody body, int limit) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        try (DataOutputStream out = new DataOutputStream(new BoundedOutput(buffer, limit - 32))) {
            out.writeInt(MAGIC); out.writeInt(SCHEMA); out.writeLong(fetchedAt);
            writeString(out, key); writeString(out, body.postId); writeString(out, body.title);
            writeString(out, body.canonicalUrl.toString()); writeString(out, body.sourceUpdatedAt);
            if (body.notices.size() > 128) throw new IOException("Too many article notices");
            out.writeInt(body.notices.size());
            for (String notice : body.notices) writeString(out, notice);
            if (body.blocks.isEmpty() || body.blocks.size() > 12000) throw new IOException("Invalid block count");
            out.writeInt(body.blocks.size());
            for (ArticleBody.Block block : body.blocks) {
                validate(block);
                writeString(out, block.type); writeString(out, block.text); writeString(out, block.language);
                out.writeInt(block.markups.size());
                for (ArticleBody.Markup markup : block.markups) {
                    writeString(out, markup.type); out.writeInt(markup.start); out.writeInt(markup.end); writeString(out, markup.href);
                }
                out.writeBoolean(block.image != null);
                if (block.image != null) {
                    writeString(out, block.image.id); writeString(out, block.image.url.toString()); writeString(out, block.image.alt);
                    out.writeInt(block.image.width); out.writeInt(block.image.height);
                }
            }
        }
        byte[] payload = buffer.toByteArray();
        byte[] checksum = hash(payload);
        buffer.write(checksum);
        return buffer.toByteArray();
    }

    static Stored decode(byte[] encoded) throws IOException {
        if (encoded.length < 48 || encoded.length > MAX_BYTES) throw new IOException("Invalid cache size");
        byte[] payload = Arrays.copyOf(encoded, encoded.length - 32);
        if (!MessageDigest.isEqual(hash(payload), Arrays.copyOfRange(encoded, encoded.length - 32, encoded.length))) {
            throw new IOException("Cache checksum mismatch");
        }
        try (DataInputStream input = new DataInputStream(new ByteArrayInputStream(payload))) {
            if (input.readInt() != MAGIC || input.readInt() != SCHEMA) throw new IOException("Unsupported cache format");
            long fetchedAt = input.readLong();
            String key = readString(input); String postId = readString(input); String title = readString(input);
            URI canonical = uri(readString(input)); String sourceUpdated = readString(input);
            int noticeCount = input.readInt();
            if (noticeCount < 0 || noticeCount > 128) throw new IOException("Invalid notice count");
            List<String> notices = new ArrayList<>();
            for (int n = 0; n < noticeCount; n++) notices.add(readString(input));
            int count = input.readInt();
            if (count <= 0 || count > 12000) throw new IOException("Invalid block count");
            List<ArticleBody.Block> blocks = new ArrayList<>();
            for (int i = 0; i < count; i++) {
                String type = readString(input); String text = readString(input); String language = readString(input);
                int markupCount = input.readInt();
                if (markupCount < 0 || markupCount > 4096) throw new IOException("Invalid markup count");
                List<ArticleBody.Markup> markups = new ArrayList<>();
                for (int m = 0; m < markupCount; m++) {
                    markups.add(new ArticleBody.Markup(readString(input), input.readInt(), input.readInt(), readString(input)));
                }
                ArticleBody.Image image = null;
                if (input.readBoolean()) {
                    image = new ArticleBody.Image(readString(input), uri(readString(input)), readString(input), input.readInt(), input.readInt());
                }
                ArticleBody.Block block = new ArticleBody.Block(type, text, markups, image, language);
                validate(block); blocks.add(block);
            }
            if (input.available() != 0 || postId == null || !postId.matches("[a-f0-9]{12}")) throw new IOException("Invalid body identity or trailing data");
            return new Stored(key, fetchedAt, new ArticleBody(postId, title, canonical, sourceUpdated, blocks, notices));
        } catch (IllegalArgumentException invalid) { throw new IOException("Invalid cached article", invalid); }
    }

    private static void validate(ArticleBody.Block block) throws IOException {
        if (!TYPES.contains(block.type) || block.text == null || block.markups.size() > 4096) throw new IOException("Invalid article block");
        if (block.type.equals("IMG") && block.image == null) throw new IOException("Missing image metadata");
        if (block.image != null && (block.image.width < 0 || block.image.height < 0)) throw new IOException("Invalid image dimensions");
        if (block.image != null) uri(block.image.url.toString());
        for (ArticleBody.Markup markup : block.markups) {
            if (!Arrays.asList("STRONG", "EM", "CODE", "A").contains(markup.type) || markup.start < 0 || markup.end <= markup.start || markup.end > block.text.length()) {
                throw new IOException("Invalid formatting span");
            }
            if (markup.type.equals("A")) uri(markup.href);
        }
    }

    private static URI uri(String value) throws IOException {
        if (value == null) throw new IOException("Missing URL");
        URI uri;
        try { uri = URI.create(value); }
        catch (IllegalArgumentException invalid) { throw new IOException("Invalid URL", invalid); }
        if (uri.getHost() == null || uri.getUserInfo() != null || !("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme()))) {
            throw new IOException("Unsafe cached URL");
        }
        return uri;
    }

    private static void writeString(DataOutputStream output, String value) throws IOException {
        if (value == null) { output.writeInt(-1); return; }
        ByteBuffer bytes = StandardCharsets.UTF_8.newEncoder().onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT).encode(java.nio.CharBuffer.wrap(value));
        if (bytes.remaining() > MAX_STRING) throw new IOException("Article string is too large");
        output.writeInt(bytes.remaining()); output.write(bytes.array(), bytes.arrayOffset() + bytes.position(), bytes.remaining());
    }
    private static String readString(DataInputStream input) throws IOException {
        int length = input.readInt();
        if (length == -1) return null;
        if (length < 0 || length > MAX_STRING || length > input.available()) throw new IOException("Invalid article string length");
        byte[] bytes = new byte[length]; input.readFully(bytes);
        return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString();
    }

    static final class Stored {
        final String key; final long fetchedAt; final ArticleBody body;
        Stored(String key, long fetchedAt, ArticleBody body) { this.key = key; this.fetchedAt = fetchedAt; this.body = body; }
    }
    private static final class BoundedOutput extends FilterOutputStream {
        private final int maximum; private int size;
        BoundedOutput(OutputStream out, int maximum) { super(out); this.maximum = maximum; }
        @Override public void write(int value) throws IOException { check(1); out.write(value); }
        @Override public void write(byte[] bytes, int offset, int length) throws IOException { check(length); out.write(bytes, offset, length); }
        private void check(int length) throws IOException {
            if (length > maximum - size) throw new IOException("Article exceeds cache entry limit");
            size += length;
        }
    }
}
