package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.AudioWindowReader;
import app.tikkamasalla.stremio.oneahead.demux.ByteBudget;
import app.tikkamasalla.stremio.oneahead.demux.DemuxException;
import app.tikkamasalla.stremio.oneahead.demux.DemuxLog;
import app.tikkamasalla.stremio.oneahead.demux.PcmSink;
import app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard;
import app.tikkamasalla.stremio.oneahead.demux.RangeSource;
import app.tikkamasalla.stremio.oneahead.demux.TrackChooser;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Theme-song backup inside the one-ahead job. It runs only with the "Work out
 * missing skip times" setting on, only for anime with a certain show mapping,
 * and only when the audio run ends without a segment type: NO_REFS, refs-lost,
 * no-segments, or a result missing intro or credits. It only fills a missing
 * type; it never overrides or extends any other result.
 *
 * Show lookup is by exact id (the app's Kitsu id to MAL to AniList to the
 * AnimeThemes slug). An uncertain mapping resolves to nothing and nothing runs.
 * Episode windows come from the job's own reader, decoder, budget, heap gate
 * and pace in the worker process; only the show's songs are fetched, cached on
 * the device under a size cap with the oldest evicted.
 */
public final class OneAheadThemes {
    /** One theme job reads episode windows plus a few songs; far under the day cap. */
    static final long THEME_CAP = 500_000_000L;

    private OneAheadThemes() {}

    private static void log(String msg) {
        try { android.util.Log.i("OneAhead", msg); } catch (Throwable ignored) { /* PC tests have no Log */ }
    }

    /** Kitsu anime id behind a meta or video id, or "" when the show is not certainly anime. */
    static String kitsuOf(String metaId, String videoId) {
        if (videoId != null && videoId.startsWith("kitsu:")) {
            String[] parts = videoId.split(":");
            if (parts.length >= 2 && parts[1].matches("[0-9]+")) return parts[1];
        }
        if (metaId != null && metaId.startsWith("kitsu:")) {
            String id = metaId.substring("kitsu:".length()).split(":")[0];
            if (id.matches("[0-9]+")) return id;
        }
        return "";
    }

    /** Episode number from the Stremio video id; 0 when it does not parse. */
    static int episodeOf(String videoId) {
        try {
            int[] se = app.tikkamasalla.stremio.introskip.StreamRanker.requestOf(videoId);
            return se == null || se.length < 2 ? 0 : Math.max(0, se[1]);
        } catch (Throwable bad) {
            return 0;
        }
    }

    /** Types the theme stage may still fill: absent from the lookup and from the audio result. */
    static List<String> missingTypes(boolean hasIntro, boolean hasCredits, Set<String> resultTypes) {
        List<String> out = new ArrayList<>();
        if (!hasIntro && (resultTypes == null || !resultTypes.contains("intro"))) out.add("intro");
        if (!hasCredits && (resultTypes == null || !resultTypes.contains("credits"))) out.add("credits");
        return out;
    }

    private static String safeReason(Throwable t) {
        return t == null ? "none" : t.getClass().getSimpleName();
    }

    /**
     * Gap-only theme fill after the audio run. Returns the audio outcome unchanged
     * unless at least one theme segment was found and saved; then the outcome is
     * DONE with the merged result. Never throws.
     */
    public static OneAheadRunner.Outcome maybeFill(File storeDir, String videoId, String metaId, String url,
            boolean hasIntro, boolean hasCredits, long fileSize, long headHash,
            OneAheadRunner runner, OneAheadRunner.Outcome o, PlaybackGuard guard, long pace) {
        String vid = videoId == null ? "" : videoId;
        try {
            if (guard.isCancelled()) return o;
            String kitsu = kitsuOf(metaId, videoId);
            if (kitsu.isEmpty()) { log("themes skip vid=" + vid + " why=uncertain-show"); return o; }
            int ep = episodeOf(videoId);
            if (ep <= 0) { log("themes skip vid=" + vid + " why=no-episode"); return o; }
            String reason = o.reason == null ? "" : o.reason;
            boolean audioFailed = (o.status == OneAheadRunner.Status.REFUSED && "NO_REFS".equals(reason))
                    || (o.status == OneAheadRunner.Status.NO_TIMES
                        && ("refs-lost".equals(reason) || reason.startsWith("refs-lost:")
                            || "no-segments".equals(reason)));
            if (!audioFailed && o.status != OneAheadRunner.Status.DONE) return o;
            Set<String> have = new HashSet<>();
            if (o.status == OneAheadRunner.Status.DONE && o.result != null)
                for (OneAheadResult.Segment s : o.result.segments) have.add(s.type);
            List<String> missing = missingTypes(hasIntro, hasCredits, have);
            if (missing.isEmpty()) { log("themes skip vid=" + vid + " why=nothing-missing"); return o; }
            if (!HeapGate.fits(HeapGate.FETCH_BYTES)) { log("themes skip vid=" + vid + " why=low-heap"); return o; }
            ByteBudget tb = runner.themeBudget();
            try {
                OneAheadThemeStore store = new OneAheadThemeStore(new File(storeDir, "themes"));
                String slug = store.resolveShow(kitsu, guard, tb);
                if (slug.isEmpty()) { log("themes skip vid=" + vid + " why=no-show-map kitsu=" + kitsu); return keepBytes(runner, vid, metaId, o, tb, guard); }
                OneAheadThemeStore.Show show;
                try {
                    show = store.show(slug, guard, tb);
                } catch (Exception bad) {
                    log("themes skip vid=" + vid + " why=show-fetch-failed " + safeReason(bad));
                    return keepBytes(runner, vid, metaId, o, tb, guard);
                }
                if (show.themes.isEmpty()) { log("themes skip vid=" + vid + " why=no-songs slug=" + slug); return keepBytes(runner, vid, metaId, o, tb, guard); }
                // Only types with at least one ranked candidate are worth any episode bytes.
                List<String> workable = new ArrayList<>();
                for (String want : missing) {
                    String kind = "intro".equals(want) ? "OP" : "ED";
                    List<OneAheadThemeMatcher.Theme> themes = new ArrayList<>();
                    for (OneAheadThemeStore.Entry e : show.themes) themes.add(e.theme());
                    if (!OneAheadThemeMatcher.rank(themes, ep, kind).isEmpty()) workable.add(want);
                }
                if (workable.isEmpty()) { log("themes skip vid=" + vid + " why=no-candidates"); return keepBytes(runner, vid, metaId, o, tb, guard); }
                if (guard.isCancelled()) return keepBytes(runner, vid, metaId, o, tb, guard);
                Windows win;
                try {
                    win = readWindows(url, guard, tb, pace, workable.contains("intro"), workable.contains("credits"));
                } catch (DemuxException bad) {
                    log("themes skip vid=" + vid + " why=audio-failed " + bad.kind);
                    return keepBytes(runner, vid, metaId, o, tb, guard);
                }
                log("themes show vid=" + vid + " kitsu=" + kitsu + " ep=" + ep + " slug=" + slug);
                if (guard.isCancelled()) return keepBytes(runner, vid, metaId, o, tb, guard);
                if (!HeapGate.fits(HeapGate.DETECT_BYTES)) { log("themes skip vid=" + vid + " why=low-heap"); return keepBytes(runner, vid, metaId, o, tb, guard); }
                List<OneAheadResult.Segment> added = new ArrayList<>();
                for (String want : workable) added.addAll(fillType(store, slug, show, want, ep, win, vid, guard, tb, pace));
                if (added.isEmpty()) return keepBytes(runner, vid, metaId, o, tb, guard);
                // A fresh result: the audio one is never mutated, so a failed save
                // cannot leak unsaved segments into the reported outcome.
                OneAheadResult result;
                if (o.status == OneAheadRunner.Status.DONE && o.result != null) {
                    result = new OneAheadResult(o.result.videoId, o.result.fileSize,
                            o.result.headHash, OneAheadResult.DETECTOR_VERSION);
                    result.fileDurationSec = o.result.fileDurationSec > 0
                            ? o.result.fileDurationSec : win.duration;
                    result.segments.addAll(o.result.segments);
                } else {
                    result = new OneAheadResult(vid, fileSize, headHash, OneAheadResult.DETECTOR_VERSION);
                    result.fileDurationSec = win.duration;
                }
                result.segments.addAll(added);
                try {
                    runner.results().save(result);
                } catch (java.io.IOException bad) {
                    log("themes skip vid=" + vid + " why=save-failed");
                    return keepBytes(runner, vid, metaId, o, tb, guard);
                }
                log("themes done vid=" + vid + " segs=" + result.segments.size() + " bytes=" + tb.used());
                return new OneAheadRunner.Outcome(OneAheadRunner.Status.DONE, "ok",
                        result, o.bytesFetched + tb.used(), o.requests);
            } finally {
                runner.themeSpent(tb.used());
            }
        } catch (Throwable t) {
            log("themes skip vid=" + vid + " why=" + safeReason(t));
            return o;
        }
    }

    /**
     * The audio outcome with the theme bytes added. A REFUSED episode never
     * recorded an attempt (the planner refused before marking), so spending
     * theme bytes on one converts it to NO_TIMES and records the attempt: the
     * next trigger will not re-download. A cancelled run keeps its attempt.
     */
    private static OneAheadRunner.Outcome keepBytes(OneAheadRunner runner, String vid, String showId,
            OneAheadRunner.Outcome o, ByteBudget tb, PlaybackGuard guard) {
        long spent = tb.used();
        if (spent <= 0) return o;
        if (o.status == OneAheadRunner.Status.REFUSED && !guard.isCancelled()) {
            runner.markThemed(vid, showId);
            return new OneAheadRunner.Outcome(OneAheadRunner.Status.NO_TIMES, "no-themes",
                    null, o.bytesFetched + spent, o.requests);
        }
        if (o.status == OneAheadRunner.Status.REFUSED) return o;
        return new OneAheadRunner.Outcome(o.status, o.reason, o.result,
                o.bytesFetched + spent, o.requests);
    }

    /** Decoded episode windows at 8 kHz: head 0..360 s and tail D-300..D. */
    static final class Windows {
        final double duration;
        final float[] head, tail;
        final double tailOff;
        final boolean tailFull;
        Windows(double duration, float[] head, float[] tail, double tailOff, boolean tailFull) {
            this.duration = duration; this.head = head; this.tail = tail;
            this.tailOff = tailOff; this.tailFull = tailFull;
        }
    }

    private static final class Win implements PcmSink {
        final float[] buf;
        final double base;
        int last, contig;
        /** A decoded block landing past the contiguous prefix: the window has a hole. */
        boolean gap;
        Win(int n, double base) { buf = new float[n]; this.base = base; }
        @Override
        public void onPcm(short[] mono, int count, int sampleRate, long ptsUs) {
            int at = (int) Math.round(ptsUs / 1e6 * OneAheadThemeMatcher.SR - base * OneAheadThemeMatcher.SR);
            // 1-sample PTS rounding jitter must not freeze the contiguous prefix.
            if (at > contig + 2) gap = true;
            for (int i = 0; i < count; i++) {
                int j = at + i;
                if (j < 0 || j >= buf.length) continue;
                buf[j] = mono[i] / 32768f;
                if (j >= last) last = j + 1;
            }
            if (!gap && at <= contig + 2) contig = Math.max(contig, Math.min(at + count, buf.length));
        }
    }

    static Windows readWindows(String url, PlaybackGuard guard, ByteBudget budget, long pace,
            boolean needHead, boolean needTail) throws DemuxException {
        RangeSource source = OneAheadAndroid.source(url, guard, budget, pace);
        AudioWindowReader reader = new AudioWindowReader(source,
                OneAheadAndroid.decoders(new DemuxLog() {
                    @Override public void log(String msg) { OneAheadThemes.log(msg); }
                }), guard, budget, OneAheadThemeMatcher.SR, new DemuxLog() {
                    @Override public void log(String msg) { OneAheadThemes.log(msg); }
                });
        try {
            reader.prepare(new TrackChooser.Request(null, 0));
            double dur = reader.statedDurationSec();
            if (dur <= 0) throw new DemuxException(DemuxException.Kind.MALFORMED, "no duration");
            double headEnd = Math.min(OneAheadThemeMatcher.HEAD_S, dur);
            double tailStart = Math.max(0, dur - OneAheadThemeMatcher.TAIL_S);
            double[][] slices = needHead && needTail ? new double[][]{{0, headEnd}, {tailStart, dur}}
                    : needHead ? new double[][]{{0, headEnd}} : new double[][]{{tailStart, dur}};
            long est = reader.estimateBytes(slices);
            if (est > 0) budget.check(est);
            float[] head = new float[0];
            if (needHead) {
                Win h = new Win((int) (headEnd * OneAheadThemeMatcher.SR), 0);
                AudioWindowReader.SliceResult hr = reader.read(0, headEnd, h);
                // An ok() slice the pts check trusts; a gap would shift everything after it.
                if (!hr.ok() || h.gap) throw new DemuxException(DemuxException.Kind.MALFORMED, "untrusted head");
                head = h.buf;
            }
            float[] tail = new float[0];
            boolean tailFull = false;
            if (needTail) {
                Win t = new Win((int) ((dur - tailStart) * OneAheadThemeMatcher.SR), tailStart);
                AudioWindowReader.SliceResult tr = reader.read(tailStart, dur, t);
                tailFull = tr.ok() && !t.gap;
                if (!tailFull && t.contig < 60 * OneAheadThemeMatcher.SR)
                    throw new DemuxException(DemuxException.Kind.MALFORMED, "untrusted tail");
                tail = tailFull ? t.buf : java.util.Arrays.copyOf(t.buf, t.contig);
            }
            return new Windows(dur, head, tail, tailStart, tailFull);
        } finally {
            reader.release();
        }
    }

    /** Ranked candidates of one type; the first loose-gate pass wins, trimmed. */
    static List<OneAheadResult.Segment> fillType(OneAheadThemeStore store, String slug,
            OneAheadThemeStore.Show show, String want, int ep, Windows win, String vid,
            PlaybackGuard guard, ByteBudget budget, long pace) {
        List<OneAheadResult.Segment> out = new ArrayList<>();
        String kind = "intro".equals(want) ? "OP" : "ED";
        float[] epx;
        double off;
        if ("intro".equals(want)) {
            int keep = Math.max(0, win.head.length - (int) (OneAheadThemeMatcher.MASK_TAIL_OP_S * OneAheadThemeMatcher.SR));
            epx = java.util.Arrays.copyOf(win.head, keep);
            off = 0.0;
        } else {
            epx = win.tail;
            off = win.tailOff;
        }
        List<OneAheadThemeMatcher.Theme> themes = new ArrayList<>();
        for (OneAheadThemeStore.Entry e : show.themes) themes.add(e.theme());
        List<OneAheadThemeMatcher.Theme> ranked = OneAheadThemeMatcher.rank(themes, ep, kind);
        int tried = 0;
        OneAheadThemeMatcher.Match best = null;
        String bestBase = "";
        Set<String> heard = new HashSet<>();
        for (int i = 0; i < ranked.size() && tried < OneAheadThemeMatcher.MAX_CAND; i++) {
            if (guard.isCancelled()) return out;
            if (!HeapGate.fits(HeapGate.DETECT_BYTES)) return out;
            OneAheadThemeMatcher.Theme t = ranked.get(i);
            String base = slug + "-" + t.slug;
            OneAheadThemeStore.Entry entry = OneAheadThemeStore.entryFor(t, show.themes);
            if (entry == null) continue;
            // Two entries can share one recording (odd/even episode splits): match it once.
            if (!heard.add(entry.audio)) continue;
            tried++;
            OneAheadThemeStore.Core core;
            try {
                RangeSource ogg = OneAheadAndroid.source(entry.audio, guard, budget, pace);
                core = store.core(slug, entry, ogg, budget, guard);
            } catch (DemuxException bad) {
                if (bad.kind == DemuxException.Kind.CANCELLED || bad.kind == DemuxException.Kind.BUDGET) return out;
                continue;
            } catch (Exception bad) {
                continue;
            }
            OneAheadThemeMatcher.Match m = OneAheadThemeMatcher.matchEpx(
                    epx, off, core.pcm, core.lead, core.trail, base);
            if (best == null || m.lagNcc > best.lagNcc) { best = m; bestBase = base; }
            if (m.pass) { best = m; bestBase = base; break; }
        }
        if (best == null || !best.pass) {
            log("themes " + want + " vid=" + vid + " tried=" + tried + " fail"
                    + (best == null ? "" : " lag=" + best.lagNcc + " med=" + best.median + " hi=" + best.hiN));
            return out;
        }
        double[] te = OneAheadThemeMatcher.trimmed(
                Math.max(0.0, best.startS), Math.min(win.duration, best.endS));
        if (te == null) {
            log("themes " + want + " vid=" + vid + " tried=" + tried + " pass " + bestBase
                    + " dropped-after-trim lag=" + best.lagNcc + " med=" + best.median + " hi=" + best.hiN);
            return out;
        }
        out.add(new OneAheadResult.Segment(want, te[0], te[1], false, OneAheadResult.THEME));
        log("themes " + want + " vid=" + vid + " tried=" + tried + " pass " + bestBase
                + " lag=" + best.lagNcc + " med=" + best.median + " hi=" + best.hiN
                + " edges=" + te[0] + "-" + te[1]);
        return out;
    }
}
