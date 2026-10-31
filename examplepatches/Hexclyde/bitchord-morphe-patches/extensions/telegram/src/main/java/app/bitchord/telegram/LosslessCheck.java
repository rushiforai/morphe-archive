package app.bitchord.telegram;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * Whether a FLAC or WAV file is really lossless, from what's in it.
 *
 * <p>Lossy encoders throw away the top of the spectrum: an MP3 at 128 kbps keeps nothing above
 * about 16 kHz, and a file made from it keeps that brick-wall edge even after it's turned into
 * FLAC. A few stretches of the file are decoded, their spectrum averaged, and the edge looked for:
 * a sudden drop of at least 15 dB within 300 Hz, well below the top of the band. How often the
 * music reaches right up to the edge tells an encoder (which cuts some moments lower than others)
 * from a recording that never had much up there. A hi-res file whose music stops at 22 kHz was made
 * from a CD-rate master, and a 24-bit file whose last bits are always zero is a 16-bit one.
 *
 * <p>The method and its thresholds follow Spectra (MIT licence, github.com/aravindrejidev/Spectra).
 * It can show a file looks lossy; it can't prove a file is genuine.
 */
final class LosslessCheck {
    private LosslessCheck() {}

    static final int VERSION = 1;

    /** Off: files are taken at their word, and what was found is kept but not used. */
    static volatile boolean enabled = true;

    static final int FFT = 2048, HOP = 1024, BINS = FFT / 2, NB = 128, BAND_BINS = BINS / NB;
    private static final double SCALE = 4.0 / FFT, SCALE_SQ = SCALE * SCALE;

    /** Stretches decoded from a long file, and how long each is. */
    static final int SEGMENTS = 4, SEGMENT_SECONDS = 8;

    /** A file this short is decoded whole, up to this. */
    static final int WHOLE_SECONDS = 40;

    /** Cutoffs where common encoders put theirs: 128 kbps MP3 at 16 kHz, and so on. */
    private static final double[] SIGNATURES = {15500, 16000, 17000, 17500, 18000, 19000};

    private static final int[] RATES = {32000, 44100, 48000, 88200, 96000, 176400, 192000};

    /** Encoders a lossless file's tags shouldn't name. */
    private static final Pattern LOSSY_ENCODER =
            Pattern.compile(
                    "(?<![a-z])(lame|mp3|libmp3lame|shine|fhg|xing|aac|faac|fdk|nero|vorbis|opus)"
                            + "(?![a-z])",
                    Pattern.CASE_INSENSITIVE);

    private static final String[] ENCODER_TAGS = {
        "ENCODER", "ENCODED-BY", "ENCODEDBY", "ENCODED_BY", "ENCODING", "ENCODERSETTINGS"
    };

    // ── Reading the file ────────────────────────────────────────────────────

    /**
     * Whether a row is a file this can check: FLAC or WAV, alone, in a stored zip, or a cue album.
     */
    static boolean checkable(JSONObject row) {
        JSONObject zip = row.optJSONObject("zip");
        if (zip != null && zip.optInt("method") != 0) return false;
        JSONObject cue = row.optJSONObject("cue");
        if (cue != null) return true;
        return row.optString("format").toLowerCase(Locale.ROOT).matches("flac|wav|wave");
    }

    /**
     * What's stored for a file: one key for all the tracks of a cue album, since they're one file.
     */
    static String key(JSONObject row) {
        long entry = row.optLong("entry");
        if (CueAlbums.isTrack(entry)) entry = CueAlbums.albumEntry(entry);
        return row.optLong("chat") + "_" + row.optLong("message") + (entry > 0 ? "_" + entry : "");
    }

    /**
     * Checks one file, reading only parts of it through {@code file}. Null when it isn't a format
     * read here.
     */
    static JSONObject check(JSONObject row, ZipDirectory.Range file) throws Exception {
        JSONObject cue = row.optJSONObject("cue");
        long size = cue != null ? cue.optLong("total") : row.optLong("size");
        ZipDirectory.Range range = file;
        JSONObject zip = row.optJSONObject("zip");
        if (zip != null) {
            if (zip.optInt("method") != 0) return null;
            range =
                    ZipAlbums.entryRange(
                            file,
                            zip.optLong("data"),
                            zip.optInt("method"),
                            zip.optLong("compressed"),
                            size);
        }
        if (size <= 0) return null;
        CueAlbums.Media media = CueAlbums.media(range, size);
        if (media == null || media.rate <= 0 || media.channels <= 0) return null;
        long total = media.samples;
        if (total <= 0 && cue != null) total = cue.optLong("samples");
        if (total <= 0) total = (long) row.optInt("duration") * media.rate;
        if (total <= 0) return null;
        if (media.samples <= 0) media.samples = total;
        Spectrum spectrum = new Spectrum(media.rate, media.channels, media.bits);
        for (long[] part : segments(total, media.rate)) read(range, media, part, spectrum);
        String encoder = media.flac == null ? null : encoder(media.flac.comments);
        return spectrum.verdict(encoder);
    }

    /** Where to listen: the whole of a short file, else stretches spread through it. */
    static List<long[]> segments(long total, int rate) {
        List<long[]> parts = new ArrayList<>();
        if (total <= (long) WHOLE_SECONDS * rate) {
            parts.add(new long[] {0, total});
            return parts;
        }
        long length = (long) SEGMENT_SECONDS * rate;
        double[] at = {0.15, 0.38, 0.62, 0.85};
        for (int i = 0; i < SEGMENTS; i++) {
            long start = Math.max(0, Math.min(total - length, (long) (total * at[i]) - length / 2));
            parts.add(new long[] {start, start + length});
        }
        return parts;
    }

    /**
     * Decodes one stretch into {@code into}. A FLAC file is read from about where the stretch
     * starts, by its average bitrate, in one piece, and decoded from the first whole frame there;
     * where exactly it starts doesn't matter for a spectrum.
     */
    private static void read(
            ZipDirectory.Range range, CueAlbums.Media media, long[] part, Spectrum into)
            throws Exception {
        int count = (int) (part[1] - part[0]), channels = media.channels;
        int[][] samples = new int[channels][count];
        int have = 0;
        if (media.flac == null) {
            // WAV: the samples as they are.
            int width = CueAudio.container(media.bits) / 8, frameBytes = width * channels;
            int shift = CueAudio.container(media.bits) - media.bits;
            byte[] b = range.read(media.first + part[0] * frameBytes, count * frameBytes);
            for (; (have + 1) * frameBytes <= b.length && have < count; have++)
                for (int ch = 0; ch < channels; ch++) {
                    int at = have * frameBytes + ch * width, v;
                    if (width == 1) v = (b[at] & 0xff) - 128;
                    else {
                        v = b[at + width - 1];
                        for (int k = width - 2; k >= 0; k--) v = (v << 8) | (b[at + k] & 0xff);
                    }
                    samples[ch][have] = v >> shift;
                }
        } else {
            long audio = media.size - media.first, total = Math.max(1, media.samples);
            double perSample = audio / (double) total;
            int margin = Math.max(media.maxFrame, 16 * 1024) * 2;
            long from = media.first + (long) (part[0] * perSample);
            int length =
                    (int) Math.min(media.size - from, (long) (count * perSample) + 2L * margin);
            byte[] b = range.read(from, length);
            int p = 0;
            FlacDecoder.Frame f = null;
            // The first whole frame: a frame header whose frame decodes and passes its CRC.
            for (; p + 16 < Math.min(b.length, margin); p++)
                if ((b[p] & 0xff) == 0xff
                        && ((b[p + 1] & 0xff) & 0xfe) == 0xf8
                        && (f = FlacDecoder.decode(b, p, b.length, media.flac)) != null) break;
            while (f != null && have < count) {
                int n = Math.min(f.count, count - have);
                for (int ch = 0; ch < channels; ch++)
                    System.arraycopy(f.samples[ch], 0, samples[ch], have, n);
                have += n;
                p += f.length;
                f = FlacDecoder.decode(b, p, b.length, media.flac);
            }
        }
        into.add(samples, have);
    }

    /** A lossy encoder named in a FLAC file's tags, or null. */
    static String encoder(byte[] comments) {
        if (comments == null) return null;
        for (String tag : ENCODER_TAGS) {
            String value = CueAlbums.comment(comments, tag);
            if (value != null && LOSSY_ENCODER.matcher(value).find())
                return value.length() > 64 ? value.substring(0, 64) : value;
        }
        return null;
    }

    // ── The spectrum ────────────────────────────────────────────────────────

    /** Spectra of every frame of the stretches read, and which bits the samples use. */
    static final class Spectrum {
        final int rate, channels, bits;
        private final double[] avg = new double[BINS];
        private final List<float[]> bands = new ArrayList<>();
        private int frames;
        private long used;
        private final double[] window = new double[FFT];

        Spectrum(int rate, int channels, int bits) {
            this.rate = rate;
            this.channels = channels;
            this.bits = bits;
            for (int i = 0; i < FFT; i++) window[i] = 0.5 - 0.5 * Math.cos(2 * Math.PI * i / FFT);
        }

        /** One stretch of samples, per channel, at the file's bit depth. */
        void add(int[][] samples, int count) {
            for (int[] channel : samples) for (int i = 0; i < count; i++) used |= channel[i];
            double full = Math.pow(2, bits - 1);
            int listened = Math.min(samples.length, 2);
            double[] re = new double[FFT], im = new double[FFT], power = new double[BINS];
            for (int start = 0; start + FFT <= count; start += HOP) {
                Arrays.fill(power, 0);
                for (int ch = 0; ch < listened; ch++) {
                    for (int i = 0; i < FFT; i++) {
                        re[i] = samples[ch][start + i] / full * window[i];
                        im[i] = 0;
                    }
                    Fingerprint.fft(re, im);
                    for (int k = 0; k < BINS; k++)
                        power[k] += (re[k] * re[k] + im[k] * im[k]) / listened;
                }
                float[] band = new float[NB];
                double[] sum = new double[NB];
                for (int k = 0; k < BINS; k++) {
                    avg[k] += Math.sqrt(power[k]) * SCALE;
                    sum[k / BAND_BINS] += power[k];
                }
                for (int b = 0; b < NB; b++)
                    band[b] =
                            (float)
                                    (10
                                            * Math.log10(
                                                    Math.max(
                                                            sum[b] / BAND_BINS * SCALE_SQ, 1e-18)));
                bands.add(band);
                frames++;
            }
        }

        /** Bits the samples really use: fewer than the file says when the rest are always 0. */
        int effectiveBits() {
            if (used == 0) return 0;
            return Math.max(1, bits - Long.numberOfTrailingZeros(used));
        }

        /** What was found, as stored with the file. */
        JSONObject verdict(String encoder) throws Exception {
            JSONObject out = new JSONObject().put("v", VERSION);
            if (frames == 0) return out.put("verdict", "unknown");
            double[] mean = new double[BINS];
            for (int k = 0; k < BINS; k++) mean[k] = avg[k] / frames;
            Edge edge = edge(mean);
            double nyquist = rate / 2.0, ratio = edge.cutoff / nyquist;
            String verdict = "ok";
            int score = 0;
            if (!edge.found) verdict = "ok";
            else if (rate >= 88200 && ratio <= 0.56 && edge.cutoff >= 18500) {
                verdict = "upsampled";
                out.put("from", sourceRate(edge.cutoff));
                score =
                        Math.min(
                                95,
                                78 + Math.max(0, Math.min(12, (int) ((edge.strength - 20) / 2))));
            } else if (nyquist < 20000 || edge.cutoff >= 21000) verdict = "ok";
            else if (edge.cutoff >= 19500) {
                // CD-era anti-alias filters and 256-320 kbps encodes look alike here.
                score = 30;
                if (edge.lock != null) score += edge.lock < 0.5 ? 20 : edge.lock < 0.8 ? 8 : -10;
                score = clamp(score, 10, 60);
                if (score >= 50) verdict = "suspect";
            } else {
                score = edge.cutoff >= 12000 ? 62 : 50;
                if (edge.strength >= 30) score += 4;
                if (edge.lock != null) {
                    if (edge.lock < 0.5) score += 10;
                    else if (edge.lock >= 0.8) score -= 12;
                }
                for (double s : SIGNATURES)
                    if (Math.abs(s - edge.cutoff) < 250) {
                        score += 6;
                        break;
                    }
                score = clamp(score, 40, 96);
                if (score >= 70) {
                    verdict = "lossy";
                    out.put("kbps", kbps(edge.cutoff));
                } else if (score >= 50) verdict = "suspect";
            }
            if (encoder != null) {
                out.put("encoder", encoder);
                if (verdict.equals("ok")) verdict = "suspect";
            }
            out.put("verdict", verdict);
            if (edge.found) {
                out.put("cutoff", (int) Math.round(edge.cutoff));
                out.put("strength", Math.round(edge.strength * 10) / 10.0);
                if (edge.lock != null) out.put("lock", Math.round(edge.lock * 100) / 100.0);
            }
            if (score > 0) out.put("score", score);
            int real = effectiveBits();
            if (real > 0) out.put("bits", real).put("declared", bits);
            return out;
        }

        private static final class Edge {
            boolean found;
            double cutoff, strength;
            Double lock;
        }

        private Edge edge(double[] avg) {
            int n = avg.length;
            double nyquist = rate / 2.0, binHz = nyquist / n;
            double[] raw = new double[n], db = new double[n];
            for (int k = 0; k < n; k++) raw[k] = 20 * Math.log10(Math.max(avg[k], 1e-9));
            for (int k = 0; k < n; k++) {
                double s = 0;
                int c = 0;
                for (int j = Math.max(0, k - 2); j <= Math.min(n - 1, k + 2); j++, c++) s += raw[j];
                db[k] = s / c;
            }
            int w = Math.max(4, (int) Math.round(300 / binHz));
            int kMin = Math.max((int) Math.round(4000 / binHz), w + 1);
            double best = Double.NEGATIVE_INFINITY;
            int kb = -1;
            for (int k = kMin; k < n - 1 - w; k++) {
                double left = 0, right = 0;
                for (int j = 1; j <= w; j++) {
                    left += db[k - j];
                    right += db[k + j];
                }
                double d = (left - right) / w;
                if (d > best) {
                    best = d;
                    kb = k;
                }
            }
            Edge edge = new Edge();
            edge.strength = kb >= 0 ? best : 0;
            edge.cutoff = nyquist;
            edge.found =
                    kb >= 0 && best >= 15 && kb * binHz < 0.97 * nyquist && n - 1 - (kb + w) >= 5;
            if (edge.found) {
                edge.cutoff = kb * binHz;
                edge.lock = lock(edge.cutoff);
            }
            return edge;
        }

        /**
         * Of the frames that reach (nearly) up to the edge, how many have their top right at it.
         */
        private Double lock(double cutoff) {
            int count = bands.size();
            double bandHz = (rate / 2.0) / NB;
            int cb = (int) Math.round(cutoff / bandHz), lo = cb + 2;
            if (count < 20 || NB - lo < 3) return null;
            int step = Math.max(1, count / 2000);
            float[] sample = new float[((count + step - 1) / step) * (NB - lo)];
            int m = 0;
            for (int f = 0; f < count; f += step)
                for (int b = lo; b < NB; b++) sample[m++] = bands.get(f)[b];
            Arrays.sort(sample, 0, m);
            float threshold = sample[m / 2] + 12f; // the floor above the edge, plus 12 dB
            int lowBand = (int) (3000 / bandHz);
            int brightFrom = cb - (int) Math.round(1500 / bandHz);
            int tolerance = Math.max(2, (int) Math.round(400 / bandHz));
            int bright = 0, locked = 0;
            for (float[] band : bands) {
                int top = -1;
                for (int b = NB - 1; b > lowBand; b--)
                    if (band[b] >= threshold && band[b - 1] >= threshold) {
                        top = b;
                        break;
                    }
                if (top >= brightFrom) {
                    bright++;
                    if (Math.abs(top - cb) <= tolerance) locked++;
                }
            }
            return bright >= 20 ? (double) locked / bright : null;
        }

        private static int clamp(int v, int lo, int hi) {
            return Math.max(lo, Math.min(hi, v));
        }
    }

    /** The bitrate a lossy encoder usually cuts at this frequency for. */
    static int kbps(double cutoff) {
        if (cutoff < 12000) return 64;
        if (cutoff < 15000) return 96;
        if (cutoff < 16800) return 128;
        if (cutoff < 17800) return 160;
        if (cutoff < 19000) return 192;
        if (cutoff < 19900) return 256;
        return 320;
    }

    /** The sample rate of the master a hi-res file whose music stops here was made from. */
    static int sourceRate(double cutoff) {
        for (int r : RATES) if (r / 2.0 >= cutoff * 0.985) return r;
        return RATES[RATES.length - 1];
    }

    // ── What a check means ──────────────────────────────────────────────────

    /**
     * What's known about a file: its full check, or failing that what its first bytes said (a lossy
     * encoder in its tags, or a 24-bit file with 16 bits in it). Null when nothing is.
     */
    static JSONObject of(JSONObject row, JSONObject header) {
        if (!enabled) return null;
        JSONObject check = row == null ? null : row.optJSONObject("check");
        if (check != null && check.has("verdict")) return check;
        if (header == null) return null;
        try {
            JSONObject quick = null;
            if (header.has("encoder"))
                quick =
                        new JSONObject()
                                .put("verdict", "suspect")
                                .put("encoder", header.optString("encoder"));
            if (header.optInt("real") > 0) {
                if (quick == null) quick = new JSONObject().put("verdict", "ok");
                quick.put("bits", header.optInt("real")).put("declared", header.optInt("bits"));
            }
            return quick;
        } catch (org.json.JSONException e) {
            return null;
        }
    }

    /** A 24-bit file with at least 4 of its bits always zero: really this many bits, or 0. */
    static int padded(JSONObject verdict) {
        if (verdict == null) return 0;
        int bits = verdict.optInt("bits"), declared = verdict.optInt("declared");
        return declared > 16 && bits > 0 && declared - bits >= 4 ? bits : 0;
    }

    static boolean fake(JSONObject verdict) {
        return verdict != null && verdict.optString("verdict").equals("lossy");
    }

    /**
     * The quality tier BitChord ranks by, given what the file's name and size say ({@code base})
     * and what the check found: a file made from an MP3 is ranked as that MP3, and a hi-res file
     * made from a CD-quality one as CD quality.
     */
    static String quality(String base, JSONObject verdict) {
        if (verdict == null || base == null || !base.contains("LOSSLESS")) return base;
        String v = verdict.optString("verdict");
        if (v.equals("lossy")) {
            int kbps = verdict.optInt("kbps");
            return kbps >= 256 ? "HIGH" : kbps > 0 && kbps <= 160 ? "LOW" : "";
        }
        if (base.equals("HI_RES_LOSSLESS")) {
            int padded = padded(verdict);
            if (v.equals("upsampled") || (padded > 0 && padded <= 16)) return "LOSSLESS";
        }
        return base;
    }

    /** The bit depth to report: the one really used, when the file is padded. */
    static int bits(int declared, JSONObject verdict) {
        int padded = padded(verdict);
        return padded > 0 ? padded : declared;
    }

    /** The format legend with what the check found: "FLAC 16bit · from ≈128 kbps". */
    static String legend(String label, JSONObject verdict) {
        if (verdict == null || label == null || label.isEmpty()) return label;
        switch (verdict.optString("verdict")) {
            case "lossy":
                return verdict.optInt("kbps") > 0
                        ? Strings.f("{0} · from ≈{1} kbps", label, verdict.optInt("kbps"))
                        : Strings.f("{0} · from a lossy file", label);
            case "suspect":
                return Strings.f("{0} · maybe lossy", label);
            case "upsampled":
                return Strings.f("{0} · from {1}", label, rate(verdict.optInt("from")));
            default:
                int padded = padded(verdict);
                return padded > 0 ? Strings.f("{0} · really {1}bit", label, padded) : label;
        }
    }

    /** "44.1 kHz", "48 kHz". */
    static String rate(int hz) {
        return hz % 1000 == 0
                ? hz / 1000 + " kHz"
                : String.format(Locale.US, "%.1f kHz", hz / 1000.0);
    }

    // ── The first bytes ─────────────────────────────────────────────────────

    /**
     * What a FLAC file's first bytes say without decoding the rest: a lossy encoder in its tags,
     * and, from the first frames, which bits its samples use. Added to its header.
     */
    static void quick(byte[] b, int length, int at, JSONObject header) {
        try {
            FlacDecoder.Info info = new FlacDecoder.Info();
            info.rate = header.optInt("rate");
            info.channels = header.optInt("channels");
            info.bits = header.optInt("bits");
            // The metadata blocks, then the frames.
            int p = at;
            boolean last = false;
            for (int n = 0; n < 1000 && !last; n++) {
                if (p + 4 > length) return;
                int type = b[p] & 0x7f, size = FlacDecoder.be(b, p + 1, 3);
                last = (b[p] & 0x80) != 0;
                if (type == 0 && size >= 18) {
                    info.minBlock = FlacDecoder.be(b, p + 4, 2);
                    info.maxBlock = FlacDecoder.be(b, p + 6, 2);
                    info.maxFrame = FlacDecoder.be(b, p + 11, 3);
                }
                if (type == 4 && p + 4 + size <= length) {
                    String encoder = encoder(Arrays.copyOfRange(b, p + 4, p + 4 + size));
                    if (encoder != null) header.put("encoder", encoder);
                }
                p += 4 + size;
            }
            long used = 0;
            int decoded = 0;
            while (p < length && decoded < 64) {
                FlacDecoder.Frame f = FlacDecoder.decode(b, p, length, info);
                if (f == null) break;
                for (int[] channel : f.samples)
                    for (int i = 0; i < f.count; i++) used |= channel[i];
                p += f.length;
                decoded++;
            }
            // Silence says nothing; a few thousand samples of music say which bits are used.
            if (used != 0 && decoded >= 2)
                header.put("real", Math.max(1, info.bits - Long.numberOfTrailingZeros(used)));
        } catch (Exception ignored) {
            // A header without these is still a header.
        }
    }
}
