package defpackage;

import android.os.Build;
import android.text.BoringLayout;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextDirectionHeuristic;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.MetricAffectingSpan;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pp6 {
    public final CharSequence a;
    public final TextPaint b;
    public final int c;
    public float d = Float.NaN;
    public float e = Float.NaN;
    public BoringLayout.Metrics f;
    public boolean g;
    public CharSequence h;

    public pp6(CharSequence charSequence, TextPaint textPaint, int i) {
        this.a = charSequence;
        this.b = textPaint;
        this.c = i;
    }

    public final BoringLayout.Metrics a() {
        if (!this.g) {
            TextDirectionHeuristic textDirectionHeuristicB = sjd.b(this.c);
            int i = Build.VERSION.SDK_INT;
            CharSequence charSequence = this.a;
            TextPaint textPaint = this.b;
            this.f = i >= 33 ? v4.o(charSequence, textPaint, textDirectionHeuristicB) : !textDirectionHeuristicB.isRtl(charSequence, 0, charSequence.length()) ? BoringLayout.isBoring(charSequence, textPaint, null) : null;
            this.g = true;
        }
        return this.f;
    }

    public final CharSequence b() {
        CharSequence charSequence = this.h;
        if (charSequence != null) {
            charSequence.getClass();
            return charSequence;
        }
        CharSequence charSequence2 = this.a;
        if (charSequence2 instanceof Spanned) {
            Spanned spanned = (Spanned) charSequence2;
            if (tp7.u(spanned, CharacterStyle.class)) {
                CharacterStyle[] characterStyleArr = (CharacterStyle[]) spanned.getSpans(0, charSequence2.length(), CharacterStyle.class);
                if (characterStyleArr != null && characterStyleArr.length != 0) {
                    SpannableString spannableString = null;
                    for (CharacterStyle characterStyle : characterStyleArr) {
                        if (!(characterStyle instanceof MetricAffectingSpan)) {
                            if (spannableString == null) {
                                spannableString = new SpannableString(charSequence2);
                            }
                            spannableString.removeSpan(characterStyle);
                        }
                    }
                    if (spannableString != null) {
                        charSequence2 = spannableString;
                    }
                }
            }
        }
        this.h = charSequence2;
        return charSequence2;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x005a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final float c() {
        /*
            r6 = this;
            float r0 = r6.d
            boolean r0 = java.lang.Float.isNaN(r0)
            if (r0 != 0) goto Lb
            float r6 = r6.d
            return r6
        Lb:
            android.text.BoringLayout$Metrics r0 = r6.a()
            if (r0 == 0) goto L14
            int r0 = r0.width
            goto L15
        L14:
            r0 = -1
        L15:
            float r0 = (float) r0
            r1 = 0
            int r2 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            android.text.TextPaint r3 = r6.b
            if (r2 >= 0) goto L34
            java.lang.CharSequence r0 = r6.b()
            int r0 = r0.length()
            java.lang.CharSequence r2 = r6.b()
            r4 = 0
            float r0 = android.text.Layout.getDesiredWidth(r2, r4, r0, r3)
            double r4 = (double) r0
            double r4 = java.lang.Math.ceil(r4)
            float r0 = (float) r4
        L34:
            int r2 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r2 != 0) goto L39
            goto L5d
        L39:
            java.lang.CharSequence r2 = r6.a
            boolean r4 = r2 instanceof android.text.Spanned
            if (r4 == 0) goto L51
            android.text.Spanned r2 = (android.text.Spanned) r2
            java.lang.Class<px6> r4 = defpackage.px6.class
            boolean r4 = defpackage.tp7.u(r2, r4)
            if (r4 != 0) goto L5a
            java.lang.Class<ox6> r4 = defpackage.ox6.class
            boolean r2 = defpackage.tp7.u(r2, r4)
            if (r2 != 0) goto L5a
        L51:
            float r2 = r3.getLetterSpacing()
            int r1 = (r2 > r1 ? 1 : (r2 == r1 ? 0 : -1))
            if (r1 != 0) goto L5a
            goto L5d
        L5a:
            r1 = 1056964608(0x3f000000, float:0.5)
            float r0 = r0 + r1
        L5d:
            r6.d = r0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pp6.c():float");
    }
}
