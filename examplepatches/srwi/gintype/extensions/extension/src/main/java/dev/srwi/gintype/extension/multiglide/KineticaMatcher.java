package dev.srwi.gintype.extension.multiglide;

import java.util.Arrays;
import java.util.List;

/**
 * Geometric matcher representation for Kinetica DTW search.
 * Ported from Kinetica's Matcher.kt.
 */
public abstract class KineticaMatcher {

    public static final class Anchor extends KineticaMatcher {
        public final int code;
        public final float xKw;
        public final float yKw;
        public final long t;
        public final int streamId;

        public Anchor(int code, float xKw, float yKw, long t, int streamId) {
            this.code = code;
            this.xKw = xKw;
            this.yKw = yKw;
            this.t = t;
            this.streamId = streamId;
        }
    }

    public static final class Segment extends KineticaMatcher {
        private static final boolean[] NO_CONTACTS = new boolean[0];
        private static final int[] EMPTY_INT = new int[0];
        private static final long[] EMPTY_LONG = new long[0];

        public final float[] resampled; // 64 floats (32 points) in KW
        public final float arcLen;      // arc length in KW
        public final float letterArcLen;
        public final int minLetters;
        public final int maxLetters;
        public final boolean[] isStartNeighbor; // [26]
        public final boolean[] isEndNeighbor;   // [26]
        public final boolean[] nearPath;        // [26]
        public final boolean[] contacted;       // [26] or empty when contact list omitted
        public final int[][] passIdx;           // [26][] resample indices per key
        public final boolean softStart;
        public final boolean softEnd;
        public final int streamId;
        public final long startTimeMs;
        public final long endTimeMs;
        public final long[] sampleT;
        private final int[] contactCode;
        private final long[] contactEnter;
        private final long[] contactExit;

        public Segment(
                float[] resampled,
                float arcLen,
                float letterArcLen,
                int minLetters,
                int maxLetters,
                boolean[] isStartNeighbor,
                boolean[] isEndNeighbor,
                boolean[] nearPath,
                boolean[] contacted,
                int[][] passIdx,
                boolean softStart,
                boolean softEnd,
                int streamId,
                long startTimeMs,
                long endTimeMs,
                long[] sampleT,
                int[] contactCode,
                long[] contactEnter,
                long[] contactExit
        ) {
            this.resampled = resampled;
            this.arcLen = arcLen;
            this.letterArcLen = letterArcLen;
            this.minLetters = minLetters;
            this.maxLetters = maxLetters;
            this.isStartNeighbor = isStartNeighbor;
            this.isEndNeighbor = isEndNeighbor;
            this.nearPath = nearPath;
            this.contacted = (contacted != null) ? contacted : NO_CONTACTS;
            this.passIdx = passIdx;
            this.softStart = softStart;
            this.softEnd = softEnd;
            this.streamId = streamId;
            this.startTimeMs = startTimeMs;
            this.endTimeMs = endTimeMs;
            this.sampleT = sampleT;
            this.contactCode = (contactCode != null) ? contactCode : EMPTY_INT;
            this.contactEnter = (contactEnter != null) ? contactEnter : EMPTY_LONG;
            this.contactExit = (contactExit != null) ? contactExit : EMPTY_LONG;
        }

        public Segment(
                float[] resampled,
                float arcLen,
                float letterArcLen,
                int minLetters,
                int maxLetters,
                boolean[] isStartNeighbor,
                boolean[] isEndNeighbor,
                boolean[] nearPath,
                int[][] passIdx,
                boolean softStart,
                boolean softEnd,
                int streamId,
                long startTimeMs,
                long endTimeMs
        ) {
            this(
                    resampled, arcLen, letterArcLen, minLetters, maxLetters,
                    isStartNeighbor, isEndNeighbor, nearPath, NO_CONTACTS, passIdx,
                    softStart, softEnd, streamId, startTimeMs, endTimeMs,
                    null, EMPTY_INT, EMPTY_LONG, EMPTY_LONG
            );
        }

        public boolean isStart(int code) {
            return code >= 0 && code < 26 && isStartNeighbor[code];
        }

        public boolean isEnd(int code) {
            return code >= 0 && code < 26 && isEndNeighbor[code];
        }

        public boolean isNear(int code) {
            return code >= 0 && code < 26 && nearPath[code];
        }

        public boolean isContacted(int code) {
            return contacted.length == 0 || (code >= 0 && code < contacted.length && contacted[code]);
        }

        public int passAtOrAfter(int code, int minIdx) {
            if (code < 0 || code >= 26) return -1;
            int[] passes = passIdx[code];
            if (passes == null) return -1;
            for (int i = 0; i < passes.length; i++) {
                if (passes[i] >= minIdx) return passes[i];
            }
            return -1;
        }

        public int[] passesOf(int code) {
            if (code < 0 || code >= 26) return EMPTY_INT;
            int[] passes = passIdx[code];
            return (passes != null) ? passes : EMPTY_INT;
        }

        public long letterTime(int code, int pass) {
            int n = (sampleT != null && sampleT.length > 0) ? sampleT.length : KineticaConstants.RESAMPLE_N;
            int idx = (pass < 0) ? 0 : (pass >= n ? n - 1 : pass);
            long ts = (sampleT != null && idx < sampleT.length)
                    ? sampleT[idx]
                    : startTimeMs + (long) ((endTimeMs - startTimeMs) * (idx / (float) Math.max(1, n - 1)));
            int best = -1;
            long bestGap = Long.MAX_VALUE;
            for (int i = 0; i < contactCode.length; i++) {
                if (contactCode[i] != code) continue;
                long gap;
                if (ts < contactEnter[i]) gap = contactEnter[i] - ts;
                else if (ts > contactExit[i]) gap = ts - contactExit[i];
                else gap = 0L;
                if (gap < bestGap) {
                    bestGap = gap;
                    best = i;
                }
            }
            if (best < 0) return ts;
            long span = contactExit[best] - contactEnter[best];
            return contactEnter[best] + (long) (span * KineticaConstants.HANDOVER_CONTACT_FRACTION);
        }
    }

    public static Segment buildSegment(
            List<DtwMatcher.Point2D> rawPointsKw,
            long startTimeMs,
            long endTimeMs,
            MultiGlideGeometry geometry,
            int streamId,
            DtwMatcher dtw
    ) {
        return buildSegment(
                rawPointsKw, startTimeMs, endTimeMs, geometry, streamId, dtw,
                java.util.Collections.emptyList(), false, false
        );
    }

    public static Segment buildSegment(
            List<DtwMatcher.Point2D> rawPointsKw,
            long startTimeMs,
            long endTimeMs,
            MultiGlideGeometry geometry,
            int streamId,
            DtwMatcher dtw,
            List<MultiGlideInputToken.KeyContact> keyContacts,
            boolean softStart,
            boolean softEnd
    ) {
        int n = KineticaConstants.RESAMPLE_N;
        float[] resampled = new float[2 * n];
        dtw.resample(rawPointsKw, resampled);

        // Compute total arc length in KW
        float arcLen = 0f;
        for (int i = 1; i < rawPointsKw.size(); i++) {
            DtwMatcher.Point2D p0 = rawPointsKw.get(i - 1);
            DtwMatcher.Point2D p1 = rawPointsKw.get(i);
            float dx = p1.x - p0.x;
            float dy = p1.y - p0.y;
            arcLen += (float) Math.sqrt(dx * dx + dy * dy);
        }

        float letterArcLen = (softStart || softEnd)
                ? Math.max(0f, arcLen - KineticaConstants.SPLIT_RESUME_TAIL_KW)
                : arcLen;
        int minLetters = (letterArcLen < KineticaConstants.MIN_SWIPE_ARC_KW) ? 1 : 2;
        int maxLetters = Math.max(minLetters, Math.min(KineticaConstants.MAX_WORD_LEN, (int) Math.ceil(arcLen / KineticaConstants.KW_PER_LETTER) + 2));

        boolean[] isStart = new boolean[26];
        boolean[] isEnd = new boolean[26];
        boolean[] nearPath = new boolean[26];
        boolean[] contacted;
        if (keyContacts == null || keyContacts.isEmpty()) {
            contacted = Segment.NO_CONTACTS;
        } else {
            contacted = new boolean[26];
            for (int i = 0; i < keyContacts.size(); i++) {
                int c = keyContacts.get(i).code;
                if (c >= 0 && c < 26) contacted[c] = true;
            }
        }
        int[][] passIdx = new int[26][];

        float startX = resampled[0];
        float startY = resampled[1];
        float endX = resampled[2 * (n - 1)];
        float endY = resampled[2 * (n - 1) + 1];

        float prominence = KineticaConstants.PASS_SPLIT_PROMINENCE_KW;
        int maxPasses = n / 2;
        int[] passScratch = new int[maxPasses];
        boolean anyStart = false;
        boolean anyEnd = false;
        int nearestStartCode = -1;
        float nearestStartDist = Float.MAX_VALUE;
        int nearestEndCode = -1;
        float nearestEndDist = Float.MAX_VALUE;

        for (int code = 0; code < 26; code++) {
            if (!geometry.hasKey(code)) continue;

            float dStart = geometry.distToCenterKw(startX, startY, code);
            if (dStart < nearestStartDist) {
                nearestStartDist = dStart;
                nearestStartCode = code;
            }
            if (dStart <= KineticaConstants.R_ENDPOINT_KW) {
                isStart[code] = true;
                anyStart = true;
            }

            float dEnd = geometry.distToCenterKw(endX, endY, code);
            if (dEnd < nearestEndDist) {
                nearestEndDist = dEnd;
                nearestEndCode = code;
            }
            if (dEnd <= KineticaConstants.R_ENDPOINT_KW) {
                isEnd[code] = true;
                anyEnd = true;
            }

            int count = 0;
            int bestIdx = -1;
            float best = 0f;
            float peak = 0f;
            for (int k = 0; k < n; k++) {
                float d = geometry.distToCenterKw(resampled[2 * k], resampled[2 * k + 1], code);
                if (d > KineticaConstants.R_INNER_KW) {
                    if (bestIdx != -1 && count < maxPasses) passScratch[count++] = bestIdx;
                    bestIdx = -1;
                    continue;
                }
                if (bestIdx == -1) {
                    bestIdx = k;
                    best = d;
                    peak = d;
                    continue;
                }
                if (d > peak) peak = d;
                if (peak - best >= prominence && peak - d >= prominence) {
                    if (count < maxPasses) passScratch[count++] = bestIdx;
                    bestIdx = k;
                    best = d;
                    peak = d;
                } else if (d < best) {
                    best = d;
                    bestIdx = k;
                    peak = d;
                }
            }
            if (bestIdx != -1 && count < maxPasses) {
                passScratch[count++] = bestIdx;
            }

            if (count > 0) {
                nearPath[code] = true;
                passIdx[code] = Arrays.copyOf(passScratch, count);
            }
        }

        if (!anyStart && nearestStartCode >= 0) isStart[nearestStartCode] = true;
        if (!anyEnd && nearestEndCode >= 0) isEnd[nearestEndCode] = true;

        long[] sampleT = new long[n];
        dtw.resampleTimes(rawPointsKw, sampleT);
        long spanStart = rawPointsKw.isEmpty() ? startTimeMs : rawPointsKw.get(0).t;
        long spanEnd = rawPointsKw.isEmpty() ? endTimeMs : rawPointsKw.get(rawPointsKw.size() - 1).t;

        int heldCount = 0;
        if (keyContacts != null) {
            for (int i = 0; i < keyContacts.size(); i++) {
                MultiGlideInputToken.KeyContact c = keyContacts.get(i);
                if (c.tExit >= spanStart && c.tEnter <= spanEnd) heldCount++;
            }
        }
        int[] contactCode = new int[heldCount];
        long[] contactEnter = new long[heldCount];
        long[] contactExit = new long[heldCount];
        if (heldCount > 0) {
            int j = 0;
            for (int i = 0; i < keyContacts.size(); i++) {
                MultiGlideInputToken.KeyContact c = keyContacts.get(i);
                if (c.tExit >= spanStart && c.tEnter <= spanEnd) {
                    contactCode[j] = c.code;
                    contactEnter[j] = Math.max(c.tEnter, spanStart);
                    contactExit[j] = Math.min(c.tExit, spanEnd);
                    j++;
                }
            }
        }

        return new Segment(
                resampled, arcLen, letterArcLen, minLetters, maxLetters,
                isStart, isEnd, nearPath, contacted, passIdx,
                softStart, softEnd, streamId, spanStart, spanEnd,
                sampleT, contactCode, contactEnter, contactExit
        );
    }
}
