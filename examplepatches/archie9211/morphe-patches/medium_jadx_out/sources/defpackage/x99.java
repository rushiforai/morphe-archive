package defpackage;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.text.style.ReplacementSpan;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x99 extends ReplacementSpan {
    public final float a;
    public final int b;
    public final float c;
    public final int d;
    public final float e;
    public final float f;
    public final int g;
    public Paint.FontMetricsInt h;
    public int i;
    public int j;
    public boolean k;

    public x99(float f, int i, float f2, int i2, m73 m73Var, int i3) {
        float fP0 = i == 0 ? m73Var.p0(en7.M(f, 4294967296L)) : 0.0f;
        float fP02 = i2 == 0 ? m73Var.p0(en7.M(f2, 4294967296L)) : 0.0f;
        this.a = f;
        this.b = i;
        this.c = f2;
        this.d = i2;
        this.e = fP0;
        this.f = fP02;
        this.g = i3;
    }

    public final Paint.FontMetricsInt a() {
        Paint.FontMetricsInt fontMetricsInt = this.h;
        if (fontMetricsInt != null) {
            return fontMetricsInt;
        }
        g76.g0("fontMetrics");
        throw null;
    }

    public final int b() {
        if (!this.k) {
            c26.c("PlaceholderSpan is not laid out yet.");
        }
        return this.j;
    }

    public final int c() {
        if (!this.k) {
            c26.c("PlaceholderSpan is not laid out yet.");
        }
        return this.i;
    }

    @Override // android.text.style.ReplacementSpan
    public final int getSize(Paint paint, CharSequence charSequence, int i, int i2, Paint.FontMetricsInt fontMetricsInt) {
        float f;
        float f2;
        this.k = true;
        float textSize = paint.getTextSize();
        this.h = paint.getFontMetricsInt();
        if (a().descent <= a().ascent) {
            c26.a("Invalid fontMetrics: line height can not be negative.");
        }
        int i3 = this.b;
        if (i3 == 0) {
            f = this.e;
        } else {
            if (i3 != 1) {
                c26.b("Unsupported unit.");
                z72.b();
                return 0;
            }
            f = this.a * textSize;
        }
        this.i = (int) Math.ceil(f);
        int i4 = this.d;
        if (i4 == 0) {
            f2 = this.f;
        } else {
            if (i4 != 1) {
                c26.b("Unsupported unit.");
                z72.b();
                return 0;
            }
            f2 = this.c * textSize;
        }
        this.j = (int) Math.ceil(f2);
        if (fontMetricsInt != null) {
            fontMetricsInt.ascent = a().ascent;
            fontMetricsInt.descent = a().descent;
            fontMetricsInt.leading = a().leading;
            switch (this.g) {
                case 0:
                    if (fontMetricsInt.ascent > (-b())) {
                        fontMetricsInt.ascent = -b();
                    }
                    break;
                case 1:
                case 4:
                    if (b() + fontMetricsInt.ascent > fontMetricsInt.descent) {
                        fontMetricsInt.descent = b() + fontMetricsInt.ascent;
                    }
                    break;
                case 2:
                case 5:
                    if (fontMetricsInt.ascent > fontMetricsInt.descent - b()) {
                        fontMetricsInt.ascent = fontMetricsInt.descent - b();
                    }
                    break;
                case 3:
                case 6:
                    if (fontMetricsInt.descent - fontMetricsInt.ascent < b()) {
                        int iB = fontMetricsInt.ascent - ((b() - (fontMetricsInt.descent - fontMetricsInt.ascent)) / 2);
                        fontMetricsInt.ascent = iB;
                        fontMetricsInt.descent = b() + iB;
                    }
                    break;
                default:
                    c26.a("Unknown verticalAlign.");
                    break;
            }
            fontMetricsInt.top = Math.min(a().top, fontMetricsInt.ascent);
            fontMetricsInt.bottom = Math.max(a().bottom, fontMetricsInt.descent);
        }
        return c();
    }

    @Override // android.text.style.ReplacementSpan
    public final void draw(Canvas canvas, CharSequence charSequence, int i, int i2, float f, int i3, int i4, int i5, Paint paint) {
    }
}
