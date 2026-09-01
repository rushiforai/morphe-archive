package defpackage;

import android.graphics.Canvas;
import android.text.TextUtils;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wq {
    public final ar a;
    public final int b;
    public final long c;
    public final ojd d;
    public final CharSequence e;
    public final List f;

    /* JADX WARN: Removed duplicated region for block: B:102:0x014e  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0159  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x019f  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x01d7  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0213  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0216  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x024a  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0279  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x027d  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x02cf  */
    /* JADX WARN: Removed duplicated region for block: B:191:0x0343  */
    /* JADX WARN: Removed duplicated region for block: B:193:0x0359  */
    /* JADX WARN: Removed duplicated region for block: B:195:0x036c  */
    /* JADX WARN: Removed duplicated region for block: B:196:0x0378  */
    /* JADX WARN: Removed duplicated region for block: B:197:0x038b  */
    /* JADX WARN: Removed duplicated region for block: B:198:0x0394  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x0399  */
    /* JADX WARN: Removed duplicated region for block: B:210:0x033d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00ed  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public wq(defpackage.ar r22, int r23, int r24, long r25) {
        /*
            Method dump skipped, instruction units count: 974
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wq.<init>(ar, int, int, long):void");
    }

    public final ojd a(int i, int i2, TextUtils.TruncateAt truncateAt, int i3, int i4, int i5, int i6, int i7, CharSequence charSequence) {
        pa9 pa9Var;
        float fD = d();
        ar arVar = this.a;
        ys ysVar = arVar.g;
        int i8 = arVar.l;
        pp6 pp6Var = arVar.i;
        mkd mkdVar = arVar.b;
        xq xqVar = yq.a;
        bb9 bb9Var = mkdVar.c;
        return new ojd(charSequence, fD, ysVar, i, truncateAt, i8, (bb9Var == null || (pa9Var = bb9Var.a) == null) ? false : pa9Var.a, i3, i5, i6, i7, i4, i2, pp6Var);
    }

    public final float b() {
        return this.d.a();
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00a6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long c(defpackage.zwa r11, int r12, defpackage.ywb r13) {
        /*
            r10 = this;
            android.graphics.RectF r4 = defpackage.kk7.F(r11)
            r11 = 1
            r8 = 0
            if (r12 != 0) goto La
        L8:
            r12 = r8
            goto Ld
        La:
            if (r12 != r11) goto L8
            r12 = r11
        Ld:
            k6c r6 = new k6c
            r0 = 17
            r6.<init>(r0, r13)
            ojd r0 = r10.d
            android.text.Layout r1 = r0.f
            int r10 = android.os.Build.VERSION.SDK_INT
            r13 = 34
            if (r10 < r13) goto L24
            int[] r10 = defpackage.m4.o(r0, r4, r12, r6)
            goto Lb6
        L24:
            iq1 r2 = r0.c()
            if (r12 != r11) goto L39
            d2f r10 = new d2f
            java.lang.CharSequence r12 = r1.getText()
            h30 r13 = r0.j()
            r10.<init>(r12, r11, r13)
        L37:
            r5 = r10
            goto L4f
        L39:
            java.lang.CharSequence r12 = r1.getText()
            android.text.TextPaint r13 = r0.a
            r3 = 29
            if (r10 < r3) goto L49
            jf5 r10 = new jf5
            r10.<init>(r12, r13)
            goto L37
        L49:
            kf5 r10 = new kf5
            r10.<init>(r12)
            goto L37
        L4f:
            float r10 = r4.top
            int r10 = (int) r10
            int r10 = r1.getLineForVertical(r10)
            float r12 = r4.top
            float r13 = r0.e(r10)
            int r12 = (r12 > r13 ? 1 : (r12 == r13 ? 0 : -1))
            if (r12 <= 0) goto L67
            int r10 = r10 + 1
            int r12 = r0.g
            if (r10 < r12) goto L67
            goto La6
        L67:
            r3 = r10
            float r10 = r4.bottom
            int r10 = (int) r10
            int r10 = r1.getLineForVertical(r10)
            if (r10 != 0) goto L7c
            float r12 = r4.bottom
            float r13 = r0.g(r8)
            int r12 = (r12 > r13 ? 1 : (r12 == r13 ? 0 : -1))
            if (r12 >= 0) goto L7c
            goto La6
        L7c:
            r7 = 1
            int r12 = defpackage.ur7.y(r0, r1, r2, r3, r4, r5, r6, r7)
        L81:
            r13 = r3
            r9 = -1
            if (r12 != r9) goto L8f
            if (r13 >= r10) goto L8f
            int r3 = r13 + 1
            r7 = 1
            int r12 = defpackage.ur7.y(r0, r1, r2, r3, r4, r5, r6, r7)
            goto L81
        L8f:
            if (r12 != r9) goto L92
            goto La6
        L92:
            r7 = 0
            r3 = r10
            int r10 = defpackage.ur7.y(r0, r1, r2, r3, r4, r5, r6, r7)
        L98:
            if (r10 != r9) goto La4
            if (r13 >= r3) goto La4
            int r3 = r3 + (-1)
            r7 = 0
            int r10 = defpackage.ur7.y(r0, r1, r2, r3, r4, r5, r6, r7)
            goto L98
        La4:
            if (r10 != r9) goto La8
        La6:
            r10 = 0
            goto Lb6
        La8:
            int r12 = r12 + r11
            int r12 = r5.h0(r12)
            int r10 = r10 - r11
            int r10 = r5.i0(r10)
            int[] r10 = new int[]{r12, r10}
        Lb6:
            if (r10 != 0) goto Lbb
            long r10 = defpackage.bkd.b
            return r10
        Lbb:
            r12 = r10[r8]
            r10 = r10[r11]
            long r10 = defpackage.lk7.q(r12, r10)
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wq.c(zwa, int, ywb):long");
    }

    public final float d() {
        return f72.h(this.c);
    }

    public final void e(e61 e61Var) {
        Canvas canvasA = qm.a(e61Var);
        ojd ojdVar = this.d;
        if (ojdVar.d) {
            canvasA.save();
            canvasA.clipRect(0.0f, 0.0f, d(), b());
        }
        int i = ojdVar.h;
        if (canvasA.getClipBounds(ojdVar.o)) {
            if (i != 0) {
                canvasA.translate(0.0f, i);
            }
            ThreadLocal threadLocal = sjd.a;
            Object lgdVar = threadLocal.get();
            if (lgdVar == null) {
                lgdVar = new lgd();
                threadLocal.set(lgdVar);
            }
            lgd lgdVar2 = (lgd) lgdVar;
            lgdVar2.a = canvasA;
            try {
                ojdVar.f.draw(lgdVar2);
                if (i != 0) {
                    canvasA.translate(0.0f, (-1.0f) * i);
                }
            } finally {
                lgdVar2.a = null;
            }
        }
        if (ojdVar.d) {
            canvasA.restore();
        }
    }

    public final void f(e61 e61Var, long j, i3c i3cVar, ohd ohdVar, pxf pxfVar, int i) {
        ys ysVar = this.a.g;
        int i2 = ysVar.c;
        ysVar.d(j);
        ysVar.f(i3cVar);
        ysVar.g(ohdVar);
        ysVar.e(pxfVar);
        ysVar.b(i);
        e(e61Var);
        ysVar.b(i2);
    }

    public final void g(e61 e61Var, ez0 ez0Var, float f, i3c i3cVar, ohd ohdVar, pxf pxfVar) {
        ys ysVar = this.a.g;
        int i = ysVar.c;
        float fD = d();
        ysVar.c(ez0Var, (((long) Float.floatToRawIntBits(b())) & 4294967295L) | (Float.floatToRawIntBits(fD) << 32), f);
        ysVar.f(i3cVar);
        ysVar.g(ohdVar);
        ysVar.e(pxfVar);
        ysVar.b(3);
        e(e61Var);
        ysVar.b(i);
    }
}
