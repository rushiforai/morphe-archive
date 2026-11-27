package dev.srwi.gintype.extension.multiglide;

import java.util.Collections;
import java.util.List;

/**
 * Touch sample, gesture token, and decoded candidate representations for MultiGlide.
 */
public final class MultiGlideInputToken {

    public static final class TouchPoint {
        public final float x;
        public final float y;
        public final long timeMs;
        public final int pointerId;

        public TouchPoint(float x, float y, long timeMs, int pointerId) {
            this.x = x;
            this.y = y;
            this.timeMs = timeMs;
            this.pointerId = pointerId;
        }
    }

    public static final class KeyContact {
        public final int code;
        public final long tEnter;
        public final long tExit;

        public KeyContact(int code, long tEnter, long tExit) {
            this.code = code;
            this.tEnter = tEnter;
            this.tExit = tExit;
        }
    }

    public static final class Dwell {
        public final int enterIdx;
        public final int exitIdx;
        public final long tEnter;
        public final long tExit;

        public Dwell(int enterIdx, int exitIdx, long tEnter, long tExit) {
            this.enterIdx = enterIdx;
            this.exitIdx = exitIdx;
            this.tEnter = tEnter;
            this.tExit = tExit;
        }
    }

    public enum Kind {
        TAP,
        SWIPE
    }

    public final Kind kind;
    public final int pointerId;
    public final int streamId; // 0 = LEFT, 1 = RIGHT, -1 = unspecified
    public final long startTimeMs;
    public final long endTimeMs;
    // For TAP:
    public final char character;
    public final float tapX;
    public final float tapY;
    // For SWIPE:
    public final List<TouchPoint> points;
    public final float pathLengthPx;
    public final List<KeyContact> keyContacts;
    public final List<Dwell> dwells;
    public final boolean softStart;
    public final boolean softEnd;

    private MultiGlideInputToken(
            Kind kind,
            int pointerId,
            int streamId,
            long startTimeMs,
            long endTimeMs,
            char character,
            float tapX,
            float tapY,
            List<TouchPoint> points,
            float pathLengthPx,
            List<KeyContact> keyContacts,
            List<Dwell> dwells,
            boolean softStart,
            boolean softEnd
    ) {
        this.kind = kind;
        this.pointerId = pointerId;
        this.streamId = streamId;
        this.startTimeMs = startTimeMs;
        this.endTimeMs = endTimeMs;
        this.character = character;
        this.tapX = tapX;
        this.tapY = tapY;
        this.points = points;
        this.pathLengthPx = pathLengthPx;
        this.keyContacts = (keyContacts != null) ? keyContacts : Collections.emptyList();
        this.dwells = (dwells != null) ? dwells : Collections.emptyList();
        this.softStart = softStart;
        this.softEnd = softEnd;
    }

    public static MultiGlideInputToken tap(
            int pointerId,
            int streamId,
            char character,
            float x,
            float y,
            long startTimeMs,
            long endTimeMs
    ) {
        return new MultiGlideInputToken(
                Kind.TAP, pointerId, streamId, startTimeMs, endTimeMs, character, x, y,
                null, 0f, Collections.emptyList(), Collections.emptyList(), false, false);
    }

    public static MultiGlideInputToken tap(
            int pointerId,
            char character,
            float x,
            float y,
            long startTimeMs,
            long endTimeMs
    ) {
        return tap(pointerId, -1, character, x, y, startTimeMs, endTimeMs);
    }

    public static MultiGlideInputToken swipe(
            int pointerId,
            int streamId,
            List<TouchPoint> points,
            float pathLengthPx,
            long startTimeMs,
            long endTimeMs,
            List<KeyContact> keyContacts,
            List<Dwell> dwells,
            boolean softStart,
            boolean softEnd
    ) {
        return new MultiGlideInputToken(
                Kind.SWIPE, pointerId, streamId, startTimeMs, endTimeMs, '\0', 0f, 0f,
                points, pathLengthPx, keyContacts, dwells, softStart, softEnd);
    }

    public static MultiGlideInputToken swipe(
            int pointerId,
            int streamId,
            List<TouchPoint> points,
            float pathLengthPx,
            long startTimeMs,
            long endTimeMs
    ) {
        return swipe(
                pointerId, streamId, points, pathLengthPx, startTimeMs, endTimeMs,
                Collections.emptyList(), Collections.emptyList(), false, false);
    }

    public static MultiGlideInputToken swipe(
            int pointerId,
            List<TouchPoint> points,
            float pathLengthPx,
            long startTimeMs,
            long endTimeMs
    ) {
        return swipe(pointerId, -1, points, pathLengthPx, startTimeMs, endTimeMs);
    }

    public static final class WordCandidate implements Comparable<WordCandidate> {
        public final String word;
        public final float totalScore;
        public final float spatialScore;
        public final float frequencyScore;
        public final float bigramScore;

        public WordCandidate(
                String word,
                float totalScore,
                float spatialScore,
                float frequencyScore,
                float bigramScore
        ) {
            this.word = word;
            this.totalScore = totalScore;
            this.spatialScore = spatialScore;
            this.frequencyScore = frequencyScore;
            this.bigramScore = bigramScore;
        }

        @Override
        public int compareTo(WordCandidate other) {
            return Float.compare(other.totalScore, this.totalScore);
        }
    }
}
