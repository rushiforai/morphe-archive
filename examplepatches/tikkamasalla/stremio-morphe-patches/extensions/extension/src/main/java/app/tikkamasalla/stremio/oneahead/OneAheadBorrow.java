package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.DemuxException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Skip times taken from the named chapters of another release of the same episode. A chapter
 * counts only with audio proof: the same-language track on both files, both edges of the segment
 * locked at one offset, and a window on the far side of the episode locked at that offset too, so
 * a recap or a shared theme cannot pass. Marks are the donor's marks moved by each edge's offset.
 * Plain Java over two small interfaces; only cached links ever reach it.
 */
public final class OneAheadBorrow {
    static final double PEAK = 0.5, AGREE_S = 0.25, EDGE_S = 30, ANCHOR_S = 30, SLACK_S = 3, CLEAR_S = 15,
            CLUSTER = 0.08, EOF_S = 2, INTRO_ANCHOR = 0.65, CREDITS_ANCHOR = 0.35;
    static final double INTRO_START_TRIM_S = 2, CREDITS_START_TRIM_S = 3, CREDITS_END_TRIM_S = 10;
    static final double DETECTOR_AGREE_S = 15;
    static final int MAX_DONORS = 5;
    private static final int MIN_WINDOW = 6 * Track.SR;
    private static final double[] INTRO_SPOTS = {0.65, 0.60, 0.70, 0.55}, CREDITS_SPOTS = {0.35, 0.30, 0.40, 0.45};

    private OneAheadBorrow() {}

    /** One named chapter segment. A weak name (a plain "Intro") is usable here: the audio proof stands in for a second source. */
    public static final class Named {
        public final String label;
        public final double start, end;
        public final boolean weak;
        public Named(String label, double start, double end, boolean weak) {
            this.label = label; this.start = start; this.end = end; this.weak = weak;
        }
    }

    /** One other cached stream of the same episode. */
    public static final class Donor {
        final String url, fileName, title;
        final boolean cached;
        public Donor(String url, String fileName, String title, boolean cached) {
            this.url = url; this.fileName = fileName; this.title = title; this.cached = cached;
        }
    }

    /** One file's audio. Windows are 4 kHz mono, null when the file cannot be trusted there. */
    interface Audio {
        double duration();
        /** Normalised languages of the usable tracks, the default track's first; "" is an unlabelled track. */
        List<String> languages();
        void use(String language) throws DemuxException;
        float[] window(double start, double length) throws DemuxException;
        void release();
    }

    interface Files {
        /** Null or empty when the file has no usable chapters. */
        List<Named> chapters(String url);
        Audio open(String url) throws DemuxException;
    }

    interface Log { void line(String message); }

    // ---- which files may donate -------------------------------------------------------

    private static final Pattern SXE = Pattern.compile("(?i)(?<![a-z0-9])s(\\d{1,2})[ ._-]*e(\\d{1,3})(?!\\d)");
    private static final Pattern NXN = Pattern.compile("(?i)(?<![0-9.])(\\d{1,2})x(\\d{2,3})(?![0-9])");
    private static final Pattern WORDS = Pattern.compile("(?i)season[ ._-]*(\\d{1,2})[ ._-]*episode[ ._-]*(\\d{1,3})");
    private static final Pattern NOT_EPISODE = Pattern.compile(
            "(?i)(?<![a-z])(ncop|nced|ova|oad|sp|special|creditless|recap|movie|trailer|pv|sample|menu|extras?)(?![a-z])");
    private static final Pattern[] ABSOLUTE = {
            Pattern.compile(" - (\\d{1,4})(?![.\\d]|p|i|bit|kbps|fps)"),
            Pattern.compile("(?i)(?<![a-z0-9])(?:e|ep|episode)[ ._]?(\\d{1,4})(?![.\\d]|p|i|bit|kbps|fps)"),
            Pattern.compile("#(\\d{1,4})(?![.\\d])"),
            Pattern.compile("\\[(\\d{1,4})\\]"),
            Pattern.compile("_(\\d{1,4})_"),
            Pattern.compile("第(\\d{1,4})話"),
    };

    /**
     * Whether a file inside a release is this episode, from its base name only: a pack's folder
     * name says nothing about the file. SxxExx, 1x01 and "Season N Episode M" decide outright.
     */
    static boolean sameEpisode(String fileName, int season, int episode) {
        if (fileName == null) return false;
        String name = fileName.replace('\\', '/');
        name = name.substring(name.lastIndexOf('/') + 1);
        int dot = name.lastIndexOf('.');
        if (dot > 0) name = name.substring(0, dot);
        if (name.isEmpty()) return false;
        int wantSeason = season <= 0 ? 1 : season;
        for (Pattern p : new Pattern[]{SXE, NXN, WORDS}) {
            Matcher m = p.matcher(name);
            if (m.find()) return Integer.parseInt(m.group(1)) == wantSeason && Integer.parseInt(m.group(2)) == episode
                    && !NOT_EPISODE.matcher(name).find();
        }
        if (NOT_EPISODE.matcher(name).find() || wantSeason != 1) return false;
        for (Pattern p : ABSOLUTE) {
            Matcher m = p.matcher(name);
            if (m.find()) return Integer.parseInt(m.group(1)) == episode;
        }
        return false;
    }

    /** The release must name the show. */
    static boolean titleOk(String show, String... release) {
        if (show == null) return false;
        String want = plainWords(show).trim();
        if (want.isEmpty()) return false;
        StringBuilder b = new StringBuilder(" ");
        for (String r : release) if (r != null) b.append(plainWords(r)).append(' ');
        for (String w : want.split(" +")) if (b.indexOf(" " + w + " ") < 0) return false;
        return true;
    }

    private static String plainWords(String s) {
        return s.toLowerCase(Locale.ROOT).replace("'", "").replaceAll("[^\\p{L}\\p{N}]+", " ");
    }

    /**
     * Keeps files within 8% of the median of the largest duration cluster: another cut or a
     * neighbouring file of another length is not this episode. Returns the kept indexes.
     */
    static List<Integer> durationCluster(double[] durations) {
        int bestCount = -1;
        double[] best = new double[0];
        for (double d : durations) {
            if (d <= 0) continue;
            List<Double> c = new ArrayList<>();
            for (double o : durations) if (o > 0 && Math.abs(o - d) <= CLUSTER * d) c.add(o);
            if (c.size() > bestCount) {
                bestCount = c.size();
                best = new double[c.size()];
                for (int i = 0; i < best.length; i++) best[i] = c.get(i);
            }
        }
        List<Integer> kept = new ArrayList<>();
        if (best.length == 0) return kept;
        Arrays.sort(best);
        double median = best[best.length / 2];
        for (int i = 0; i < durations.length; i++) {
            if (durations[i] > 0 && Math.abs(durations[i] - median) <= CLUSTER * median) kept.add(i);
        }
        return kept;
    }

    /** The language both files have, null when none. Unlabelled counts only when both files are wholly unlabelled. */
    static String commonLanguage(List<String> donor, List<String> target) {
        String first = null;
        for (String l : donor) {
            if (l.isEmpty() || !target.contains(l)) continue;
            if ("jpn".equals(l)) return l;
            if (first == null) first = l;
        }
        if (first != null) return first;
        boolean plain = !donor.isEmpty() && !target.isEmpty();
        for (String l : donor) plain &= l.isEmpty();
        for (String l : target) plain &= l.isEmpty();
        return plain ? "" : null;
    }

    // ---- the proof ---------------------------------------------------------------------

    static final class Lock {
        final double peak, offset;
        Lock(double peak, double offset) { this.peak = peak; this.offset = offset; }
    }

    static final class Proof {
        final double start, end;
        final String refused;
        Proof(double start, double end, String refused) { this.start = start; this.end = end; this.refused = refused; }
    }

    private static Proof no(String why) { return new Proof(0, 0, why); }

    /** Where the far-side window goes: its share of runtime, moved until it is clear of every donor segment. */
    static double anchorAt(double duration, boolean intro, List<Named> all) {
        for (double f : intro ? INTRO_SPOTS : CREDITS_SPOTS) {
            double t = Math.round(duration * f);
            boolean clear = t + ANCHOR_S <= duration;
            for (Named s : all) if (t < s.end + CLEAR_S && t + ANCHOR_S > s.start - CLEAR_S) clear = false;
            if (clear) return t;
        }
        return -1;
    }

    /** Target offset of a donor window: target time = donor time + offset. Null when no peak stands out. */
    private static Lock lock(Audio donor, double at, double len, Audio target, double lo, double hi, Correlator c)
            throws DemuxException {
        float[] d = donor.window(at, len);
        if (d == null || d.length < MIN_WINDOW) return null;
        double tStart = Math.max(0, at + lo), tEnd = Math.min(target.duration(), at + len + hi);
        if (tEnd - tStart < MIN_WINDOW / (double) Track.SR) return null;
        float[] t = target.window(tStart, tEnd - tStart);
        if (t == null || t.length < MIN_WINDOW) return null;
        Correlator.Spec sd = c.spec(Track.build(0, d, 32), null), st = c.spec(Track.build(0, t, 32), null);
        Correlator.Lag[] lags = c.topLags(sd, st, 3, (int) Math.min(Correlator.MIN_OVERLAP, 0.7 * d.length));
        if (lags.length == 0) return null;
        double offset = (tStart - at) - lags[0].lag / (double) Track.SR;
        // A partial overlap at the rim of the search can peak outside it; the search covers no such offset.
        return offset < lo || offset > hi ? null : new Lock(lags[0].peak, offset);
    }

    /** The whole proof for one donor segment; marks in target file seconds. */
    static Proof prove(Audio donor, Audio target, Named seg, List<Named> all, Correlator c) throws DemuxException {
        double dd = donor.duration(), td = target.duration(), delta = td - dd;
        double lo = Math.min(0, delta) - SLACK_S, hi = Math.max(0, delta) + SLACK_S;
        double donorEnd = Math.min(seg.end, dd), w = Math.min(EDGE_S, donorEnd - seg.start);
        Lock a = lock(donor, seg.start, w, target, lo, hi, c);
        if (a == null || a.peak < PEAK) return no("start-edge");
        Lock b = lock(donor, donorEnd - w, w, target, lo, hi, c);
        if (b == null || b.peak < PEAK) return no("end-edge");
        if (Math.abs(a.offset - b.offset) > AGREE_S) return no("edges-differ");
        double spot = anchorAt(dd, "OP".equals(seg.label), all);
        if (spot < 0) return no("no-anchor-spot");
        Lock far = lock(donor, spot, ANCHOR_S, target, lo, hi, c);
        if (far == null || far.peak < PEAK) return no("anchor");
        double start = seg.start + a.offset, end = donorEnd + b.offset;
        // A donor chapter that simply runs out with its file says nothing about what follows on a longer one.
        if (dd - donorEnd <= EOF_S && end <= td && td - end > EOF_S) return no("end-of-file");
        start = Math.max(0, start);
        end = Math.min(td, end);
        return end > start ? new Proof(start, end, null) : no("empty");
    }

    // ---- the run -----------------------------------------------------------------------

    private static final class Held {
        final Donor donor;
        final List<Named> segments;
        Audio audio;
        Held(Donor d, List<Named> s) { donor = d; segments = s; }
    }

    /**
     * Tries the donors for each missing type and returns what it could prove. The target's language
     * track and each donor stay open only for this call. A cancelled read ends the run.
     */
    static final class Run {
        final List<OneAheadResult.Segment> segments;
        /** The intro came from a weak chapter name: it still needs the detector's intro to agree. */
        final boolean weakIntro;
        Run(List<OneAheadResult.Segment> segments, boolean weakIntro) {
            this.segments = segments; this.weakIntro = weakIntro;
        }
    }

    static Run run(List<Donor> donors, Audio target, int season, int episode, String show,
                   boolean needIntro, boolean needCredits, Files files, Log log)
            throws DemuxException {
        List<OneAheadResult.Segment> out = new ArrayList<>();
        boolean weakIntro = false;
        List<Held> held = new ArrayList<>();
        try {
            for (Donor d : donors) {
                if (held.size() >= MAX_DONORS) break;
                if (!d.cached || !OneAheadGate.isDirectHttp(d.url) || !sameEpisode(d.fileName, season, episode)
                        || OneAheadGate.containerOf(d.fileName) != OneAheadPlanner.Container.MKV
                        || !titleOk(show, d.title, d.fileName)) continue;
                List<Named> named = files.chapters(d.url);
                if (named == null || !(hasType(named, "OP") && needIntro || hasType(named, "credits") && needCredits)) continue;
                Held h = new Held(d, named);
                try {
                    h.audio = files.open(d.url);
                    held.add(h);
                } catch (DemuxException e) {
                    if (e.kind == DemuxException.Kind.CANCELLED) throw e;
                }
            }
            log.line("borrow donors=" + held.size() + " of " + donors.size());
            if (held.isEmpty()) return new Run(out, false);
            double[] durations = new double[held.size() + 1];
            durations[0] = target.duration();
            for (int i = 0; i < held.size(); i++) durations[i + 1] = held.get(i).audio.duration();
            List<Integer> kept = durationCluster(durations);
            if (!kept.contains(0)) { log.line("borrow refused: target outside the duration cluster"); return new Run(out, false); }
            Correlator c = new Correlator();
            boolean intro = needIntro, credits = needCredits;
            String usedLanguage = null;
            for (int i = 0; i < held.size() && (intro || credits); i++) {
                if (!kept.contains(i + 1)) { log.line("borrow donor " + i + " refused: duration"); continue; }
                Held h = held.get(i);
                String language = commonLanguage(h.audio.languages(), target.languages());
                if (language == null) { log.line("borrow donor " + i + " refused: no common language"); continue; }
                try {
                    h.audio.use(language);
                    if (!language.equals(usedLanguage)) { usedLanguage = null; target.use(language); usedLanguage = language; }
                    if (intro) {
                        Cand proved = proveType(h, target, "OP", "intro", i, c, log);
                        if (proved != null) { out.add(proved.segment); weakIntro = proved.weak; intro = false; }
                    }
                    if (credits) {
                        Cand proved = proveType(h, target, "credits", "credits", i, c, log);
                        if (proved != null) { out.add(proved.segment); credits = false; }
                    }
                } catch (DemuxException e) {
                    if (e.kind == DemuxException.Kind.CANCELLED) throw e;
                    log.line("borrow donor " + i + " refused: " + e.kind);
                }
            }
            return new Run(out, weakIntro);
        } finally {
            for (Held h : held) h.audio.release();
        }
    }

    private static boolean hasType(List<Named> named, String label) {
        for (Named n : named) if (label.equals(n.label)) return true;
        return false;
    }

    /** Strong names first, a weak one only when the donor has no strong one. */
    private static final class Cand {
        final OneAheadResult.Segment segment;
        final boolean weak;
        Cand(OneAheadResult.Segment segment, boolean weak) { this.segment = segment; this.weak = weak; }
    }

    private static Cand proveType(Held h, Audio target, String label, String type, int index,
                                  Correlator c, Log log) throws DemuxException {
        for (boolean weak : new boolean[]{false, true}) {
            boolean any = false;
            for (Named n : h.segments) {
                if (!label.equals(n.label) || n.weak != weak) continue;
                any = true;
                Proof p = prove(h.audio, target, n, h.segments, c);
                if (p.refused == null) {
                    double s = p.start, e = p.end;
                    if ("OP".equals(label)) s += INTRO_START_TRIM_S;
                    else { s += CREDITS_START_TRIM_S; e -= CREDITS_END_TRIM_S; }
                    if (e <= s) {
                        log.line("borrow " + type + " donor " + index + " refused: trimmed-empty");
                        return null;
                    }
                    log.line(String.format(Locale.US, "borrow %s proved by donor %d: %.3f-%.3f (donor %.3f-%.3f)",
                            type, index, s, e, n.start, n.end));
                    return new Cand(new OneAheadResult.Segment(type, s, e, false, OneAheadResult.BORROWED), weak);
                }
                log.line("borrow " + type + " donor " + index + " refused: " + p.refused);
            }
            if (any) return null;
        }
        return null;
    }
}
