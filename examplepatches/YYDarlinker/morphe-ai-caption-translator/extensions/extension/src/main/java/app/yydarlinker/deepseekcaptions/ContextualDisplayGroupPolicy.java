package app.yydarlinker.deepseekcaptions;

import java.util.Collections;
import java.util.List;

/** Source-only, immutable display grouping decisions for Contextual Unit captions. */
final class ContextualDisplayGroupPolicy {
    static final long WAIT_LIMIT_MS = 800L;
    private static final long MAX_CONTINUATION_GAP_MS = 900L;

    enum WaitDecision { READY, WAIT, TIMEOUT, PERMANENT_FAILURE }

    private ContextualDisplayGroupPolicy() {}

    static Group[] singleWindows(List<TranslationUnitTimeline.Unit> units,
                                 List<SourceAtomTimeline.Atom> atoms) {
        Group[] result=new Group[units.size()];
        for(int i=0;i<units.size();i++) {
            TranslationUnitTimeline.Unit u=units.get(i);
            result[i]=new Group(i,i,u.fromAtom,u.toAtom,u.startMs,u.endMs,u.sourceText);
        }
        return result;
    }

    static Group[] buildByUnit(
            List<TranslationUnitTimeline.Unit> units,
            List<SourceAtomTimeline.Atom> atoms
    ) {
        if (units == null || units.isEmpty()) return new Group[0];
        List<SourceAtomTimeline.Atom> sourceAtoms = atoms == null
                ? Collections.emptyList() : atoms;
        Group[] byUnit = new Group[units.size()];
        int first = 0;
        while (first < units.size()) {
            int last = first;
            while (last + 1 < units.size() && shouldContinue(
                    units.get(last), units.get(last + 1)
            )) {
                last++;
            }
            TranslationUnitTimeline.Unit start = units.get(first);
            TranslationUnitTimeline.Unit end = units.get(last);
            String sourceText = sourceAtoms.isEmpty()
                    ? joinUnitSources(units, first, last)
                    : SourceAtomTimeline.join(sourceAtoms, start.fromAtom, end.toAtom);
            Group group = new Group(
                    first, last, start.fromAtom, end.toAtom,
                    start.startMs, end.endMs, sourceText
            );
            for (int i = first; i <= last; i++) byUnit[i] = group;
            first = last + 1;
        }
        return byUnit;
    }

    static WaitDecision waitDecision(
            boolean allReady,
            boolean anyPermanentFailure,
            long waitStartedAtMs,
            long nowMs
    ) {
        if (allReady) return WaitDecision.READY;
        if (anyPermanentFailure) return WaitDecision.PERMANENT_FAILURE;
        if (waitStartedAtMs > 0L && nowMs - waitStartedAtMs >= WAIT_LIMIT_MS) {
            return WaitDecision.TIMEOUT;
        }
        return WaitDecision.WAIT;
    }

    static boolean allReady(int[] states, Group group, int readyState) {
        if (states == null || group == null || group.firstUnit < 0 ||
                group.lastUnit >= states.length) return false;
        for (int i = group.firstUnit; i <= group.lastUnit; i++) {
            if (states[i] != readyState) return false;
        }
        return true;
    }

    static boolean anyPermanentFailure(int[] states, Group group, int permanentState) {
        if (states == null || group == null || group.firstUnit < 0 ||
                group.lastUnit >= states.length) return false;
        for (int i = group.firstUnit; i <= group.lastUnit; i++) {
            if (states[i] == permanentState) return true;
        }
        return false;
    }

    static String joinCanonical(List<String> translations, int first, int last) {
        if (translations == null || translations.isEmpty() || first < 0 || last < first) return "";
        String result = "";
        int end = Math.min(last, translations.size() - 1);
        for (int i = first; i <= end; i++) {
            String next = translations.get(i);
            if (next == null || next.trim().isEmpty()) continue;
            String clean = next.trim();
            if (!result.isEmpty() && SentenceBoundaryUtil.needsSpace(result, clean)) result += " ";
            result += clean;
        }
        return result;
    }

    private static boolean shouldContinue(
            TranslationUnitTimeline.Unit current,
            TranslationUnitTimeline.Unit next
    ) {
        if (current == null || next == null) return false;
        if ("hard_gap".equals(current.reason) || "speaker_boundary".equals(current.reason)) return false;
        if (next.startMs - current.endMs > MAX_CONTINUATION_GAP_MS) return false;
        if (startsSpeaker(next.sourceText)) return false;
        return !endsClause(current.sourceText, next.sourceText);
    }

    private static boolean endsClause(String currentValue, String nextValue) {
        String current = currentValue == null ? "" : currentValue.trim();
        if (current.isEmpty()) return false;
        int index = current.length() - 1;
        while (index >= 0 && (Character.isWhitespace(current.charAt(index)) ||
                SentenceBoundaryUtil.closer(current.charAt(index)))) index--;
        if (index < 0) return false;
        char value = current.charAt(index);
        if (value == ',' || value == '，') return true;
        if (value != '.' && value != '!' && value != '?' &&
                value != '。' && value != '！' && value != '？') return false;
        String next = nextValue == null ? "" : nextValue.trim();
        if (value == '.' && index > 0 && !next.isEmpty() &&
                Character.isDigit(current.charAt(index - 1)) &&
                Character.isDigit(next.charAt(0))) return false;
        if (value == '.' && dottedAbbreviation(current.substring(0, index + 1))) return false;
        String combined = current.substring(0, index + 1) +
                (next.isEmpty() ? "" : " " + next);
        return SentenceBoundaryUtil.strong(combined, index);
    }

    private static boolean dottedAbbreviation(String value) {
        String lower = value == null ? "" : value.toLowerCase(java.util.Locale.ROOT);
        return lower.endsWith("e.g.") || lower.endsWith("i.e.") ||
                lower.endsWith("u.s.") || lower.endsWith("u.k.") ||
                lower.endsWith("e.u.");
    }

    private static boolean startsSpeaker(String value) {
        String text = value == null ? "" : value.trim();
        return text.startsWith("-") || text.startsWith("—") || text.startsWith("[") ||
                text.matches("^[A-Z][A-Z0-9_-]{1,24}:.*");
    }

    private static String joinUnitSources(
            List<TranslationUnitTimeline.Unit> units,
            int first,
            int last
    ) {
        String result = "";
        for (int i = first; i <= last; i++) {
            String next = units.get(i).sourceText == null ? "" : units.get(i).sourceText.trim();
            if (next.isEmpty()) continue;
            if (!result.isEmpty() && SentenceBoundaryUtil.needsSpace(result, next)) result += " ";
            result += next;
        }
        return result;
    }

    static final class Group {
        final int firstUnit;
        final int lastUnit;
        final int fromAtom;
        final int toAtom;
        final long startMs;
        final long endMs;
        final String sourceText;

        Group(
                int firstUnit,
                int lastUnit,
                int fromAtom,
                int toAtom,
                long startMs,
                long endMs,
                String sourceText
        ) {
            this.firstUnit = firstUnit;
            this.lastUnit = lastUnit;
            this.fromAtom = fromAtom;
            this.toAtom = toAtom;
            this.startMs = startMs;
            this.endMs = endMs;
            this.sourceText = sourceText == null ? "" : sourceText;
        }
    }
}
