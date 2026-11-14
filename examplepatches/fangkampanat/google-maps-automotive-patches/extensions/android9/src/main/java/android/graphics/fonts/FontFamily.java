package android.graphics.fonts;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Android 10's FontFamily for Android 9, where the class does not exist (patch "Android 9 (API 28)"). Loaded only on
 * Android 9 (classes load parent first). A list of fonts with distinct styles, as in Android 10.
 */
public final class FontFamily {
    private final List<Font> fonts;

    private FontFamily(List<Font> fonts) {
        this.fonts = Collections.unmodifiableList(new ArrayList<>(fonts));
    }

    public Font getFont(int index) {
        return fonts.get(index);
    }

    public int getSize() {
        return fonts.size();
    }

    /** Android 9 only: the font closest to the style, by FontStyle's match score. */
    public Font closestFont28(FontStyle style) {
        Font best = fonts.get(0);
        int bestScore = best.getStyle().getMatchScore(style);
        for (int i = 1; i < fonts.size(); i++) {
            int score = fonts.get(i).getStyle().getMatchScore(style);
            if (score < bestScore) {
                best = fonts.get(i);
                bestScore = score;
            }
        }
        return best;
    }

    public static final class Builder {
        private final List<Font> fonts = new ArrayList<>();

        public Builder(Font font) {
            fonts.add(font);
        }

        public Builder addFont(Font font) {
            for (Font existing : fonts) {
                if (existing.getStyle().equals(font.getStyle()) && existing.getTtcIndex() == font.getTtcIndex()) {
                    throw new IllegalArgumentException("Font style " + font.getStyle() + " is already added.");
                }
            }
            fonts.add(font);
            return this;
        }

        public FontFamily build() {
            return new FontFamily(fonts);
        }
    }
}
