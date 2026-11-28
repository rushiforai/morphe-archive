package app.yydarlinker.aicaptions;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextDirectionHeuristic;
import android.text.TextDirectionHeuristics;
import android.text.TextPaint;
import android.view.View;
import android.widget.TextView;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/** Immutable target presentation contract; never inferred from UI locale or text script. */
public final class CaptionRenderSpec {
    static final String POLICY_VERSION = "upstream-presentation-ac65fe8";
    public static final CaptionRenderSpec LEGACY =
            new CaptionRenderSpec("zh-Hans", CaptionLanguageProfile.fromCode("zh-Hans"), true);
    public final String targetCode, presentationPolicy;
    public final CaptionLanguageProfile profile;
    final Locale locale;
    final CaptionLanguageProfile.Direction direction;
    final boolean compactScript;

    /** True when the captions come from a manually authored track: pages follow the author. */
    final boolean authored;
    final int maxLines = 2;
    private final TextPaint measurementPaint;
    private final TextDirectionHeuristic measurementDirection;

    public CaptionRenderSpec(String target, CaptionLanguageProfile profile, boolean chinese) {
        this(target, profile, chinese, null, null, false);
    }

    private CaptionRenderSpec(
            String target,
            CaptionLanguageProfile profile,
            boolean chinese,
            TextPaint paint,
            TextDirectionHeuristic heuristic,
            boolean authored) {
        this.authored = authored;
        measurementPaint = paint;
        measurementDirection = heuristic;
        targetCode = target;
        this.profile = profile;
        // Script, not language id, decides whether adjacent translated events need a space. Han,
        // Kana, Thai, Lao, Khmer and Myanmar are written without inter-word spaces; Korean is
        // written with spaces between eojeol and must keep them.
        locale = Locale.forLanguageTag(target.equals("UNKNOWN") ? "und" : target);
        compactScript = CaptionScript.compact(locale);
        direction = profile.direction;
        presentationPolicy = POLICY_VERSION;
    }

    public CaptionRenderSpec withPaint(TextView view) {
        TextPaint paint = new TextPaint(view.getPaint());
        paint.setTextSize(1); // Size is an explicit plan key and is set separately by layout().
        int direction = view.getTextDirection();
        TextDirectionHeuristic actual;
        switch (direction) {
            case View.TEXT_DIRECTION_LTR:
                actual = TextDirectionHeuristics.LTR;
                break;
            case View.TEXT_DIRECTION_RTL:
                actual = TextDirectionHeuristics.RTL;
                break;
            case View.TEXT_DIRECTION_ANY_RTL:
                actual = TextDirectionHeuristics.ANYRTL_LTR;
                break;
            case View.TEXT_DIRECTION_LOCALE:
                actual = TextDirectionHeuristics.LOCALE;
                break;
            case View.TEXT_DIRECTION_FIRST_STRONG_RTL:
                actual = TextDirectionHeuristics.FIRSTSTRONG_RTL;
                break;
            case View.TEXT_DIRECTION_FIRST_STRONG_LTR:
                actual = TextDirectionHeuristics.FIRSTSTRONG_LTR;
                break;
            default:
                actual =
                        view.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL
                                ? TextDirectionHeuristics.FIRSTSTRONG_RTL
                                : TextDirectionHeuristics.FIRSTSTRONG_LTR;
        }
        return new CaptionRenderSpec(targetCode, profile, compactScript, paint, actual, authored);
    }

    /** The same measurement contract, but pages follow a manually authored track. */
    CaptionRenderSpec withAuthored() {
        return authored
                ? this
                : new CaptionRenderSpec(
                        targetCode, profile, compactScript, measurementPaint, measurementDirection, true);
    }

    boolean sameMeasurement(CaptionRenderSpec other) {
        return other != null
                && targetCode.equals(other.targetCode)
                && compactScript == other.compactScript
                && effectiveDirection() == other.effectiveDirection()
                && paint(1).equalsForTextMeasurement(other.paint(1));
    }

    private TextDirectionHeuristic effectiveDirection() {
        return measurementDirection == null ? heuristic() : measurementDirection;
    }

    private static final LinkedHashMap<String, CaptionRenderSpec> MEASUREMENTS =
            new LinkedHashMap<>(64, .75f, true);
    private static long nextMeasurement;
    private volatile String cachedMeasurementKey;

    public String measurementKey() {
        String cached = cachedMeasurementKey;
        if (cached != null) return cached;
        synchronized (MEASUREMENTS) {
            String found = null;
            for (Map.Entry<String, CaptionRenderSpec> row : MEASUREMENTS.entrySet())
                if (sameMeasurement(row.getValue())) {
                    found = row.getKey();
                    break;
                }
            if (found != null) {
                MEASUREMENTS.get(found);
                cachedMeasurementKey = found;
                return found;
            }
            String key = "font" + (++nextMeasurement);
            MEASUREMENTS.put(key, this);
            while (MEASUREMENTS.size() > 64)
                MEASUREMENTS.remove(MEASUREMENTS.keySet().iterator().next());
            cachedMeasurementKey = key;
            return key;
        }
    }

    TextDirectionHeuristic heuristic() {
        return direction == CaptionLanguageProfile.Direction.RTL
                ? TextDirectionHeuristics.RTL
                : direction == CaptionLanguageProfile.Direction.LTR
                        ? TextDirectionHeuristics.LTR
                        : TextDirectionHeuristics.FIRSTSTRONG_LTR;
    }

    public void apply(TextView view) {
        view.setTextDirection(
                direction == CaptionLanguageProfile.Direction.RTL
                        ? View.TEXT_DIRECTION_RTL
                        : direction == CaptionLanguageProfile.Direction.LTR
                                ? View.TEXT_DIRECTION_LTR
                                : View.TEXT_DIRECTION_FIRST_STRONG_LTR);
        view.setLayoutDirection(
                direction == CaptionLanguageProfile.Direction.RTL
                        ? View.LAYOUT_DIRECTION_RTL
                        : View.LAYOUT_DIRECTION_LTR);
        if (!locale.equals(view.getTextLocale())) view.setTextLocale(locale);
    }

    public TextPaint paint(float sizePx) {
        TextPaint p =
                measurementPaint == null
                        ? new TextPaint(Paint.ANTI_ALIAS_FLAG)
                        : new TextPaint(measurementPaint);
        if (measurementPaint == null) {
            p.setTypeface(Typeface.DEFAULT);
            p.setTextLocale(locale);
        }
        p.setTextSize(sizePx);
        return p;
    }

    /** The whole text laid out (no maxLines, no ellipsis) so it is measured before approval. */
    public StaticLayout layout(String value, float sizePx, int width) {
        return StaticLayout.Builder.obtain(
                        value, 0, value.length(), paint(sizePx), Math.max(1, width))
                .setIncludePad(false)
                .setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED)
                .setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE)
                .setTextDirection(effectiveDirection())
                .setAlignment(Layout.Alignment.ALIGN_CENTER)
                .build();
    }

    boolean fits(String value, float sizePx, int width, int lines) {
        return fits(value, layout(value, sizePx, width), width, lines);
    }

    public boolean fits(String value, Layout layout, int width, int lines) {
        if (layout == null || layout.getLineCount() > lines || layout.getLineCount() < 1)
            return false;
        if (layout.getLineEnd(layout.getLineCount() - 1) != value.length()) return false;
        int[] boundaries = CaptionUnicode.characterBoundaries(value, locale);
        for (int i = 0; i < layout.getLineCount(); i++) {
            if (layout.getEllipsisCount(i) > 0
                    || layout.getLineMax(i) > width + .01f
                    || Arrays.binarySearch(boundaries, layout.getLineStart(i)) < 0
                    || Arrays.binarySearch(boundaries, layout.getLineEnd(i)) < 0) return false;
        }
        return true;
    }

    public float actualWidth(Layout layout) {
        float width = 0;
        for (int i = 0; i < layout.getLineCount(); i++)
            width = Math.max(width, layout.getLineMax(i));
        return width;
    }

    public int readingUnits(String text) {
        return CaptionUnicode.readingUnits(text, profile, locale);
    }

    double lineUnits(String text) {
        return CaptionUnicode.lineHalfUnits(text, profile, locale) / 2.0;
    }

    double lineUnits(String text, Layout layout) {
        double units = 0;
        for (int i = 0; i < layout.getLineCount(); i++)
            units =
                    Math.max(
                            units,
                            lineUnits(
                                    text.substring(layout.getLineStart(i), layout.getLineEnd(i))));
        return units;
    }
}
