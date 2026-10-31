package v3;

import android.text.Spannable;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import i2.r0;
import kotlin.math.MathKt;
import y3.c;
import y3.p;
import y3.q;

/* loaded from: classes.dex */
public abstract class b {
    public static final float a(long j11, float f11, c cVar) {
        float fC;
        long jB = p.b(j11);
        if (q.a(jB, 4294967296L)) {
            if (cVar.getFontScale() <= 1.05d) {
                return cVar.mo101toPxR2X_6o(j11);
            }
            fC = p.c(j11) / p.c(cVar.mo105toSpkPz2Gy4(f11));
        } else {
            if (!q.a(jB, 8589934592L)) {
                return Float.NaN;
            }
            fC = p.c(j11);
        }
        return fC * f11;
    }

    public static final void b(Spannable spannable, long j11, int i5, int i11) {
        if (j11 != 16) {
            spannable.setSpan(new ForegroundColorSpan(r0.r(j11)), i5, i11, 33);
        }
    }

    public static final void c(Spannable spannable, long j11, c cVar, int i5, int i11) {
        long jB = p.b(j11);
        if (q.a(jB, 4294967296L)) {
            spannable.setSpan(new AbsoluteSizeSpan(MathKt.b(cVar.mo101toPxR2X_6o(j11)), false), i5, i11, 33);
        } else if (q.a(jB, 8589934592L)) {
            spannable.setSpan(new RelativeSizeSpan(p.c(j11)), i5, i11, 33);
        }
    }
}
