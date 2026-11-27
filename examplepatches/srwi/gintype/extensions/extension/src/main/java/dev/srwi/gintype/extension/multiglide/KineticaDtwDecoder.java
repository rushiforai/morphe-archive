package dev.srwi.gintype.extension.multiglide;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Set;
import java.util.TreeSet;

/**
 * Continuous Dynamic Time Warping (DTW) multi-finger & single-finger swipe decoder.
 * Ported 1:1 from Kinetica's WordPredictor.kt, MergeAlternatives.kt, DtwMatcher.kt & ThumbBeam.kt.
 */
public final class KineticaDtwDecoder {

    public static final class Candidate implements Comparable<Candidate> {
        public final String word;
        public final float score;
        public final float dTotal;
        public final boolean isProperNoun;

        public Candidate(String word, float score, float dTotal, boolean isProperNoun) {
            this.word = word;
            this.score = score;
            this.dTotal = dTotal;
            this.isProperNoun = isProperNoun;
        }

        @Override
        public int compareTo(Candidate other) {
            // Min-heap order by score (lowest score at root)
            return Float.compare(this.score, other.score);
        }
    }

    public static final class CandidateHeap {
        private final int capacity;
        private final PriorityQueue<Candidate> pq;
        private final Set<String> words;

        public CandidateHeap(int capacity) {
            this.capacity = capacity;
            this.pq = new PriorityQueue<>(capacity);
            this.words = new HashSet<>(capacity * 2);
        }

        public void offer(Candidate c) {
            if (c == null || c.word == null || c.word.isEmpty()) return;
            if (words.contains(c.word)) {
                for (Candidate existing : pq) {
                    if (existing.word.equals(c.word)) {
                        if (c.score > existing.score) {
                            pq.remove(existing);
                            pq.offer(c);
                        }
                        return;
                    }
                }
                return;
            }

            if (pq.size() < capacity) {
                pq.offer(c);
                words.add(c.word);
            } else if (c.score > pq.peek().score) {
                Candidate dropped = pq.poll();
                if (dropped != null) words.remove(dropped.word);
                pq.offer(c);
                words.add(c.word);
            }
        }

        public boolean isFull() {
            return pq.size() >= capacity;
        }

        public float minScore() {
            if (pq.isEmpty()) return 0f;
            return pq.peek().score;
        }

        public Candidate best() {
            Candidate best = null;
            for (Candidate c : pq) {
                if (best == null || c.score > best.score) {
                    best = c;
                }
            }
            return best;
        }

        public List<Candidate> sortedCandidatesDescending() {
            List<Candidate> list = new ArrayList<>(pq);
            list.sort((a, b) -> Float.compare(b.score, a.score));
            return list;
        }

        public List<MultiGlideInputToken.WordCandidate> sortedDescending() {
            return toWordCandidates(sortedCandidatesDescending());
        }

        public boolean isEmpty() {
            return pq.isEmpty();
        }

        public int size() {
            return pq.size();
        }
    }

    private static List<MultiGlideInputToken.WordCandidate> toWordCandidates(List<Candidate> list) {
        List<MultiGlideInputToken.WordCandidate> out = new ArrayList<>(list.size());
        for (int i = 0; i < list.size(); i++) {
            Candidate c = list.get(i);
            out.add(new MultiGlideInputToken.WordCandidate(c.word, c.score, c.dTotal, 1.0f, 1.0f));
        }
        return out;
    }

    private final DtwMatcher dtw = new DtwMatcher();
    private final float[] idealPathScratch = new float[2 * KineticaConstants.RESAMPLE_N];
    private final int[] wordLetters = new int[KineticaConstants.MAX_WORD_LEN + 2];
    private float saturation = KineticaConstants.GEO_SATURATION_KW;
    private final Map<MultiGlideInputToken, Map<Long, Halves>> cutMemo = new IdentityHashMap<>();
    private final Map<MultiGlideInputToken, Map<Long, Halves>> ownMemo = new IdentityHashMap<>();

    private static float saturationOf(List<MultiGlideInputToken> tokens, float kw) {
        if (kw <= 0f) return KineticaConstants.GEO_SATURATION_KW;
        float arcKw = 0f;
        for (int i = 0; i < tokens.size(); i++) {
            MultiGlideInputToken t = tokens.get(i);
            if (t.kind == MultiGlideInputToken.Kind.SWIPE) {
                arcKw += t.pathLengthPx / kw;
            }
        }
        return KineticaConstants.saturationFor(arcKw);
    }

    public List<MultiGlideInputToken.WordCandidate> decode(
            List<MultiGlideInputToken> tokens,
            MultiGlideTrie trie,
            MultiGlideBigramTable bigrams,
            MultiGlideGeometry geometry,
            String prevWord
    ) {
        if (tokens == null || tokens.isEmpty() || trie == null || geometry == null || !geometry.isValid()) {
            return Collections.emptyList();
        }
        cutMemo.clear();
        ownMemo.clear();
        saturation = saturationOf(tokens, geometry.keyWidthPx);

        boolean hasSwipe = false;
        List<KineticaMatcher.Anchor> rawAnchors = new ArrayList<>(tokens.size());
        for (int i = 0; i < tokens.size(); i++) {
            MultiGlideInputToken t = tokens.get(i);
            if (t.kind == MultiGlideInputToken.Kind.SWIPE && t.points != null && !t.points.isEmpty()) {
                hasSwipe = true;
            } else if (t.kind == MultiGlideInputToken.Kind.TAP) {
                int code = MultiGlideGeometry.foldSupportedCharIndex(t.character);
                if (code >= 0) {
                    rawAnchors.add(new KineticaMatcher.Anchor(
                            code,
                            t.tapX / geometry.keyWidthPx,
                            t.tapY / geometry.keyWidthPx,
                            t.startTimeMs,
                            t.streamId
                    ));
                }
            }
        }

        if (!hasSwipe) {
            CandidateHeap tapHeap = new CandidateHeap(KineticaConstants.TOP_K);
            decodeTapsOnly(rawAnchors, trie, bigrams, geometry, prevWord, tapHeap);
            return tapHeap.sortedDescending();
        }

        List<List<MultiGlideInputToken>> seqs = MergeAlternatives.sequences(tokens, geometry);
        List<List<KineticaMatcher>> patterns = new ArrayList<>(seqs.size());
        List<List<MultiGlideInputToken>> validSeqs = new ArrayList<>(seqs.size());
        for (int i = 0; i < seqs.size(); i++) {
            List<KineticaMatcher> p = buildPattern(seqs.get(i), geometry);
            if (p != null && !p.isEmpty()) {
                patterns.add(p);
                validSeqs.add(seqs.get(i));
            }
        }
        if (patterns.isEmpty()) {
            return Collections.emptyList();
        }

        CandidateHeap heap = new CandidateHeap(KineticaConstants.TOP_K);
        List<MultiGlideInputToken> primary = validSeqs.get(0);
        List<KineticaMatcher> primaryPattern = patterns.get(0);

        // 1) Primary DFS passes across MergeAlternatives sequences (exact anchors)
        for (int i = 0; i < patterns.size(); i++) {
            runSearch(patterns.get(i), trie, bigrams, geometry, prevWord, heap, false, false, 0f);
        }

        // 2) Cutting pass over primary sequence: search places its own swipe cuts around other thumb events
        if (!heap.isFull() && hasSwipeIn(primary) && primaryPattern.size() == primary.size()) {
            Map<MultiGlideInputToken, long[]> cuts = cutCandidates(primary);
            if (!cuts.isEmpty()) {
                long[] itemStart = new long[primary.size()];
                MultiGlideInputToken[] srcOf = new MultiGlideInputToken[primary.size()];
                for (int i = 0; i < primary.size(); i++) {
                    MultiGlideInputToken tok = primary.get(i);
                    itemStart[i] = tok.startTimeMs;
                    srcOf[i] = (tok.kind == MultiGlideInputToken.Kind.SWIPE) ? tok : null;
                }
                new Search(
                        primaryPattern, trie, bigrams, geometry, prevWord, heap,
                        false, false, 0f, itemStart, srcOf, cuts, null
                ).run();
            }
        }

        // 3) Two-thumb cursor stream pass (handles arbitrary interleaving & handover tolerance)
        if (streamGateOpen(heap)) {
            StreamPlan plan = streamPlan(primary, primaryPattern, geometry);
            if (plan != null) {
                new Search(
                        primaryPattern, trie, bigrams, geometry, prevWord, heap,
                        false, false, 0f, null, null, null, plan
                ).run();
            }
        }

        // 4) Fuzzy anchor & adjacent-tap transposition fallbacks when list is underfilled
        if (!heap.isFull()) {
            boolean anyAnchors = hasAnchors(primaryPattern);
            if (anyAnchors) {
                for (int i = 0; i < patterns.size(); i++) {
                    runSearch(patterns.get(i), trie, bigrams, geometry, prevWord, heap, true, false, 0f);
                }
            }
            if (!heap.isFull() && anyAnchors) {
                List<List<KineticaMatcher>> transposed = transposedPatterns(primaryPattern);
                for (int i = 0; i < transposed.size(); i++) {
                    runSearch(
                            transposed.get(i), trie, bigrams, geometry, prevWord, heap,
                            false, false, KineticaConstants.TRANSPOSE_PENALTY);
                }
            }
        }

        // 5) Rescue pass when nothing decoded or lead distance > RESCUE_MIN_LEAD_D
        Candidate lead = heap.best();
        if (lead == null || lead.dTotal > KineticaConstants.RESCUE_MIN_LEAD_D) {
            StreamPlan rescuePlan = streamPlan(primary, primaryPattern, geometry);
            if (rescuePlan != null) {
                new Search(
                        primaryPattern, trie, bigrams, geometry, prevWord, heap,
                        false, true, 0f, null, null, null, rescuePlan
                ).run();
            } else {
                int rescueLimit = Math.min(patterns.size(), 4);
                for (int i = 0; i < rescueLimit; i++) {
                    runSearch(patterns.get(i), trie, bigrams, geometry, prevWord, heap, true, true, 0f);
                }
            }
        }

        // 6) Dual-thumb beam search on primary sequence + Kinetica mergeBeam rules
        List<Candidate> passes = heap.sortedCandidatesDescending();
        List<Candidate> merged;
        if (ThumbBeam.applies(primary, primaryPattern)) {
            CandidateHeap beamHeap = new CandidateHeap(KineticaConstants.TOP_K);
            for (int i = 0; i < passes.size(); i++) {
                beamHeap.offer(passes.get(i));
            }
            new ThumbBeam(primary, primaryPattern, geometry, trie, bigrams, prevWord, beamHeap, dtw, false).run();
            Candidate beamLead = beamHeap.best();
            if (primary.size() >= 3 && hasTapIn(primary)
                    && (beamLead == null || beamLead.dTotal > KineticaConstants.RESCUE_MIN_LEAD_D)) {
                new ThumbBeam(primary, primaryPattern, geometry, trie, bigrams, prevWord, beamHeap, dtw, true).run();
            }
            merged = mergeBeam(passes, beamHeap.sortedCandidatesDescending());
        } else {
            merged = passes;
        }

        return toWordCandidates(merged);
    }

    /**
     * Runs only the two-thumb stream pass regardless of {@link KineticaConstants#STREAM_SEARCH_GATE}
     * (used for unit testing handover and cut rules directly).
     */
    List<MultiGlideInputToken.WordCandidate> streamPassOnly(
            List<MultiGlideInputToken> tokens,
            MultiGlideTrie trie,
            MultiGlideBigramTable bigrams,
            MultiGlideGeometry geometry,
            String prevWord
    ) {
        if (tokens == null || tokens.isEmpty() || trie == null || geometry == null || !geometry.isValid()) {
            return Collections.emptyList();
        }
        cutMemo.clear();
        ownMemo.clear();
        saturation = saturationOf(tokens, geometry.keyWidthPx);
        List<List<MultiGlideInputToken>> seqs = MergeAlternatives.sequences(tokens, geometry);
        if (seqs.isEmpty()) return Collections.emptyList();
        List<MultiGlideInputToken> primary = seqs.get(0);
        List<KineticaMatcher> p = buildPattern(primary, geometry);
        if (p == null || p.isEmpty()) return Collections.emptyList();
        StreamPlan plan = streamPlan(primary, p, geometry);
        if (plan == null) return Collections.emptyList();
        CandidateHeap heap = new CandidateHeap(KineticaConstants.TOP_K);
        new Search(p, trie, bigrams, geometry, prevWord, heap, false, false, 0f, null, null, null, plan).run();
        return heap.sortedDescending();
    }

    private static boolean streamGateOpen(CandidateHeap heap) {
        if (KineticaConstants.STREAM_SEARCH_GATE == 1) return !heap.isFull();
        return KineticaConstants.STREAM_SEARCH_GATE == 3;
    }

    private static boolean hasSwipeIn(List<MultiGlideInputToken> tokens) {
        for (int i = 0; i < tokens.size(); i++) {
            MultiGlideInputToken t = tokens.get(i);
            if (t.kind == MultiGlideInputToken.Kind.SWIPE && t.points != null && !t.points.isEmpty()) {
                return true;
            }
        }
        return false;
    }

    private static boolean hasTapIn(List<MultiGlideInputToken> tokens) {
        for (int i = 0; i < tokens.size(); i++) {
            if (tokens.get(i).kind == MultiGlideInputToken.Kind.TAP) {
                return true;
            }
        }
        return false;
    }

    private static final class StreamPlan {
        final List<KineticaMatcher>[] items;
        final List<MultiGlideInputToken>[] tokens;
        final Map<MultiGlideInputToken, long[]> cuts;

        StreamPlan(
                List<KineticaMatcher>[] items,
                List<MultiGlideInputToken>[] tokens,
                Map<MultiGlideInputToken, long[]> cuts
        ) {
            this.items = items;
            this.tokens = tokens;
            this.cuts = cuts;
        }
    }

    private final class Halves {
        final KineticaMatcher.Segment head;
        private final MergeAlternatives.Cut cut;
        private final MultiGlideGeometry geometry;
        private MultiGlideInputToken token;
        private KineticaMatcher.Segment segment;

        Halves(KineticaMatcher.Segment head, MergeAlternatives.Cut cut, MultiGlideGeometry geometry) {
            this.head = head;
            this.cut = cut;
            this.geometry = geometry;
        }

        long getTailStart() {
            return cut.tailStart;
        }

        MultiGlideInputToken getTailToken() {
            if (token == null) token = cut.tail();
            return token;
        }

        KineticaMatcher.Segment getTail() {
            if (segment == null) segment = segmentFromToken(getTailToken(), geometry);
            return segment;
        }
    }

    @SuppressWarnings("unchecked")
    private StreamPlan streamPlan(
            List<MultiGlideInputToken> primary,
            List<KineticaMatcher> pattern,
            MultiGlideGeometry geometry
    ) {
        if (pattern.size() != primary.size() || !hasSwipeIn(primary)) return null;
        List<KineticaMatcher>[] itemsByStream = new List[]{new ArrayList<>(), new ArrayList<>()};
        List<MultiGlideInputToken>[] tokensByStream = new List[]{new ArrayList<>(), new ArrayList<>()};
        for (int i = 0; i < primary.size(); i++) {
            MultiGlideInputToken t = primary.get(i);
            int s = (t.streamId == 1) ? 1 : 0;
            itemsByStream[s].add(pattern.get(i));
            tokensByStream[s].add(t);
        }
        if (itemsByStream[0].isEmpty() || itemsByStream[1].isEmpty()) return null;
        return new StreamPlan(itemsByStream, tokensByStream, cutCandidates(primary));
    }

    private static Map<MultiGlideInputToken, long[]> cutCandidates(List<MultiGlideInputToken> primary) {
        Map<MultiGlideInputToken, long[]> out = new IdentityHashMap<>();
        for (int i = 0; i < primary.size(); i++) {
            MultiGlideInputToken tok = primary.get(i);
            if (tok.kind != MultiGlideInputToken.Kind.SWIPE) continue;
            TreeSet<Long> times = new TreeSet<>();
            for (int k = 0; k < primary.size(); k++) {
                if (k == i) continue;
                MultiGlideInputToken o = primary.get(k);
                if (o.streamId == tok.streamId) continue;
                if (o.startTimeMs > tok.startTimeMs && o.startTimeMs < tok.endTimeMs) {
                    times.add(o.startTimeMs);
                }
                if (o.endTimeMs > tok.startTimeMs && o.endTimeMs < tok.endTimeMs) {
                    times.add(o.endTimeMs);
                }
                if (o.kind == MultiGlideInputToken.Kind.SWIPE && o.keyContacts != null) {
                    for (int ci = 0; ci < o.keyContacts.size(); ci++) {
                        long tEnter = o.keyContacts.get(ci).tEnter;
                        if (tEnter > tok.startTimeMs && tEnter < tok.endTimeMs) {
                            times.add(tEnter);
                        }
                    }
                }
            }
            if (times.isEmpty()) continue;
            int n = Math.min(times.size(), KineticaConstants.MAX_SEARCH_CUT_TIMES);
            long[] arr = new long[n];
            int idx = 0;
            for (Long t : times) {
                if (idx >= n) break;
                arr[idx++] = t;
            }
            out.put(tok, arr);
        }
        return out;
    }

    private KineticaMatcher.Segment segmentFromToken(MultiGlideInputToken t, MultiGlideGeometry geometry) {
        List<DtwMatcher.Point2D> ptsKw = new ArrayList<>(t.points.size());
        for (int j = 0; j < t.points.size(); j++) {
            MultiGlideInputToken.TouchPoint tp = t.points.get(j);
            ptsKw.add(new DtwMatcher.Point2D(
                    tp.x / geometry.keyWidthPx,
                    tp.y / geometry.keyWidthPx,
                    tp.timeMs
            ));
        }
        return KineticaMatcher.buildSegment(
                ptsKw, t.startTimeMs, t.endTimeMs, geometry, t.streamId, dtw,
                t.keyContacts, t.softStart, t.softEnd
        );
    }

    private List<KineticaMatcher> buildPattern(List<MultiGlideInputToken> seq, MultiGlideGeometry geometry) {
        List<KineticaMatcher> items = new ArrayList<>(seq.size());
        for (int i = 0; i < seq.size(); i++) {
            MultiGlideInputToken t = seq.get(i);
            if (t.kind == MultiGlideInputToken.Kind.SWIPE && t.points != null && !t.points.isEmpty()) {
                items.add(segmentFromToken(t, geometry));
            } else if (t.kind == MultiGlideInputToken.Kind.TAP) {
                int code = MultiGlideGeometry.foldSupportedCharIndex(t.character);
                if (code < 0 || !geometry.hasKey(code)) {
                    // Fallback to nearest key if tap was on umlaut/accent not present
                    MultiGlideGeometry.KeySpec k = geometry.nearestLetterKey(t.tapX, t.tapY);
                    code = (k != null) ? MultiGlideGeometry.foldSupportedCharIndex(k.character) : -1;
                }
                if (code < 0 || !geometry.hasKey(code)) return null;
                items.add(new KineticaMatcher.Anchor(
                        code,
                        t.tapX / geometry.keyWidthPx,
                        t.tapY / geometry.keyWidthPx,
                        t.startTimeMs,
                        t.streamId
                ));
            }
        }
        return items;
    }

    private static boolean hasAnchors(List<KineticaMatcher> pattern) {
        for (int i = 0; i < pattern.size(); i++) {
            if (pattern.get(i) instanceof KineticaMatcher.Anchor) return true;
        }
        return false;
    }

    private static List<List<KineticaMatcher>> transposedPatterns(List<KineticaMatcher> pattern) {
        List<List<KineticaMatcher>> out = new ArrayList<>();
        for (int i = 0; i < pattern.size() - 1; i++) {
            KineticaMatcher m0 = pattern.get(i);
            KineticaMatcher m1 = pattern.get(i + 1);
            if (!(m0 instanceof KineticaMatcher.Anchor) || !(m1 instanceof KineticaMatcher.Anchor)) continue;
            KineticaMatcher.Anchor a = (KineticaMatcher.Anchor) m0;
            KineticaMatcher.Anchor b = (KineticaMatcher.Anchor) m1;
            if (a.code == b.code) continue;
            List<KineticaMatcher> v = new ArrayList<>(pattern);
            v.set(i, b);
            v.set(i + 1, a);
            out.add(v);
        }
        return out;
    }

    private static List<Candidate> mergeBeam(List<Candidate> passes, List<Candidate> beam) {
        if (passes.isEmpty()) return beam;
        Set<String> known = new HashSet<>(passes.size() * 2);
        for (int i = 0; i < passes.size(); i++) {
            known.add(passes.get(i).word);
        }
        float lead = passes.get(0).score;
        List<Candidate> out = new ArrayList<>(KineticaConstants.TOP_K);
        int added = 0;
        int filled = 0;
        for (int i = 0; i < beam.size(); i++) {
            Candidate c = beam.get(i);
            if (known.contains(c.word)) continue;
            if (added < KineticaConstants.BEAM_MAX_NEW && c.score > lead) {
                out.add(c);
                added++;
            } else if (passes.size() + added + filled < KineticaConstants.TOP_K) {
                out.add(c);
                filled++;
            }
        }
        Map<String, Candidate> byWord = new HashMap<>(beam.size() * 2);
        for (int i = 0; i < beam.size(); i++) {
            Candidate c = beam.get(i);
            byWord.put(c.word, c);
        }
        for (int i = 0; i < passes.size(); i++) {
            Candidate c = passes.get(i);
            Candidate b = byWord.get(c.word);
            out.add((b != null && b.score > c.score) ? b : c);
        }
        out.sort((a, b) -> Float.compare(b.score, a.score));
        if (out.size() > KineticaConstants.TOP_K) {
            return new ArrayList<>(out.subList(0, KineticaConstants.TOP_K));
        }
        return out;
    }

    private void runSearch(
            List<KineticaMatcher> pattern,
            MultiGlideTrie trie,
            MultiGlideBigramTable bigrams,
            MultiGlideGeometry geometry,
            String prevWord,
            CandidateHeap heap,
            boolean fuzzyAnchors,
            boolean rescue,
            float extraPenalty
    ) {
        Search search = new Search(
                pattern, trie, bigrams, geometry, prevWord, heap, fuzzyAnchors, rescue, extraPenalty,
                null, null, null, null);
        search.run();
    }

    private final class Search {
        private final List<KineticaMatcher> pattern;
        private final MultiGlideTrie trie;
        private final MultiGlideBigramTable bigrams;
        private final MultiGlideGeometry geometry;
        private final String prevWord;
        private final CandidateHeap heap;
        private final boolean fuzzyAnchors;
        private final boolean rescue;
        private final float extraPenalty;

        private final long[] itemStart;
        private final MultiGlideInputToken[] srcOf;
        private final Map<MultiGlideInputToken, long[]> cuts;
        private final StreamPlan plan;
        private final boolean cutting;
        private final boolean streaming;

        private final int maxAttempts;
        private final int stepBudget;
        private final int[] restMin;
        private final int[][] streamRestMin;
        private final KineticaMatcher.Segment[] pieceSeg =
                new KineticaMatcher.Segment[KineticaConstants.MAX_WORD_LEN + 1];
        private final int[] pieceFrom = new int[KineticaConstants.MAX_WORD_LEN + 1];
        private final int[] pieceTo = new int[KineticaConstants.MAX_WORD_LEN + 1];
        private final int[][] childOrder = new int[KineticaConstants.MAX_WORD_LEN + 1][26];

        private final Halves[] pendingTail =
                new Halves[KineticaConstants.MAX_SEARCH_CUTS + 1];
        private final long[] pendingStart = new long[KineticaConstants.MAX_SEARCH_CUTS + 1];
        private final MultiGlideInputToken[] pendingOrigin =
                new MultiGlideInputToken[KineticaConstants.MAX_SEARCH_CUTS + 1];
        private int cutsOpen = 0;

        // Stream pass state (one cursor per thumb)
        private final int[] sCursor = new int[2];
        private final Halves[] sParked = new Halves[2];
        private final MultiGlideInputToken[] sParkedOrigin = new MultiGlideInputToken[2];
        private long sLastT = Long.MIN_VALUE;
        private int sLastStream = -1;
        private boolean sMustSwitch = false;
        private int sCutsMade = 0;
        private long openFloorT = Long.MIN_VALUE;
        private int openCloseLetter = -1;
        private long openCloseEnter = Long.MAX_VALUE;
        private int ownFrom = 0;

        private int pieceCount = 0;
        private int emitted = 0;
        private int attempts = 0;
        private int steps = 0;
        private int emitCap = KineticaConstants.MAX_CANDIDATES;

        Search(
                List<KineticaMatcher> pattern,
                MultiGlideTrie trie,
                MultiGlideBigramTable bigrams,
                MultiGlideGeometry geometry,
                String prevWord,
                CandidateHeap heap,
                boolean fuzzyAnchors,
                boolean rescue,
                float extraPenalty,
                long[] itemStart,
                MultiGlideInputToken[] srcOf,
                Map<MultiGlideInputToken, long[]> cuts,
                StreamPlan plan
        ) {
            this.pattern = pattern;
            this.trie = trie;
            this.bigrams = bigrams;
            this.geometry = geometry;
            this.prevWord = prevWord;
            this.heap = heap;
            this.fuzzyAnchors = fuzzyAnchors;
            this.rescue = rescue;
            this.extraPenalty = extraPenalty;
            this.itemStart = itemStart;
            this.srcOf = srcOf;
            this.cuts = cuts;
            this.plan = plan;
            this.cutting = (itemStart != null && srcOf != null && cuts != null);
            this.streaming = (plan != null);
            this.maxAttempts = rescue
                    ? KineticaConstants.RESCUE_MAX_ATTEMPTS
                    : KineticaConstants.MAX_EMIT_ATTEMPTS;
            this.stepBudget = rescue
                    ? KineticaConstants.RESCUE_STEP_BUDGET
                    : KineticaConstants.STREAM_SEARCH_STEP_BUDGET;

            this.restMin = suffixMin(pattern);
            if (plan != null) {
                this.streamRestMin = new int[2][];
                this.streamRestMin[0] = suffixMin(plan.items[0]);
                this.streamRestMin[1] = suffixMin(plan.items[1]);
            } else {
                this.streamRestMin = null;
            }
        }

        private int[] suffixMin(List<KineticaMatcher> items) {
            int[] out = new int[items.size() + 1];
            for (int j = items.size() - 1; j >= 0; j--) {
                KineticaMatcher m = items.get(j);
                int need = (m instanceof KineticaMatcher.Segment)
                        ? Math.max(1, ((KineticaMatcher.Segment) m).minLetters)
                        : 1;
                out[j] = out[j + 1] + need;
            }
            return out;
        }

        private int restNeededAfter(int nextTi) {
            if (streamRestMin != null) {
                int need = 0;
                for (int s = 0; s < 2; s++) {
                    int[] sr = streamRestMin[s];
                    need += sr[Math.min(sCursor[s], sr.length - 1)];
                    if (sParked[s] != null) need++;
                }
                return need;
            }
            int need = restMin[Math.min(nextTi, pattern.size())];
            for (int i = 0; i < pendingTail.length; i++) {
                if (pendingTail[i] != null) need++;
            }
            return need;
        }

        private boolean stepsExhausted() {
            if (rescue) return steps >= KineticaConstants.RESCUE_STEP_BUDGET || attempts >= maxAttempts;
            if (streaming) return steps >= KineticaConstants.STREAM_SEARCH_STEP_BUDGET;
            return false;
        }

        private boolean branchExhausted() {
            return emitted >= emitCap || attempts >= maxAttempts || stepsExhausted();
        }

        private boolean passExhausted() {
            return emitted >= KineticaConstants.MAX_CANDIDATES
                    || attempts >= maxAttempts
                    || stepsExhausted();
        }

        void run() {
            if (streaming) {
                streamNext(0, 0, 0f, 1.0f);
            } else {
                dfs(0, 0, 0, 0f, 1.0f);
            }
        }

        // ---- Two-thumb cursor stream pass -----------------------------------------

        private void streamNext(int node, int depth, float tapPen, float contactKeep) {
            if (branchExhausted()) return;
            boolean done = true;
            for (int s = 0; s < 2; s++) {
                if (sParked[s] != null || sCursor[s] < plan.items[s].size()) {
                    done = false;
                    break;
                }
            }
            if (done) {
                if (depth > 0 && trie.isWord(node)) emit(node, depth, tapPen, contactKeep);
                return;
            }
            int first = (nextStart(0) <= nextStart(1)) ? 0 : 1;
            for (int k = 0; k < 2; k++) {
                int s = (k == 0) ? first : (1 - first);
                if (sMustSwitch && s == sLastStream) continue;
                openOn(s, node, depth, tapPen, contactKeep);
            }
        }

        private long nextStart(int s) {
            if (sParked[s] != null) return sParked[s].getTailStart();
            int idx = sCursor[s];
            return (idx < plan.tokens[s].size()) ? plan.tokens[s].get(idx).startTimeMs : Long.MAX_VALUE;
        }

        private void openOn(int s, int node, int depth, float tapPen, float contactKeep) {
            long floor = (sLastStream >= 0 && sLastStream != s)
                    ? (sLastT - KineticaConstants.HANDOVER_ALLOWANCE_MS)
                    : Long.MIN_VALUE;
            Halves parked = sParked[s];
            if (parked != null) {
                MultiGlideInputToken origin = sParkedOrigin[s];
                sParked[s] = null;
                sParkedOrigin[s] = null;
                openPiece(s, node, depth, tapPen, contactKeep,
                        parked.getTail(), parked.getTailToken(), origin, floor);
                sParked[s] = parked;
                sParkedOrigin[s] = origin;
                return;
            }
            int i = sCursor[s];
            if (i >= plan.items[s].size()) return;
            sCursor[s] = i + 1;
            KineticaMatcher item = plan.items[s].get(i);
            if (item instanceof KineticaMatcher.Anchor) {
                KineticaMatcher.Anchor anc = (KineticaMatcher.Anchor) item;
                if (anc.t >= floor) {
                    streamAnchor(node, s, anc, depth, tapPen, contactKeep);
                }
            } else if (item instanceof KineticaMatcher.Segment) {
                MultiGlideInputToken token = plan.tokens[s].get(i);
                openPiece(s, node, depth, tapPen, contactKeep,
                        (KineticaMatcher.Segment) item, token, token, floor);
            }
            sCursor[s] = i;
        }

        private void openPiece(
                int s,
                int node,
                int depth,
                float tapPen,
                float contactKeep,
                KineticaMatcher.Segment seg,
                MultiGlideInputToken token,
                MultiGlideInputToken origin,
                long floor
        ) {
            long savedFloor = openFloorT;
            int savedClose = openCloseLetter;
            long savedCloseEnter = openCloseEnter;
            openFloorT = floor;
            openCloseLetter = -1;
            openCloseEnter = Long.MAX_VALUE;

            descend(node, 0, depth, depth, 0, 0f, -KineticaConstants.MONOTONE_SLACK, -1,
                    tapPen, contactKeep, seg, 0);

            long[] times = streamCutTimes(token, origin);
            int ownStart = ownFrom;
            if (times.length > 0 && sCutsMade < KineticaConstants.STREAM_SEARCH_MAX_CUTS) {
                for (int i = 0; i < times.length; i++) {
                    if (passExhausted()) break;
                    long t = times[i];
                    if (t <= token.startTimeMs || t >= token.endTimeMs) continue;
                    Halves halves = (i < ownStart) ? cutHalves(token, t) : ownHalves(token, t);
                    if (halves == null) continue;

                    sCutsMade++;
                    sParked[s] = halves;
                    sParkedOrigin[s] = origin;

                    MultiGlideInputToken.KeyContact left = null;
                    if (i >= ownStart && KineticaConstants.STREAM_SEARCH_OWN_CUT_CLOSES_ON_KEY
                            && token.keyContacts != null) {
                        for (int ci = 0; ci < token.keyContacts.size(); ci++) {
                            MultiGlideInputToken.KeyContact kc = token.keyContacts.get(ci);
                            if (kc.tExit == t) {
                                left = kc;
                                break;
                            }
                        }
                    }
                    openCloseLetter = (left != null) ? left.code : -1;
                    openCloseEnter = (left != null && KineticaConstants.STREAM_SEARCH_CLOSE_INSIDE_LAST_KEY)
                            ? left.tEnter
                            : Long.MAX_VALUE;

                    descend(node, 0, depth, depth, 0, 0f, -KineticaConstants.MONOTONE_SLACK, -1,
                            tapPen, contactKeep, halves.head, 0);

                    sParked[s] = null;
                    sParkedOrigin[s] = null;
                    sCutsMade--;
                }
            }
            openFloorT = savedFloor;
            openCloseLetter = savedClose;
            openCloseEnter = savedCloseEnter;
        }

        private long[] streamCutTimes(MultiGlideInputToken token, MultiGlideInputToken origin) {
            long[] other = plan.cuts.get(origin);
            if (other == null) other = new long[0];
            ownFrom = other.length;
            if (!KineticaConstants.STREAM_SEARCH_OWN_CUTS || token.keyContacts == null
                    || token.keyContacts.isEmpty()) {
                return other;
            }
            List<Long> own = new ArrayList<>(token.keyContacts.size());
            for (int i = 0; i < token.keyContacts.size(); i++) {
                long tExit = token.keyContacts.get(i).tExit;
                if (tExit <= token.startTimeMs || tExit >= token.endTimeMs) continue;
                boolean dup = false;
                for (int j = 0; j < other.length; j++) {
                    if (other[j] == tExit) {
                        dup = true;
                        break;
                    }
                }
                if (!dup) own.add(tExit);
            }
            if (own.isEmpty()) return other;
            long[] combined = Arrays.copyOf(other, other.length + own.size());
            for (int i = 0; i < own.size(); i++) {
                combined[other.length + i] = own.get(i);
            }
            return combined;
        }

        private void streamAnchor(
                int node,
                int s,
                KineticaMatcher.Anchor anc,
                int depth,
                float tapPen,
                float contactKeep
        ) {
            if (depth >= KineticaConstants.MAX_WORD_LEN) return;
            int next = trie.child(node, anc.code);
            if (next != -1) {
                wordLetters[depth] = anc.code;
                afterLetter(next, depth + 1, tapPen, contactKeep, s, anc.t, false);
                if (KineticaConstants.DOUBLE_TAP_PEN_KW >= 0f && depth + 1 < KineticaConstants.MAX_WORD_LEN) {
                    int twice = trie.child(next, anc.code);
                    if (twice != -1) {
                        wordLetters[depth + 1] = anc.code;
                        afterLetter(twice, depth + 2, tapPen + KineticaConstants.DOUBLE_TAP_PEN_KW,
                                contactKeep, s, anc.t, false);
                    }
                }
            }
        }

        private void afterLetter(
                int node,
                int depth,
                float tapPen,
                float contactKeep,
                int s,
                long t,
                boolean isHead
        ) {
            long savedT = sLastT;
            int savedStream = sLastStream;
            boolean savedSwitch = sMustSwitch;
            sLastT = t;
            sLastStream = s;
            sMustSwitch = isHead;
            streamNext(node, depth, tapPen, contactKeep);
            sLastT = savedT;
            sLastStream = savedStream;
            sMustSwitch = savedSwitch;
        }

        // ---- Standard & Cutting DFS passes ---------------------------------------

        private void dfs(int node, int ti, int depth, float tapPen, float contactKeep) {
            if (branchExhausted()) return;

            int due = earliestPending(ti);
            if (due >= 0) {
                Halves cut = pendingTail[due];
                long start = pendingStart[due];
                MultiGlideInputToken origin = pendingOrigin[due];
                pendingTail[due] = null;
                descend(node, ti, depth, depth, 0, 0f, -KineticaConstants.MONOTONE_SLACK, -1,
                        tapPen, contactKeep, cut.getTail(), ti);
                if (origin != null) {
                    offerCuts(node, ti, depth, tapPen, contactKeep, cut.getTailToken(), origin, ti);
                }
                pendingTail[due] = cut;
                pendingStart[due] = start;
                pendingOrigin[due] = origin;
                return;
            }

            if (ti == pattern.size()) {
                if (depth > 0 && trie.isWord(node)) emit(node, depth, tapPen, contactKeep);
                return;
            }

            KineticaMatcher m = pattern.get(ti);
            if (m instanceof KineticaMatcher.Anchor) {
                anchorStep(node, ti, depth, tapPen, contactKeep, (KineticaMatcher.Anchor) m);
            } else if (m instanceof KineticaMatcher.Segment) {
                KineticaMatcher.Segment seg = (KineticaMatcher.Segment) m;
                descend(node, ti, depth, depth, 0, 0f, -KineticaConstants.MONOTONE_SLACK, -1,
                        tapPen, contactKeep, seg, ti + 1);
                if (srcOf != null && srcOf[ti] != null) {
                    offerCuts(node, ti, depth, tapPen, contactKeep, srcOf[ti], srcOf[ti], ti + 1);
                }
            }
        }

        private void offerCuts(
                int node,
                int ti,
                int depth,
                float tapPen,
                float contactKeep,
                MultiGlideInputToken token,
                MultiGlideInputToken origin,
                int nextTi
        ) {
            if (!cutting) return;
            if (cutsOpen >= KineticaConstants.MAX_SEARCH_CUTS) return;
            long[] times = cuts.get(origin);
            if (times == null) return;
            int slot = cutsOpen;
            for (int i = 0; i < times.length; i++) {
                if (passExhausted()) return;
                long t = times[i];
                if (t <= token.startTimeMs || t >= token.endTimeMs) continue;
                Halves halves = cutHalves(token, t);
                if (halves == null) continue;
                cutsOpen++;
                pendingTail[slot] = halves;
                pendingStart[slot] = t;
                pendingOrigin[slot] = origin;
                descend(node, ti, depth, depth, 0, 0f, -KineticaConstants.MONOTONE_SLACK, -1,
                        tapPen, contactKeep, halves.head, nextTi);
                pendingTail[slot] = null;
                pendingOrigin[slot] = null;
                cutsOpen--;
            }
        }

        private int earliestPending(int ti) {
            int best = -1;
            for (int i = 0; i < pendingTail.length; i++) {
                if (pendingTail[i] == null) continue;
                if (best < 0 || pendingStart[i] < pendingStart[best]) best = i;
            }
            if (best < 0) return -1;
            if (ti < pattern.size() && !(itemStart[ti] > pendingStart[best])) return -1;
            return best;
        }

        private Halves cutHalves(MultiGlideInputToken src, long t) {
            Map<Long, Halves> perSwipe = cutMemo.get(src);
            if (perSwipe == null) {
                perSwipe = new HashMap<>();
                cutMemo.put(src, perSwipe);
            } else if (perSwipe.containsKey(t)) {
                return perSwipe.get(t);
            }
            MergeAlternatives.Cut cut = MergeAlternatives.cutSwipe(src, t, geometry.keyWidthPx);
            Halves built = (cut != null)
                    ? new Halves(segmentFromToken(cut.head, geometry), cut, geometry)
                    : null;
            perSwipe.put(t, built);
            return built;
        }

        private Halves ownHalves(MultiGlideInputToken src, long t) {
            Map<Long, Halves> perSwipe = ownMemo.get(src);
            if (perSwipe == null) {
                perSwipe = new HashMap<>();
                ownMemo.put(src, perSwipe);
            } else if (perSwipe.containsKey(t)) {
                return perSwipe.get(t);
            }
            MergeAlternatives.Cut cut = MergeAlternatives.cutAtOwnContact(src, t, geometry.keyWidthPx);
            Halves built = (cut != null)
                    ? new Halves(segmentFromToken(cut.head, geometry), cut, geometry)
                    : null;
            perSwipe.put(t, built);
            return built;
        }

        private void anchorStep(
                int node,
                int ti,
                int depth,
                float tapPen,
                float contactKeep,
                KineticaMatcher.Anchor anc
        ) {
            if (depth >= KineticaConstants.MAX_WORD_LEN) return;
            if (!fuzzyAnchors) {
                tryAnchor(node, anc.code, 0f, ti, depth, tapPen, contactKeep);
                return;
            }
            int[] order = childOrder[depth];
            int nChildren = sortedChildren(node, depth, order);
            for (int ci = 0; ci < nChildren; ci++) {
                if (branchExhausted()) break;
                int c = order[ci];
                float pen;
                if (c == anc.code) {
                    pen = 0f;
                } else {
                    float d = geometry.distToCenterKw(anc.xKw, anc.yKw, c);
                    if (d > KineticaConstants.FUZZY_TAP_RADIUS_KW) continue;
                    pen = KineticaConstants.FUZZY_TAP_LAMBDA * d;
                }
                tryAnchor(node, c, pen, ti, depth, tapPen, contactKeep);
            }
        }

        private void tryAnchor(
                int node,
                int code,
                float penalty,
                int ti,
                int depth,
                float tapPen,
                float contactKeep
        ) {
            int next = trie.child(node, code);
            if (next == -1) return;
            wordLetters[depth] = code;
            dfs(next, ti + 1, depth + 1, tapPen + penalty, contactKeep);
            if (KineticaConstants.DOUBLE_TAP_PEN_KW >= 0f && depth + 1 < KineticaConstants.MAX_WORD_LEN
                    && !branchExhausted()) {
                int twice = trie.child(next, code);
                if (twice != -1) {
                    wordLetters[depth + 1] = code;
                    dfs(twice, ti + 1, depth + 2, tapPen + penalty + KineticaConstants.DOUBLE_TAP_PEN_KW,
                            contactKeep);
                }
            }
        }

        private int sortedChildren(int node, int depth, int[] outOrder) {
            int count = 0;
            int mask = trie.getChildMask(node);
            while (mask != 0) {
                int c = Integer.numberOfTrailingZeros(mask);
                outOrder[count++] = c;
                mask &= mask - 1;
            }
            // Insertion sort descending by maxSubtreeFreq for fast best-first traversal
            for (int i = 1; i < count; i++) {
                int key = outOrder[i];
                int keyFreq = trie.getMaxSubtreeFreq(trie.child(node, key));
                int j = i - 1;
                while (j >= 0 && trie.getMaxSubtreeFreq(trie.child(node, outOrder[j])) < keyFreq) {
                    outOrder[j + 1] = outOrder[j];
                    j--;
                }
                outOrder[j + 1] = key;
            }
            return count;
        }

        private void descend(
                int node,
                int ti,
                int depth,
                int segStartDepth,
                int lettersInSeg,
                float idealLen,
                int lastIdx,
                int prevLetter,
                float tapPen,
                float contactKeep,
                KineticaMatcher.Segment seg,
                int nextTi
        ) {
            if (branchExhausted()) return;
            if (depth >= KineticaConstants.MAX_WORD_LEN) return;
            if (streaming || rescue) steps++;

            int[] order = childOrder[depth];
            int count = sortedChildren(node, depth, order);
            if (count == 0) return;

            int restNeed = restNeededAfter(nextTi);
            int shortest = depth + 1 + Math.max(0, seg.minLetters - (lettersInSeg + 1)) + restNeed;
            if (shortest > KineticaConstants.MAX_WORD_LEN) {
                return;
            }

            boolean rootFairness = (ti == 0 && depth == 0 && lettersInSeg == 0);
            int remainingStarts = 0;
            if (rootFairness) {
                for (int i = 0; i < count; i++) {
                    int code = order[i];
                    if (!geometry.hasKey(code)) continue;
                    boolean ok = seg.softStart
                            ? (seg.passAtOrAfter(code, lastIdx - KineticaConstants.MONOTONE_SLACK) != -1)
                            : seg.isStart(code);
                    if (ok) remainingStarts++;
                }
                int best = -1;
                float bestD = Float.MAX_VALUE;
                for (int i = 0; i < count; i++) {
                    int code = order[i];
                    if (!geometry.hasKey(code)) continue;
                    float d = geometry.distToCenterKw(seg.resampled[0], seg.resampled[1], code);
                    if (d < bestD) {
                        bestD = d;
                        best = i;
                    }
                }
                if (best > 0) {
                    int nearest = order[best];
                    for (int j = best; j >= 1; j--) order[j] = order[j - 1];
                    order[0] = nearest;
                }
            }
            boolean firstStart = rootFairness;

            for (int i = 0; i < count; i++) {
                if (passExhausted()) return;
                if (rootFairness && remainingStarts > 0) {
                    int share = firstStart
                            ? (KineticaConstants.MAX_CANDIDATES / 2)
                            : Math.max(1, (KineticaConstants.MAX_CANDIDATES - emitted) / remainingStarts);
                    emitCap = Math.min(KineticaConstants.MAX_CANDIDATES, emitted + share);
                }

                int code = order[i];
                if (!geometry.hasKey(code)) continue;
                int child = trie.child(node, code);
                if (child == -1) continue;
                if (trie.getMaxWordLen(child) < shortest) continue;

                int pass = seg.passAtOrAfter(code, lastIdx - KineticaConstants.MONOTONE_SLACK);
                float startKeep = 1.0f;
                if (lettersInSeg == 0) {
                    if (seg.softStart) {
                        if (pass == -1) continue;
                    } else if (!seg.isStart(code)) {
                        if (rescue && pass != -1) {
                            startKeep = KineticaConstants.RESCUE_GATE_KEEP;
                        } else {
                            continue;
                        }
                    }
                    if (streaming && openFloorT != Long.MIN_VALUE
                            && seg.letterTime(code, Math.max(pass, 0)) < openFloorT) {
                        continue;
                    }
                } else {
                    if (pass == -1) continue;
                }

                float step = (lettersInSeg == 0 || prevLetter == code)
                        ? 0f
                        : geometry.keyDist(prevLetter, code);
                float len2 = idealLen + step;
                if (len2 > KineticaConstants.LEN_BAND_HI * seg.arcLen + KineticaConstants.LEN_BAND_MARGIN_KW) {
                    continue;
                }

                wordLetters[depth] = code;
                int consumed = lettersInSeg + 1;
                float keep = seg.isContacted(code)
                        ? contactKeep
                        : (contactKeep * KineticaConstants.UNCONTACTED_LETTER_KEEP);

                boolean closesStrict = seg.isEnd(code) || (seg.softEnd && pass >= 0);
                boolean closes = closesStrict || (rescue && pass >= 0);
                float k = keep * startKeep;
                float closeKeep = closesStrict ? k : (k * KineticaConstants.RESCUE_GATE_KEEP);
                boolean bandLoOk = len2 >= KineticaConstants.LEN_BAND_LO * seg.letterArcLen
                        - KineticaConstants.LEN_BAND_MARGIN_KW;
                int closeIdx = (pass >= 0) ? pass : Math.max(lastIdx, 0);
                boolean closeLetterOk = !streaming || openCloseLetter < 0 || code == openCloseLetter
                        || (seg.sampleT != null && seg.sampleT.length > 0
                        && seg.sampleT[Math.max(0, Math.min(seg.sampleT.length - 1, closeIdx))] >= openCloseEnter);

                if (consumed >= seg.minLetters && closes && bandLoOk && closeLetterOk) {
                    pieceSeg[pieceCount] = seg;
                    pieceFrom[pieceCount] = segStartDepth;
                    pieceTo[pieceCount] = depth + 1;
                    pieceCount++;
                    if (streaming) {
                        int s = (seg.streamId == 1) ? 1 : 0;
                        afterLetter(child, depth + 1, tapPen, closeKeep, s,
                                seg.letterTime(code, closeIdx), sParked[s] != null);
                    } else {
                        dfs(child, nextTi, depth + 1, tapPen, closeKeep);
                    }
                    pieceCount--;
                }

                if (consumed < seg.maxLetters) {
                    int nextLast = (pass >= 0) ? Math.max(lastIdx, pass) : lastIdx;
                    descend(child, ti, depth + 1, segStartDepth, consumed, len2,
                            nextLast, code, tapPen, k, seg, nextTi);
                }

                if (rootFairness) {
                    firstStart = false;
                    remainingStarts--;
                }
            }
        }

        private void emit(int node, int length, float tapPen, float keep) {
            if (attempts >= maxAttempts) return;
            attempts++;

            int rawFreq = Math.min(255, trie.getFrequency(node));
            float maxFw = KineticaConstants.FREQ_WEIGHT_FLOOR +
                    (1.0f - KineticaConstants.FREQ_WEIGHT_FLOOR) * (rawFreq / 255.0f);
            float maxBm = (prevWord != null && bigrams != null) ? 2.0f : 1.0f;

            float shortKeep = 1.0f;
            if (pieceCount == 1 && pieceSeg[0] != null
                    && pieceSeg[0].letterArcLen >= KineticaConstants.SHORT_READING_ARC_KW) {
                float idealLen = dtw.idealLength(wordLetters, pieceFrom[0], pieceTo[0], geometry);
                shortKeep = KineticaConstants.shortReadingKeep(idealLen, pieceSeg[0].letterArcLen);
            }
            float finalKeep = keep * shortKeep;

            float accumBudget = Float.POSITIVE_INFINITY;
            int totalSteps = pieceCount * KineticaConstants.RESAMPLE_N;
            if (heap.isFull() && totalSteps > 0) {
                float maxDTotal = KineticaConstants.maxDTotalForScore(
                        maxFw * maxBm * finalKeep, heap.minScore(), saturation);
                if (maxDTotal <= tapPen + extraPenalty) return;
                if (!Float.isInfinite(maxDTotal)) {
                    accumBudget = totalSteps * (maxDTotal - tapPen - extraPenalty);
                }
            }

            float accum = 0f;
            for (int pi = 0; pi < pieceCount; pi++) {
                KineticaMatcher.Segment seg = pieceSeg[pi];
                boolean hasPath = dtw.idealPath(
                        wordLetters, pieceFrom[pi], pieceTo[pi], geometry, idealPathScratch);
                if (!hasPath) return;

                float remBudget = Float.isInfinite(accumBudget)
                        ? Float.POSITIVE_INFINITY
                        : (accumBudget - accum);
                if (remBudget <= 0f) return;

                float d = dtw.distanceAccum(seg.resampled, idealPathScratch, remBudget);
                if (Float.isInfinite(d)) return;
                accum += d;
            }

            float geoFit = (totalSteps > 0) ? accum / (float) totalSteps : 0f;
            float dTotal = geoFit + tapPen + extraPenalty;
            float geo = KineticaConstants.geometricTerm(dTotal, saturation);

            String word = trie.getWord(node);
            float bm = 1.0f;
            if (prevWord != null && bigrams != null && word != null) {
                bm = 1.0f + bigrams.score(prevWord, word);
            }
            float bmApplied = KineticaConstants.appliedBoost(bm, geoFit);

            List<MultiGlideTrie.WordForm> forms = trie.getWordForms(node);
            if (forms != null && !forms.isEmpty()) {
                for (int i = 0; i < forms.size(); i++) {
                    MultiGlideTrie.WordForm f = forms.get(i);
                    float fv = KineticaConstants.FREQ_WEIGHT_FLOOR +
                            (1.0f - KineticaConstants.FREQ_WEIGHT_FLOOR) * (Math.min(255, f.frequency) / 255.0f);
                    heap.offer(new Candidate(f.displayWord, fv * geo * bmApplied * finalKeep, dTotal, f.isProperNoun));
                }
                emitted++;
            } else if (word != null) {
                heap.offer(new Candidate(word, maxFw * geo * bmApplied * finalKeep, dTotal, false));
                emitted++;
            }
        }
    }

    private void decodeTapsOnly(
            List<KineticaMatcher.Anchor> anchors,
            MultiGlideTrie trie,
            MultiGlideBigramTable bigrams,
            MultiGlideGeometry geometry,
            String prevWord,
            CandidateHeap heap
    ) {
        StringBuilder sb = new StringBuilder(anchors.size());
        for (int i = 0; i < anchors.size(); i++) {
            sb.append(MultiGlideAlphabet.indexToChar(anchors.get(i).code));
        }
        String literal = sb.toString();
        int node = trie.findNode(literal);
        int freq = (node >= 0) ? trie.getFrequency(node) : 50;

        float fw = KineticaConstants.FREQ_WEIGHT_FLOOR +
                (1.0f - KineticaConstants.FREQ_WEIGHT_FLOOR) * (Math.min(255, freq) / 255.0f);
        float bm = 1.0f;
        if (prevWord != null && bigrams != null && !literal.isEmpty()) {
            bm = 1.0f + bigrams.score(prevWord, literal);
        }
        float score = fw * bm;

        if (node >= 0 && trie.isWord(node)) {
            List<MultiGlideTrie.WordForm> forms = trie.getWordForms(node);
            if (forms != null && !forms.isEmpty()) {
                for (int i = 0; i < forms.size(); i++) {
                    MultiGlideTrie.WordForm f = forms.get(i);
                    float fv = KineticaConstants.FREQ_WEIGHT_FLOOR +
                            (1.0f - KineticaConstants.FREQ_WEIGHT_FLOOR) * (f.frequency / 255.0f);
                    heap.offer(new Candidate(f.displayWord, fv * bm, 0f, f.isProperNoun));
                }
                return;
            }
        }
        heap.offer(new Candidate(literal, score, 0f, false));
    }
}
