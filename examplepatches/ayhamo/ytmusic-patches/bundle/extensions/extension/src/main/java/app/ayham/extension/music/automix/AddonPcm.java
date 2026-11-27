package app.ayham.extension.music.automix;

import android.content.Context;
import android.util.Log;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Locale;

import app.ayham.extension.music.addons.AddonPrep;
import app.ayham.extension.music.addons.AudioDecode;

/**
 * A song's addon audio for the mix decks: its opening and its end as deck PCM (Analyzer.Pcm) on
 * YouTube's timeline (offset-map.md: addonTime = youtubeTime + offsetSec), the source gain baked
 * in, silence where the file has no audio. Rates over the engine's are brought down to it; lower
 * ones are kept (the engine resamples them like YouTube's). A mix whose song plays from an addon
 * mixes the addon's audio, so the takeover and the handover don't change the sound.
 */
public final class AddonPcm {
    private static final String TAG = "AyhamAddons";

    private AddonPcm() {
    }

    static File headFile(Context c, String id) {
        return new File(Analyzer.pcmDir(c), id + ".ahead");
    }

    static File tailFile(Context c, String id) {
        return new File(Analyzer.pcmDir(c), id + ".atail");
    }

    static Analyzer.Pcm head(Context c, String id) {
        return Analyzer.Pcm.open(headFile(c, id));
    }

    static Analyzer.Pcm tail(Context c, String id) {
        return Analyzer.Pcm.open(tailFile(c, id));
    }

    public static void delete(Context c, String id) {
        if (c == null || id == null) return;
        for (File f : new File[]{headFile(c, id), tailFile(c, id), part(headFile(c, id)), part(tailFile(c, id))})
            //noinspection ResultOfMethodCallIgnored
            f.delete();
    }

    private static File part(File f) {
        return new File(f.getPath() + ".part");
    }

    /** YouTube's copy of the song: the one the analysis downloads too (kept while addons are on). */
    public static File youtubeFile(Context c, String id) throws Exception {
        return StreamDeck.youtubeCopy(c, id);
    }

    /** The decks' safety ceiling for a boosted song (the fit's boost already keeps it under -1 dBTP). */
    static final double DECK_CEILING_DBFS = -0.3;

    /** Decodes the prepared file again and writes its opening and end on YouTube's timeline. */
    public static void write(Context c, final AddonPrep.Prepared p) throws Exception {
        long t0 = System.currentTimeMillis();
        // written beside them and moved in when whole: the song is ready (and may mix) before this is done
        final File hf = part(headFile(c, p.id)), tf = part(tailFile(c, p.id));
        final Writer[] w = new Writer[2];
        try {
            AudioDecode.decode(p.file, new AudioDecode.Sink() {
                long a; // addon frames seen
                long d; // addon frame = youtube frame + d
                int rate;
                long headN, tailFrom, tailTo;
                float gain = p.gainLinear();
                float[][] buf;

                @Override
                public void format(int r, int channels) throws IOException {
                    rate = r;
                    d = Math.round(p.offsetSec * r);
                    headN = Math.round(Analyzer.HEAD_SEC * r);
                    tailTo = Math.round(p.ytDurationSec * r);
                    tailFrom = Math.max(0, tailTo - Math.round(Analyzer.TAIL_SEC * r));
                    int out = r > Engine.SR ? Engine.SR : r;
                    w[0] = new Writer(hf, r, out, 0);
                    w[1] = new Writer(tf, r, out, tailFrom);
                    // the file starts late (negative offset): silence first, on YouTube's timeline
                    if (d < 0) {
                        w[0].zeros(Math.min(-d, headN));
                        if (tailFrom < -d) w[1].zeros(Math.min(-d, tailTo) - tailFrom);
                    }
                }

                @Override
                public void block(float[][] planar, int frames) throws IOException {
                    AddonPrep.waitWhileHeld();
                    int ch = planar.length;
                    if (buf == null || buf[0].length < frames) buf = new float[2][frames];
                    for (int f = 0; f < frames; f++) {
                        float l = planar[0][f] * gain, rr = (ch > 1 ? planar[1][f] : planar[0][f]) * gain;
                        buf[0][f] = l;
                        buf[1][f] = rr;
                    }
                    // youtube frames k = a - d .. a - d + frames
                    long k0 = a - d;
                    put(w[0], k0, frames, 0, headN);
                    put(w[1], k0, frames, tailFrom, tailTo);
                    a += frames;
                }

                private void put(Writer wr, long k0, int frames, long from, long to) throws IOException {
                    long s = Math.max(k0, from), e = Math.min(k0 + frames, to);
                    if (e > s) wr.add(buf, (int) (s - k0), (int) (e - s));
                }
            });
            // the file ends early: silence to YouTube's end
            if (w[1] != null) w[1].padTo(Math.round(p.ytDurationSec * w[1].from) - w[1].firstFrom);
            for (Writer x : w) if (x != null) x.finish();
        } catch (Throwable t) {
            for (Writer x : w) if (x != null) x.abandon();
            delete(c, p.id);
            throw t;
        }
        Analyzer.Pcm h, t;
        String boost = "";
        // a failure from here on leaves no .part file behind either
        try {
            h = Analyzer.Pcm.open(hf);
            t = Analyzer.Pcm.open(tf);
            // the decoder gave no audio (no format came, so nothing was written)
            if (h == null || t == null) throw new IOException("no deck audio decoded from " + p.id + "'s file");
            // the boost toward YouTube's loudness, as our player has it (LoudnessEnhancer): in the samples.
            // The fit's boost keeps the true peak at -1 dBTP, so the limiter is only a safety net
            double db = p.boostDb();
            if (db > 0.005) {
                app.ayham.extension.music.addons.AtmosWav.Limited a = app.ayham.extension.music.addons.AtmosWav.limit(hf, 16, 2, h.rate, db, DECK_CEILING_DBFS);
                app.ayham.extension.music.addons.AtmosWav.Limited b = app.ayham.extension.music.addons.AtmosWav.limit(tf, 16, 2, t.rate, db, DECK_CEILING_DBFS);
                boost = String.format(Locale.US, ", boost: opening %s, end %s", a, b);
            }
            if (!hf.renameTo(headFile(c, p.id)) || !tf.renameTo(tailFile(c, p.id)))
                throw new IOException("deck audio of " + p.id + " could not be moved in");
        } catch (Throwable x) {
            delete(c, p.id);
            throw x;
        }
        Log.i(TAG, String.format(Locale.US, "%s: deck audio from %s written in %d ms (opening %.1f-%.1f s, end %.1f-%.1f s at %d Hz)%s", p.id, p.addon,
                System.currentTimeMillis() - t0, h.start(), h.end(), t.start(), t.end(), h.rate, boost));
    }

    /** One deck file: source-rate frames in, written at the output rate as 16-bit stereo. */
    private static final class Writer {
        final int from;
        final long firstFrom;   // the first frame, at the source rate
        long given;             // source frames given
        final DataOutputStream out;
        final AudioDecode.Resampler rs;
        final File file;

        Writer(File f, int from, int to, long firstFrom) throws IOException {
            file = f;
            this.from = from;
            this.firstFrom = firstFrom;
            out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(f), 1 << 16));
            Analyzer.Pcm.writeHeader(out, to, Math.round(firstFrom * (double) to / from));
            rs = new AudioDecode.Resampler(from, to, 2, (p, off, n) -> {
                for (int i = 0; i < n; i++) {
                    out.writeShort(Short.reverseBytes(clip(p[0][off + i])));
                    out.writeShort(Short.reverseBytes(clip(p[1][off + i])));
                }
            });
        }

        void add(float[][] b, int off, int n) throws IOException {
            rs.add(b, off, n);
            given += n;
        }

        void zeros(long n) throws IOException {
            float[][] z = new float[2][4096];
            while (n > 0) {
                int k = (int) Math.min(n, 4096);
                add(z, 0, k);
                n -= k;
            }
        }

        void padTo(long frames) throws IOException {
            if (frames > given) zeros(frames - given);
        }

        void finish() throws IOException {
            rs.finish();
            out.close();
        }

        void abandon() {
            try {
                out.close();
            } catch (IOException ignored) {
            }
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }

        private static short clip(float x) {
            int v = Math.round(x * 32767f);
            return (short) Math.max(-32768, Math.min(32767, v));
        }
    }
}
