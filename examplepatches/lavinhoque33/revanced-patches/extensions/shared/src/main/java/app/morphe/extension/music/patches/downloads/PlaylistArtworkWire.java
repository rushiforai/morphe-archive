/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.regex.Pattern;

/** Only the track images and the primary cover in a native saved browse response. */
final class PlaylistArtworkWire {
    private static final int[] COLUMN_SECTIONS = {58_173_949, 1, 58_174_010, 4, 49_399_797};
    private static final int[] DIRECT_SECTIONS = {49_399_797};
    private static final int PLAYLIST_SHELF = 175_617_300;
    private static final int[] PLAYLIST_ROWS = {3, 161_429_595};
    private static final int[] ITEM_SECTION_ITEMS = {50_195_462, 1};
    private static final int[] LEGACY_ROW_IMAGE = {9, 66_439_850, 5, 72_399_185, 3, 164_480_666, 1, 1};
    private static final int[] TRACK_IMAGE_SOURCES = {1, 164_480_666, 1, 1};
    private static final int[] WATCH_ID = {5, 48_687_757, 1};

    private static final int[] CLASSIC_COVER = {173_602_558, 5, 164_480_666, 1, 1};

    // Elements field 13 is the detail header. Neither the owner avatar nor field 777's templates are cover sources.
    private static final int[] ELEMENTS_HEADER = {361_650_780, 2, 153_515_154, 172_660_663, 1, 168_777_401, 5};
    private static final int[] ELEMENTS_COVER = {413_471_385, 1258, 10, 1, 1};
    private static final int[] LEGACY_HEADER = {373_186_255, 14};
    private static final int[] LEGACY_COVER = {2, 1};
    private static final int[] LEGACY_BACKGROUND = {3, 1};
    private static final int PREFERRED_COVER_WIDTH = 768;
    private static final Pattern RESIZE = Pattern.compile("=(?:s[0-9]+|w[0-9]+-h[0-9]+)(?:-[a-zA-Z0-9]+)*$");

    private PlaylistArtworkWire() {}

    static byte[] localize(byte[] response, String playlistId, Function<String, String> trackUri,
                           Function<String, String> savedCoverUri) throws IOException {
        Message root = new Message(response, 0, response.length);
        Map<String, String> headerMatches = new HashMap<>();
        editCoverSources(root, source -> {
            String remote = source.string(1);
            String key = remote == null ? null : imageKey(remote);
            if (key != null) headerMatches.put(key, null);
        });

        TrackImages tracks = new TrackImages(trackUri, headerMatches);
        root.edit(9, contents -> editRows(contents, playlistId, tracks));
        if (!tracks.foundShelf) return response;
        if (headerMatches.isEmpty()) return root.finish();

        editCoverSources(root, source -> replaceUrl(source, imageKey -> {
            String saved = savedCoverUri.apply(imageKey);
            if (saved != null) return saved;
            String matching = headerMatches.get(imageKey);
            return matching != null ? matching : tracks.first;
        }));
        return root.finish();
    }

    @Nullable
    static String headerCover(byte[] response) throws IOException {
        BestCover best = new BestCover();
        editCoverSources(new Message(response, 0, response.length), source -> {
            String remote = source.string(1);
            if (remote != null && imageKey(remote) != null) {
                int width = source.integer(4);
                best.consider(remote, width > 0 ? width : source.integer(2));
            }
        });
        return best.url;
    }

    private static void editCoverSources(Message root, Edit edit) throws IOException {
        root.edit(13, wrapper -> {
            wrapper.follow(CLASSIC_COVER, edit);
            wrapper.follow(ELEMENTS_HEADER, header -> {
                header.follow(ELEMENTS_COVER, edit);
                header.follow(LEGACY_HEADER, legacy -> {
                    legacy.follow(LEGACY_COVER, edit);
                    legacy.follow(LEGACY_BACKGROUND, edit);
                });
            });
        });
    }

    private static void editRows(Message contents, String playlistId, TrackImages tracks) throws IOException {
        Edit shelf = item -> item.edit(PLAYLIST_SHELF, candidate -> {
            if (playlistId.equals(candidate.string(1))) {
                tracks.foundShelf = true;
                candidate.follow(PLAYLIST_ROWS, tracks::edit);
            }
        });
        Edit section = sectionList -> sectionList.edit(1, child -> {
            shelf.accept(child);
            child.follow(ITEM_SECTION_ITEMS, shelf);
        });
        contents.follow(COLUMN_SECTIONS, section);
        contents.follow(DIRECT_SECTIONS, section);
    }

    /**
     * Size variants of the same Google-hosted image need only one local copy. The asset path is never used as a
     * filename. On ytimg the fixed thumbnail path itself identifies a rendition, independently of its signed query.
     */
    @Nullable
    static String imageKey(String url) {
        if (url.length() > 2048 || !url.startsWith("https://")) return null;
        try {
            URI uri = URI.create(url);
            String host = uri.getHost();
            String path = uri.getRawPath();
            if (host == null || path == null || path.length() <= 1 || uri.getRawUserInfo() != null
                    || uri.getPort() != -1) return null;

            if (host.endsWith(".ytimg.com")) return host + path;
            if (!host.endsWith(".googleusercontent.com") && !host.endsWith(".ggpht.com")) return null;
            String image = host + RESIZE.matcher(path).replaceFirst("");
            String query = uri.getRawQuery();
            return query == null ? image : image + '?' + query;
        } catch (IllegalArgumentException ex) {
            return null;
        }
    }

    private static void replaceUrl(Message image, Function<String, String> transform) throws IOException {
        image.lengthDelimited(1, (number, start, value) -> {
            String imageKey = imageKey(value.text());
            if (imageKey == null) return;
            String replacement = transform.apply(imageKey);
            if (replacement != null && replacement.startsWith("file://")) {
                image.replace(number, start, value.end, new Utf8(replacement.getBytes(StandardCharsets.UTF_8)));
            }
        });
    }

    private static final class TrackImages {
        private final Function<String, String> trackUri;
        private final Map<String, String> byVideo = new HashMap<>();
        private final Map<String, String> headerMatches;
        private String first;
        private boolean foundShelf;

        private TrackImages(Function<String, String> trackUri, Map<String, String> headerMatches) {
            this.trackUri = trackUri;
            this.headerMatches = headerMatches;
        }

        private void edit(Message row) throws IOException {
            String uri = lookup(row.string(WATCH_ID));
            if (uri != null) {
                replace(row, TRACK_IMAGE_SOURCES, uri);
                replace(row, LEGACY_ROW_IMAGE, uri);
            }
        }

        @Nullable
        private String lookup(@Nullable String id) {
            // The playlist item data's id is a set-video/occurrence id, not the track id.
            if (!RawAudioFiles.validId(id)) return null;
            if (!byVideo.containsKey(id)) byVideo.put(id, trackUri.apply(id));
            String uri = byVideo.get(id);
            if (uri == null || !uri.startsWith("file://")) return null;
            if (first == null) first = uri;
            return uri;
        }

        private void replace(Message row, int[] path, String uri) throws IOException {
            row.follow(path, source -> replaceUrl(source, imageKey -> {
                if (headerMatches.containsKey(imageKey)) headerMatches.putIfAbsent(imageKey, uri);
                return uri;
            }));
        }
    }

    private static final class BestCover {
        private String url;
        private int width;

        private void consider(String candidate, int pixels) {
            // Prefer the best variant under the storage target, or the smallest oversized variant if necessary.
            boolean better = width <= PREFERRED_COVER_WIDTH
                    ? pixels <= PREFERRED_COVER_WIDTH && pixels > width
                    : pixels < width;
            if (url == null || better) {
                url = candidate;
                width = pixels;
            }
        }
    }

    private interface Edit {
        void accept(Message message) throws IOException;
    }

    private interface Field {
        void accept(int number, int start, Message value) throws IOException;
    }

    private interface Payload {
        int size();
        void writeTo(CodedOutputStream output) throws IOException;
    }

    private record Utf8(byte[] bytes) implements Payload {
        @Override public int size() { return bytes.length; }
        @Override public void writeTo(CodedOutputStream output) throws IOException { output.writeRawBytes(bytes); }
    }

    private record Change(int number, int start, int end, Payload value) {}

    /** Sparse wire edits: unchanged spans remain in the original buffer until the one final serialization. */
    private static final class Message implements Payload {
        private final byte[] data;
        private final int start;
        private final int end;
        private List<Change> changes;
        private int size;

        private Message(byte[] data, int start, int end) {
            this.data = data;
            this.start = start;
            this.end = end;
            size = end - start;
        }

        private CodedInputStream input() {
            return CodedInputStream.newInstance(data, start, end - start);
        }

        private void lengthDelimited(int number, Field field) throws IOException {
            CodedInputStream input = input();
            while (!input.isAtEnd()) {
                int fieldStart = start + input.getTotalBytesRead();
                int tag = input.readTag();
                if (WireFormat.getTagFieldNumber(tag) == number
                        && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    int length = input.readRawVarint32();
                    int valueStart = start + input.getTotalBytesRead();
                    input.skipRawBytes(length);
                    field.accept(number, fieldStart, new Message(data, valueStart, valueStart + length));
                } else if (!input.skipField(tag)) {
                    throw new IOException("Unexpected protobuf end group");
                }
            }
        }

        private void edit(int number, Edit editor) throws IOException {
            lengthDelimited(number, (field, start, value) -> {
                editor.accept(value);
                if (value.changes != null) replace(field, start, value.end, value);
            });
        }

        private void follow(int[] path, Edit editor) throws IOException {
            follow(path, 0, editor);
        }

        private void follow(int[] path, int index, Edit editor) throws IOException {
            edit(path[index], index + 1 == path.length ? editor : child -> child.follow(path, index + 1, editor));
        }

        @Nullable
        private Message unique(int number) throws IOException {
            CodedInputStream input = input();
            Message value = null;
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                if (WireFormat.getTagFieldNumber(tag) == number
                        && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    if (value != null) return null;
                    int length = input.readRawVarint32();
                    int from = start + input.getTotalBytesRead();
                    input.skipRawBytes(length);
                    value = new Message(data, from, from + length);
                } else if (!input.skipField(tag)) {
                    throw new IOException("Unexpected protobuf end group");
                }
            }
            return value;
        }

        private String text() {
            return new String(data, start, end - start, StandardCharsets.UTF_8);
        }

        @Nullable
        private String string(int number) throws IOException {
            Message value = unique(number);
            return value == null ? null : value.text();
        }

        @Nullable
        private String string(int[] path) throws IOException {
            Message message = this;
            for (int number : path) {
                message = message.unique(number);
                if (message == null) return null;
            }
            return message.text();
        }

        private int integer(int number) throws IOException {
            CodedInputStream input = input();
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                if (WireFormat.getTagFieldNumber(tag) == number
                        && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_VARINT) return input.readInt32();
                if (!input.skipField(tag)) throw new IOException("Unexpected protobuf end group");
            }
            return 0;
        }

        private void replace(int number, int from, int to, Payload value) {
            if (changes == null) changes = new ArrayList<>();
            changes.add(new Change(number, from, to, value));
            size += CodedOutputStream.computeTagSize(number) + CodedOutputStream.computeUInt32SizeNoTag(value.size())
                    + value.size() - (to - from);
        }

        private byte[] finish() throws IOException {
            if (changes == null) return data;
            byte[] result = new byte[size];
            CodedOutputStream output = CodedOutputStream.newInstance(result);
            writeTo(output);
            output.checkNoSpaceLeft();
            return result;
        }

        @Override
        public int size() {
            return size;
        }

        @Override
        public void writeTo(CodedOutputStream output) throws IOException {
            int cursor = start;
            if (changes != null) {
                changes.sort(Comparator.comparingInt(Change::start));
                for (Change change : changes) {
                    output.writeRawBytes(data, cursor, change.start - cursor);
                    output.writeTag(change.number, WireFormat.WIRETYPE_LENGTH_DELIMITED);
                    output.writeUInt32NoTag(change.value.size());
                    change.value.writeTo(output);
                    cursor = change.end;
                }
            }
            output.writeRawBytes(data, cursor, end - cursor);
        }
    }
}
