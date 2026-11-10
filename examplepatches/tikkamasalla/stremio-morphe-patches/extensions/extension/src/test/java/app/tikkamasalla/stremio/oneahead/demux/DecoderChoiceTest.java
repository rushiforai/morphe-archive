package app.tikkamasalla.stremio.oneahead.demux;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Standalone (no JUnit): which decoder and which track, and the header reads that keep FFmpeg's converter safe.
 * Exit 1 on any failure. The decoding itself needs a device: see the emulator harness.
 */
public class DecoderChoiceTest {
    private static int fails, total;

    private static void check(String name, boolean ok) {
        total++;
        if (!ok) fails++;
        System.out.println((ok ? "ok   " : "FAIL ") + name);
    }

    private static TrackInfo track(int number, String mime, String lang, int channels, boolean isDefault) {
        TrackInfo t = new TrackInfo();
        t.number = number;
        t.mime = mime;
        t.language = lang;
        t.channels = channels;
        t.isDefault = isDefault;
        return t;
    }

    private static final TrackChooser.Probe ALL = new TrackChooser.Probe() {
        @Override
        public boolean canDecode(String mime) {
            return true;
        }

        @Override
        public boolean isSoftware(String mime) {
            return true;
        }
    };

    private static final class Stub implements AudioDecoder.Factory {
        final String has;
        String created;

        Stub(String has) {
            this.has = has;
        }

        @Override
        public boolean canDecode(String mime) {
            return has.equals(mime);
        }

        @Override
        public boolean isSoftware(String mime) {
            return canDecode(mime);
        }

        @Override
        public AudioDecoder create(TrackInfo t, AudioDecoder.Output o) {
            created = t.mime;
            return null;
        }
    }

    private static void chooser() {
        TrackChooser.Request eng = new TrackChooser.Request("eng", 0);
        TrackInfo thd = track(1, "audio/true-hd", "eng", 8, true), ac3 = track(2, "audio/ac3", "eng", 2, false);
        check("stereo AC3 beats default 7.1 TrueHD", TrackChooser.choose(Arrays.asList(thd, ac3), eng, ALL) == ac3);
        TrackInfo dts = track(1, "audio/vnd.dts", "eng", 6, true), eac3 = track(2, "audio/eac3", "eng", 6, false);
        check("5.1 EAC3 beats default 5.1 DTS", TrackChooser.choose(Arrays.asList(dts, eac3), eng, ALL) == eac3);
        TrackInfo jpn = track(1, "audio/ac3", "jpn", 2, true);
        check("language outranks cost", TrackChooser.choose(Arrays.asList(jpn, thd), eng, ALL) == thd);
        check("no match in the language is no track", TrackChooser.choose(Arrays.asList(jpn), eng, ALL) == null);
        TrackInfo a = track(1, "audio/ac3", "eng", 6, true), b = track(2, "audio/ac3", "eng", 6, false);
        check("default flag still breaks a cost tie", TrackChooser.choose(Arrays.asList(b, a), eng, ALL) == a);
        check("costliest track on its own is still chosen", TrackChooser.choose(Arrays.asList(thd), eng, ALL) == thd);
        TrackChooser.Request none = new TrackChooser.Request("", 0);
        check("unknown language: costliest alone is chosen", TrackChooser.choose(Arrays.asList(track(1, "audio/true-hd", "", 8, false)), none, ALL) != null);
        TrackInfo commentary = track(2, "audio/ac3", "eng", 2, false);
        commentary.name = "Director commentary";
        check("a cheap commentary does not win", TrackChooser.choose(Arrays.asList(thd, commentary), eng, ALL) == thd);
        TrackChooser.Probe noDts = new TrackChooser.Probe() {
            @Override
            public boolean canDecode(String mime) {
                return !mime.equals("audio/vnd.dts");
            }

            @Override
            public boolean isSoftware(String mime) {
                return true;
            }
        };
        check("undecodable is skipped", TrackChooser.choose(Arrays.asList(dts), eng, noDts) == null);
    }

    private static TrackInfo named(int number, String mime, String lang, int channels, boolean isDefault, String name) {
        TrackInfo t = track(number, mime, lang, channels, isDefault);
        t.name = name;
        return t;
    }

    private static void reasons() {
        // Our Great National Parks on the Streamer: main English E-AC3 5.1 plus a Czech AAC 5.1 dub.
        // The viewer played English, so every file reads English: track #2 A_AAC cs 6ch was the bug.
        TrackInfo eac3 = track(1, "audio/eac3", "en", 6, true);
        TrackInfo aac = named(2, "audio/mp4a-latm", "cs", 6, false, "Czech");
        TrackChooser.Request eng51 = new TrackChooser.Request("eng", 6);
        check("viewer English 5.1 reads E-AC3, not the Czech dub",
                TrackChooser.choose(Arrays.asList(eac3, aac), eng51, ALL) == eac3);
        check("Czech-first order still reads E-AC3",
                TrackChooser.choose(Arrays.asList(aac, eac3), eng51, ALL) == eac3);
        check("logged reason names the language, channels and codec",
                TrackChooser.reason(Arrays.asList(eac3, aac), eac3, eng51).contains("lang=eng")
                        && TrackChooser.reason(Arrays.asList(eac3, aac), eac3, eng51).contains("6")
                        && TrackChooser.reason(Arrays.asList(eac3, aac), eac3, eng51).contains("audio/eac3"));
        // Unknown want (no player language): same-layout E-AC3 beats AAC by codec cost.
        TrackInfo aac2 = track(2, "audio/mp4a-latm", "eng", 6, false);
        check("no want reads E-AC3 over same-layout AAC",
                TrackChooser.choose(Arrays.asList(aac2, eac3), new TrackChooser.Request(null, 0), ALL) == eac3);
        // Name lists are the Streamer's own: "cs" is Czech, "uk" is Ukrainian, not English.
        check("cs normalises to ces, not eng", "ces".equals(TrackChooser.normalize("cs")));
        check("uk normalises to ukr, not eng", "ukr".equals(TrackChooser.normalize("uk")));
        // Second cheapest E-AC3 5.1 wins over a stereo E-AC3 when the viewer plays 5.1.
        TrackInfo stereo = track(3, "audio/eac3", "eng", 2, false);
        check("same language keeps the 5.1 layout the viewer plays",
                TrackChooser.choose(Arrays.asList(stereo, eac3), eng51, ALL) == eac3);
    }

    private static void selection() throws DemuxException {
        Stub media = new Stub("audio/mp4a-latm"), ffmpeg = new Stub("audio/ac3");
        SoftwareDecoders d = new SoftwareDecoders(media, ffmpeg);
        check("either can decode", d.canDecode("audio/mp4a-latm") && d.canDecode("audio/ac3") && !d.canDecode("audio/x"));
        d.create(track(1, "audio/mp4a-latm", "", 2, true), null);
        check("software MediaCodec first", "audio/mp4a-latm".equals(media.created) && ffmpeg.created == null);
        d.create(track(1, "audio/ac3", "", 2, true), null);
        check("FFmpeg when MediaCodec has none", "audio/ac3".equals(ffmpeg.created));
        check("codec names", "dca".equals(AppFfmpegDecoder.codecName("audio/vnd.dts")) && "truehd".equals(AppFfmpegDecoder.codecName("audio/true-hd"))
                && "ac3".equals(AppFfmpegDecoder.codecName("audio/ac3")) && "eac3".equals(AppFfmpegDecoder.codecName("audio/eac3"))
                && AppFfmpegDecoder.codecName("audio/opus") == null && AppFfmpegDecoder.codecName(null) == null);
        // A PC has none of the app's classes: this is the missing-class refusal, once, with a word.
        List<String> logged = new ArrayList<>();
        AppFfmpegDecoder.Factory f = new AppFfmpegDecoder.Factory(logged::add);
        check("no app classes: refused", !f.canDecode("audio/ac3") && !f.canDecode("audio/vnd.dts") && !f.isSoftware("audio/eac3"));
        check("refused once, with its reason", logged.size() == 1 && logged.get(0).startsWith("ffmpeg refused: no-class"));
        try {
            f.create(track(1, "audio/ac3", "", 2, true), null);
            check("create refuses too", false);
        } catch (DemuxException e) {
            check("create refuses too", e.kind == DemuxException.Kind.DECODER_MISSING);
        }
        check("unmapped type never loads anything", !f.canDecode("audio/opus"));
    }

    /** bsid 8, then acmod and lfe placed by the optional fields the acmod brings. */
    private static byte[] ac3(int acmod, int lfe) {
        int at = 51 + ((acmod & 1) != 0 && acmod != 1 ? 2 : 0) + ((acmod & 4) != 0 ? 2 : 0) + (acmod == 2 ? 2 : 0);
        byte[] b = new byte[16];
        b[0] = 0x0B;
        b[1] = 0x77;
        b[5] = 8 << 3;
        b[6] = (byte) (acmod << 5);
        if (lfe != 0) b[at >> 3] |= (byte) (0x80 >> (at & 7));
        return b;
    }

    private static byte[] eac3(int acmod, int lfe, int bytes) {
        int words = bytes / 2 - 1;
        byte[] b = new byte[bytes];
        b[0] = 0x0B;
        b[1] = 0x77;
        b[2] = (byte) (words >> 8 & 7);
        b[3] = (byte) words;
        b[4] = (byte) (acmod << 1 | lfe);
        b[5] = (byte) (16 << 3);
        return b;
    }

    private static void layouts() {
        check("AC3 5.1 and 2.0 differ", AppFfmpegDecoder.layoutOf("ac3", ac3(7, 1), 0, 16) != AppFfmpegDecoder.layoutOf("ac3", ac3(2, 0), 0, 16));
        check("AC3 same layout same number", AppFfmpegDecoder.layoutOf("ac3", ac3(7, 1), 0, 16) == AppFfmpegDecoder.layoutOf("ac3", ac3(7, 1), 0, 16));
        check("AC3 LFE counts", AppFfmpegDecoder.layoutOf("ac3", ac3(7, 1), 0, 16) != AppFfmpegDecoder.layoutOf("ac3", ac3(7, 0), 0, 16));
        byte[] alone = eac3(7, 1, 32), both = new byte[64];
        System.arraycopy(alone, 0, both, 0, 32);
        System.arraycopy(eac3(2, 0, 32), 0, both, 32, 32);
        check("E-AC-3 dependent frame counts", AppFfmpegDecoder.layoutOf("eac3", alone, 0, 32) != AppFfmpegDecoder.layoutOf("eac3", both, 0, 64));
        byte[] core = ac3(7, 1); // 32 kbit/s at 48 kHz: 128 bytes.
        byte[] coreOnly = new byte[128], coreAndMore = new byte[160];
        System.arraycopy(core, 0, coreOnly, 0, 16);
        System.arraycopy(core, 0, coreAndMore, 0, 16);
        System.arraycopy(eac3(2, 0, 32), 0, coreAndMore, 128, 32);
        check("AC-3 core with a dependent frame counts", AppFfmpegDecoder.layoutOf("eac3", coreOnly, 0, 128) != AppFfmpegDecoder.layoutOf("eac3", coreAndMore, 0, 160));
        byte[] mapped = eac3(2, 0, 32);
        mapped[2] |= 0x40; // strmtyp 1
        mapped[6] = 0; // dialnorm, compre 0
        long plain = AppFfmpegDecoder.layoutOf("eac3", mapped, 0, 32);
        mapped[6] = 0x10; // chanmape at bit 51, chanmap right after it
        mapped[7] = 0x10;
        check("E-AC-3 chanmap counts", plain != AppFfmpegDecoder.layoutOf("eac3", mapped, 0, 32));
        check("no sync says nothing", AppFfmpegDecoder.layoutOf("ac3", new byte[16], 0, 16) == Long.MIN_VALUE);
        byte[] swapped = {0x77, 0x0B, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        check("byte-swapped AC-3 says nothing", AppFfmpegDecoder.layoutOf("ac3", swapped, 0, swapped.length) == Long.MIN_VALUE);
        byte[] thd = new byte[24];
        thd[4] = (byte) 0xF8;
        thd[5] = 0x72;
        thd[6] = 0x6F;
        thd[7] = (byte) 0xBA;
        thd[11] = 4;
        byte[] thd2 = thd.clone(), thd3 = thd.clone();
        thd2[11] = 5;
        thd3[20] = 0x30;
        long one = AppFfmpegDecoder.layoutOf("truehd", thd, 0, 24);
        check("TrueHD major sync says", one != AppFfmpegDecoder.layoutOf("truehd", thd2, 0, 24));
        check("TrueHD substream count counts", one != AppFfmpegDecoder.layoutOf("truehd", thd3, 0, 24));
        check("TrueHD without one says nothing", AppFfmpegDecoder.layoutOf("truehd", new byte[24], 0, 24) == Long.MIN_VALUE);
        check("a DTS frame without a core says nothing", AppFfmpegDecoder.layoutOf("dca", new byte[24], 0, 24) == Long.MIN_VALUE);
    }

    private static void dtsCore() {
        int core = 2012;
        byte[] b = new byte[core + 500];
        b[0] = 0x7F;
        b[1] = (byte) 0xFE;
        b[2] = (byte) 0x80;
        b[3] = 0x01;
        int fsize = core - 1; // 14 bits from bit 46.
        b[5] = (byte) (fsize >> 12);
        b[6] = (byte) (fsize >> 4);
        b[7] = (byte) (fsize << 4);
        b[core] = 0x64;
        b[core + 1] = 0x58;
        b[core + 2] = 0x20;
        b[core + 3] = 0x25;
        check("DTS-HD: cut to the core", AppFfmpegDecoder.dtsCoreBytes(b, 0, b.length) == core);
        check("frame size outside the packet: whole", AppFfmpegDecoder.dtsCoreBytes(b, 0, core + 2) == core + 2);
        byte[] padded = new byte[1008 + 100];
        System.arraycopy(b, 0, padded, 0, 8);
        padded[5] = 0; // A 1006-byte core, then two bytes to the 4-byte boundary.
        padded[6] = (byte) (1005 >> 4);
        padded[7] = (byte) (1005 << 4);
        padded[1008] = 0x64;
        padded[1009] = 0x58;
        padded[1010] = 0x20;
        padded[1011] = 0x25;
        check("DTS-HD: extension on the boundary", AppFfmpegDecoder.dtsCoreBytes(padded, 0, padded.length) == 1006);
        b[core] = 0;
        check("no extension sync: whole", AppFfmpegDecoder.dtsCoreBytes(b, 0, b.length) == b.length);
        b[0] = 0;
        check("not a core frame: whole", AppFfmpegDecoder.dtsCoreBytes(b, 0, b.length) == b.length);
    }

    public static void main(String[] a) throws Exception {
        chooser();
        reasons();
        selection();
        layouts();
        dtsCore();
        TrackInfo t = track(1, "audio/true-hd", "", 6, true);
        check("TrueHD access unit at 48 kHz", t.codecFrameNs() == 833333);
        t.sampleRate = 96000;
        check("the same at 96 kHz", t.codecFrameNs() == 833333);
        t.sampleRate = 44100;
        check("and in the 44.1 family", t.codecFrameNs() == 907029);
        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
