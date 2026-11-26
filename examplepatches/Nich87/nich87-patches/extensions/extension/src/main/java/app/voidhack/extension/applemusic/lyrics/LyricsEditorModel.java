package app.voidhack.extension.applemusic.lyrics;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Pure Java state and editing model for the full-song mobile lyrics editor.
 * Supports batch text & pronunciation editing, per-line and cascade timing adjustments,
 * explicit interlude insertion/editing/auto-detection, split/insert/delete, find & replace,
 * bulk text / LRC round-trip editing, and multi-step undo/redo.
 */
final class LyricsEditorModel {
    static final long INTERLUDE_VISIBLE_MIN_MS = 2500L;
    /**
     * Intro interludes start at 0 ms while line 0 is shifted earlier by -500 ms
     * ({@code suggestedLineOffset}), so line 0 must start at >= 3,000 ms for Apple Music
     * to have >= 2,500 ms of wait time to animate the three-dot intro indicator.
     */
    static final long INTERLUDE_INTRO_MIN_MS = 3000L;
    static final long NATIVE_DOTS_THRESHOLD_MS = 7000L;
    static final long STUCK_LINE_CANDIDATE_MS = 9000L;
    static final long DEFAULT_INSERT_INTERLUDE_MS = 8000L;
    static final long MIN_LINE_DURATION_MS = 200L;
    static final long DEFAULT_NEW_LINE_DURATION_MS = 3000L;
    private static final int MAX_UNDO_HISTORY = 40;

    private static final Pattern TIMESTAMP_PATTERN = Pattern.compile(
            "^\\s*\\[?\\s*(?:(\\d{1,2})\\s*:\\s*)?(\\d{1,3})\\s*:\\s*(\\d{1,2})(?:\\s*[.:]\\s*(\\d{1,3}))?\\s*\\]?\\s*$");
    private static final Pattern SECONDS_ONLY_PATTERN = Pattern.compile(
            "^\\s*(\\d{1,5})(?:\\.(\\d{1,3}))?\\s*s?\\s*$");
    private static final Pattern LRC_LEADING_TAG = Pattern.compile(
            "^\\[(\\d{1,3}):(\\d{2})(?:[:.](\\d{1,3}))?\\](.*)$");

    enum EditTab {
        LYRICS,
        READING,
        BOTH
    }

    static final class Line {
        final int id;
        final int sourceIndex;
        String text;
        String reading;
        boolean readingEdited;
        long startMs;
        long endMs;
        boolean explicitInterludeAfter;

        final String originalText;
        final String originalReading;
        final long originalStartMs;
        final long originalEndMs;

        Line(
                int id,
                int sourceIndex,
                String text,
                String reading,
                boolean readingEdited,
                long startMs,
                long endMs,
                boolean explicitInterludeAfter,
                String originalText,
                String originalReading,
                long originalStartMs,
                long originalEndMs) {
            this.id = id;
            this.sourceIndex = sourceIndex;
            this.text = text == null ? "" : text;
            this.reading = reading == null ? "" : reading;
            this.readingEdited = readingEdited;
            this.startMs = startMs;
            this.endMs = endMs;
            this.explicitInterludeAfter = explicitInterludeAfter;
            this.originalText = originalText == null ? "" : originalText;
            this.originalReading = originalReading == null ? "" : originalReading;
            this.originalStartMs = originalStartMs;
            this.originalEndMs = originalEndMs;
        }

        Line copy() {
            return new Line(
                    id, sourceIndex, text, reading, readingEdited, startMs, endMs, explicitInterludeAfter,
                    originalText, originalReading, originalStartMs, originalEndMs);
        }

        boolean isAdded() {
            return sourceIndex < 0;
        }

        boolean isTextModified() {
            return isAdded() || !text.equals(originalText);
        }

        boolean isReadingModified() {
            return readingEdited && !reading.equals(originalReading);
        }

        boolean isTimingModified(boolean synced) {
            if (!synced) return false;
            return isAdded() || startMs != originalStartMs || endMs != originalEndMs;
        }

        boolean isModified(boolean synced) {
            return isAdded() || isTextModified() || isReadingModified() || isTimingModified(synced)
                    || explicitInterludeAfter;
        }

        long durationMs() {
            if (startMs < 0L || endMs <= startMs) return 0L;
            return endMs - startMs;
        }
    }

    private static final class Snapshot {
        final boolean synced;
        final boolean explicitIntro;
        final List<Line> lines;

        Snapshot(boolean synced, boolean explicitIntro, List<Line> lines) {
            this.synced = synced;
            this.explicitIntro = explicitIntro;
            this.lines = new ArrayList<>(lines.size());
            for (Line line : lines) {
                this.lines.add(line.copy());
            }
        }
    }

    static final class BulkApplyResult {
        final boolean applied;
        final int updatedLines;
        final int addedLines;
        final int removedLines;
        final int interludesDetected;

        BulkApplyResult(boolean applied, int updatedLines, int addedLines, int removedLines, int interludesDetected) {
            this.applied = applied;
            this.updatedLines = updatedLines;
            this.addedLines = addedLines;
            this.removedLines = removedLines;
            this.interludesDetected = interludesDetected;
        }
    }

    static final class Document {
        boolean synced;
        final boolean wordTimed;
        final long trackDurationMs;
        boolean explicitIntro;
        final List<Line> lines;
        private int nextLineId = 1;
        private final Deque<Snapshot> undoStack = new ArrayDeque<>();
        private final Deque<Snapshot> redoStack = new ArrayDeque<>();
        private boolean dirty;
        private final boolean hadSavedEditsInitially;

        private Document(
                boolean synced,
                boolean wordTimed,
                long trackDurationMs,
                boolean explicitIntro,
                List<Line> lines,
                int nextLineId,
                boolean hadSavedEditsInitially) {
            this.synced = synced;
            this.wordTimed = wordTimed;
            this.trackDurationMs = trackDurationMs;
            this.explicitIntro = explicitIntro;
            this.lines = lines;
            this.nextLineId = nextLineId;
            this.hadSavedEditsInitially = hadSavedEditsInitially;
        }

        static Document fromTtml(
                String baselineTtml,
                String displayedTtml,
                LyricsEditTtml.DocumentEdit existingDocEdit,
                Map<Integer, LyricsEditTtml.Edit> existingLegacyEdits,
                boolean wordTimed,
                long trackDurationMs) {
            List<LyricsEditTtml.Row> baseRows = safeRows(baselineTtml);
            List<LyricsEditTtml.Row> dispRows = safeRows(displayedTtml);
            Map<Integer, LyricsEditTtml.Row> baseByIndex = new HashMap<>();
            for (LyricsEditTtml.Row r : baseRows) {
                baseByIndex.put(r.index, r);
            }

            boolean synced = false;
            for (LyricsEditTtml.Row r : dispRows) {
                if (r.startMs >= 0L) {
                    synced = true;
                    break;
                }
            }
            if (!synced) {
                for (LyricsEditTtml.Row r : baseRows) {
                    if (r.startMs >= 0L) {
                        synced = true;
                        break;
                    }
                }
            }

            List<Line> editable = new ArrayList<>();
            int idCounter = 1;
            boolean explicitIntro = existingDocEdit != null && existingDocEdit.explicitIntro;
            boolean hadSavedEdits = existingDocEdit != null
                    || (existingLegacyEdits != null && !existingLegacyEdits.isEmpty());

            if (existingDocEdit != null && !existingDocEdit.lines.isEmpty()) {
                synced = existingDocEdit.synced;
                for (int i = 0; i < existingDocEdit.lines.size(); i++) {
                    LyricsEditTtml.LinePatch lp = existingDocEdit.lines.get(i);
                    LyricsEditTtml.Row orig = lp.sourceIndex >= 0 ? baseByIndex.get(lp.sourceIndex) : null;
                    LyricsEditTtml.Row disp = i < dispRows.size() ? dispRows.get(i) : null;
                    String reading = lp.readingEdited
                            ? (lp.reading == null ? "" : lp.reading)
                            : (disp != null && !disp.reading.isEmpty()
                                    ? disp.reading
                                    : (orig != null ? orig.reading : ""));
                    long start = synced ? Math.max(0L, lp.startMs) : -1L;
                    long end = synced ? Math.max(start + MIN_LINE_DURATION_MS, lp.endMs) : -1L;
                    editable.add(new Line(
                            idCounter++,
                            lp.sourceIndex,
                            lp.text,
                            reading,
                            lp.readingEdited,
                            start,
                            end,
                            lp.explicitInterludeAfter,
                            orig != null ? orig.text : "",
                            orig != null ? orig.reading : "",
                            orig != null ? orig.startMs : -1L,
                            orig != null ? orig.endMs : -1L));
                }
            } else {
                List<LyricsEditTtml.Row> sourceRows = dispRows.isEmpty() ? baseRows : dispRows;
                for (int i = 0; i < sourceRows.size(); i++) {
                    LyricsEditTtml.Row row = sourceRows.get(i);
                    LyricsEditTtml.Row orig = baseByIndex.get(row.index);
                    if (orig == null && i < baseRows.size()) {
                        orig = baseRows.get(i);
                    }
                    LyricsEditTtml.Edit legacy = existingLegacyEdits != null
                            ? existingLegacyEdits.get(row.index) : null;
                    long start = synced ? Math.max(0L, row.startMs) : -1L;
                    long end = -1L;
                    if (synced) {
                        end = row.endMs > start ? row.endMs : inferEndMs(sourceRows, i, start, trackDurationMs);
                    }
                    editable.add(new Line(
                            idCounter++,
                            row.index,
                            row.text,
                            row.reading,
                            legacy != null && legacy.reading != null,
                            start,
                            end,
                            false,
                            orig != null ? orig.text : row.text,
                            orig != null ? orig.reading : row.reading,
                            orig != null ? orig.startMs : start,
                            orig != null ? (orig.endMs > orig.startMs ? orig.endMs : end) : end));
                }
            }

            long resolvedDuration = trackDurationMs;
            if (resolvedDuration <= 0L && !editable.isEmpty()) {
                long maxEnd = 0L;
                for (Line l : editable) {
                    if (l.endMs > maxEnd) maxEnd = l.endMs;
                }
                resolvedDuration = maxEnd;
            }
            return new Document(synced, wordTimed, resolvedDuration, explicitIntro, editable, idCounter, hadSavedEdits);
        }

        private static List<LyricsEditTtml.Row> safeRows(String ttml) {
            if (ttml == null || ttml.isEmpty()) return Collections.emptyList();
            try {
                return LyricsEditTtml.rows(ttml);
            } catch (Exception e) {
                return Collections.emptyList();
            }
        }

        private static long inferEndMs(List<LyricsEditTtml.Row> rows, int index, long startMs, long durationMs) {
            for (int j = index + 1; j < rows.size(); j++) {
                if (rows.get(j).startMs > startMs) {
                    return rows.get(j).startMs;
                }
            }
            if (durationMs > startMs) return durationMs;
            return startMs + 4000L;
        }

        boolean isDirty() {
            return dirty;
        }

        boolean hadSavedEditsInitially() {
            return hadSavedEditsInitially;
        }

        boolean canUndo() {
            return !undoStack.isEmpty();
        }

        boolean canRedo() {
            return !redoStack.isEmpty();
        }

        int modifiedLineCount() {
            int count = 0;
            for (Line l : lines) {
                if (l.isModified(synced)) count++;
            }
            return count;
        }

        int interludeCount() {
            if (!synced || lines.isEmpty()) return 0;
            int count = hasIntroInterlude() ? 1 : 0;
            for (int i = 0; i < lines.size() - 1; i++) {
                if (hasInterludeAfter(i)) count++;
            }
            return count;
        }

        int interludeCandidateCount() {
            if (!synced || lines.size() < 2) return 0;
            int count = 0;
            for (int i = 0; i < lines.size() - 1; i++) {
                if (isInterludeCandidateAfter(i)) count++;
            }
            return count;
        }

        boolean hasIntroInterlude() {
            if (!synced || lines.isEmpty()) return false;
            return lines.get(0).startMs >= INTERLUDE_INTRO_MIN_MS;
        }

        long introGapMs() {
            if (!synced || lines.isEmpty()) return 0L;
            return Math.max(0L, lines.get(0).startMs);
        }

        long gapAfter(int index) {
            if (!synced || index < 0 || index >= lines.size() - 1) return 0L;
            Line cur = lines.get(index);
            Line next = lines.get(index + 1);
            return Math.max(0L, next.startMs - cur.endMs);
        }

        boolean hasInterludeAfter(int index) {
            if (!synced || index < 0 || index >= lines.size() - 1) return false;
            return gapAfter(index) >= INTERLUDE_VISIBLE_MIN_MS;
        }

        /**
         * Detects a classic LRCLIB stuck line: the line lasts >= 9 seconds and runs straight
         * into the next line with no interlude gap.
         */
        boolean isInterludeCandidateAfter(int index) {
            if (!synced || index < 0 || index >= lines.size() - 1) return false;
            if (hasInterludeAfter(index)) return false;
            Line cur = lines.get(index);
            return cur.durationMs() >= STUCK_LINE_CANDIDATE_MS && gapAfter(index) < INTERLUDE_VISIBLE_MIN_MS;
        }

        private void pushUndo() {
            undoStack.push(new Snapshot(synced, explicitIntro, lines));
            while (undoStack.size() > MAX_UNDO_HISTORY) {
                undoStack.removeLast();
            }
            redoStack.clear();
            dirty = true;
        }

        boolean undo() {
            if (undoStack.isEmpty()) return false;
            redoStack.push(new Snapshot(synced, explicitIntro, lines));
            Snapshot prev = undoStack.pop();
            restoreSnapshot(prev);
            dirty = true;
            return true;
        }

        boolean redo() {
            if (redoStack.isEmpty()) return false;
            undoStack.push(new Snapshot(synced, explicitIntro, lines));
            Snapshot next = redoStack.pop();
            restoreSnapshot(next);
            dirty = true;
            return true;
        }

        private void restoreSnapshot(Snapshot snap) {
            synced = snap.synced;
            explicitIntro = snap.explicitIntro;
            lines.clear();
            for (Line l : snap.lines) {
                lines.add(l.copy());
            }
        }

        /**
         * Upgrades an unsynced (plain text) document into line-synced mode so the user can
         * tap-sync timestamps line by line or insert interludes.
         */
        boolean convertToSynced() {
            if (synced || lines.isEmpty()) return false;
            pushUndo();
            synced = true;
            long step = DEFAULT_NEW_LINE_DURATION_MS;
            if (trackDurationMs > 0L) {
                long avg = trackDurationMs / Math.max(1L, lines.size());
                step = Math.max(1500L, Math.min(4000L, avg));
            }
            long cursor = 0L;
            for (Line l : lines) {
                l.startMs = cursor;
                l.endMs = cursor + step;
                cursor = l.endMs;
            }
            return true;
        }

        boolean setLineText(int index, String newText) {
            if (index < 0 || index >= lines.size()) return false;
            String normalized = normalizeSingleLine(newText);
            Line line = lines.get(index);
            if (normalized.equals(line.text)) return false;
            pushUndo();
            line.text = normalized;
            return true;
        }

        boolean setLineReading(int index, String newReading) {
            if (index < 0 || index >= lines.size()) return false;
            String normalized = normalizeSingleLine(newReading);
            Line line = lines.get(index);
            if (normalized.equals(line.reading) && line.readingEdited) return false;
            pushUndo();
            line.reading = normalized;
            line.readingEdited = true;
            return true;
        }

        /**
         * Updates text/reading silently during typing without spamming an undo entry per keystroke.
         * Records one undo snapshot at the start of editing if {@code recordUndo} is true.
         */
        void updateLineTextDirect(int index, String newText, boolean recordUndo) {
            if (index < 0 || index >= lines.size()) return;
            String normalized = normalizeSingleLine(newText);
            Line line = lines.get(index);
            if (normalized.equals(line.text)) return;
            if (recordUndo) pushUndo();
            else dirty = true;
            line.text = normalized;
        }

        void updateLineReadingDirect(int index, String newReading, boolean recordUndo) {
            if (index < 0 || index >= lines.size()) return;
            String normalized = normalizeSingleLine(newReading);
            Line line = lines.get(index);
            if (normalized.equals(line.reading) && line.readingEdited) return;
            if (recordUndo) pushUndo();
            else dirty = true;
            line.reading = normalized;
            line.readingEdited = true;
        }

        boolean setLineStart(int index, long newStartMs, boolean cascadeFollowing) {
            if (!synced || index < 0 || index >= lines.size()) return false;
            Line line = lines.get(index);
            long clamped = Math.max(0L, newStartMs);
            long delta = clamped - line.startMs;
            if (delta == 0L) return false;
            pushUndo();

            if (cascadeFollowing) {
                long safeDelta = delta;
                if (line.startMs + safeDelta < 0L) {
                    safeDelta = -line.startMs;
                }
                for (int i = index; i < lines.size(); i++) {
                    Line l = lines.get(i);
                    long dur = Math.max(MIN_LINE_DURATION_MS, l.endMs - l.startMs);
                    l.startMs = Math.max(0L, l.startMs + safeDelta);
                    l.endMs = Math.max(l.startMs + MIN_LINE_DURATION_MS, l.endMs + safeDelta);
                    if (l.endMs <= l.startMs) l.endMs = l.startMs + dur;
                }
                // Keep previous line's end <= this line's start.
                if (index > 0) {
                    Line prev = lines.get(index - 1);
                    if (prev.endMs > line.startMs) {
                        prev.endMs = Math.max(prev.startMs + MIN_LINE_DURATION_MS, line.startMs);
                    }
                }
                return true;
            }

            long oldDur = Math.max(MIN_LINE_DURATION_MS, line.endMs - line.startMs);
            line.startMs = clamped;
            if (line.endMs < line.startMs + MIN_LINE_DURATION_MS) {
                long proposedEnd = line.startMs + oldDur;
                if (index + 1 < lines.size() && lines.get(index + 1).startMs > line.startMs + MIN_LINE_DURATION_MS) {
                    proposedEnd = Math.min(proposedEnd, lines.get(index + 1).startMs);
                }
                line.endMs = Math.max(line.startMs + MIN_LINE_DURATION_MS, proposedEnd);
            }
            if (index > 0) {
                Line prev = lines.get(index - 1);
                if (prev.endMs > line.startMs && line.startMs >= prev.startMs + MIN_LINE_DURATION_MS) {
                    prev.endMs = line.startMs;
                }
            }
            return true;
        }

        boolean nudgeLineStart(int index, long deltaMs, boolean cascadeFollowing) {
            if (!synced || index < 0 || index >= lines.size() || deltaMs == 0L) return false;
            return setLineStart(index, lines.get(index).startMs + deltaMs, cascadeFollowing);
        }

        boolean setLineEnd(int index, long newEndMs) {
            if (!synced || index < 0 || index >= lines.size()) return false;
            Line line = lines.get(index);
            long minEnd = line.startMs + MIN_LINE_DURATION_MS;
            long clamped = Math.max(minEnd, newEndMs);
            if (index + 1 < lines.size()) {
                long nextStart = lines.get(index + 1).startMs;
                if (nextStart >= minEnd) {
                    clamped = Math.min(clamped, nextStart);
                }
            }
            if (clamped == line.endMs) return false;
            pushUndo();
            line.endMs = clamped;
            if (index + 1 < lines.size()) {
                long gap = lines.get(index + 1).startMs - line.endMs;
                if (gap < 500L) {
                    line.explicitInterludeAfter = false;
                }
            }
            return true;
        }

        boolean nudgeLineEnd(int index, long deltaMs) {
            if (!synced || index < 0 || index >= lines.size() || deltaMs == 0L) return false;
            return setLineEnd(index, lines.get(index).endMs + deltaMs);
        }

        boolean shiftRange(int fromIndex, int toIndexInclusive, long deltaMs) {
            if (!synced || lines.isEmpty() || deltaMs == 0L) return false;
            int from = Math.max(0, fromIndex);
            int to = Math.min(lines.size() - 1, toIndexInclusive);
            if (from > to) return false;
            pushUndo();
            for (int i = from; i <= to; i++) {
                Line l = lines.get(i);
                long dur = Math.max(MIN_LINE_DURATION_MS, l.endMs - l.startMs);
                long nextStart = Math.max(0L, l.startMs + deltaMs);
                long nextEnd = Math.max(nextStart + MIN_LINE_DURATION_MS, l.endMs + deltaMs);
                if (nextEnd <= nextStart) nextEnd = nextStart + dur;
                l.startMs = nextStart;
                l.endMs = nextEnd;
            }
            if (from > 0) {
                Line prev = lines.get(from - 1);
                Line firstShifted = lines.get(from);
                if (prev.endMs > firstShifted.startMs && firstShifted.startMs >= prev.startMs + MIN_LINE_DURATION_MS) {
                    prev.endMs = firstShifted.startMs;
                }
            }
            return true;
        }

        /**
         * Inserts an interlude right after {@code lineIndex} (or an intro before line 0 if {@code lineIndex == -1}).
         * When the line currently stretches across a long silent region (classic LRCLIB case),
         * splits the line's tail into a real silent gap without shifting subsequent timestamps.
         * When the next line immediately follows a normal-length line, shifts following lines to create room.
         */
        boolean insertInterludeAfter(int lineIndex, long preferredStartMs) {
            if (!synced || lines.isEmpty()) return false;
            if (lineIndex < 0) {
                return insertIntroInterlude(DEFAULT_INSERT_INTERLUDE_MS);
            }
            if (lineIndex >= lines.size() - 1) return false;

            Line prev = lines.get(lineIndex);
            Line next = lines.get(lineIndex + 1);
            pushUndo();

            long totalSpan = next.startMs - prev.startMs;
            if (preferredStartMs >= prev.startMs + 400L
                    && preferredStartMs <= next.startMs - INTERLUDE_VISIBLE_MIN_MS) {
                prev.endMs = preferredStartMs;
                prev.explicitInterludeAfter = true;
                return true;
            }

            long estimatedVocal = estimateVocalDurationMs(prev.text);
            if (totalSpan >= estimatedVocal + INTERLUDE_VISIBLE_MIN_MS) {
                // Classic LRCLIB case: line stretched across an interlude. Trim prev.endMs only!
                prev.endMs = prev.startMs + estimatedVocal;
                prev.explicitInterludeAfter = true;
                return true;
            }

            if (totalSpan >= 1000L + INTERLUDE_VISIBLE_MIN_MS) {
                long vocalPart = Math.min(Math.max(1000L, totalSpan / 3L), totalSpan - INTERLUDE_VISIBLE_MIN_MS);
                prev.endMs = prev.startMs + vocalPart;
                prev.explicitInterludeAfter = true;
                return true;
            }

            // Lines are close together: make room by shifting next..end forward by DEFAULT_INSERT_INTERLUDE_MS.
            long gapNeeded = DEFAULT_INSERT_INTERLUDE_MS - Math.max(0L, next.startMs - prev.endMs);
            if (gapNeeded > 0L) {
                for (int i = lineIndex + 1; i < lines.size(); i++) {
                    Line l = lines.get(i);
                    l.startMs += gapNeeded;
                    l.endMs += gapNeeded;
                }
            }
            prev.explicitInterludeAfter = true;
            return true;
        }

        boolean insertIntroInterlude(long desiredIntroMs) {
            if (!synced || lines.isEmpty()) return false;
            long target = Math.max(INTERLUDE_INTRO_MIN_MS, desiredIntroMs);
            Line first = lines.get(0);
            pushUndo();
            if (first.startMs < target) {
                long shift = target - first.startMs;
                for (Line l : lines) {
                    l.startMs += shift;
                    l.endMs += shift;
                }
            }
            explicitIntro = true;
            return true;
        }

        boolean adjustInterludeStart(int prevLineIndex, long newStartMs) {
            if (!synced || prevLineIndex < 0 || prevLineIndex >= lines.size() - 1) return false;
            Line prev = lines.get(prevLineIndex);
            Line next = lines.get(prevLineIndex + 1);
            long minAllowed = prev.startMs + MIN_LINE_DURATION_MS;
            long minGap = (next.startMs - minAllowed) >= INTERLUDE_VISIBLE_MIN_MS
                    ? INTERLUDE_VISIBLE_MIN_MS : 500L;
            long maxAllowed = Math.max(minAllowed, next.startMs - minGap);
            long clamped = Math.max(minAllowed, Math.min(maxAllowed, newStartMs));
            if (clamped == prev.endMs && prev.explicitInterludeAfter) return false;
            pushUndo();
            prev.endMs = clamped;
            prev.explicitInterludeAfter = true;
            return true;
        }

        boolean adjustInterludeEnd(int prevLineIndex, long newEndMs, boolean cascadeFollowing) {
            if (!synced || lines.isEmpty()) return false;
            if (prevLineIndex < 0) {
                long clamped = Math.max(INTERLUDE_INTRO_MIN_MS, newEndMs);
                boolean changed = setLineStart(0, clamped, cascadeFollowing);
                if (changed) explicitIntro = true;
                return changed;
            }
            if (prevLineIndex >= lines.size() - 1) return false;
            Line prev = lines.get(prevLineIndex);
            long clamped = Math.max(prev.endMs + INTERLUDE_VISIBLE_MIN_MS, newEndMs);
            boolean changed = setLineStart(prevLineIndex + 1, clamped, cascadeFollowing);
            if (changed) {
                prev.explicitInterludeAfter = true;
            }
            return changed;
        }

        boolean removeInterludeAfter(int prevLineIndex) {
            if (!synced || lines.isEmpty()) return false;
            if (prevLineIndex < 0) {
                if (!hasIntroInterlude()) return false;
                pushUndo();
                explicitIntro = false;
                return true;
            }
            if (prevLineIndex >= lines.size() - 1) return false;
            Line prev = lines.get(prevLineIndex);
            Line next = lines.get(prevLineIndex + 1);
            if (!prev.explicitInterludeAfter && prev.endMs >= next.startMs) return false;
            pushUndo();
            prev.endMs = Math.max(prev.startMs + MIN_LINE_DURATION_MS, next.startMs);
            prev.explicitInterludeAfter = false;
            return true;
        }

        /**
         * Scans all lines for long stuck LRCLIB intervals (>= 9s with no gap) and converts their tails
         * into explicit interludes in one undoable batch action.
         */
        int autoInsertInterludes() {
            if (!synced || lines.size() < 2) return 0;
            List<Integer> targets = new ArrayList<>();
            for (int i = 0; i < lines.size() - 1; i++) {
                if (isInterludeCandidateAfter(i)) {
                    targets.add(i);
                }
            }
            if (targets.isEmpty()) return 0;
            pushUndo();
            for (int idx : targets) {
                Line cur = lines.get(idx);
                Line next = lines.get(idx + 1);
                long vocal = estimateVocalDurationMs(cur.text);
                long maxVocal = Math.max(1000L, (next.startMs - cur.startMs) - INTERLUDE_VISIBLE_MIN_MS);
                long chosenVocal = Math.min(vocal, maxVocal);
                cur.endMs = cur.startMs + Math.max(MIN_LINE_DURATION_MS, chosenVocal);
                cur.explicitInterludeAfter = true;
            }
            return targets.size();
        }

        int insertLineAt(int atIndex, String text, String reading) {
            int pos = Math.max(0, Math.min(lines.size(), atIndex));
            pushUndo();
            long start = -1L;
            long end = -1L;
            if (synced) {
                if (lines.isEmpty()) {
                    start = 0L;
                    end = DEFAULT_NEW_LINE_DURATION_MS;
                } else if (pos == 0) {
                    Line first = lines.get(0);
                    if (first.startMs >= 1000L) {
                        start = 0L;
                        end = first.startMs;
                    } else {
                        start = 0L;
                        end = Math.max(MIN_LINE_DURATION_MS, first.startMs / 2L);
                    }
                } else if (pos >= lines.size()) {
                    Line last = lines.get(lines.size() - 1);
                    start = last.endMs;
                    end = last.endMs + DEFAULT_NEW_LINE_DURATION_MS;
                } else {
                    Line prev = lines.get(pos - 1);
                    Line next = lines.get(pos);
                    long gap = next.startMs - prev.endMs;
                    if (gap >= 1000L) {
                        start = prev.endMs;
                        end = Math.min(next.startMs, prev.endMs + Math.min(DEFAULT_NEW_LINE_DURATION_MS, gap));
                        prev.explicitInterludeAfter = false;
                    } else {
                        long mid = prev.startMs + Math.max(MIN_LINE_DURATION_MS, (prev.endMs - prev.startMs) / 2L);
                        prev.endMs = mid;
                        start = mid;
                        end = Math.max(mid + MIN_LINE_DURATION_MS, next.startMs);
                    }
                }
            }
            Line added = new Line(
                    nextLineId++,
                    -1,
                    normalizeSingleLine(text),
                    normalizeSingleLine(reading),
                    reading != null && !reading.trim().isEmpty(),
                    start,
                    end,
                    false,
                    "",
                    "",
                    -1L,
                    -1L);
            lines.add(pos, added);
            return pos;
        }

        boolean splitLine(int index, int charIndex) {
            if (index < 0 || index >= lines.size()) return false;
            Line orig = lines.get(index);
            String t = orig.text;
            if (t.length() < 2) return false;
            int splitAt = charIndex;
            if (splitAt <= 0 || splitAt >= t.length()) {
                splitAt = findNaturalSplitIndex(t);
            }
            if (splitAt <= 0 || splitAt >= t.length()) return false;

            String leftText = t.substring(0, splitAt).trim();
            String rightText = t.substring(splitAt).trim();
            if (leftText.isEmpty() || rightText.isEmpty()) return false;

            pushUndo();

            String leftReading = orig.reading;
            String rightReading = "";
            if (!orig.reading.isEmpty()) {
                int rSplit = findNaturalSplitIndex(orig.reading);
                if (rSplit > 0 && rSplit < orig.reading.length()) {
                    leftReading = orig.reading.substring(0, rSplit).trim();
                    rightReading = orig.reading.substring(rSplit).trim();
                }
            }

            long leftEnd = orig.endMs;
            long rightStart = -1L;
            long rightEnd = -1L;
            if (synced && orig.startMs >= 0L) {
                long dur = Math.max(MIN_LINE_DURATION_MS * 2L, orig.endMs - orig.startMs);
                double ratio = (double) leftText.length() / (double) (leftText.length() + rightText.length());
                long leftDur = Math.max(MIN_LINE_DURATION_MS, Math.min(dur - MIN_LINE_DURATION_MS, Math.round(dur * ratio)));
                leftEnd = orig.startMs + leftDur;
                rightStart = leftEnd;
                rightEnd = Math.max(rightStart + MIN_LINE_DURATION_MS, orig.endMs);
            }

            boolean wasExplicitAfter = orig.explicitInterludeAfter;
            orig.text = leftText;
            orig.reading = leftReading;
            if (!orig.reading.equals(orig.originalReading)) orig.readingEdited = true;
            orig.endMs = leftEnd;
            orig.explicitInterludeAfter = false;

            Line second = new Line(
                    nextLineId++,
                    -1,
                    rightText,
                    rightReading,
                    !rightReading.isEmpty(),
                    rightStart,
                    rightEnd,
                    wasExplicitAfter,
                    "",
                    "",
                    -1L,
                    -1L);
            lines.add(index + 1, second);
            return true;
        }

        boolean deleteLine(int index) {
            if (index < 0 || index >= lines.size() || lines.size() <= 1) return false;
            pushUndo();
            lines.remove(index);
            return true;
        }

        boolean restoreLine(int index) {
            if (index < 0 || index >= lines.size()) return false;
            Line line = lines.get(index);
            if (line.isAdded() || !line.isModified(synced)) return false;
            pushUndo();
            line.text = line.originalText;
            line.reading = line.originalReading;
            line.readingEdited = false;
            if (synced && line.originalStartMs >= 0L) {
                line.startMs = line.originalStartMs;
                line.endMs = Math.max(line.startMs + MIN_LINE_DURATION_MS, line.originalEndMs);
            }
            line.explicitInterludeAfter = false;
            return true;
        }

        int countMatches(String find, EditTab scope, boolean ignoreCase) {
            if (find == null || find.isEmpty()) return 0;
            String needle = ignoreCase ? find.toLowerCase(Locale.ROOT) : find;
            int total = 0;
            for (Line line : lines) {
                if (scope == EditTab.LYRICS || scope == EditTab.BOTH) {
                    total += countOccurrences(line.text, needle, ignoreCase);
                }
                if (scope == EditTab.READING || scope == EditTab.BOTH) {
                    total += countOccurrences(line.reading, needle, ignoreCase);
                }
            }
            return total;
        }

        int findAndReplace(String find, String replace, EditTab scope, boolean ignoreCase) {
            if (find == null || find.isEmpty()) return 0;
            String replacement = replace == null ? "" : replace;
            int matches = countMatches(find, scope, ignoreCase);
            if (matches == 0) return 0;
            pushUndo();
            int replaced = 0;
            Pattern pattern = Pattern.compile(Pattern.quote(find),
                    ignoreCase ? (Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE) : 0);
            for (Line line : lines) {
                if (scope == EditTab.LYRICS || scope == EditTab.BOTH) {
                    Matcher m = pattern.matcher(line.text);
                    if (m.find()) {
                        replaced += countOccurrences(line.text,
                                ignoreCase ? find.toLowerCase(Locale.ROOT) : find, ignoreCase);
                        line.text = normalizeSingleLine(m.replaceAll(Matcher.quoteReplacement(replacement)));
                    }
                }
                if (scope == EditTab.READING || scope == EditTab.BOTH) {
                    Matcher m = pattern.matcher(line.reading);
                    if (m.find()) {
                        replaced += countOccurrences(line.reading,
                                ignoreCase ? find.toLowerCase(Locale.ROOT) : find, ignoreCase);
                        line.reading = normalizeSingleLine(m.replaceAll(Matcher.quoteReplacement(replacement)));
                        line.readingEdited = true;
                    }
                }
            }
            return replaced;
        }

        boolean sortByTimestamp() {
            if (!synced || lines.size() < 2) return false;
            boolean alreadySorted = true;
            for (int i = 1; i < lines.size(); i++) {
                if (lines.get(i).startMs < lines.get(i - 1).startMs) {
                    alreadySorted = false;
                    break;
                }
            }
            if (alreadySorted) return false;
            pushUndo();
            Collections.sort(lines, new Comparator<Line>() {
                @Override
                public int compare(Line a, Line b) {
                    int cmp = Long.compare(a.startMs, b.startMs);
                    return cmp != 0 ? cmp : Integer.compare(a.id, b.id);
                }
            });
            return true;
        }

        /**
         * Exports plain lines for the Bulk Text sheet (one line per lyric line).
         */
        String exportBulkPlain(boolean forReadings) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < lines.size(); i++) {
                if (i > 0) sb.append('\n');
                Line l = lines.get(i);
                sb.append(forReadings ? l.reading : l.text);
            }
            return sb.toString();
        }

        /**
         * Exports synced lines as editable LRC text including empty end-boundary timestamps for interludes.
         */
        String exportBulkLrc() {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < lines.size(); i++) {
                Line l = lines.get(i);
                if (i > 0) sb.append('\n');
                if (synced && l.startMs >= 0L) {
                    sb.append('[').append(formatTimestamp(l.startMs)).append("] ");
                }
                sb.append(l.text);
                if (synced && i + 1 < lines.size() && hasInterludeAfter(i) && l.endMs > l.startMs) {
                    sb.append('\n').append('[').append(formatTimestamp(l.endMs)).append(']');
                }
            }
            return sb.toString();
        }

        /**
         * Applies bulk plain text edits (either Lyrics or Readings).
         * Preserves all timestamps and interludes when editing in place.
         */
        BulkApplyResult applyBulkPlain(String rawText, boolean forReadings) {
            if (rawText == null) return new BulkApplyResult(false, 0, 0, 0, 0);
            String[] split = rawText.split("\\r?\\n", -1);
            if (forReadings) {
                int updated = 0;
                int limit = Math.min(lines.size(), split.length);
                boolean anyChange = false;
                for (int i = 0; i < limit; i++) {
                    String val = normalizeSingleLine(split[i]);
                    if (!val.equals(lines.get(i).reading)) {
                        anyChange = true;
                        break;
                    }
                }
                if (!anyChange) return new BulkApplyResult(false, 0, 0, 0, 0);
                pushUndo();
                for (int i = 0; i < limit; i++) {
                    String val = normalizeSingleLine(split[i]);
                    Line l = lines.get(i);
                    if (!val.equals(l.reading)) {
                        l.reading = val;
                        l.readingEdited = true;
                        updated++;
                    }
                }
                return new BulkApplyResult(true, updated, 0, 0, 0);
            }

            List<String> incoming = new ArrayList<>();
            for (String raw : split) {
                String clean = normalizeSingleLine(raw);
                if (!clean.isEmpty()) incoming.add(clean);
            }
            if (incoming.isEmpty()) return new BulkApplyResult(false, 0, 0, 0, 0);

            pushUndo();
            int updated = 0;
            int added = 0;
            int removed = 0;
            int common = Math.min(lines.size(), incoming.size());
            for (int i = 0; i < common; i++) {
                Line l = lines.get(i);
                String nextText = incoming.get(i);
                if (!nextText.equals(l.text)) {
                    l.text = nextText;
                    updated++;
                }
            }
            if (incoming.size() > lines.size()) {
                long cursor = lines.isEmpty() ? 0L : Math.max(0L, lines.get(lines.size() - 1).endMs);
                for (int i = lines.size(); i < incoming.size(); i++) {
                    long start = synced ? cursor : -1L;
                    long end = synced ? cursor + DEFAULT_NEW_LINE_DURATION_MS : -1L;
                    cursor = end;
                    lines.add(new Line(
                            nextLineId++, -1, incoming.get(i), "", false,
                            start, end, false, "", "", -1L, -1L));
                    added++;
                }
            } else if (incoming.size() < lines.size()) {
                while (lines.size() > incoming.size()) {
                    lines.remove(lines.size() - 1);
                    removed++;
                }
            }
            return new BulkApplyResult(true, updated, added, removed, 0);
        }

        /**
         * Applies bulk LRC text (with `[mm:ss.xx]` timestamps and empty `[mm:ss.xx]` interlude boundaries).
         * Matches existing lines' readings & source indices when text matches or position aligns.
         */
        BulkApplyResult applyBulkLrc(String rawLrc) {
            if (!synced || rawLrc == null || rawLrc.trim().isEmpty()) {
                return new BulkApplyResult(false, 0, 0, 0, 0);
            }
            String[] rawLines = rawLrc.split("\\r?\\n");
            List<long[]> rawTimes = new ArrayList<>();
            List<String> rawBodies = new ArrayList<>();
            for (String raw : rawLines) {
                String trimmed = raw.trim();
                if (trimmed.isEmpty()) continue;
                Matcher m = LRC_LEADING_TAG.matcher(trimmed);
                if (!m.matches()) continue;
                long ts = parseLrcGroups(m.group(1), m.group(2), m.group(3));
                if (ts < 0L) continue;
                String body = normalizeSingleLine(m.group(4));
                rawTimes.add(new long[]{ts, rawTimes.size()});
                rawBodies.add(body);
            }
            if (rawTimes.isEmpty()) return new BulkApplyResult(false, 0, 0, 0, 0);

            List<Integer> order = new ArrayList<>(rawTimes.size());
            for (int i = 0; i < rawTimes.size(); i++) order.add(i);
            Collections.sort(order, new Comparator<Integer>() {
                @Override
                public int compare(Integer a, Integer b) {
                    int cmp = Long.compare(rawTimes.get(a)[0], rawTimes.get(b)[0]);
                    return cmp != 0 ? cmp : Integer.compare(a, b);
                }
            });

            List<Line> rebuilt = new ArrayList<>();
            int interludes = 0;
            for (int oi = 0; oi < order.size(); oi++) {
                int idx = order.get(oi);
                String body = rawBodies.get(idx);
                if (body.isEmpty()) continue; // boundary timestamp
                long startMs = rawTimes.get(idx)[0];
                long endMs = -1L;
                boolean explicitAfter = false;
                for (int oj = oi + 1; oj < order.size(); oj++) {
                    int nextIdx = order.get(oj);
                    long nextTs = rawTimes.get(nextIdx)[0];
                    if (nextTs > startMs) {
                        endMs = nextTs;
                        if (rawBodies.get(nextIdx).isEmpty()) {
                            // Check if a non-empty line follows later to confirm this is an interlude boundary.
                            for (int ok = oj + 1; ok < order.size(); ok++) {
                                int afterIdx = order.get(ok);
                                if (!rawBodies.get(afterIdx).isEmpty()
                                        && rawTimes.get(afterIdx)[0] - nextTs >= INTERLUDE_VISIBLE_MIN_MS) {
                                    explicitAfter = true;
                                    interludes++;
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }
                if (endMs <= startMs) {
                    endMs = trackDurationMs > startMs ? trackDurationMs : startMs + 4000L;
                }
                int linePos = rebuilt.size();
                Line prevMatch = linePos < lines.size() ? lines.get(linePos) : null;
                if (prevMatch != null && prevMatch.text.equals(body)) {
                    rebuilt.add(new Line(
                            prevMatch.id, prevMatch.sourceIndex, body,
                            prevMatch.reading, prevMatch.readingEdited,
                            startMs, Math.max(startMs + MIN_LINE_DURATION_MS, endMs), explicitAfter,
                            prevMatch.originalText, prevMatch.originalReading,
                            prevMatch.originalStartMs, prevMatch.originalEndMs));
                } else {
                    int src = prevMatch != null ? prevMatch.sourceIndex : -1;
                    rebuilt.add(new Line(
                            nextLineId++, src, body,
                            prevMatch != null ? prevMatch.reading : "",
                            prevMatch != null && prevMatch.readingEdited,
                            startMs, Math.max(startMs + MIN_LINE_DURATION_MS, endMs), explicitAfter,
                            prevMatch != null ? prevMatch.originalText : "",
                            prevMatch != null ? prevMatch.originalReading : "",
                            prevMatch != null ? prevMatch.originalStartMs : -1L,
                            prevMatch != null ? prevMatch.originalEndMs : -1L));
                }
            }
            if (rebuilt.isEmpty()) return new BulkApplyResult(false, 0, 0, 0, 0);

            int oldSize = lines.size();
            pushUndo();
            lines.clear();
            lines.addAll(rebuilt);
            int added = Math.max(0, rebuilt.size() - oldSize);
            int removed = Math.max(0, oldSize - rebuilt.size());
            return new BulkApplyResult(true, rebuilt.size(), added, removed, interludes);
        }

        int findPlayingLineIndex(long positionMs) {
            if (!synced || positionMs < 0L || lines.isEmpty()) return -1;
            for (int i = 0; i < lines.size(); i++) {
                Line l = lines.get(i);
                if (l.startMs >= 0L && positionMs >= l.startMs && positionMs < l.endMs) {
                    return i;
                }
            }
            return -1;
        }

        /**
         * Returns -2 when playback is inside the intro interlude before line 0,
         * {@code i} (0..size-2) when inside the interlude after line {@code i},
         * or -1 when not inside an interlude.
         */
        int findPlayingInterludeAfter(long positionMs) {
            if (!synced || positionMs < 0L || lines.isEmpty()) return -1;
            if (hasIntroInterlude() && positionMs < lines.get(0).startMs) {
                return -2;
            }
            for (int i = 0; i < lines.size() - 1; i++) {
                if (hasInterludeAfter(i)) {
                    Line cur = lines.get(i);
                    Line next = lines.get(i + 1);
                    if (positionMs >= cur.endMs && positionMs < next.startMs) {
                        return i;
                    }
                }
            }
            return -1;
        }

        LyricsEditTtml.DocumentEdit toDocumentEdit() {
            List<LyricsEditTtml.LinePatch> patches = new ArrayList<>(lines.size());
            List<LyricsEditTtml.InterludeRange> interludes = new ArrayList<>();

            if (synced && !lines.isEmpty()) {
                // Ensure chronological order on save without mutating user's unsaved editing list.
                List<Line> ordered = new ArrayList<>(lines);
                Collections.sort(ordered, new Comparator<Line>() {
                    @Override
                    public int compare(Line a, Line b) {
                        int cmp = Long.compare(a.startMs, b.startMs);
                        return cmp != 0 ? cmp : Integer.compare(a.id, b.id);
                    }
                });
                // Filter empty lines first so interlude boundaries match the actually emitted lines.
                List<Line> nonEmpty = new ArrayList<>(ordered.size());
                for (Line l : ordered) {
                    if (!normalizeSingleLine(l.text).isEmpty()) {
                        nonEmpty.add(l);
                    }
                }
                if (!nonEmpty.isEmpty() && nonEmpty.get(0).startMs >= INTERLUDE_INTRO_MIN_MS) {
                    interludes.add(new LyricsEditTtml.InterludeRange(0L, nonEmpty.get(0).startMs));
                }
                for (int i = 0; i < nonEmpty.size(); i++) {
                    Line l = nonEmpty.get(i);
                    String cleanText = normalizeSingleLine(l.text);
                    long start = Math.max(0L, l.startMs);
                    long end = Math.max(start + MIN_LINE_DURATION_MS, l.endMs);
                    if (i + 1 < nonEmpty.size()) {
                        long nextStart = Math.max(0L, nonEmpty.get(i + 1).startMs);
                        if (end > nextStart && nextStart >= start + MIN_LINE_DURATION_MS) {
                            end = nextStart;
                        }
                        if ((nextStart - end) >= INTERLUDE_VISIBLE_MIN_MS) {
                            interludes.add(new LyricsEditTtml.InterludeRange(end, nextStart));
                        }
                    }
                    patches.add(new LyricsEditTtml.LinePatch(
                            l.sourceIndex,
                            cleanText,
                            l.readingEdited ? normalizeSingleLine(l.reading) : null,
                            l.readingEdited,
                            start,
                            end,
                            l.explicitInterludeAfter));
                }
            } else {
                for (Line l : lines) {
                    String cleanText = normalizeSingleLine(l.text);
                    if (cleanText.isEmpty()) continue;
                    patches.add(new LyricsEditTtml.LinePatch(
                            l.sourceIndex,
                            cleanText,
                            l.readingEdited ? normalizeSingleLine(l.reading) : null,
                            l.readingEdited,
                            -1L,
                            -1L,
                            false));
                }
            }
            return new LyricsEditTtml.DocumentEdit(synced, explicitIntro, patches, interludes);
        }
    }

    private LyricsEditorModel() {}

    static long estimateVocalDurationMs(String text) {
        if (text == null || text.trim().isEmpty()) return 3000L;
        int cps = text.trim().codePointCount(0, text.trim().length());
        long est = cps * 210L;
        return Math.max(2200L, Math.min(5500L, est));
    }

    static String formatTimestamp(long totalMs) {
        long clamped = Math.max(0L, totalMs);
        long totalCentis = Math.round(clamped / 10.0);
        long minutes = totalCentis / 6000L;
        long rem = totalCentis % 6000L;
        long seconds = rem / 100L;
        long centis = rem % 100L;
        return String.format(Locale.ROOT, "%02d:%02d.%02d", minutes, seconds, centis);
    }

    static String formatDurationSeconds(long durationMs) {
        double sec = Math.max(0L, durationMs) / 1000.0;
        return String.format(Locale.ROOT, "%.1f", sec);
    }

    static long parseTimestamp(String input) {
        if (input == null || input.trim().isEmpty()) return -1L;
        Matcher m = TIMESTAMP_PATTERN.matcher(input);
        if (m.matches()) {
            try {
                long h = m.group(1) != null ? Long.parseLong(m.group(1)) : 0L;
                long min = Long.parseLong(m.group(2));
                long sec = Long.parseLong(m.group(3));
                long ms = parseFracMs(m.group(4));
                if (sec >= 60L && h > 0L) return -1L;
                return h * 3600000L + min * 60000L + sec * 1000L + ms;
            } catch (NumberFormatException ignored) {
                return -1L;
            }
        }
        Matcher secMatcher = SECONDS_ONLY_PATTERN.matcher(input);
        if (secMatcher.matches()) {
            try {
                long sec = Long.parseLong(secMatcher.group(1));
                long ms = parseFracMs(secMatcher.group(2));
                return sec * 1000L + ms;
            } catch (NumberFormatException ignored) {
                return -1L;
            }
        }
        return -1L;
    }

    private static long parseLrcGroups(String minStr, String secStr, String fracStr) {
        try {
            long min = Long.parseLong(minStr);
            long sec = Long.parseLong(secStr);
            long ms = parseFracMs(fracStr);
            return min * 60000L + sec * 1000L + ms;
        } catch (NumberFormatException ignored) {
            return -1L;
        }
    }

    private static long parseFracMs(String frac) {
        if (frac == null || frac.isEmpty()) return 0L;
        if (frac.length() == 1) return Long.parseLong(frac) * 100L;
        if (frac.length() == 2) return Long.parseLong(frac) * 10L;
        return Long.parseLong(frac.substring(0, 3));
    }

    private static int findNaturalSplitIndex(String text) {
        int len = text.length();
        int mid = len / 2;
        int best = -1;
        int bestDist = Integer.MAX_VALUE;
        for (int i = 1; i < len - 1; i++) {
            char c = text.charAt(i);
            if (Character.isWhitespace(c) || c == '、' || c == '。' || c == ',' || c == '/' || c == '　') {
                int dist = Math.abs(i - mid);
                if (dist < bestDist) {
                    bestDist = dist;
                    best = (c == '、' || c == '。' || c == ',') ? i + 1 : i;
                }
            }
        }
        return best > 0 && best < len ? best : mid;
    }

    private static int countOccurrences(String haystack, String needle, boolean ignoreCase) {
        if (haystack == null || haystack.isEmpty() || needle.isEmpty()) return 0;
        String src = ignoreCase ? haystack.toLowerCase(Locale.ROOT) : haystack;
        int count = 0;
        int pos = 0;
        while ((pos = src.indexOf(needle, pos)) >= 0) {
            count++;
            pos += needle.length();
        }
        return count;
    }

    static String normalizeSingleLine(String text) {
        if (text == null) return "";
        return text.replace('\r', ' ').replace('\n', ' ').trim();
    }
}
