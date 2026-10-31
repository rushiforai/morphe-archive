package p3;

import android.graphics.Paint;
import android.text.style.LineHeightSpan;

/* loaded from: classes.dex */
public final class g implements LineHeightSpan {

    /* renamed from: a, reason: collision with root package name */
    public final float f82037a;

    /* renamed from: b, reason: collision with root package name */
    public final int f82038b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f82039c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f82040d;

    /* renamed from: e, reason: collision with root package name */
    public final float f82041e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f82042f;

    /* renamed from: g, reason: collision with root package name */
    public int f82043g = Integer.MIN_VALUE;

    /* renamed from: h, reason: collision with root package name */
    public int f82044h = Integer.MIN_VALUE;

    /* renamed from: i, reason: collision with root package name */
    public int f82045i = Integer.MIN_VALUE;

    /* renamed from: j, reason: collision with root package name */
    public int f82046j = Integer.MIN_VALUE;

    /* renamed from: k, reason: collision with root package name */
    public int f82047k;

    /* renamed from: l, reason: collision with root package name */
    public int f82048l;

    public g(float f11, int i5, boolean z11, boolean z12, float f12, boolean z13) {
        this.f82037a = f11;
        this.f82038b = i5;
        this.f82039c = z11;
        this.f82040d = z12;
        this.f82041e = f12;
        this.f82042f = z13;
        if ((0.0f > f12 || f12 > 1.0f) && f12 != -1.0f) {
            s3.a.c("topRatio should be in [0..1] range or -1");
        }
    }

    @Override // android.text.style.LineHeightSpan
    public final void chooseHeight(CharSequence charSequence, int i5, int i11, int i12, int i13, Paint.FontMetricsInt fontMetricsInt) {
        int i14 = fontMetricsInt.descent;
        int i15 = fontMetricsInt.ascent;
        if (i14 - i15 <= 0) {
            return;
        }
        boolean z11 = i5 == 0;
        boolean z12 = i11 == this.f82038b;
        boolean z13 = this.f82040d;
        boolean z14 = this.f82039c;
        if (z11 && z12 && z14 && z13) {
            return;
        }
        if (this.f82043g == Integer.MIN_VALUE) {
            int i16 = i14 - i15;
            int iCeil = (int) Math.ceil(this.f82037a);
            int i17 = iCeil - i16;
            if (!this.f82042f || i17 > 0) {
                float fAbs = this.f82041e;
                if (fAbs == -1.0f) {
                    fAbs = Math.abs(fontMetricsInt.ascent) / (fontMetricsInt.descent - fontMetricsInt.ascent);
                }
                int iCeil2 = (int) (i17 <= 0 ? Math.ceil(i17 * fAbs) : Math.ceil((1.0f - fAbs) * i17));
                int i18 = fontMetricsInt.descent;
                int i19 = iCeil2 + i18;
                this.f82045i = i19;
                int i21 = i19 - iCeil;
                this.f82044h = i21;
                if (z14) {
                    i21 = fontMetricsInt.ascent;
                }
                this.f82043g = i21;
                if (z13) {
                    i19 = i18;
                }
                this.f82046j = i19;
                this.f82047k = fontMetricsInt.ascent - i21;
                this.f82048l = i19 - i18;
            } else {
                int i22 = fontMetricsInt.ascent;
                this.f82044h = i22;
                int i23 = fontMetricsInt.descent;
                this.f82045i = i23;
                this.f82043g = i22;
                this.f82046j = i23;
                this.f82047k = 0;
                this.f82048l = 0;
            }
        }
        fontMetricsInt.ascent = z11 ? this.f82043g : this.f82044h;
        fontMetricsInt.descent = z12 ? this.f82046j : this.f82045i;
    }
}
