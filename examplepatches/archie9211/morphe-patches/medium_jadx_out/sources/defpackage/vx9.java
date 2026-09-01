package defpackage;

import android.os.Build;
import android.text.PrecomputedText;
import android.text.TextDirectionHeuristic;
import android.text.TextPaint;
import android.text.TextUtils;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vx9 {
    public final TextPaint a;
    public final TextDirectionHeuristic b;
    public final int c;
    public final int d;

    public vx9(TextPaint textPaint, TextDirectionHeuristic textDirectionHeuristic, int i, int i2) {
        if (Build.VERSION.SDK_INT >= 29) {
            new PrecomputedText.Params.Builder(textPaint).setBreakStrategy(i).setHyphenationFrequency(i2).setTextDirection(textDirectionHeuristic).build();
        }
        this.a = textPaint;
        this.b = textDirectionHeuristic;
        this.c = i;
        this.d = i2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof vx9)) {
            return false;
        }
        vx9 vx9Var = (vx9) obj;
        int i = vx9Var.c;
        TextPaint textPaint = vx9Var.a;
        if (this.c != i || this.d != vx9Var.d) {
            return false;
        }
        TextPaint textPaint2 = this.a;
        if (textPaint2.getTextSize() != textPaint.getTextSize() || textPaint2.getTextScaleX() != textPaint.getTextScaleX() || textPaint2.getTextSkewX() != textPaint.getTextSkewX() || textPaint2.getLetterSpacing() != textPaint.getLetterSpacing() || !TextUtils.equals(textPaint2.getFontFeatureSettings(), textPaint.getFontFeatureSettings()) || textPaint2.getFlags() != textPaint.getFlags()) {
            return false;
        }
        if (Build.VERSION.SDK_INT >= 24) {
            if (!textPaint2.getTextLocales().equals(textPaint.getTextLocales())) {
                return false;
            }
        } else if (!textPaint2.getTextLocale().equals(textPaint.getTextLocale())) {
            return false;
        }
        if (textPaint2.getTypeface() == null) {
            if (textPaint.getTypeface() != null) {
                return false;
            }
        } else if (!textPaint2.getTypeface().equals(textPaint.getTypeface())) {
            return false;
        }
        return this.b == vx9Var.b;
    }

    public final int hashCode() {
        int i = Build.VERSION.SDK_INT;
        TextDirectionHeuristic textDirectionHeuristic = this.b;
        int i2 = this.d;
        int i3 = this.c;
        TextPaint textPaint = this.a;
        return i >= 24 ? Objects.hash(Float.valueOf(textPaint.getTextSize()), Float.valueOf(textPaint.getTextScaleX()), Float.valueOf(textPaint.getTextSkewX()), Float.valueOf(textPaint.getLetterSpacing()), Integer.valueOf(textPaint.getFlags()), textPaint.getTextLocales(), textPaint.getTypeface(), Boolean.valueOf(textPaint.isElegantTextHeight()), textDirectionHeuristic, Integer.valueOf(i3), Integer.valueOf(i2)) : Objects.hash(Float.valueOf(textPaint.getTextSize()), Float.valueOf(textPaint.getTextScaleX()), Float.valueOf(textPaint.getTextSkewX()), Float.valueOf(textPaint.getLetterSpacing()), Integer.valueOf(textPaint.getFlags()), textPaint.getTextLocale(), textPaint.getTypeface(), Boolean.valueOf(textPaint.isElegantTextHeight()), textDirectionHeuristic, Integer.valueOf(i3), Integer.valueOf(i2));
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("{");
        StringBuilder sb2 = new StringBuilder("textSize=");
        TextPaint textPaint = this.a;
        sb2.append(textPaint.getTextSize());
        sb.append(sb2.toString());
        sb.append(", textScaleX=" + textPaint.getTextScaleX());
        sb.append(", textSkewX=" + textPaint.getTextSkewX());
        sb.append(", letterSpacing=" + textPaint.getLetterSpacing());
        sb.append(", elegantTextHeight=" + textPaint.isElegantTextHeight());
        int i = Build.VERSION.SDK_INT;
        if (i >= 24) {
            sb.append(", textLocale=" + textPaint.getTextLocales());
        } else {
            sb.append(", textLocale=" + textPaint.getTextLocale());
        }
        sb.append(", typeface=" + textPaint.getTypeface());
        if (i >= 26) {
            sb.append(", variationSettings=" + textPaint.getFontVariationSettings());
        }
        sb.append(", textDir=" + this.b);
        sb.append(", breakStrategy=" + this.c);
        sb.append(", hyphenationFrequency=" + this.d);
        sb.append("}");
        return sb.toString();
    }

    public vx9(PrecomputedText.Params params) {
        this.a = params.getTextPaint();
        this.b = params.getTextDirection();
        this.c = params.getBreakStrategy();
        this.d = params.getHyphenationFrequency();
    }
}
