package y4;

import android.os.Build;
import android.text.PrecomputedText;
import android.text.TextDirectionHeuristic;
import android.text.TextPaint;
import android.text.TextUtils;
import java.util.Objects;
import l2.m;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final TextPaint f96641a;

    /* renamed from: b, reason: collision with root package name */
    public final TextDirectionHeuristic f96642b;

    /* renamed from: c, reason: collision with root package name */
    public final int f96643c;

    /* renamed from: d, reason: collision with root package name */
    public final int f96644d;

    public c(TextPaint textPaint, TextDirectionHeuristic textDirectionHeuristic, int i5, int i11) {
        if (Build.VERSION.SDK_INT >= 29) {
            m.j(textPaint).setBreakStrategy(i5).setHyphenationFrequency(i11).setTextDirection(textDirectionHeuristic).build();
        }
        this.f96641a = textPaint;
        this.f96642b = textDirectionHeuristic;
        this.f96643c = i5;
        this.f96644d = i11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        if (this.f96643c != cVar.f96643c || this.f96644d != cVar.f96644d) {
            return false;
        }
        TextPaint textPaint = this.f96641a;
        float textSize = textPaint.getTextSize();
        TextPaint textPaint2 = cVar.f96641a;
        if (textSize != textPaint2.getTextSize() || textPaint.getTextScaleX() != textPaint2.getTextScaleX() || textPaint.getTextSkewX() != textPaint2.getTextSkewX() || textPaint.getLetterSpacing() != textPaint2.getLetterSpacing() || !TextUtils.equals(textPaint.getFontFeatureSettings(), textPaint2.getFontFeatureSettings()) || textPaint.getFlags() != textPaint2.getFlags() || !textPaint.getTextLocales().equals(textPaint2.getTextLocales())) {
            return false;
        }
        if (textPaint.getTypeface() == null) {
            if (textPaint2.getTypeface() != null) {
                return false;
            }
        } else if (!textPaint.getTypeface().equals(textPaint2.getTypeface())) {
            return false;
        }
        return this.f96642b == cVar.f96642b;
    }

    public final int hashCode() {
        TextPaint textPaint = this.f96641a;
        return Objects.hash(Float.valueOf(textPaint.getTextSize()), Float.valueOf(textPaint.getTextScaleX()), Float.valueOf(textPaint.getTextSkewX()), Float.valueOf(textPaint.getLetterSpacing()), Integer.valueOf(textPaint.getFlags()), textPaint.getTextLocales(), textPaint.getTypeface(), Boolean.valueOf(textPaint.isElegantTextHeight()), this.f96642b, Integer.valueOf(this.f96643c), Integer.valueOf(this.f96644d));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("{");
        StringBuilder sb3 = new StringBuilder("textSize=");
        TextPaint textPaint = this.f96641a;
        sb3.append(textPaint.getTextSize());
        sb2.append(sb3.toString());
        sb2.append(", textScaleX=" + textPaint.getTextScaleX());
        sb2.append(", textSkewX=" + textPaint.getTextSkewX());
        sb2.append(", letterSpacing=" + textPaint.getLetterSpacing());
        sb2.append(", elegantTextHeight=" + textPaint.isElegantTextHeight());
        sb2.append(", textLocale=" + textPaint.getTextLocales());
        sb2.append(", typeface=" + textPaint.getTypeface());
        sb2.append(", variationSettings=" + textPaint.getFontVariationSettings());
        sb2.append(", textDir=" + this.f96642b);
        sb2.append(", breakStrategy=" + this.f96643c);
        sb2.append(", hyphenationFrequency=" + this.f96644d);
        sb2.append("}");
        return sb2.toString();
    }

    public c(PrecomputedText.Params params) {
        this.f96641a = params.getTextPaint();
        this.f96642b = params.getTextDirection();
        this.f96643c = params.getBreakStrategy();
        this.f96644d = params.getHyphenationFrequency();
    }
}
