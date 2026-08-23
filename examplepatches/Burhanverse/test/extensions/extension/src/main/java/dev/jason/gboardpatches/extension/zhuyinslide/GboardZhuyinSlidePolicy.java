package dev.jason.gboardpatches.extension.zhuyinslide;

import java.util.ArrayList;
import java.util.List;

public final class GboardZhuyinSlidePolicy {
    private GboardZhuyinSlidePolicy() {
    }

    public static PatchPlan plan(String primaryLabel, String pressText,
            String[] longPressTokens, boolean hasSlideUp, boolean hasSlideDown) {
        String[] tokens = normalizeTokens(longPressTokens);
        String firstToken = tokens.length == 0 ? null : tokens[0];
        if ("ㄦ".equals(primaryLabel) || "ㄦ".equals(firstToken)) {
            return PatchPlan.EMPTY;
        }

        String recognizedLabel = normalizedLabel(primaryLabel);
        if (!isZhuyinOrTone(recognizedLabel)) {
            recognizedLabel = firstToken;
        }
        if (!isZhuyinOrTone(recognizedLabel)) {
            return PatchPlan.EMPTY;
        }

        String slideUpText = !hasSlideUp && !"ㄥ".equals(recognizedLabel)
                ? tokenAt(tokens, 2) : null;
        String slideDownText = !hasSlideDown
                ? resolveSlideDown(recognizedLabel, tokens) : null;
        if (slideUpText == null && slideDownText == null) {
            return PatchPlan.EMPTY;
        }
        return new PatchPlan(slideUpText, slideDownText,
                tokenSummary(recognizedLabel, pressText, tokens));
    }

    private static String resolveSlideDown(String label, String[] tokens) {
        if ("ㄝ".equals(label)) {
            return "…";
        }
        if ("ㄡ".equals(label)) {
            return "！";
        }
        if ("ㄤ".equals(label)) {
            return "：";
        }
        if ("ㄥ".equals(label)) {
            return "？";
        }
        return tokenAt(tokens, 1);
    }

    private static String[] normalizeTokens(String[] tokens) {
        if (tokens == null || tokens.length == 0) {
            return new String[0];
        }
        List<String> normalized = new ArrayList<String>();
        for (String token : tokens) {
            String value = normalizedLabel(token);
            if (value != null) {
                normalized.add(value);
            }
        }
        return normalized.toArray(new String[0]);
    }

    private static String normalizedLabel(String value) {
        if (value == null) {
            return null;
        }
        String normalized = value.trim();
        return normalized.isEmpty() ? null : normalized;
    }

    private static String tokenAt(String[] tokens, int index) {
        return index >= 0 && index < tokens.length ? tokens[index] : null;
    }

    private static boolean isZhuyinOrTone(String token) {
        if (token == null || token.length() != 1) {
            return false;
        }
        char value = token.charAt(0);
        return (value >= '\u3105' && value <= '\u3129')
                || value == '\u00B7'
                || value == '\u02CA'
                || value == '\u02C7'
                || value == '\u02CB'
                || value == '\u02D9';
    }

    private static String tokenSummary(String primaryLabel, String pressText, String[] tokens) {
        StringBuilder summary = new StringBuilder("zhuyin");
        String label = normalizedLabel(primaryLabel);
        if (label == null) {
            label = normalizedLabel(pressText);
        }
        if (label != null) {
            summary.append(':').append(label);
        }
        if (tokens.length > 0) {
            summary.append(':').append(String.join("|", tokens));
        }
        return summary.toString();
    }

    public static final class PatchPlan {
        static final PatchPlan EMPTY = new PatchPlan(null, null, "<none>");

        public final String slideUpText;
        public final String slideDownText;
        public final String tokenSummary;

        PatchPlan(String slideUpText, String slideDownText, String tokenSummary) {
            this.slideUpText = slideUpText;
            this.slideDownText = slideDownText;
            this.tokenSummary = tokenSummary;
        }

        public boolean isEmpty() {
            return slideUpText == null && slideDownText == null;
        }
    }
}
