package defpackage;

import android.graphics.Paint;
import android.graphics.Rect;
import android.text.Layout;
import android.text.TextPaint;
import android.text.TextUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ojd {
    public final TextPaint a;
    public final TextUtils.TruncateAt b;
    public final boolean c;
    public final boolean d;
    public h30 e;
    public final Layout f;
    public final int g;
    public final int h;
    public final int i;
    public final float j;
    public final float k;
    public final Paint.FontMetricsInt l;
    public final int m;
    public final mz6[] n;
    public final Rect o = new Rect();
    public iq1 p;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0216  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0218  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x021d  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x021f  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x019d A[PHI: r14
      0x019d: PHI (r14v7 int) = (r14v6 int), (r14v9 int) binds: [B:94:0x01af, B:87:0x0196] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01bd  */
    /* JADX WARN: Type inference failed for: r13v10 */
    /* JADX WARN: Type inference failed for: r13v16 */
    /* JADX WARN: Type inference failed for: r13v17 */
    /* JADX WARN: Type inference failed for: r13v7 */
    /* JADX WARN: Type inference failed for: r13v9 */
    /* JADX WARN: Type inference failed for: r15v11 */
    /* JADX WARN: Type inference failed for: r15v13 */
    /* JADX WARN: Type inference failed for: r15v19 */
    /* JADX WARN: Type inference failed for: r26v1, types: [boolean] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public ojd(java.lang.CharSequence r23, float r24, android.text.TextPaint r25, int r26, android.text.TextUtils.TruncateAt r27, int r28, boolean r29, int r30, int r31, int r32, int r33, int r34, int r35, defpackage.pp6 r36) {
        /*
            Method dump skipped, instruction units count: 835
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ojd.<init>(java.lang.CharSequence, float, android.text.TextPaint, int, android.text.TextUtils$TruncateAt, int, boolean, int, int, int, int, int, int, pp6):void");
    }

    public final int a() {
        boolean z = this.d;
        Layout layout = this.f;
        return (z ? layout.getLineBottom(this.g - 1) : layout.getHeight()) + this.h + this.i + this.m;
    }

    public final float b(int i) {
        if (i == this.g - 1) {
            return this.j + this.k;
        }
        return 0.0f;
    }

    public final iq1 c() {
        iq1 iq1Var = this.p;
        if (iq1Var != null) {
            return iq1Var;
        }
        iq1 iq1Var2 = new iq1(this.f);
        this.p = iq1Var2;
        return iq1Var2;
    }

    public final float d(int i) {
        Paint.FontMetricsInt fontMetricsInt;
        return this.h + ((i != this.g + (-1) || (fontMetricsInt = this.l) == null) ? this.f.getLineBaseline(i) : g(i) - fontMetricsInt.ascent);
    }

    public final float e(int i) {
        Paint.FontMetricsInt fontMetricsInt;
        int i2 = this.g;
        int i3 = i2 - 1;
        Layout layout = this.f;
        if (i != i3 || (fontMetricsInt = this.l) == null) {
            return this.h + layout.getLineBottom(i) + (i == i2 + (-1) ? this.i : 0);
        }
        return layout.getLineBottom(i - 1) + fontMetricsInt.bottom;
    }

    public final int f(int i) {
        ThreadLocal threadLocal = sjd.a;
        Layout layout = this.f;
        return (layout.getEllipsisCount(i) <= 0 || this.b != TextUtils.TruncateAt.END) ? layout.getLineEnd(i) : layout.getText().length();
    }

    public final float g(int i) {
        return this.f.getLineTop(i) + (i == 0 ? 0 : this.h);
    }

    public final float h(int i, boolean z) {
        return b(this.f.getLineForOffset(i)) + c().B(i, true, z);
    }

    public final float i(int i, boolean z) {
        return b(this.f.getLineForOffset(i)) + c().B(i, false, z);
    }

    public final h30 j() {
        h30 h30Var = this.e;
        if (h30Var != null) {
            return h30Var;
        }
        Layout layout = this.f;
        h30 h30Var2 = new h30(layout.getText(), layout.getText().length(), this.a.getTextLocale());
        this.e = h30Var2;
        return h30Var2;
    }
}
