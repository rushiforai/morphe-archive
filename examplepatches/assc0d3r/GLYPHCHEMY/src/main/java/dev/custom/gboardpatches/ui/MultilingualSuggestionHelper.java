package dev.custom.gboardpatches.ui;

import android.view.View;

import java.util.ArrayList;
import java.util.List;

/** Reorders candidate suggestions so a different script surfaces first. */
public final class MultilingualSuggestionHelper {

    private MultilingualSuggestionHelper() {
    }

    public static void applyToView(View view, List candidates) {
        try {
            if (candidates == null || candidates.size() < 2) {
                return;
            }
            List<Object> nonLatin = new ArrayList<Object>();
            List<Object> latin = new ArrayList<Object>();
            for (int i = 0; i < candidates.size(); i++) {
                Object candidate = candidates.get(i);
                String text = candidate == null ? "" : candidate.toString();
                boolean hasNonLatin = false;
                for (int j = 0; j < text.length(); j++) {
                    if (text.charAt(j) > 0x024F) {
                        hasNonLatin = true;
                        break;
                    }
                }
                if (hasNonLatin) {
                    nonLatin.add(candidate);
                } else {
                    latin.add(candidate);
                }
            }
            if (nonLatin.isEmpty()) {
                return;
            }
            candidates.clear();
            candidates.addAll(nonLatin);
            candidates.addAll(latin);
        } catch (Throwable ignored) {
        }
    }
}
