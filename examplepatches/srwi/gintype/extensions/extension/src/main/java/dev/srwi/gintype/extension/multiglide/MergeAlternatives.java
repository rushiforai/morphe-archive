package dev.srwi.gintype.extension.multiglide;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Turns the raw MultiGlide token buffer into the merged sequences to decode.
 * Ported 1:1 from Kinetica's MergeAlternatives.kt.
 */
public final class MergeAlternatives {

    private static final boolean[][] TRIM_MODES = {
            {true, true},
            {false, true},
            {false, false}
    };

    private MergeAlternatives() {}

    private static final class Boundary {
        final long t;
        final int tokenIdx;

        Boundary(long t, int tokenIdx) {
            this.t = t;
            this.tokenIdx = tokenIdx;
        }
    }

    private static final class Piece {
        final MultiGlideInputToken swipe;
        final int nextTokenIdx;

        Piece(MultiGlideInputToken swipe, int nextTokenIdx) {
            this.swipe = swipe;
            this.nextTokenIdx = nextTokenIdx;
        }
    }

    public static final class SplitVariant {
        public final MultiGlideInputToken first;
        public final MultiGlideInputToken second;

        public SplitVariant(MultiGlideInputToken first, MultiGlideInputToken second) {
            this.first = first;
            this.second = second;
        }
    }

    public static List<List<MultiGlideInputToken>> sequences(
            List<MultiGlideInputToken> tokens,
            MultiGlideGeometry geometry
    ) {
        if (tokens == null || tokens.isEmpty()) return Collections.emptyList();

        float kw = (geometry != null && geometry.isValid() && geometry.keyWidthPx > 0f)
                ? geometry.keyWidthPx
                : 108f;
        float midlinePx = (geometry != null && geometry.isValid())
                ? geometry.midlinePx()
                : 540f;

        List<MultiGlideInputToken> primary = new ArrayList<>(tokens.size());
        for (int i = 0; i < tokens.size(); i++) {
            primary.add(withResolvedStream(tokens.get(i), midlinePx));
        }
        primary.sort((a, b) -> Long.compare(a.startTimeMs, b.startTimeMs));

        List<List<MultiGlideInputToken>> result = new ArrayList<>(4);
        result.add(primary);
        if (primary.size() < 2) return result;

        List<List<MultiGlideInputToken>> anchorIL = new ArrayList<>();
        addAnchorInterleaves(primary, kw, anchorIL);

        List<List<MultiGlideInputToken>> crossIL = new ArrayList<>();
        addCrossSwipeInterleaves(primary, kw, crossIL);

        List<List<MultiGlideInputToken>> orderSwap = new ArrayList<>();
        addOrderSwaps(primary, orderSwap);

        List<List<MultiGlideInputToken>> tapSplit = new ArrayList<>();
        addTapSplits(primary, kw, tapSplit);

        List<List<MultiGlideInputToken>> swipeAround = new ArrayList<>();
        addSwipeAroundSwipes(primary, kw, swipeAround);

        @SuppressWarnings("unchecked")
        List<List<MultiGlideInputToken>>[] producers = new List[]{
                anchorIL, crossIL, orderSwap, tapSplit, swipeAround
        };
        for (List<List<MultiGlideInputToken>> prod : producers) {
            for (int i = 0; i < prod.size() && result.size() < KineticaConstants.MAX_ALT_SEQUENCES; i++) {
                result.add(prod.get(i));
            }
        }
        return result;
    }

    private static MultiGlideInputToken withResolvedStream(MultiGlideInputToken t, float midlinePx) {
        if (t.streamId == 0 || t.streamId == 1) return t;
        float refX;
        if (t.kind == MultiGlideInputToken.Kind.TAP) {
            refX = t.tapX;
        } else if (t.points != null && !t.points.isEmpty()) {
            refX = t.points.get(0).x;
        } else {
            refX = midlinePx;
        }
        int stream = (refX < midlinePx) ? 0 : 1;
        if (t.kind == MultiGlideInputToken.Kind.TAP) {
            return MultiGlideInputToken.tap(
                    t.pointerId, stream, t.character, t.tapX, t.tapY, t.startTimeMs, t.endTimeMs);
        }
        return MultiGlideInputToken.swipe(
                t.pointerId, stream, t.points, t.pathLengthPx, t.startTimeMs, t.endTimeMs,
                t.keyContacts, t.dwells, t.softStart, t.softEnd);
    }

    private static void addOrderSwaps(
            List<MultiGlideInputToken> primary,
            List<List<MultiGlideInputToken>> result
    ) {
        for (int i = 0; i < primary.size() - 1; i++) {
            if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) return;
            MultiGlideInputToken a = primary.get(i);
            MultiGlideInputToken b = primary.get(i + 1);
            if (a.streamId != b.streamId
                    && Math.abs(a.startTimeMs - b.startTimeMs) < KineticaConstants.ORDER_AMBIG_MS) {
                List<MultiGlideInputToken> v = new ArrayList<>(primary);
                v.set(i, b);
                v.set(i + 1, a);
                result.add(v);
            }
        }
    }

    private static void addTapSplits(
            List<MultiGlideInputToken> primary,
            float kw,
            List<List<MultiGlideInputToken>> result
    ) {
        for (int tapIdx = 0; tapIdx < primary.size(); tapIdx++) {
            if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) return;
            MultiGlideInputToken tap = primary.get(tapIdx);
            if (tap.kind != MultiGlideInputToken.Kind.TAP) continue;

            for (int swipeIdx = 0; swipeIdx < primary.size(); swipeIdx++) {
                if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) break;
                MultiGlideInputToken swipe = primary.get(swipeIdx);
                if (swipe.kind != MultiGlideInputToken.Kind.SWIPE) continue;
                if (swipe.streamId == tap.streamId) continue;

                if (tap.startTimeMs <= swipe.startTimeMs + KineticaConstants.SPLIT_MARGIN_MS
                        && !isInteriorCut(swipe, tap.startTimeMs)) {
                    continue;
                }
                if (tap.startTimeMs >= swipe.endTimeMs + KineticaConstants.ORDER_AMBIG_MS) continue;

                List<SplitVariant> variants = new ArrayList<>(4);
                Set<String> seenHalves = new HashSet<>(4);
                List<Long> snaps = contactSnaps(swipe, tap.startTimeMs);

                List<SplitVariant> direct = splitVariants(swipe, tap.startTimeMs, kw);
                for (int vi = 0; vi < direct.size(); vi++) {
                    SplitVariant v = direct.get(vi);
                    String sig = v.first.startTimeMs + "-" + v.first.endTimeMs + "-" + v.second.startTimeMs;
                    if (seenHalves.add(sig)) variants.add(v);
                }
                for (int si = 1; si < snaps.size(); si++) {
                    SplitVariant v = splitAtContact(swipe, snaps.get(si), kw);
                    if (v == null) continue;
                    String sig = v.first.startTimeMs + "-" + v.first.endTimeMs + "-" + v.second.startTimeMs;
                    if (seenHalves.add(sig)) variants.add(v);
                }
                for (int si = 1; si < snaps.size(); si++) {
                    List<SplitVariant> snappedVars = splitVariants(swipe, snaps.get(si), kw);
                    for (int vi = 0; vi < snappedVars.size(); vi++) {
                        SplitVariant v = snappedVars.get(vi);
                        String sig = v.first.startTimeMs + "-" + v.first.endTimeMs + "-" + v.second.startTimeMs;
                        if (seenHalves.add(sig)) variants.add(v);
                    }
                }

                for (int vi = 0; vi < variants.size(); vi++) {
                    if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) break;
                    SplitVariant halves = variants.get(vi);
                    List<MultiGlideInputToken> seq = new ArrayList<>(primary.size() + 1);
                    for (int k = 0; k < primary.size(); k++) {
                        if (k == swipeIdx) {
                            seq.add(halves.first);
                        } else if (k == tapIdx) {
                            seq.add(tap);
                            seq.add(halves.second);
                        } else {
                            seq.add(primary.get(k));
                        }
                    }
                    result.add(seq);
                }
            }
        }
    }

    private static void addSwipeAroundSwipes(
            List<MultiGlideInputToken> primary,
            float kw,
            List<List<MultiGlideInputToken>> result
    ) {
        for (int outerIdx = 0; outerIdx < primary.size(); outerIdx++) {
            if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) return;
            MultiGlideInputToken outer = primary.get(outerIdx);
            if (outer.kind != MultiGlideInputToken.Kind.SWIPE) continue;

            for (int innerIdx = outerIdx + 1; innerIdx < primary.size(); innerIdx++) {
                if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) break;
                MultiGlideInputToken inner = primary.get(innerIdx);
                if (inner.kind != MultiGlideInputToken.Kind.SWIPE) continue;
                if (inner.streamId == outer.streamId) continue;
                if (inner.startTimeMs <= outer.startTimeMs + KineticaConstants.SPLIT_MARGIN_MS) continue;
                if (inner.startTimeMs >= outer.endTimeMs - KineticaConstants.SPLIT_MARGIN_MS) continue;

                boolean contained = inner.endTimeMs < outer.endTimeMs - KineticaConstants.SPLIT_MARGIN_MS;
                List<SplitVariant> halves;
                if (contained) {
                    SplitVariant h = splitSwipe(outer, (inner.startTimeMs + inner.endTimeMs) / 2L, kw);
                    if (h == null) continue;
                    halves = Collections.singletonList(h);
                } else {
                    halves = splitVariants(outer, inner.startTimeMs, kw);
                }

                for (int hi = 0; hi < halves.size(); hi++) {
                    if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) break;
                    SplitVariant h = halves.get(hi);
                    List<MultiGlideInputToken> seq = new ArrayList<>(primary.size() + 1);
                    for (int k = 0; k < primary.size(); k++) {
                        if (k == outerIdx) {
                            seq.add(h.first);
                        } else if (k == innerIdx) {
                            seq.add(inner);
                            seq.add(h.second);
                        } else {
                            seq.add(primary.get(k));
                        }
                    }
                    result.add(seq);
                }
            }
        }
    }

    private static void addAnchorInterleaves(
            List<MultiGlideInputToken> primary,
            float kw,
            List<List<MultiGlideInputToken>> result
    ) {
        for (int swipeIdx = 0; swipeIdx < primary.size(); swipeIdx++) {
            if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) return;
            MultiGlideInputToken s = primary.get(swipeIdx);
            if (s.kind != MultiGlideInputToken.Kind.SWIPE) continue;

            List<Boundary> tokenOnly = boundariesFor(primary, swipeIdx, s, false);
            if (tokenOnly.isEmpty()) continue;

            List<List<Boundary>> sets = new ArrayList<>(2);
            if (tokenOnly.size() >= 2) sets.add(tokenOnly);
            if (!s.dwells.isEmpty()) {
                List<Boundary> withDwells = boundariesFor(primary, swipeIdx, s, true);
                if (withDwells.size() >= 2) sets.add(withDwells);
            }

            Set<String> seen = new HashSet<>(8);
            for (int si = 0; si < sets.size(); si++) {
                List<Boundary> boundaries = sets.get(si);
                for (boolean[] mode : TRIM_MODES) {
                    if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) return;
                    List<Piece> pieces = multiSplit(s, boundaries, kw, mode[0], mode[1], true);
                    if (pieces == null) continue;
                    StringBuilder sig = new StringBuilder();
                    for (int pi = 0; pi < pieces.size(); pi++) {
                        if (pi > 0) sig.append(',');
                        MultiGlideInputToken pTok = pieces.get(pi).swipe;
                        int pSize = (pTok.points != null) ? pTok.points.size() : 0;
                        sig.append(pTok.startTimeMs).append('-').append(pTok.endTimeMs).append('-').append(pSize);
                    }
                    if (!seen.add(sig.toString())) continue;
                    result.add(interleave(primary, swipeIdx, pieces));
                }
            }
        }
    }

    private static void addCrossSwipeInterleaves(
            List<MultiGlideInputToken> primary,
            float kw,
            List<List<MultiGlideInputToken>> result
    ) {
        Map<Integer, List<Boundary>> perSwipe = new LinkedHashMap<>();
        for (int i = 0; i < primary.size(); i++) {
            MultiGlideInputToken s = primary.get(i);
            if (s.kind != MultiGlideInputToken.Kind.SWIPE) continue;
            List<Boundary> b = contactBoundaries(primary, i, s);
            if (!b.isEmpty()) perSwipe.put(i, b);
        }
        if (perSwipe.size() < 2) return;

        Set<String> seen = new HashSet<>(8);
        List<Integer> idx = new ArrayList<>(perSwipe.keySet());

        for (int span = 1; span < idx.size(); span++) {
            for (int i = 0; i < idx.size() - span; i++) {
                int first = idx.get(i);
                int second = idx.get(i + span);
                List<Boundary> fa = perSwipe.get(first);
                List<Boundary> fb = perSwipe.get(second);
                for (int ai = 0; ai < fa.size(); ai++) {
                    Boundary a = fa.get(ai);
                    for (int bi = 0; bi < fb.size(); bi++) {
                        Boundary b = fb.get(bi);
                        if (a.t >= b.t) continue;
                        Map<Integer, List<Boundary>> pair = new LinkedHashMap<>(2);
                        pair.put(first, Collections.singletonList(a));
                        pair.put(second, Collections.singletonList(b));
                        if (!emitCuts(primary, kw, result, seen, pair)) return;
                    }
                }
            }
        }

        for (int ki = 0; ki < idx.size(); ki++) {
            int k = idx.get(ki);
            List<Boundary> cuts = perSwipe.get(k);
            for (int ci = 0; ci < cuts.size(); ci++) {
                if (!emitCuts(primary, kw, result, seen, Collections.singletonMap(k, Collections.singletonList(cuts.get(ci))))) {
                    return;
                }
            }
        }

        emitCuts(primary, kw, result, seen, perSwipe);
    }

    private static boolean emitCuts(
            List<MultiGlideInputToken> primary,
            float kw,
            List<List<MultiGlideInputToken>> result,
            Set<String> seen,
            Map<Integer, List<Boundary>> cuts
    ) {
        for (boolean[] mode : TRIM_MODES) {
            if (result.size() >= KineticaConstants.MAX_ALT_SEQUENCES) return false;
            Map<Integer, List<Piece>> pieces = new HashMap<>(cuts.size());
            boolean ok = true;
            for (Map.Entry<Integer, List<Boundary>> entry : cuts.entrySet()) {
                MultiGlideInputToken s = primary.get(entry.getKey());
                List<Piece> split = multiSplit(s, entry.getValue(), kw, mode[0], mode[1], true);
                if (split == null) {
                    ok = false;
                    break;
                }
                pieces.put(entry.getKey(), split);
            }
            if (!ok || pieces.size() != cuts.size()) continue;
            List<MultiGlideInputToken> ordered = orderByTime(primary, pieces);
            StringBuilder sig = new StringBuilder();
            for (int i = 0; i < ordered.size(); i++) {
                if (i > 0) sig.append(',');
                MultiGlideInputToken t = ordered.get(i);
                sig.append(t.startTimeMs).append('-').append(t.endTimeMs);
            }
            if (!seen.add(sig.toString())) continue;
            result.add(ordered);
        }
        return true;
    }

    private static SplitVariant splitAtContact(MultiGlideInputToken s, long t, float kw) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        if (path == null || path.size() < 4) return null;
        int cut = clamp(nearestIndex(path, t), 1, path.size() - 3);
        MultiGlideInputToken first = sliceOrNull(s, 0, cut, kw, false, true, true);
        if (first == null) return null;
        MultiGlideInputToken second = sliceOrNull(s, cut + 1, path.size() - 1, kw, true, false, true);
        if (second == null) return null;
        return new SplitVariant(first, second);
    }

    private static List<Long> contactSnaps(MultiGlideInputToken s, long t) {
        List<Long> snaps = new ArrayList<>(3);
        snaps.add(t);
        for (int i = 0; i < s.keyContacts.size(); i++) {
            MultiGlideInputToken.KeyContact c = s.keyContacts.get(i);
            if (t >= c.tEnter && t < c.tExit) {
                if (!snaps.contains(c.tExit)) snaps.add(c.tExit);
                if (!snaps.contains(c.tEnter)) snaps.add(c.tEnter);
                break;
            }
        }
        return snaps;
    }

    private static List<Boundary> contactBoundaries(
            List<MultiGlideInputToken> primary,
            int swipeIdx,
            MultiGlideInputToken s
    ) {
        long lo = s.startTimeMs;
        long hi = s.endTimeMs;
        List<Long> times = new ArrayList<>(8);
        for (int k = 0; k < primary.size(); k++) {
            if (k == swipeIdx) continue;
            MultiGlideInputToken o = primary.get(k);
            if (o.streamId == s.streamId) continue;
            if (o.kind == MultiGlideInputToken.Kind.TAP) {
                if (o.startTimeMs >= lo && o.startTimeMs <= hi) times.add(o.startTimeMs);
            } else {
                for (int ci = 0; ci < o.keyContacts.size(); ci++) {
                    long te = o.keyContacts.get(ci).tEnter;
                    if (te >= lo && te <= hi) times.add(te);
                }
            }
            if (o.endTimeMs >= lo && o.endTimeMs <= hi) times.add(o.endTimeMs);
        }
        if (times.isEmpty()) return Collections.emptyList();
        Collections.sort(times);

        List<Boundary> out = new ArrayList<>(KineticaConstants.MAX_SPLIT_ANCHORS);
        for (int ti = 0; ti < times.size(); ti++) {
            long raw = times.get(ti);
            long t = raw;
            List<Long> snaps = contactSnaps(s, raw);
            for (int si = 0; si < snaps.size(); si++) {
                long cand = snaps.get(si);
                if (cand > s.startTimeMs && cand < s.endTimeMs && isInteriorCut(s, cand)
                        && hasContactAfterOrAt(s, cand, false)) {
                    t = cand;
                    break;
                }
            }
            if (!out.isEmpty() && t - out.get(out.size() - 1).t < KineticaConstants.SPLIT_MARGIN_MS) continue;
            if (!isInteriorCut(s, t)) continue;
            if (!hasContactAfterOrAt(s, t, true)) continue;
            out.add(new Boundary(t, -1));
            if (out.size() == KineticaConstants.MAX_SPLIT_ANCHORS) break;
        }
        return out;
    }

    private static boolean hasContactAfterOrAt(MultiGlideInputToken s, long t, boolean strictlyAfter) {
        for (int i = 0; i < s.keyContacts.size(); i++) {
            long te = s.keyContacts.get(i).tEnter;
            if (strictlyAfter ? (te > t) : (te >= t)) return true;
        }
        return false;
    }

    private static List<MultiGlideInputToken> orderByTime(
            List<MultiGlideInputToken> primary,
            Map<Integer, List<Piece>> piecesBySwipe
    ) {
        List<MultiGlideInputToken> out = new ArrayList<>(primary.size() + piecesBySwipe.size() + 2);
        for (int k = 0; k < primary.size(); k++) {
            List<Piece> pieces = piecesBySwipe.get(k);
            if (pieces != null) {
                for (int pi = 0; pi < pieces.size(); pi++) out.add(pieces.get(pi).swipe);
            } else {
                out.add(primary.get(k));
            }
        }
        out.sort((a, b) -> {
            int cmp = Long.compare(a.startTimeMs, b.startTimeMs);
            if (cmp != 0) return cmp;
            int aSoft = (a.kind == MultiGlideInputToken.Kind.SWIPE && a.softStart) ? 1 : 0;
            int bSoft = (b.kind == MultiGlideInputToken.Kind.SWIPE && b.softStart) ? 1 : 0;
            return Integer.compare(aSoft, bSoft);
        });
        return out;
    }

    private static boolean isInteriorCut(MultiGlideInputToken s, long t) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        if (path == null || path.size() < 6) return false;
        int idx = nearestIndex(path, t);
        return idx > 1 && idx < path.size() - 3;
    }

    private static List<Boundary> boundariesFor(
            List<MultiGlideInputToken> primary,
            int swipeIdx,
            MultiGlideInputToken s,
            boolean withDwells
    ) {
        List<Boundary> out = new ArrayList<>(4);
        for (int k = 0; k < primary.size(); k++) {
            if (k == swipeIdx) continue;
            MultiGlideInputToken o = primary.get(k);
            if (o.streamId == s.streamId) continue;

            Long t = null;
            if (o.kind == MultiGlideInputToken.Kind.TAP) {
                if (o.startTimeMs < s.endTimeMs + KineticaConstants.ORDER_AMBIG_MS) {
                    if (o.startTimeMs > s.startTimeMs + KineticaConstants.SPLIT_MARGIN_MS) {
                        t = o.startTimeMs;
                    } else {
                        List<Long> snaps = contactSnaps(s, o.startTimeMs);
                        if (snaps.size() > 1) {
                            long cand = snaps.get(1);
                            if (cand > s.startTimeMs && cand < s.endTimeMs && isInteriorCut(s, cand)) {
                                t = cand;
                            }
                        }
                    }
                }
            } else if (o.startTimeMs > s.startTimeMs + KineticaConstants.SPLIT_MARGIN_MS
                    && o.startTimeMs < s.endTimeMs - KineticaConstants.SPLIT_MARGIN_MS) {
                t = (o.endTimeMs < s.endTimeMs - KineticaConstants.SPLIT_MARGIN_MS)
                        ? (o.startTimeMs + o.endTimeMs) / 2L
                        : o.startTimeMs;
            }
            if (t != null) out.add(new Boundary(t, k));
        }

        if (withDwells && !out.isEmpty()) {
            for (int di = 0; di < s.dwells.size(); di++) {
                MultiGlideInputToken.Dwell d = s.dwells.get(di);
                out.add(new Boundary((d.tEnter + d.tExit) / 2L, -1));
            }
        }
        out.sort((a, b) -> Long.compare(a.t, b.t));
        if (out.size() > KineticaConstants.MAX_SPLIT_ANCHORS) {
            return new ArrayList<>(out.subList(0, KineticaConstants.MAX_SPLIT_ANCHORS));
        }
        return out;
    }

    private static List<Piece> multiSplit(
            MultiGlideInputToken s,
            List<Boundary> boundaries,
            float kw,
            boolean trimInterior,
            boolean trimFinal,
            boolean contacted
    ) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        if (path == null || path.size() < 6) return null;

        int[] cuts = new int[boundaries.size()];
        for (int i = 0; i < boundaries.size(); i++) {
            int c = clamp(nearestIndex(path, boundaries.get(i).t), 1, path.size() - 3);
            if (i > 0 && c - cuts[i - 1] < 2) return null;
            cuts[i] = c;
        }

        List<Piece> out = new ArrayList<>(cuts.length + 1);
        for (int i = 0; i < cuts.length; i++) {
            int from;
            if (i == 0) from = 0;
            else if (trimInterior) from = tailStartBefore(path, cuts[i], cuts[i - 1], kw);
            else from = cuts[i - 1] + 1;

            MultiGlideInputToken piece = sliceOrNull(s, from, cuts[i], kw, i > 0, true, contacted);
            if (piece == null) return null;
            out.add(new Piece(piece, boundaries.get(i).tokenIdx));
        }

        int last = cuts[cuts.length - 1];
        int from = trimFinal ? tailStartBefore(path, path.size() - 1, last, kw) : last + 1;
        MultiGlideInputToken tail = sliceOrNull(s, from, path.size() - 1, kw, true, false, contacted);
        if (tail == null) return null;
        out.add(new Piece(tail, -1));
        return out;
    }

    private static List<MultiGlideInputToken> interleave(
            List<MultiGlideInputToken> primary,
            int swipeIdx,
            List<Piece> pieces
    ) {
        Set<Integer> consumed = new HashSet<>(pieces.size() * 2);
        for (int i = 0; i < pieces.size(); i++) {
            int nextIdx = pieces.get(i).nextTokenIdx;
            if (nextIdx >= 0) consumed.add(nextIdx);
        }
        List<MultiGlideInputToken> out = new ArrayList<>(primary.size() + pieces.size());
        for (int k = 0; k < primary.size(); k++) {
            if (k == swipeIdx) {
                for (int pi = 0; pi < pieces.size(); pi++) {
                    Piece p = pieces.get(pi);
                    out.add(p.swipe);
                    if (p.nextTokenIdx >= 0) out.add(primary.get(p.nextTokenIdx));
                }
            } else if (!consumed.contains(k)) {
                out.add(primary.get(k));
            }
        }
        return out;
    }

    public static List<SplitVariant> splitVariants(MultiGlideInputToken s, long tCut, float kw) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        if (path == null || path.size() < 4) return Collections.emptyList();
        int nearest = nearestIndex(path, tCut);
        if (nearest < 1) return Collections.emptyList();
        int cut = clamp(nearest, 1, path.size() - 3);

        List<SplitVariant> out = new ArrayList<>(3);
        Set<Long> seen = new HashSet<>(4);

        addVariant(s, path, kw, cut, v1Resume(path, cut, kw), true, out, seen);
        addVariant(s, path, kw, cut, tailStart(path, cut, kw), true, out, seen);
        int apex = apexAfter(path, cut, kw);
        if (apex > cut && apex <= path.size() - 3) {
            addVariant(s, path, kw, apex, tailStart(path, apex, kw), false, out, seen);
        }
        return out;
    }

    private static void addVariant(
            MultiGlideInputToken s,
            List<MultiGlideInputToken.TouchPoint> path,
            float kw,
            int h1End,
            int h2Start,
            boolean softEnd,
            List<SplitVariant> out,
            Set<Long> seen
    ) {
        if (h2Start <= h1End || h2Start > path.size() - 2) return;
        long key = (((long) h1End) << 32) | (h2Start & 0xffffffffL);
        if (!seen.add(key)) return;
        SplitVariant halves = buildHalves(s, h1End, h2Start, kw, softEnd);
        if (halves != null) out.add(halves);
    }

    public static final class Cut {
        public final MultiGlideInputToken head;
        public final long tailStart;
        private final MultiGlideInputToken src;
        private final int from;
        private final float kw;

        Cut(MultiGlideInputToken head, MultiGlideInputToken src, int from, float kw) {
            this.head = head;
            this.tailStart = src.points.get(from).timeMs;
            this.src = src;
            this.from = from;
            this.kw = kw;
        }

        public MultiGlideInputToken tail() {
            return slice(src, from, src.points.size() - 1, kw, true, false);
        }
    }

    public static SplitVariant splitSwipe(MultiGlideInputToken s, long tCut, float kw) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        Integer cut = v1Cut(path, tCut);
        if (cut == null) return null;
        return buildHalves(s, cut, v1Resume(path, cut, kw), kw, true);
    }

    public static Cut cutSwipe(MultiGlideInputToken s, long tCut, float kw) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        Integer cut = v1Cut(path, tCut);
        if (cut == null) return null;
        int resume = v1Resume(path, cut, kw);
        if (arcLenKw(path, 0, cut, kw) < KineticaConstants.MIN_SPLIT_HALF_ARC_KW) return null;
        if (path.size() - resume < 2) return null;
        return new Cut(slice(s, 0, cut, kw, false, true), s, resume, kw);
    }

    private static Integer v1Cut(List<MultiGlideInputToken.TouchPoint> path, long tCut) {
        if (path == null || path.size() < 4) return null;
        int nearest = nearestIndex(path, tCut);
        if (nearest < 1) return null;
        return clamp(nearest, 1, path.size() - 3);
    }

    public static SplitVariant splitAtOwnContact(MultiGlideInputToken s, long t, float kw) {
        return splitAtContact(s, t, kw);
    }

    public static Cut cutAtOwnContact(MultiGlideInputToken s, long t, float kw) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        if (path == null || path.size() < 4) return null;
        int cut = clamp(nearestIndex(path, t), 1, path.size() - 3);
        MultiGlideInputToken head = sliceOrNull(s, 0, cut, kw, false, true, true);
        if (head == null) return null;
        if (!keeps(s, cut + 1, path.size() - 1, kw, true)) return null;
        return new Cut(head, s, cut + 1, kw);
    }

    private static boolean keeps(
            MultiGlideInputToken s,
            int from,
            int to,
            float kw,
            boolean keepIfContacted
    ) {
        if (to - from < 1) return false;
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        if (arcLenKw(path, from, to, kw) >= KineticaConstants.MIN_SPLIT_HALF_ARC_KW) return true;
        if (!keepIfContacted || s.keyContacts == null || s.keyContacts.isEmpty()) return false;
        long tFrom = path.get(from).timeMs;
        long tTo = path.get(to).timeMs;
        for (int i = 0; i < s.keyContacts.size(); i++) {
            MultiGlideInputToken.KeyContact c = s.keyContacts.get(i);
            if (c.tExit >= tFrom && c.tEnter <= tTo) return true;
        }
        return false;
    }

    private static int nearestIndex(List<MultiGlideInputToken.TouchPoint> path, long t) {
        int best = 0;
        long bestDt = Long.MAX_VALUE;
        for (int i = 0; i < path.size(); i++) {
            long dt = Math.abs(path.get(i).timeMs - t);
            if (dt < bestDt) {
                bestDt = dt;
                best = i;
            }
        }
        return best;
    }

    private static SplitVariant buildHalves(
            MultiGlideInputToken s,
            int h1End,
            int h2Start,
            float kw,
            boolean softEnd
    ) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        if (arcLenKw(path, 0, h1End, kw) < KineticaConstants.MIN_SPLIT_HALF_ARC_KW) return null;
        if (path.size() - h2Start < 2) return null;
        MultiGlideInputToken first = slice(s, 0, h1End, kw, false, softEnd);
        MultiGlideInputToken second = slice(s, h2Start, path.size() - 1, kw, true, false);
        return new SplitVariant(first, second);
    }

    private static MultiGlideInputToken slice(
            MultiGlideInputToken s,
            int from,
            int to,
            float kw,
            boolean softStart,
            boolean softEnd
    ) {
        List<MultiGlideInputToken.TouchPoint> path = s.points;
        List<MultiGlideInputToken.TouchPoint> sub = new ArrayList<>(path.subList(from, to + 1));
        long tFrom = path.get(from).timeMs;
        long tTo = path.get(to).timeMs;

        List<MultiGlideInputToken.KeyContact> contacts = new ArrayList<>(s.keyContacts.size());
        for (int i = 0; i < s.keyContacts.size(); i++) {
            MultiGlideInputToken.KeyContact c = s.keyContacts.get(i);
            if (c.tExit >= tFrom && c.tEnter <= tTo) contacts.add(c);
        }

        List<MultiGlideInputToken.Dwell> subDwells = Collections.emptyList();
        float arcPx = arcLenPx(sub);
        return MultiGlideInputToken.swipe(
                s.pointerId,
                s.streamId,
                sub,
                arcPx,
                (from == 0) ? s.startTimeMs : tFrom,
                (to == path.size() - 1) ? s.endTimeMs : tTo,
                contacts,
                subDwells,
                softStart,
                softEnd
        );
    }

    private static MultiGlideInputToken sliceOrNull(
            MultiGlideInputToken s,
            int from,
            int to,
            float kw,
            boolean softStart,
            boolean softEnd,
            boolean keepIfContacted
    ) {
        if (to - from < 1) return null;
        MultiGlideInputToken piece = slice(s, from, to, kw, softStart, softEnd);
        if ((piece.pathLengthPx / kw) >= KineticaConstants.MIN_SPLIT_HALF_ARC_KW) return piece;
        return (keepIfContacted && !piece.keyContacts.isEmpty()) ? piece : null;
    }

    private static int v1Resume(List<MultiGlideInputToken.TouchPoint> path, int cut, float kw) {
        int resume = apexAfter(path, cut, kw);
        if (resume == -1) {
            resume = cut + 1;
            while (resume < path.size() - 2
                    && distKw(path.get(resume), path.get(cut), kw) < KineticaConstants.SPLIT_HEAD_TRIM_KW) {
                resume++;
            }
        }
        return (arcLenKw(path, resume, path.size() - 1, kw) < KineticaConstants.MIN_SPLIT_HALF_ARC_KW)
                ? (cut + 1)
                : resume;
    }

    private static int apexAfter(List<MultiGlideInputToken.TouchPoint> path, int from, float kw) {
        MultiGlideInputToken.TouchPoint fromPt = path.get(from);
        float prevD = 0f;
        int i = from + 1;
        while (i <= path.size() - 2) {
            float d = distKw(path.get(i), fromPt, kw);
            float dNext = distKw(path.get(i + 1), fromPt, kw);
            if (d >= KineticaConstants.SPLIT_HEAD_TRIM_KW && d >= prevD && d > dNext) return i;
            prevD = d;
            i++;
        }
        return -1;
    }

    private static int tailStart(List<MultiGlideInputToken.TouchPoint> path, int cutIdx, float kw) {
        return Math.min(tailStartBefore(path, path.size() - 1, cutIdx, kw), path.size() - 2);
    }

    private static int tailStartBefore(
            List<MultiGlideInputToken.TouchPoint> path,
            int end,
            int floor,
            float kw
    ) {
        float acc = 0f;
        int i = end;
        while (i - 1 > floor) {
            float step = distKw(path.get(i), path.get(i - 1), kw);
            if (acc + step > KineticaConstants.SPLIT_RESUME_TAIL_KW) break;
            acc += step;
            i--;
        }
        return i;
    }

    private static float distKw(
            MultiGlideInputToken.TouchPoint a,
            MultiGlideInputToken.TouchPoint b,
            float kw
    ) {
        float dx = a.x - b.x;
        float dy = a.y - b.y;
        return (float) Math.hypot(dx, dy) / kw;
    }

    private static float arcLenKw(
            List<MultiGlideInputToken.TouchPoint> path,
            int from,
            int to,
            float kw
    ) {
        float acc = 0f;
        for (int i = from + 1; i <= to; i++) {
            acc += distKw(path.get(i), path.get(i - 1), kw);
        }
        return acc;
    }

    private static float arcLenPx(List<MultiGlideInputToken.TouchPoint> path) {
        float acc = 0f;
        for (int i = 1; i < path.size(); i++) {
            MultiGlideInputToken.TouchPoint a = path.get(i - 1);
            MultiGlideInputToken.TouchPoint b = path.get(i);
            acc += (float) Math.hypot(b.x - a.x, b.y - a.y);
        }
        return acc;
    }

    private static int clamp(int v, int lo, int hi) {
        return Math.max(lo, Math.min(hi, v));
    }
}
