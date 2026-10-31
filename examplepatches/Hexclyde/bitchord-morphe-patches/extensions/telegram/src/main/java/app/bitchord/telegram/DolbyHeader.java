package app.bitchord.telegram;

import org.json.JSONObject;

/**
 * Dolby files: which format, how many channels, and whether it's Dolby Atmos, from the first bytes
 * of the file.
 *
 * <ul>
 *   <li>Dolby Digital (AC-3) and Dolby Digital Plus (E-AC-3) as plain .ac3 and .ec3 files: from the
 *       first frames. Dolby Atmos in Dolby Digital Plus is marked in the first frame's "additional
 *       bit stream information", the flag ffmpeg reads too.
 *   <li>The same inside .m4a and .mp4: from the track's description (the dec3 box carries the Atmos
 *       flag). ALAC in .m4a is read here too, since it's the same walk through the boxes.
 *   <li>.mka (Matroska): the track's codec, Dolby TrueHD included, and for Dolby Digital Plus the
 *       first frame.
 *   <li>Dolby AC-4: only that it is AC-4.
 * </ul>
 *
 * Telegram only says the file's name and type, which can't tell Atmos apart.
 */
final class DolbyHeader {
    private DolbyHeader() {}

    static final int[] RATES = {48000, 44100, 32000};
    static final int[] REDUCED_RATES = {24000, 22050, 16000};
    static final int[] BLOCKS = {1, 2, 3, 6};

    // Speaker positions, as bits: the main five and the LFE, then what E-AC-3's channel map adds.
    static final int L = 1, C = 1 << 1, R = 1 << 2, LS = 1 << 3, RS = 1 << 4, LFE = 1 << 5;
    static final int LCRC = 1 << 6, LRSRRS = 1 << 7, CS = 1 << 8, TS = 1 << 9, LSDRSD = 1 << 10;
    static final int LWRW = 1 << 11, LVHRVH = 1 << 12, CVH = 1 << 13, LFE2 = 1 << 14;
    static final int PAIRS = LCRC | LRSRRS | LSDRSD | LWRW | LVHRVH;
    // Speakers by acmod; mode 0 is two mono programmes, counted as two.
    static final int[] MODES = {
        L | R, C, L | R, L | C | R, L | R | CS, L | C | R | CS, L | R | LS | RS, L | C | R | LS | RS
    };
    // The extras in a channel map (bits 5 to 14, 13 unused) and in dec3's chan_loc (9 bits).
    static final int[] MAP_EXTRAS = {LCRC, LRSRRS, CS, TS, LSDRSD, LWRW, LVHRVH, CVH, 0, LFE2};
    static final int[] LOC_EXTRAS = {LCRC, LRSRRS, CS, TS, LSDRSD, LWRW, LVHRVH, CVH, LFE2};

    static JSONObject parse(byte[] b, int length, int start) {
        try {
            if (sync(b, length, start)) return frames(b, length, start);
            if (AudioHeader.matches(b, length, 4, "ftyp")) return mp4(b, length);
            if (length >= 4
                    && (b[0] & 0xff) == 0x1a
                    && (b[1] & 0xff) == 0x45
                    && (b[2] & 0xff) == 0xdf
                    && (b[3] & 0xff) == 0xa3) return matroska(b, length);
            if (length >= 2 && (b[0] & 0xff) == 0xac && ((b[1] & 0xff) & 0xfe) == 0x40)
                return details("ac4", 0, 0, 0, false);
        } catch (RuntimeException e) {
            // A header this can't follow just means no details.
        }
        return null;
    }

    // ── Plain Dolby Digital and Dolby Digital Plus ─────────────────────────────────────────

    static boolean sync(byte[] b, int length, int at) {
        return at + 1 < length && (b[at] & 0xff) == 0x0b && (b[at + 1] & 0xff) == 0x77;
    }

    /** The first frame, and the dependent frames after it that add channels (7.1). */
    static JSONObject frames(byte[] b, int length, int start) {
        Frame first = frame(b, length, start);
        if (first == null || first.dependent) return null;
        int speakers = first.speakers;
        int at = start + first.size;
        // A 7.1 stream is a 5.1 frame followed by a dependent one with the other two channels.
        for (int n = 0; n < 8 && first.eac3 && at > start && sync(b, length, at); n++) {
            Frame next = frame(b, length, at);
            if (next == null || !next.dependent) break;
            speakers |= next.speakers;
            at += next.size;
        }
        return details(first.eac3 ? "eac3" : "ac3", first.rate, speakers, first.atmos);
    }

    static final class Frame {
        boolean eac3, dependent, atmos;
        int rate, speakers, size;
    }

    static Frame frame(byte[] b, int length, int at) {
        if (!sync(b, length, at) || at + 8 > length) return null;
        Bits in = new Bits(b, at + 2, length);
        // bsid sits in the same place in both: 5 bits, 40 bits after the sync word's start.
        int bsid = ((b[at + 5] & 0xff) >> 3);
        Frame f = new Frame();
        if (bsid <= 10) {
            in.skip(16); // crc1
            int fscod = in.read(2), frmsizecod = in.read(6);
            if (fscod == 3 || frmsizecod > 37) return null;
            in.skip(5 + 3); // bsid, bsmod
            int acmod = in.read(3);
            if ((acmod & 1) != 0 && acmod != 1) in.skip(2); // cmixlev
            if ((acmod & 4) != 0) in.skip(2); // surmixlev
            if (acmod == 2) in.skip(2); // dsurmod
            boolean lfe = in.bit();
            f.rate = RATES[fscod];
            f.speakers = MODES[acmod] | (lfe ? LFE : 0);
            f.size = ac3FrameBytes(fscod, frmsizecod);
            return f;
        }
        if (bsid > 16) return null;
        f.eac3 = true;
        int strmtyp = in.read(2);
        in.skip(3); // substreamid
        f.size = (in.read(11) + 1) * 2;
        int fscod = in.read(2), numblkscod;
        if (fscod == 3) {
            int fscod2 = in.read(2);
            if (fscod2 == 3) return null;
            f.rate = REDUCED_RATES[fscod2];
            numblkscod = 3;
        } else {
            f.rate = RATES[fscod];
            numblkscod = in.read(2);
        }
        int blocks = BLOCKS[numblkscod];
        int acmod = in.read(3);
        boolean lfe = in.bit();
        in.skip(5); // bsid
        f.dependent = strmtyp == 1;
        int programmes = acmod == 0 ? 2 : 1;
        for (int i = 0; i < programmes; i++) {
            in.skip(5); // dialnorm
            if (in.bit()) in.skip(8); // compr
        }
        int speakers = MODES[acmod] | (lfe ? LFE : 0);
        if (strmtyp == 1 && in.bit()) {
            int chanmap = in.read(16);
            speakers = 0;
            int[] main = {L, C, R, LS, RS};
            for (int i = 0; i < 5; i++) if ((chanmap & (0x8000 >> i)) != 0) speakers |= main[i];
            for (int i = 0; i < MAP_EXTRAS.length; i++)
                if ((chanmap & (0x8000 >> (5 + i))) != 0) speakers |= MAP_EXTRAS[i];
            if ((chanmap & 1) != 0) speakers |= LFE;
        }
        f.speakers = speakers;
        if (in.bit()) { // mixmdate
            if (acmod > 2) in.skip(2); // dmixmod
            if ((acmod & 1) != 0 && acmod > 2) in.skip(6); // centre mix levels
            if ((acmod & 4) != 0) in.skip(6); // surround mix levels
            if (lfe && in.bit()) in.skip(5); // lfemixlevcod
            if (strmtyp == 0) {
                for (int i = 0; i < programmes; i++) if (in.bit()) in.skip(6); // pgmscl
                if (in.bit()) in.skip(6); // extpgmscl
                int mixdef = in.read(2);
                if (mixdef == 1) in.skip(5);
                else if (mixdef == 2) in.skip(12);
                else if (mixdef == 3) in.skip((in.read(5) + 2) * 8);
                if (acmod < 2)
                    for (int i = 0; i < programmes; i++) if (in.bit()) in.skip(14); // paninfo
                if (in.bit()) // frmmixcfginfoe
                for (int blk = 0; blk < blocks; blk++) if (blocks == 1 || in.bit()) in.skip(5);
            }
        }
        if (in.bit()) { // infomdate
            in.skip(3 + 1 + 1); // bsmod, copyrightb, origbs
            if (acmod == 2) in.skip(4); // dsurmod, dheadphonmod
            if (acmod >= 6) in.skip(2); // dsurexmod
            for (int i = 0; i < programmes; i++) if (in.bit()) in.skip(8); // audprodi
            if (fscod < 3) in.skip(1); // sourcefscod
        }
        if (strmtyp == 0 && numblkscod != 3) in.skip(1); // convsync
        if (strmtyp == 2 && (numblkscod == 3 || in.bit())) in.skip(6); // frmsizecod
        if (in.bit()) { // addbsie
            in.skip(6); // addbsil
            // The first byte's lowest bit is flag_ec3_extension_type_a: joint object coding, which
            // is how Dolby Atmos travels in Dolby Digital Plus.
            in.skip(7);
            f.atmos = in.bit();
        }
        return in.overrun() ? null : f;
    }

    /** Bytes in an AC-3 frame, from its sample rate and size code. */
    static int ac3FrameBytes(int fscod, int code) {
        int[] kbps = {
            32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384, 448, 512, 576, 640
        };
        int rate = kbps[code / 2];
        if (fscod == 0) return rate * 4;
        if (fscod == 1) return (320 * rate / 147 + (code & 1)) * 2;
        return rate * 6;
    }

    // ── .m4a and .mp4 ──────────────────────────────────────────────────────────────────────

    static JSONObject mp4(byte[] b, int length) {
        int moov = box(b, length, 0, length, "moov");
        // The description is at the end of this file: the first frames may still say.
        if (moov < 0) return firstFrames(b, length);
        for (String name : new String[] {"trak", "mdia", "minf", "stbl", "stsd"}) {
            int found = -1;
            for (int at = moov + 8; at + 8 <= end(b, moov, length); at += size(b, at, length)) {
                if (size(b, at, length) < 8) return null;
                if (name.equals("trak") && !audioTrack(b, at, length)) continue;
                if (AudioHeader.matches(b, length, at + 4, name)) {
                    found = at;
                    break;
                }
            }
            if (found < 0) return null;
            moov = found;
        }
        // stsd: full box header (4) and entry count (4), then the first sample entry.
        int entry = moov + 16;
        if (entry + 36 > length) return null;
        String codec = new String(b, entry + 4, 4, java.nio.charset.StandardCharsets.US_ASCII);
        int version = be16(b, entry + 16);
        int channels = be16(b, entry + 24);
        int rate = be16(b, entry + 32);
        int children = entry + 36 + (version == 1 ? 16 : version == 2 ? 36 : 0);
        int stop = end(b, entry, length);
        switch (codec) {
            case "ec-3":
                {
                    int dec3 = box(b, length, children, stop, "dec3");
                    JSONObject header =
                            dec3 < 0 ? details("eac3", rate, 0, channels, false) : dec3(b, dec3);
                    // Not every muxer writes dec3's Atmos flag; the first frame always has it.
                    JSONObject frames = header.optBoolean("atmos") ? null : firstFrames(b, length);
                    return frames != null && frames.optBoolean("atmos") ? frames : header;
                }
            case "ac-3":
                {
                    int dac3 = box(b, length, children, stop, "dac3");
                    if (dac3 < 0) return details("ac3", rate, 0, channels, false);
                    Bits in = new Bits(b, dac3 + 8, length);
                    int fscod = in.read(2);
                    in.skip(5 + 3);
                    int acmod = in.read(3);
                    boolean lfe = in.bit();
                    return details(
                            "ac3",
                            fscod < 3 ? RATES[fscod] : rate,
                            MODES[acmod] | (lfe ? LFE : 0),
                            false);
                }
            case "ac-4":
                return details("ac4", rate, 0, 0, false);
            case "alac":
                {
                    // The alac box: version and flags, frame length, compatible version, then
                    // the bit depth; the channel count and sample rate follow.
                    int alac = box(b, length, children, stop, "alac");
                    if (alac < 0 || alac + 36 > length) return null;
                    int bits = b[alac + 17] & 0xff;
                    int count = b[alac + 21] & 0xff;
                    int hz = be16(b, alac + 32) << 16 | be16(b, alac + 34);
                    return AudioHeader.details("alac", bits, hz, count, 0);
                }
            default:
                return null; // AAC and the rest: the bitrate says enough
        }
    }

    /** Dolby Digital (Plus) frames at the start of the file's media data, or null. */
    static JSONObject firstFrames(byte[] b, int length) {
        int mdat = box(b, length, 0, length, "mdat");
        if (mdat < 0) return null;
        int from = mdat + (size(b, mdat, length) == 1 ? 16 : 8);
        for (int f = from; f + 8 < Math.min(length, from + 4096); f++) {
            if (!sync(b, length, f)) continue;
            Frame frame = frame(b, length, f);
            if (frame == null || frame.dependent || !followed(b, length, f + frame.size)) continue;
            return frames(b, length, f);
        }
        return null;
    }

    /** dec3: the first independent substream's layout, the channels its dependents add, Atmos. */
    static JSONObject dec3(byte[] b, int at) {
        int size = size(b, at, b.length);
        Bits in = new Bits(b, at + 8, at + size);
        in.skip(13); // data_rate
        int substreams = in.read(3) + 1;
        int rate = 0, speakers = 0;
        for (int i = 0; i < substreams; i++) {
            int fscod = in.read(2);
            in.skip(5 + 1 + 1 + 3); // bsid, reserved, asvc, bsmod
            int acmod = in.read(3);
            boolean lfe = in.bit();
            in.skip(3);
            int dependents = in.read(4);
            int loc = 0;
            if (dependents > 0) loc = in.read(9);
            else in.skip(1);
            if (i == 0) {
                rate = fscod < 3 ? RATES[fscod] : 0;
                speakers = MODES[acmod] | (lfe ? LFE : 0);
                for (int k = 0; k < 9; k++)
                    if ((loc & (0x100 >> k)) != 0) speakers |= LOC_EXTRAS[k];
            }
        }
        // Then, when present: 7 reserved bits and flag_ec3_extension_type_a.
        boolean atmos = false;
        if (in.left() >= 16) {
            in.skip(7);
            atmos = in.bit();
        }
        return details("eac3", rate, speakers, atmos);
    }

    /** Whether a trak box is the sound track: its handler (mdia/hdlr) says "soun". */
    static boolean audioTrack(byte[] b, int trak, int length) {
        if (!AudioHeader.matches(b, length, trak + 4, "trak")) return true;
        int mdia = box(b, length, trak + 8, end(b, trak, length), "mdia");
        if (mdia < 0) return false;
        int hdlr = box(b, length, mdia + 8, end(b, mdia, length), "hdlr");
        return hdlr >= 0 && AudioHeader.matches(b, length, hdlr + 16, "soun");
    }

    /** The first child box with this name between two offsets, or -1. */
    static int box(byte[] b, int length, int from, int to, String name) {
        for (int at = from; at + 8 <= Math.min(to, length); ) {
            int size = size(b, at, length);
            if (size < 8) return -1;
            if (AudioHeader.matches(b, length, at + 4, name)) return at;
            at += size;
        }
        return -1;
    }

    static int size(byte[] b, int at, int length) {
        if (at + 8 > length) return -1;
        long size = be16(b, at) << 16 | be16(b, at + 2);
        if (size == 1 && at + 16 <= length) {
            long big = 0;
            for (int i = 0; i < 8; i++) big = big << 8 | (b[at + 8 + i] & 0xff);
            size = big;
        }
        return size < 8 || size > Integer.MAX_VALUE ? -1 : (int) size;
    }

    static int end(byte[] b, int at, int length) {
        int size = size(b, at, length);
        return size < 0 ? length : (int) Math.min((long) at + size, length);
    }

    // ── .mka ───────────────────────────────────────────────────────────────────────────────

    /** The first audio track's codec and channels, found by their element IDs. */
    static JSONObject matroska(byte[] b, int length) {
        String[][] codecs = {
            {"A_EAC3", "eac3"}, {"A_AC3", "ac3"}, {"A_TRUEHD", "truehd"}, {"A_AC4", "ac4"}
        };
        for (int at = 0; at + 3 < length; at++) {
            if ((b[at] & 0xff) != 0x86) continue; // CodecID
            int size = b[at + 1] & 0xff;
            if ((size & 0x80) == 0) continue;
            size &= 0x7f;
            if (size < 5 || size > 16 || at + 2 + size > length) continue;
            String id = new String(b, at + 2, size, java.nio.charset.StandardCharsets.US_ASCII);
            id = id.trim().replace("\u0000", "");
            for (String[] codec : codecs) {
                if (!id.equals(codec[0])) continue;
                int channels = element(b, length, at, 0x9f);
                if (codec[1].equals("eac3")) {
                    // The first frame, in the first block after the track list, says if it's Atmos.
                    for (int f = at; f + 8 < length; f++) {
                        if (!sync(b, length, f)) continue;
                        Frame frame = frame(b, length, f);
                        if (frame == null || frame.dependent) continue;
                        if (!followed(b, length, f + frame.size)) continue;
                        JSONObject header = frames(b, length, f);
                        if (header != null) return header;
                    }
                }
                // Matroska gives a count but not which: six and eight are 5.1 and 7.1.
                int lfe = channels == 6 || channels == 8 ? 1 : 0;
                boolean atmos = codec[1].equals("truehd") && trueHdAtmos(b, length, at);
                return details(codec[1], 0, lfe, channels, atmos);
            }
        }
        return null;
    }

    /**
     * Dolby Atmos in Dolby TrueHD: the first frame's major sync says the stream has four substreams
     * and sets the top bit of its substream info, the fourth carrying the Atmos objects. This is
     * the test ffmpeg's TrueHD decoder makes.
     */
    static boolean trueHdAtmos(byte[] b, int length, int from) {
        for (int at = from; at + 18 <= length; at++)
            if ((b[at] & 0xff) == 0xf8
                    && (b[at + 1] & 0xff) == 0x72
                    && (b[at + 2] & 0xff) == 0x6f
                    && (b[at + 3] & 0xff) == 0xba) {
                // After the sync: 32 bits of rates and channel layouts, 48 skipped, then the
                // variable-rate flag and peak rate (16), substream count (4), 2 skipped, the
                // extended info (2) and the substream info (8).
                int substreams = (b[at + 16] & 0xff) >> 4;
                int info = b[at + 17] & 0xff;
                return substreams == 4 && info >> 7 == 1;
            }
        return false;
    }

    /**
     * Whether another frame starts here, or just after the few bytes of the next block's header, or
     * the buffer ends first: what tells a real frame from two bytes that only look like one.
     */
    static boolean followed(byte[] b, int length, int at) {
        if (at >= length) return true;
        for (int i = at; i < Math.min(length - 1, at + 32); i++)
            if (sync(b, length, i)) return true;
        return false;
    }

    /** A small unsigned element (one-byte ID) near the codec, or 0. */
    static int element(byte[] b, int length, int near, int id) {
        for (int at = Math.max(0, near - 200); at + 2 < Math.min(length, near + 400); at++)
            if ((b[at] & 0xff) == id && (b[at + 1] & 0xff) == 0x81) return b[at + 2] & 0xff;
        return 0;
    }

    // ── Results ────────────────────────────────────────────────────────────────────────────

    static JSONObject details(String codec, int rate, int speakers, boolean atmos) {
        int lfe = ((speakers & LFE) != 0 ? 1 : 0) + ((speakers & LFE2) != 0 ? 1 : 0);
        int main = Integer.bitCount(speakers & ~(LFE | LFE2)) + Integer.bitCount(speakers & PAIRS);
        return details(codec, rate, lfe, main + lfe, atmos);
    }

    static JSONObject details(String codec, int rate, int lfe, int channels, boolean atmos) {
        try {
            JSONObject header = new JSONObject().put("codec", codec).put("bits", 0);
            if (rate > 0) header.put("rate", rate);
            if (channels > 0) header.put("channels", channels).put("lfe", lfe);
            if (atmos) header.put("atmos", true);
            return header;
        } catch (org.json.JSONException e) {
            return null;
        }
    }

    /** "5.1", "7.1", "2.0", or "" when the channels aren't known. */
    static String layout(JSONObject header) {
        int channels = header.optInt("channels"), lfe = header.optInt("lfe");
        if (channels <= 0) return "";
        return (channels - lfe) + "." + lfe;
    }

    static boolean dolby(String codec) {
        return codec.equals("ac3")
                || codec.equals("eac3")
                || codec.equals("truehd")
                || codec.equals("ac4");
    }

    /** "Dolby Atmos", "TrueHD Atmos", "DD+ 5.1", "DD 2.0", "TrueHD 7.1", "AC-4". */
    static String label(JSONObject header) {
        String codec = header.optString("codec");
        if (header.optBoolean("atmos"))
            return codec.equals("truehd") ? "TrueHD Atmos" : "Dolby Atmos";
        String layout = layout(header);
        String name =
                codec.equals("eac3")
                        ? "DD+"
                        : codec.equals("ac3") ? "DD" : codec.equals("truehd") ? "TrueHD" : "AC-4";
        return layout.isEmpty() ? name : name + " " + layout;
    }

    static int be16(byte[] b, int at) {
        return (b[at] & 0xff) << 8 | (b[at + 1] & 0xff);
    }

    /** Reads bits most significant first; reading past the end gives zeros and is noted. */
    static final class Bits {
        private final byte[] b;
        private final int end;
        private long position;
        private boolean over;

        Bits(byte[] b, int start, int end) {
            this.b = b;
            this.end = Math.min(end, b.length);
            this.position = (long) start * 8;
        }

        int read(int n) {
            int value = 0;
            for (int i = 0; i < n; i++) value = value << 1 | (bit() ? 1 : 0);
            return value;
        }

        boolean bit() {
            int at = (int) (position >> 3);
            if (at >= end) {
                over = true;
                position++;
                return false;
            }
            boolean set = (b[at] >> (7 - (position & 7)) & 1) != 0;
            position++;
            return set;
        }

        void skip(int n) {
            position += n;
            if (position > (long) end * 8) over = true;
        }

        long left() {
            return (long) end * 8 - position;
        }

        boolean overrun() {
            return over;
        }
    }
}
