/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import android.net.Uri;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Whether a video a chat is about to send says where it was filmed. Send chat photos and videos at
 * original quality only lets a video skip Facebook's re-encode when this finds no location in it,
 * since the file then goes out byte for byte and the re-encode is what drops a camera's tags.
 *
 * <p>An MP4 or QuickTime file keeps its tags in the movie box ({@code moov}): a phone writes the
 * place as a {@code ©xyz} or 3GPP {@code loci} box in a {@code udta}, or as a
 * {@code com.apple.quicktime.location.ISO6709} key in a {@code meta}, on the movie or on a track.
 * A dashcam can write it elsewhere: a Novatek camera indexes its GPS log from a {@code gps } box in
 * the movie and keeps the log in {@code free} boxes or, on some models, in {@code freeGPS} blocks
 * inside the media data itself, and a BlackVue keeps NMEA sentences in a {@code gps } box inside a
 * top-level {@code free} box. This reads the file's top-level box headers, the movie box, the
 * contents of every top-level {@code free}, {@code skip} and {@code wide} box, and the media data
 * ({@code mdat}) in chunks, looking in the media data only for the long markers a dashcam writes
 * (see {@link #LOG_MARKERS}). It walks every {@code udta}, {@code meta} and padding box of the
 * movie, its tracks and their media box by box.
 *
 * <p>It answers "clear" only when it read the whole layout, found every box on its container's
 * list, and found nothing. Each container this walks has a list of the boxes it may hold, taken
 * from ISO/IEC 14496-12, Apple's QuickTime file format and what Android's, Samsung's and iOS's
 * cameras write; a box off that list (a dashcam's {@code gps } index, an XMP {@code uuid}, a
 * fragment's {@code mvex}, a Nikon {@code NCDT}, an ISO {@code iloc} that points at an Exif item)
 * means the file isn't clear. So does a file that isn't local, can't be read, is cut short, has its
 * movie box twice, holds more than {@link #MAX_MOVIE_BYTES} in its movie and padding boxes
 * together, has a top-level box this doesn't know, a track with no media or no handler, or a
 * handler that isn't video or sound (a timed metadata track, such as GoPro's {@code gpmd} or Google's
 * {@code camm}, can carry a GPS trace). Video frames aren't decoded, so GPS written into the video
 * stream as binary SEI, with none of the markers above, isn't seen. The date and the camera's make and model aren't looked at: a
 * video that passes keeps them.
 */
final class VideoLocation {
    /** The most of a movie box and the padding boxes beside it this reads. A phone video's is tens of kilobytes. */
    static final int MAX_MOVIE_BYTES = 4 << 20;

    /** How many top-level boxes a file may have before this stops reading it. */
    static final int MAX_TOP_BOXES = 64;

    /** The most of the media data this reads for a GPS log, and the chunk it reads at a time. */
    static final long MAX_MDAT_BYTES = 64L << 20;
    static final int MDAT_CHUNK = 64 << 10;

    /** How deep the movie box's containers may nest: track, media, media information, a udta and its meta. */
    private static final int MAX_DEPTH = 6;

    /**
     * The boxes each container this walks may hold, and nothing else. Padding ({@code free},
     * {@code skip}, {@code wide}) is read like a {@code udta}.
     */
    private static final Map<String, Set<String>> CHILDREN = new HashMap<>();

    /**
     * Text atoms editors and phones write, in a udta or a meta's item list, that carry no place:
     * make, model, software, date, tool (ffmpeg's and Lavf's), encoder, title, comment,
     * description, artist, album, genre, writer, grouping, lyrics and copyright. The place's
     * \u00A9xyz is not here.
     */
    private static final Set<String> TEXT_ATOMS = set("\u00A9mak", "\u00A9mod", "\u00A9swr", "\u00A9day",
            "\u00A9too", "\u00A9enc", "\u00A9nam", "\u00A9cmt", "\u00A9des", "\u00A9ART", "\u00A9alb",
            "\u00A9gen", "\u00A9wrt", "\u00A9grp", "\u00A9lyr", "\u00A9cpy");

    /**
     * The iTunes-style items of an {@code ilst} that carry no place: the text atoms above and the
     * plain tags an editor or a tagger writes. Cover art ({@code covr}) can hold an Exif block and a
     * freeform {@code ----} item can hold anything, so both are off.
     */
    private static final Set<String> ILST_ITEMS = ilstItems();

    private static Set<String> ilstItems() {
        Set<String> items = new HashSet<>(TEXT_ATOMS);
        items.addAll(Arrays.asList("aART", "desc", "ldes", "cprt", "tvsh", "tven", "tvnn", "tves", "tvsn",
                "keyw", "catg", "purl", "egid", "purd", "trkn", "disk", "cpil", "pgap", "tmpo", "sonm", "soal",
                "soar", "soaa", "soco", "sosn", "stik", "rtng", "gnre", "hdvd"));
        return Collections.unmodifiableSet(items);
    }

    static {
        // The movie's header, tracks, tags, MPEG-4's object descriptor and padding. No mvex: a
        // fragmented movie keeps its samples, and so any timed metadata, in fragments not read here.
        CHILDREN.put("moov", set("mvhd", "trak", "udta", "meta", "iods", "free", "skip", "wide"));
        // Header, references, edit list, QuickTime's aperture modes (an iPhone writes tapt), media.
        CHILDREN.put("trak", set("tkhd", "tref", "edts", "tapt", "mdia", "udta", "meta", "free", "skip", "wide"));
        CHILDREN.put("mdia", set("mdhd", "hdlr", "minf", "elng", "udta", "meta", "free", "skip", "wide"));
        // A video or a sound header, QuickTime's data handler, data references and sample tables.
        CHILDREN.put("minf", set("vmhd", "smhd", "hdlr", "dinf", "stbl", "udta", "meta", "free", "skip", "wide"));
        // Text atoms a phone or an editor writes that name no place (make, model, software, date,
        // tool, encoder, title, comment, artist), a meta, Samsung's boxes, 3GPP's asset strings,
        // QuickTime's name and hint info, and padding. A place's box (the \u00A9xyz atom, loci) and
        // every maker's binary Exif box (Nikon NCDT, Pentax PENT, Panasonic PANA, Canon CNTH) are
        // off the list.
        Set<String> udta = new HashSet<>(Arrays.asList("meta", "free", "skip", "wide",
                // Samsung: the smta block, a play mode, and the strings a Galaxy may write straight
                // under udta. From memory of ExifTool's Samsung QuickTime tables, so a best guess.
                "smta", "SDLN", "smrd", "cver", "cmnm",
                // 3GPP asset boxes (TS 26.244) except loci, which is a place.
                "titl", "dscp", "cprt", "perf", "auth", "albm", "yrrc", "kywd", "gnre", "rtng", "clsf",
                // QuickTime's name and hint info.
                "name", "hnti", "hinf"));
        udta.addAll(TEXT_ATOMS);
        CHILDREN.put("udta", Collections.unmodifiableSet(udta));
        // A handler, the keys and their values, and padding. An ISO meta's iinf, iloc and idat can
        // hold an Exif item, so they're off the list.
        CHILDREN.put("meta", set("hdlr", "keys", "ilst", "free", "skip", "wide"));
    }

    /** Box types and key text that name a place, matched as bytes in a udta, a meta or padding. */
    private static final byte[][] PLACE_BOXES = {
            {(byte) 0xA9, 'x', 'y', 'z'},
            {'l', 'o', 'c', 'i'},
            {'X', 'M', 'P', '_'},
    };

    /**
     * Words a location key, an XMP packet or a GPS log holds, matched without case: a {@code gps }
     * box or a Novatek {@code freeGPS} block, a timed metadata format's name, and the NMEA sentences
     * a dashcam logs.
     */
    private static final byte[][] PLACE_WORDS = {
            ascii("location"),
            ascii("iso6709"),
            ascii("gps"),
            ascii("gpmd"),
            ascii("camm"),
            ascii("nmea"),
            ascii("$gprmc"),
            ascii("$gpgga"),
            ascii("$gnrmc"),
            ascii("$gngga"),
    };

    /**
     * What a dashcam's GPS log holds, each long enough that it never turns up in video by chance:
     * Novatek's {@code freeGPS} block (the name ExifTool gives its parser for those blocks),
     * LigoGPS's {@code LIGOGPSINFO} header (ExifTool's LIGOGPS parser), and the NMEA 0183 sentence
     * starts (RMC, GGA, GLL, VTG, GSA) that BlackVue, Viofo, Thinkware and others log in plain
     * text, from a GPS or a multi-constellation receiver. Matched with case, as NMEA writes them.
     * Never a bare "gps", which random bytes spell.
     */
    static final byte[][] LOG_MARKERS = logMarkers();

    private static byte[][] logMarkers() {
        java.util.List<byte[]> markers = new java.util.ArrayList<>();
        markers.add(ascii("freeGPS"));
        markers.add(ascii("LIGOGPSINFO"));
        for (String talker : new String[] {"GP", "GN"}) {
            for (String sentence : new String[] {"RMC", "GGA", "GLL", "VTG", "GSA"}) {
                markers.add(ascii("$" + talker + sentence + ","));
            }
        }
        return markers.toArray(new byte[0][]);
    }

    private VideoLocation() {
    }

    /**
     * Whether [length] bytes of [in] from [start] hold one of {@link #LOG_MARKERS}, read in
     * {@link #MDAT_CHUNK}-byte chunks that overlap enough to catch a marker split across two.
     */
    static boolean holdsGpsLog(RandomAccessFile in, long start, long length) throws IOException {
        int overlap = 0;
        boolean[] first = new boolean[256];
        for (byte[] marker : LOG_MARKERS) {
            overlap = Math.max(overlap, marker.length - 1);
            first[marker[0] & 0xFF] = true;
        }
        byte[] buffer = new byte[MDAT_CHUNK + overlap];
        int kept = 0;
        in.seek(start);
        for (long left = length; left > 0; ) {
            int read = (int) Math.min(MDAT_CHUNK, left);
            in.readFully(buffer, kept, read);
            int total = kept + read;
            for (int i = 0; i < total; i++) {
                if (!first[buffer[i] & 0xFF]) continue;
                for (byte[] marker : LOG_MARKERS) {
                    if (matches(buffer, i, total, marker, false)) return true;
                }
            }
            kept = Math.min(overlap, total);
            System.arraycopy(buffer, total - kept, buffer, 0, kept);
            left -= read;
        }
        return false;
    }

    /**
     * True only when [source], a {@code file://} address as Facebook's transcoder takes it, is a
     * file whose box tree this read in full without finding a place in it.
     */
    static boolean clear(@Nullable String source) {
        File file = localFile(source);
        if (file == null) return false;
        try (RandomAccessFile in = new RandomAccessFile(file, "r")) {
            // Facebook's reported size is what the cap was checked on; the file's own length is the truth.
            if (in.length() > OriginalChatMedia.VIDEO_MAX_BYTES) return false;
            byte[] movie = movieBox(in);
            return movie != null && clearBoxes(movie, 0, movie.length, "moov", 0);
        } catch (IOException | RuntimeException unreadable) {
            return false;
        }
    }

    /** The file a {@code file://} address names, or null for any other address. */
    @Nullable
    private static File localFile(@Nullable String source) {
        if (source == null || source.isEmpty()) return null;
        Uri uri = Uri.parse(source);
        if (!"file".equals(uri.getScheme())) return null;
        String path = uri.getPath();
        return path == null || path.isEmpty() ? null : new File(path);
    }

    /**
     * The movie box's payload, read after a walk over every top-level box header, or null when the
     * layout isn't one this reads in full or a padding box names a place.
     */
    @Nullable
    static byte[] movieBox(RandomAccessFile in) throws IOException {
        long length = in.length();
        byte[] header = new byte[16];
        byte[] movie = null;
        // What the movie box and the padding boxes may take together.
        long room = MAX_MOVIE_BYTES;
        long at = 0;
        for (int boxes = 0; at < length; boxes++) {
            if (boxes >= MAX_TOP_BOXES || length - at < 8) return null;
            in.seek(at);
            in.readFully(header, 0, 8);
            long size = u32(header, 0);
            int headerSize = 8;
            if (size == 1) {
                if (length - at < 16) return null;
                in.readFully(header, 8, 8);
                size = u64(header, 8);
                headerSize = 16;
            } else if (size == 0) {
                // The last box runs to the end of the file.
                size = length - at;
            }
            if (size < headerSize || size > length - at) return null;
            long payload = size - headerSize;
            switch (type(header, 4)) {
                case "moov":
                    if (movie != null || payload > room) return null;
                    movie = new byte[(int) payload];
                    in.readFully(movie);
                    room -= payload;
                    break;
                case "free":
                case "skip":
                case "wide":
                    // Padding, unless a camera wrote into it: a dashcam can keep its GPS log in one.
                    if (payload > room) return null;
                    byte[] padding = new byte[(int) payload];
                    in.readFully(padding);
                    room -= payload;
                    if (namesAPlace(padding, 0, padding.length)) return null;
                    break;
                case "mdat":
                    // Some dashcams write their GPS log into the media data, as freeGPS blocks.
                    if (payload > MAX_MDAT_BYTES || holdsGpsLog(in, at + headerSize, payload)) return null;
                    break;
                case "ftyp":
                case "pdin":
                    break;
                default:
                    // Fragments (moof), an XMP uuid, a top-level meta or anything else.
                    return null;
            }
            at += size;
        }
        return movie;
    }

    /**
     * Whether the boxes in [from, to) of [data], the children of a [parent] box, hold no place:
     * each is one the parent may hold, every udta, meta and padding box is searched, tracks, their
     * media and its information are walked, a track has media, and the media's one handler is
     * video or sound.
     */
    static boolean clearBoxes(byte[] data, int from, int to, String parent, int depth) {
        if (depth > MAX_DEPTH) return false;
        Set<String> allowed = CHILDREN.get(parent);
        if (allowed == null) return false;
        boolean media = false;
        boolean handler = false;
        int at = from;
        while (at < to) {
            // QuickTime ends a udta with four zero bytes.
            if ("udta".equals(parent) && to - at == 4 && u32(data, at) == 0) break;
            if (to - at < 8) return false;
            long size = u32(data, at);
            int headerSize = 8;
            if (size == 1) {
                if (to - at < 16) return false;
                size = u64(data, at + 8);
                headerSize = 16;
            } else if (size == 0) {
                size = to - at;
            }
            if (size < headerSize || size > to - at) return false;
            int start = at + headerSize;
            int end = (int) (at + size);
            String type = type(data, at + 4);
            if (!allowed.contains(type)) return false;
            switch (type) {
                case "udta":
                case "meta":
                    if (namesAPlace(data, start, end)) return false;
                    int inner = "meta".equals(type) ? metaChildren(data, start, end) : start;
                    if (!clearBoxes(data, inner, end, type, depth + 1)) return false;
                    break;
                case "ilst":
                    if (!numberedItems(data, start, end)) return false;
                    break;
                case "free":
                case "skip":
                case "wide":
                    if (namesAPlace(data, start, end)) return false;
                    break;
                case "trak":
                case "minf":
                    if (!clearBoxes(data, start, end, type, depth + 1)) return false;
                    break;
                case "mdia":
                    if (media || !clearBoxes(data, start, end, type, depth + 1)) return false;
                    media = true;
                    break;
                case "hdlr":
                    // The media's handler, after its version, flags and QuickTime's component type.
                    // One inside minf is QuickTime's data handler, which says where the samples are.
                    if ("mdia".equals(parent)) {
                        if (handler || !videoOrSound(data, start, end)) return false;
                        handler = true;
                    }
                    break;
                default:
                    // A header, an edit list or the sample tables: no tags in them.
                    break;
            }
            at = end;
        }
        // A track without media, or media without a handler, can't be shown to be video or sound.
        if ("trak".equals(parent) && !media) return false;
        return !"mdia".equals(parent) || handler;
    }

    /**
     * Where a meta box's children start: an ISO meta begins with four bytes of version and flags,
     * a QuickTime meta with its first child. A zero first word is the version and flags.
     */
    private static int metaChildren(byte[] data, int start, int end) {
        return end - start >= 4 && u32(data, start) == 0 ? start + 4 : start;
    }

    /**
     * Whether every item of an {@code ilst} has a number for its type, as the items of a QuickTime
     * key list do, or is an iTunes-style text or tag atom that names no place (ffmpeg writes a
     * {@code \u00A9too} this way). A {@code \u00A9xyz}, a freeform {@code ----} item and cover art aren't.
     */
    private static boolean numberedItems(byte[] data, int from, int to) {
        int at = from;
        while (at < to) {
            if (to - at < 8) return false;
            long size = u32(data, at);
            if (size < 8 || size > to - at) return false;
            boolean numbered = data[at + 4] == 0 && data[at + 5] == 0 && data[at + 6] == 0;
            if (!numbered && !ILST_ITEMS.contains(type(data, at + 4))) return false;
            at += (int) size;
        }
        return true;
    }

    private static boolean videoOrSound(byte[] data, int start, int end) {
        if (end - start < 12) return false;
        String handler = type(data, start + 8);
        return "vide".equals(handler) || "soun".equals(handler);
    }

    /** Whether [from, to) of [data] holds a place's box type or a word a location key or a GPS log uses. */
    static boolean namesAPlace(byte[] data, int from, int to) {
        for (int i = from; i < to; i++) {
            for (byte[] box : PLACE_BOXES) {
                if (matches(data, i, to, box, false)) return true;
            }
            for (byte[] word : PLACE_WORDS) {
                if (matches(data, i, to, word, true) || matchesWide(data, i, to, word, false)
                        || matchesWide(data, i, to, word, true)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean matches(byte[] data, int at, int to, byte[] part, boolean anyCase) {
        if (to - at < part.length) return false;
        for (int j = 0; j < part.length; j++) {
            int b = data[at + j];
            if (anyCase && b >= 'A' && b <= 'Z') b += 'a' - 'A';
            if (b != part[j]) return false;
        }
        return true;
    }

    /** [part] as UTF-16 text without case, as an XMP packet may be written: big-endian or little-endian. */
    private static boolean matchesWide(byte[] data, int at, int to, byte[] part, boolean littleEndian) {
        if (to - at < part.length * 2) return false;
        for (int j = 0; j < part.length; j++) {
            if (data[at + 2 * j + (littleEndian ? 1 : 0)] != 0) return false;
            int b = data[at + 2 * j + (littleEndian ? 0 : 1)];
            if (b >= 'A' && b <= 'Z') b += 'a' - 'A';
            if (b != part[j]) return false;
        }
        return true;
    }

    private static long u32(byte[] data, int at) {
        return ((data[at] & 0xFFL) << 24) | ((data[at + 1] & 0xFFL) << 16) | ((data[at + 2] & 0xFFL) << 8)
                | (data[at + 3] & 0xFFL);
    }

    /** A 64-bit size, or -1 past what a long holds, which every size check then refuses. */
    private static long u64(byte[] data, int at) {
        long value = (u32(data, at) << 32) | u32(data, at + 4);
        return value < 0 ? -1 : value;
    }

    private static String type(byte[] data, int at) {
        return new String(data, at, 4, StandardCharsets.ISO_8859_1);
    }

    private static Set<String> set(String... types) {
        return Collections.unmodifiableSet(new HashSet<>(Arrays.asList(types)));
    }

    private static byte[] ascii(String text) {
        return text.getBytes(StandardCharsets.US_ASCII);
    }
}
