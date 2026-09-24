package app.yydarlinker.deepseekcaptions;

import android.net.Uri;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

/**
 * Builds immutable translation units locally while retaining lexical atoms only as source/timing
 * provenance. The model never owns or returns these ranges.
 */
final class TranslationUnitTimeline {
    private static final long MIN_NATURAL_UNIT_MS = 700L;
    private static final long MANUAL_SOFT_MAX_MS = 6_500L;
    private static final long ASR_SOFT_MAX_MS = 5_500L;
    private static final long HARD_MAX_MS = 8_000L;
    private static final long SOFT_GAP_MS = 420L;
    private static final long HARD_GAP_MS = 950L;
    private static final int MANUAL_SOFT_MAX_ATOMS = 20;
    private static final int ASR_SOFT_MAX_ATOMS = 16;
    private static final int HARD_MAX_ATOMS = 28;
    private static final int HARD_MAX_SOURCE_CHARS = 240;
    private static final int SAFE_BACKTRACK_ATOMS = 8;

    private TranslationUnitTimeline() {}

    static Result build(SourceAtomTimeline.Result source, String sourceUrl) {
        if (source == null || source.atoms == null || source.atoms.isEmpty()) return Result.EMPTY;
        List<SourceAtomTimeline.Atom> atoms = source.atoms;
        boolean asr = isAsr(sourceUrl);
        long softMaxMs = asr ? ASR_SOFT_MAX_MS : MANUAL_SOFT_MAX_MS;
        int softMaxAtoms = asr ? ASR_SOFT_MAX_ATOMS : MANUAL_SOFT_MAX_ATOMS;
        List<Unit> units = new ArrayList<>();
        Map<String, Integer> boundaryRejections = new HashMap<>();

        int from = 0;
        int index = 0;
        int candidate = -1;
        Confidence candidateConfidence = Confidence.MEDIUM;
        String candidateReason = "";

        while (index < atoms.size()) {
            SourceAtomTimeline.Atom current = atoms.get(index);
            String text = SourceAtomTimeline.join(atoms, from, index);
            long duration = Math.max(1L, current.endMs - atoms.get(from).startMs);
            int atomCount = index - from + 1;
            long gapAfter = index + 1 < atoms.size()
                    ? Math.max(0L, atoms.get(index + 1).startMs - current.endMs)
                    : Long.MAX_VALUE;
            boolean strong = endsStrong(text);
            String rejectionReason = unsafeEndingReason(atoms, index);
            boolean safe = rejectionReason.isEmpty();
            boolean speakerBoundary = startsSpeaker(atoms, index + 1);
            boolean weak = endsWeak(text);

            int cut = -1;
            Confidence confidence = Confidence.LOW;
            String reason = "";

            if (strong) {
                cut = index;
                confidence = Confidence.HIGH;
                reason = "terminal_punctuation";
            } else if (gapAfter >= HARD_GAP_MS && duration >= MIN_NATURAL_UNIT_MS && safe) {
                cut = index;
                confidence = Confidence.HIGH;
                reason = "hard_gap";
            } else if (speakerBoundary && duration >= MIN_NATURAL_UNIT_MS && safe) {
                cut = index;
                confidence = Confidence.HIGH;
                reason = "speaker_boundary";
            } else {
                if (safe && duration >= 1_800L && (weak || gapAfter >= SOFT_GAP_MS)) {
                    candidate = index;
                    candidateConfidence = weak ? Confidence.MEDIUM : Confidence.HIGH;
                    candidateReason = weak ? "clause_punctuation" : "soft_gap";
                }

                boolean softLimit = duration >= softMaxMs || atomCount >= softMaxAtoms;
                if (!safe && (weak || gapAfter >= SOFT_GAP_MS || softLimit)) {
                    boundaryRejections.put(
                            rejectionReason,
                            boundaryRejections.containsKey(rejectionReason)
                                    ? boundaryRejections.get(rejectionReason) + 1 : 1
                    );
                }
                if (softLimit) {
                    if (candidate >= from) {
                        cut = candidate;
                        confidence = candidateConfidence;
                        reason = candidateReason;
                    } else if (safe && atomCount >= 4) {
                        cut = index;
                        confidence = Confidence.MEDIUM;
                        reason = "bounded_safe_phrase";
                    }
                }

                boolean hardLimit = duration >= HARD_MAX_MS || atomCount >= HARD_MAX_ATOMS ||
                        text.length() >= HARD_MAX_SOURCE_CHARS;
                if (cut < 0 && hardLimit) {
                    cut = candidate >= from ? candidate : findSafeCut(atoms, from, index);
                    confidence = Confidence.LOW;
                    reason = candidate >= from ? candidateReason : "hard_limit";
                }
            }

            if (cut >= from) {
                addUnit(units, atoms, from, cut, confidence, reason);
                from = cut + 1;
                index = from;
                candidate = -1;
                candidateConfidence = Confidence.MEDIUM;
                candidateReason = "";
            } else {
                index++;
            }
        }

        if (from < atoms.size()) {
            String tail = SourceAtomTimeline.join(atoms, from, atoms.size() - 1);
            Confidence confidence = endsStrong(tail) ? Confidence.HIGH : Confidence.LOW;
            addUnit(units, atoms, from, atoms.size() - 1, confidence, "source_tail");
        }

        if (units.isEmpty()) return Result.EMPTY;
        String kind = source.rollupNormalized ? "rollup" : asr ? "asr" : "manual_or_unknown";
        return new Result(
                Collections.unmodifiableList(units),
                atoms,
                kind,
                source.rollupNormalized,
                Collections.unmodifiableMap(new HashMap<>(boundaryRejections))
        );
    }

    private static void addUnit(
            List<Unit> units,
            List<SourceAtomTimeline.Atom> atoms,
            int from,
            int to,
            Confidence confidence,
            String reason
    ) {
        if (from < 0 || to < from || to >= atoms.size()) return;
        String text = SourceAtomTimeline.join(atoms, from, to).trim();
        if (text.isEmpty()) return;
        SourceAtomTimeline.Atom first = atoms.get(from);
        SourceAtomTimeline.Atom last = atoms.get(to);
        int index = units.size();
        String id = "u" + index + "-" + from + "-" + to + "-" +
                Integer.toHexString(text.hashCode());
        units.add(new Unit(
                index,
                id,
                from,
                to,
                Math.max(0, first.cueIndex),
                Math.max(first.cueIndex, last.cueIndex),
                first.startMs,
                last.endMs,
                text,
                confidence == null ? Confidence.LOW : confidence,
                reason == null ? "" : reason
        ));
    }

    private static int findSafeCut(
            List<SourceAtomTimeline.Atom> atoms,
            int from,
            int to
    ) {
        int minimum = Math.max(from, to - SAFE_BACKTRACK_ATOMS);
        for (int i = to; i >= minimum; i--) {
            if (!unsafeEnding(atoms, i)) return i;
        }
        return to;
    }

    private static boolean startsSpeaker(List<SourceAtomTimeline.Atom> atoms, int index) {
        if (index < 0 || index >= atoms.size()) return false;
        SourceAtomTimeline.Atom next = atoms.get(index);
        if (index > 0 && next.cueIndex == atoms.get(index - 1).cueIndex) return false;
        String text = next.text == null ? "" : next.text.trim();
        return text.startsWith("-") || text.startsWith("—") || text.startsWith("[") ||
                text.matches("^[A-Z][A-Z0-9_-]{1,24}:.*");
    }

    private static boolean endsStrong(String value) {
        if (value == null) return false;
        String text = value.trim();
        int index = text.length() - 1;
        while (index >= 0 && SentenceBoundaryUtil.closer(text.charAt(index))) index--;
        return index >= 0 && SentenceBoundaryUtil.strong(text, index);
    }

    private static boolean endsWeak(String value) {
        if (value == null) return false;
        String text = value.trim();
        int index = text.length() - 1;
        while (index >= 0 && SentenceBoundaryUtil.closer(text.charAt(index))) index--;
        return index >= 0 && SentenceBoundaryUtil.weak(text.charAt(index));
    }

    private static boolean unsafeEnding(List<SourceAtomTimeline.Atom> atoms, int to) {
        return !unsafeEndingReason(atoms, to).isEmpty();
    }

    private static String unsafeEndingReason(List<SourceAtomTimeline.Atom> atoms, int to) {
        if (to < 0 || to >= atoms.size()) return "invalid_boundary";
        if (to + 1 < atoms.size() && numericExpressionContinues(
                atoms.get(to).text, atoms.get(to + 1).text
        )) return "numeric_span";
        String last = lexical(atoms.get(to).text, false);
        if (last.isEmpty()) return "";
        switch (last) {
            case "a": case "an": case "the": case "this": case "that": case "these": case "those":
            case "and": case "or": case "but": case "because": case "although": case "though": case "while":
            case "if": case "unless": case "whether": case "than": case "as":
            case "of": case "to": case "for": case "with": case "from": case "by": case "at": case "in":
            case "on": case "into": case "onto": case "about": case "through": case "between": case "without":
            case "is": case "am": case "are": case "was": case "were": case "be": case "been": case "being":
            case "has": case "have": case "had": case "do": case "does": case "did":
            case "can": case "could": case "will": case "would": case "shall": case "should": case "may":
            case "might": case "must": case "whose": case "which": case "who": case "whom":
                return "dependent_function_word";
            default:
                break;
        }
        if (to + 1 < atoms.size()) {
            String next = lexical(atoms.get(to + 1).text, true);
            if (startsRelativeClause(next)) return "relative_clause";
            if (startsPredicateContinuation(next)) return "subject_predicate";
            if (startsPrepositionalComplement(next)) return "prepositional_complement";
            if (("feel".equals(last) || "felt".equals(last) || "seem".equals(last) ||
                    "seemed".equals(last) || "think".equals(last) || "thought".equals(last) ||
                    "say".equals(last) || "said".equals(last) ||
                    "claim".equals(last) || "claimed".equals(last) ||
                    "announce".equals(last) || "announced".equals(last) ||
                    "promise".equals(last) || "promised".equals(last) ||
                    "plan".equals(last) || "planned".equals(last) ||
                    "decide".equals(last) || "decided".equals(last) ||
                    "intend".equals(last) || "intended".equals(last)) &&
                    ("that".equals(next) || "like".equals(next) || "as".equals(next) ||
                            "how".equals(next) || "what".equals(next) ||
                            "whether".equals(next) || "to".equals(next))) {
                return "predicate_complement";
            }
        }
        return "";
    }

    private static boolean numericExpressionContinues(String leftValue, String rightValue) {
        String left = leftValue == null ? "" : leftValue.trim();
        String right = rightValue == null ? "" : rightValue.trim();
        if (left.isEmpty() || right.isEmpty()) return false;
        char rightFirst = right.charAt(0);
        boolean leftIsNumber = containsDigit(left) || isNumberWord(lexical(left, false));
        if (!leftIsNumber) return false;
        char leftLast = left.charAt(left.length() - 1);
        if ((leftLast == ',' || leftLast == '.' || leftLast == ':' || leftLast == '-' ||
                leftLast == '/' || leftLast == '，' || leftLast == '．' || leftLast == '：') &&
                Character.isDigit(rightFirst)) return true;
        String next = lexical(right, true);
        return "hundred".equals(next) || "thousand".equals(next) || "million".equals(next) ||
                "billion".equals(next) || "trillion".equals(next) || "percent".equals(next) ||
                isQuantityUnit(next);
    }

    private static boolean containsDigit(String value) {
        if (value == null) return false;
        for (int i = 0; i < value.length(); i++) {
            if (Character.isDigit(value.charAt(i))) return true;
        }
        return false;
    }

    private static boolean isNumberWord(String value) {
        if (value == null || value.isEmpty()) return false;
        String[] parts = value.toLowerCase(Locale.ROOT).split("-");
        for (String part : parts) {
            switch (part) {
                case "zero": case "one": case "two": case "three": case "four": case "five":
                case "six": case "seven": case "eight": case "nine": case "ten": case "eleven":
                case "twelve": case "thirteen": case "fourteen": case "fifteen": case "sixteen":
                case "seventeen": case "eighteen": case "nineteen": case "twenty": case "thirty":
                case "forty": case "fifty": case "sixty": case "seventy": case "eighty": case "ninety":
                case "hundred": case "thousand": case "million": case "billion": case "trillion":
                case "first": case "second": case "third": case "fourth": case "fifth": case "sixth":
                case "seventh": case "eighth": case "ninth": case "tenth":
                    break;
                default:
                    return false;
            }
        }
        return true;
    }

    private static boolean isQuantityUnit(String value) {
        if (value == null || value.isEmpty()) return false;
        String unit = value.toLowerCase(Locale.ROOT);
        if (unit.endsWith("ies") && unit.length() > 3) unit = unit.substring(0, unit.length() - 3) + "y";
        else if (unit.endsWith("s") && unit.length() > 1) unit = unit.substring(0, unit.length() - 1);
        switch (unit) {
            case "second": case "minute": case "hour": case "day": case "week": case "month":
            case "year": case "person": case "people": case "mile": case "kilometer": case "metre":
            case "meter": case "centimeter": case "millimeter": case "kilogram": case "gram":
            case "pound": case "ounce": case "liter": case "litre": case "degree": case "percent":
            case "dollar": case "euro": case "yuan": case "yen": case "unit": case "time":
                return true;
            default:
                return false;
        }
    }

    private static boolean startsRelativeClause(String next) {
        return "that".equals(next) || "which".equals(next) || "who".equals(next) ||
                "whom".equals(next) || "whose".equals(next) || "where".equals(next);
    }

    private static boolean startsPredicateContinuation(String next) {
        switch (next) {
            case "is": case "am": case "are": case "was": case "were": case "be": case "been":
            case "being": case "has": case "have": case "had": case "do": case "does": case "did":
            case "can": case "could": case "will": case "would": case "shall": case "should":
            case "may": case "might": case "must":
                return true;
            default:
                return false;
        }
    }

    private static boolean startsPrepositionalComplement(String next) {
        switch (next) {
            case "to": case "of": case "for": case "with": case "from": case "by": case "at":
            case "in": case "on": case "into": case "onto": case "about": case "through":
            case "between": case "without":
                return true;
            default:
                return false;
        }
    }

    private static String lexical(String value, boolean first) {
        if (value == null) return "";
        String clean = value.toLowerCase(Locale.ROOT)
                .replace('’', '\'')
                .replaceAll("^[^\\p{L}\\p{N}']+", "")
                .replaceAll("[^\\p{L}\\p{N}']+$", "")
                .trim();
        int space = first ? clean.indexOf(' ') : Math.max(clean.lastIndexOf(' '), clean.lastIndexOf('\t'));
        if (space < 0) return clean;
        return first ? clean.substring(0, space) : clean.substring(space + 1);
    }

    private static boolean isAsr(String sourceUrl) {
        if (sourceUrl == null || sourceUrl.trim().isEmpty()) return false;
        try {
            String kind = Uri.parse(sourceUrl).getQueryParameter("kind");
            return "asr".equalsIgnoreCase(kind == null ? "" : kind.trim());
        } catch (Throwable ignored) {
            return sourceUrl.toLowerCase(Locale.ROOT).contains("kind=asr");
        }
    }

    enum Confidence {
        HIGH,
        MEDIUM,
        LOW
    }

    static final class Unit {
        final int index;
        final String id;
        final int fromAtom;
        final int toAtom;
        final int firstCue;
        final int lastCue;
        final long startMs;
        final long endMs;
        final String sourceText;
        final Confidence confidence;
        final String reason;

        Unit(
                int index,
                String id,
                int fromAtom,
                int toAtom,
                int firstCue,
                int lastCue,
                long startMs,
                long endMs,
                String sourceText,
                Confidence confidence,
                String reason
        ) {
            this.index = index;
            this.id = id;
            this.fromAtom = fromAtom;
            this.toAtom = toAtom;
            this.firstCue = firstCue;
            this.lastCue = lastCue;
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs + 1L, endMs);
            this.sourceText = sourceText == null ? "" : sourceText;
            this.confidence = confidence;
            this.reason = reason == null ? "" : reason;
        }
    }

    static final class Result {
        static final Result EMPTY = new Result(
                Collections.emptyList(), Collections.emptyList(), "unknown", false,
                Collections.emptyMap()
        );
        final List<Unit> units;
        final List<SourceAtomTimeline.Atom> atoms;
        final String sourceKind;
        final boolean rollupNormalized;
        final Map<String, Integer> boundaryRejections;

        Result(
                List<Unit> units,
                List<SourceAtomTimeline.Atom> atoms,
                String sourceKind,
                boolean rollupNormalized,
                Map<String, Integer> boundaryRejections
        ) {
            this.units = units;
            this.atoms = atoms;
            this.sourceKind = sourceKind == null ? "unknown" : sourceKind;
            this.rollupNormalized = rollupNormalized;
            this.boundaryRejections = boundaryRejections == null
                    ? Collections.emptyMap() : boundaryRejections;
        }

        String rejectionSummary() {
            if (boundaryRejections.isEmpty()) return "";
            StringBuilder result = new StringBuilder();
            for (Map.Entry<String, Integer> entry : new TreeMap<>(boundaryRejections).entrySet()) {
                if (result.length() > 0) result.append(',');
                result.append(entry.getKey()).append('=').append(entry.getValue());
            }
            return result.toString();
        }
    }
}
