/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-26.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.IntFunction;
import java.util.regex.Pattern;

/** Assembles the native first page and the track rows and Elements updates from its continuations. */
final class PlaylistSyncPage {
    private static final int BROWSE_CONTENTS = 9;
    private static final int BROWSE_CONTINUATION = 10;
    static final int SINGLE_COLUMN_BROWSE = 58_173_949;
    static final int SECTION_LIST = 49_399_797;
    private static final int ITEM_SECTION = 50_195_462;
    static final int PLAYLIST_SHELF = 175_617_300;
    static final int SHELF_ROW = 161_429_595;
    private static final int SHELF_ROWS = 3;
    private static final int SHELF_CONTINUATIONS = 10;
    private static final int NEXT_CONTINUATION = 52_047_593;
    private static final int WATCH = 48_687_757;
    private static final int SEARCH = 48_687_709;
    private static final int UPDATES = 777;
    private static final int MAX_PAGES = 64;
    private static final int MAX_BYTES = 32 * 1024 * 1024;
    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");

    interface Browse {
        byte[] read(String continuation) throws Exception;
    }

    record Snapshot(List<String> tracks, Message page) {
        byte[] browseBytes() throws IOException {
            return bytesOf(page);
        }
    }

    private PlaylistSyncPage() {}

    private static byte[] bytesOf(Message page) throws IOException {
        byte[] bytes = new byte[page.size];
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        page.writeTo(output);
        output.checkNoSpaceLeft();
        return bytes;
    }

    static Snapshot fetch(String playlistId, Browse browse) throws Exception {
        Parsed first = first(browse.read(null));
        return assemble(playlistId, first, browse);
    }

    private static Snapshot assemble(String playlistId, Parsed first, Browse browse) throws Exception {
        if (!playlistId.equals(required(first.shelf, 1).text())) throw invalid();

        List<String> tracks = new ArrayList<>();
        List<Part> rows = new ArrayList<>();
        Message updates = new Message();
        Set<String> tokens = new HashSet<>();
        Parsed page = first;
        int bytes = 0;
        while (true) {
            bytes += page.root.length();
            if (bytes > MAX_BYTES) throw invalid();
            appendRows(playlistId, page.shelf, tracks, rows);
            for (Field field : page.root.fields()) if (field.number == UPDATES) updates.add(field.payload());

            String token = token(page.shelf);
            if (token == null) break;
            if (tokens.size() >= MAX_PAGES || !tokens.add(token)) throw invalid();
            page = continued(browse.read(token));
        }
        if (tracks.stream().noneMatch(PlaylistPage::isAvailable)) throw invalid();
        return new Snapshot(List.copyOf(tracks), render(first, rows, updates));
    }

    private static Message render(Parsed first, List<Part> rows, @Nullable Message updates) throws IOException {
        Message shelf = rewrite(first.shelf, SHELF_ROWS, SHELF_CONTINUATIONS, rows);
        Message wrapper = replace(first.wrapper, PLAYLIST_SHELF, shelf);
        if (first.itemSection != null) {
            Message item = replaceExact(first.itemSection, first.wrapper, wrapper, false);
            wrapper = replace(first.sectionChild, ITEM_SECTION, item);
        }
        Message section = replaceExact(first.section, first.sectionChild, wrapper, true);
        Message contents = replaceSection(first, section);
        if (updates == null) return replace(first.root, BROWSE_CONTENTS, contents);

        Message root = rewrite(first.root, BROWSE_CONTENTS, UPDATES, List.of(contents.field(BROWSE_CONTENTS)));
        if (updates.size != 0) root.add(updates.field(UPDATES));
        return root;
    }

    /** A page may answer local detail only if its entire native queue agrees with the committed membership. */
    static boolean matchesComplete(String playlistId, byte[] response, List<String> saved) {
        try {
            Parsed page = first(response);
            if (page.section.child(2) != null || token(page.shelf) != null || !validFirstPage(playlistId, page)) {
                return false;
            }

            List<String> tracks = new ArrayList<>(saved.size());
            appendRows(playlistId, page.shelf, tracks, null);
            return tracks.equals(saved);
        } catch (IOException ignored) {
            return false;
        }
    }

    private static boolean validFirstPage(String playlistId, Parsed page) throws IOException {
        return page.root.child(BROWSE_CONTINUATION) == null && playlistId.equals(required(page.shelf, 1).text());
    }

    /** Only a native page with no track continuation may be persisted as a complete first-page capture. */
    @Nullable
    static byte[] completeLegacy(String playlistId, byte[] response, List<String> saved) {
        return repairLegacy(playlistId, response, saved, null);
    }

    /** Keep the native header, rows, menus and updates of a matching prefix; supply only the missing saved rows. */
    @Nullable
    static byte[] repairLegacy(String playlistId, byte[] response, List<String> saved,
                               @Nullable IntFunction<byte[]> missingRow) {
        try {
            Parsed page = first(response);
            if (!validFirstPage(playlistId, page)) return null;
            boolean ongoing = token(page.shelf) != null;
            if (ongoing && missingRow == null) return null;

            List<String> tracks = new ArrayList<>(saved.size());
            List<Part> rows = new ArrayList<>(saved.size());
            appendRows(playlistId, page.shelf, tracks, rows);
            int prefix = tracks.size();
            if (prefix > saved.size() || !saved.subList(0, prefix).equals(tracks)) return null;
            if (prefix < saved.size() && (!ongoing || missingRow == null)) return null;

            for (int position = prefix; position < saved.size(); position++) {
                byte[] encoded = missingRow.apply(position);
                Message wrapper = new Message();
                wrapper.add(new Bytes(encoded, 0, encoded.length));
                rows.add(wrapper.field(SHELF_ROWS));
            }
            return bytesOf(render(page, rows, null));
        } catch (IOException ignored) {
            return null;
        }
    }

    private record Parsed(Field root, Field contents, Field column, Field tabWrapper, Field tab, Field tabContents,
                          Field section, Field sectionChild, Field itemSection, Field wrapper, Field shelf) {}

    private static Parsed first(byte[] bytes) throws IOException {
        Field root = Field.root(bytes);
        Field contents = required(root, BROWSE_CONTENTS);
        Field column = contents.child(SINGLE_COLUMN_BROWSE);
        Field tabWrapper = column == null ? null : required(column, 1);
        Field tab = tabWrapper == null ? null : required(tabWrapper, 58_174_010);
        Field tabContents = tab == null ? contents : required(tab, 4);
        Field section = required(tabContents, SECTION_LIST);
        for (Field child : section.fields()) {
            if (child.number != 1) continue;
            Field shelf = child.child(PLAYLIST_SHELF);
            if (shelf != null) {
                return new Parsed(root, contents, column, tabWrapper, tab, tabContents, section, child, null,
                        child, shelf);
            }
            Field item = child.child(ITEM_SECTION);
            if (item == null) continue;
            for (Field wrapper : item.fields()) {
                if (wrapper.number != 1) continue;
                shelf = wrapper.child(PLAYLIST_SHELF);
                if (shelf != null) {
                    return new Parsed(root, contents, column, tabWrapper, tab, tabContents, section, child, item,
                            wrapper, shelf);
                }
            }
        }
        throw invalid();
    }

    private static Parsed continued(byte[] bytes) throws IOException {
        Field root = Field.root(bytes);
        Field shelf = required(required(root, BROWSE_CONTINUATION), PLAYLIST_SHELF);
        return new Parsed(root, null, null, null, null, null, null, null, null, null, shelf);
    }

    private static String token(Field shelf) throws IOException {
        String token = null;
        for (Field field : shelf.fields()) {
            if (field.number != SHELF_CONTINUATIONS) continue;
            String next = required(required(field, NEXT_CONTINUATION), 1).text();
            if (next.isEmpty() || token != null) throw invalid();
            token = next;
        }
        return token;
    }

    private static void appendRows(String playlistId, Field shelf, List<String> tracks, List<Part> rows)
            throws IOException {
        int before = tracks.size();
        Field id = shelf.child(1);
        if (id != null && !playlistId.equals(id.text())) throw invalid();
        for (Field wrapper : shelf.fields()) {
            if (wrapper.number != SHELF_ROWS) continue;
            Field row = required(wrapper, SHELF_ROW);
            Field tap = row.child(5);
            Field watch = tap == null ? null : tap.child(WATCH);
            Field item = row.child(12);
            if (item == null && tap != null && tap.child(SEARCH) != null) {
                if (rows != null) rows.add(wrapper);
                continue;
            }

            Field video = watch == null ? null : watch.child(1);
            if (video == null) {
                Field policy = row.child(2);
                boolean unavailable = (item != null && item.child(1) != null)
                        || (policy != null && policy.int32() == OfflineBrowsePagesLogic.GREY_OUT);
                if (!unavailable || row.child(3) == null) throw invalid();
                tracks.add(PlaylistPage.UNAVAILABLE);
                if (rows != null) rows.add(wrapper);
                continue;
            }

            String videoId = video.text();
            if (!VIDEO_ID.matcher(videoId).matches() || !playlistId.equals(required(watch, 2).text())) throw invalid();
            if (rows != null) {
                // Stock endpoints sometimes omit an index. The saved page must distinguish duplicate occurrences.
                byte[] index = new ProtoWriter().int32(3, tracks.size()).toByteArray();
                Message indexed = rewrite(watch, 3, -1, List.of(new Bytes(index, 0, index.length)));
                Message command = replace(tap, WATCH, indexed);
                rows.add(replace(wrapper, SHELF_ROW, replace(row, 5, command)).field(SHELF_ROWS));
            } else if (required(watch, 3).int32() != tracks.size()) {
                throw invalid();
            }
            tracks.add(videoId);
        }
        if (before == tracks.size()) throw invalid();
    }

    private static Message replaceSection(Parsed page, Message section) throws IOException {
        if (page.column == null) return replace(page.contents, SECTION_LIST, section);
        Message tabContents = replace(page.tabContents, SECTION_LIST, section);
        Message tab = replace(page.tab, 4, tabContents);
        Message wrapper = replace(page.tabWrapper, 58_174_010, tab);
        Message column = replaceExact(page.column, page.tabWrapper, wrapper, false);
        return replace(page.contents, SINGLE_COLUMN_BROWSE, column);
    }

    private static Message replaceExact(Field parent, Field old, Message replacement, boolean stripContinuation)
            throws IOException {
        Message result = new Message();
        for (Field field : parent.fields()) {
            if (field.start == old.start) result.add(replacement.field(field.number));
            else if (!stripContinuation || field.number != 2) result.add(field);
        }
        return result;
    }

    private static Message replace(Field parent, int number, Message replacement) throws IOException {
        return rewrite(parent, number, -1, List.of(replacement.field(number)));
    }

    private static Message rewrite(Field parent, int replace, int omit, List<Part> values) throws IOException {
        Message result = new Message();
        boolean written = false;
        for (Field field : parent.fields()) {
            if (field.number == replace) {
                if (!written) values.forEach(result::add);
                written = true;
            } else if (field.number != omit) result.add(field);
        }
        if (!written) values.forEach(result::add);
        return result;
    }

    private static Field required(Field parent, int number) throws IOException {
        Field value = parent.child(number);
        if (value == null) throw invalid();
        return value;
    }

    private static IOException invalid() {
        return new IOException("Incomplete or unrecognized native playlist response");
    }

    private interface Part {
        int length();
        void writeTo(CodedOutputStream output) throws IOException;
    }

    private record Bytes(byte[] bytes, int start, int end) implements Part {
        @Override public int length() { return end - start; }
        @Override public void writeTo(CodedOutputStream output) throws IOException {
            output.write(bytes, start, length());
        }
    }

    private static final class Message implements Part {
        private final List<Part> parts = new ArrayList<>();
        private int size;

        void add(Part part) {
            parts.add(part);
            size += part.length();
        }

        Part field(int number) { return new Nested(number, this); }
        @Override public int length() { return size; }
        @Override public void writeTo(CodedOutputStream output) throws IOException {
            for (Part part : parts) part.writeTo(output);
        }
    }

    private record Nested(int number, Message message) implements Part {
        @Override public int length() {
            return CodedOutputStream.computeTagSize(number) + CodedOutputStream.computeUInt32SizeNoTag(message.size)
                    + message.size;
        }
        @Override public void writeTo(CodedOutputStream output) throws IOException {
            output.writeTag(number, WireFormat.WIRETYPE_LENGTH_DELIMITED);
            output.writeUInt32NoTag(message.size);
            message.writeTo(output);
        }
    }

    /** A slice of a native message, with the original wire bytes retained verbatim. */
    private record Field(byte[] bytes, int number, int start, int body, int end) implements Part {
        static Field root(byte[] bytes) throws IOException {
            if (bytes.length == 0 || bytes.length > MAX_BYTES) throw invalid();
            return new Field(bytes, 0, 0, 0, bytes.length);
        }

        Bytes payload() throws IOException {
            if (body < 0) throw invalid();
            return new Bytes(bytes, body, end);
        }

        String text() throws IOException {
            Bytes data = payload();
            return new String(bytes, data.start, data.length(), java.nio.charset.StandardCharsets.UTF_8);
        }

        int int32() throws IOException {
            if (body >= 0) throw invalid();
            CodedInputStream input = CodedInputStream.newInstance(bytes, start, end - start);
            if (WireFormat.getTagWireType(input.readTag()) != WireFormat.WIRETYPE_VARINT) throw invalid();
            return input.readInt32();
        }

        List<Field> fields() throws IOException {
            Bytes data = payload();
            CodedInputStream input = CodedInputStream.newInstance(bytes, data.start, data.length());
            List<Field> fields = new ArrayList<>();
            while (!input.isAtEnd()) fields.add(read(input));
            return fields;
        }

        Field child(int wanted) throws IOException {
            Bytes data = payload();
            CodedInputStream input = CodedInputStream.newInstance(bytes, data.start, data.length());
            while (!input.isAtEnd()) {
                Field field = read(input);
                if (field.number == wanted) return field;
            }
            return null;
        }

        private Field read(CodedInputStream input) throws IOException {
            int start = body + input.getTotalBytesRead();
            int tag = input.readTag();
            int payload = -1;
            if (WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                int length = input.readRawVarint32();
                payload = body + input.getTotalBytesRead();
                input.skipRawBytes(length);
            } else if (!input.skipField(tag)) throw invalid();
            return new Field(bytes, WireFormat.getTagFieldNumber(tag), start, payload, body + input.getTotalBytesRead());
        }

        @Override public int length() { return end - start; }
        @Override public void writeTo(CodedOutputStream output) throws IOException {
            output.write(bytes, start, length());
        }
    }
}
