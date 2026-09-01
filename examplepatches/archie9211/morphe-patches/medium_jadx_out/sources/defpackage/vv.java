package defpackage;

import android.graphics.ImageDecoder;
import android.graphics.drawable.Drawable;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class vv implements lw2 {
    public final yx5 a;
    public final ew8 b;
    public final boolean c;

    public vv(yx5 yx5Var, ew8 ew8Var, boolean z) {
        this.a = yx5Var;
        this.b = ew8Var;
        this.c = z;
    }

    public static final Drawable b(vv vvVar, nya nyaVar) {
        yx5 yx5VarI = r40.I(vvVar.a, vvVar.c);
        try {
            ImageDecoder.Source sourceL = nm.L(yx5VarI, vvVar.b, true);
            if (sourceL == null) {
                zz0 zz0VarV0 = yx5VarI.v0();
                try {
                    zz0VarV0.request(Long.MAX_VALUE);
                    ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect((int) zz0VarV0.a().b);
                    while (!zz0VarV0.a().H()) {
                        zz0VarV0.a().read(byteBufferAllocateDirect);
                    }
                    byteBufferAllocateDirect.flip();
                    zz0VarV0.close();
                    sourceL = ImageDecoder.createSource(byteBufferAllocateDirect);
                } finally {
                }
            }
            Drawable drawableDecodeDrawable = ImageDecoder.decodeDrawable(sourceL, new sv(vvVar, nyaVar, 0));
            xz5.F(yx5VarI, null);
            return drawableDecodeDrawable;
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(android.graphics.drawable.Drawable r8, defpackage.p92 r9) {
        /*
            r7 = this;
            boolean r0 = r9 instanceof defpackage.tv
            if (r0 == 0) goto L13
            r0 = r9
            tv r0 = (defpackage.tv) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            tv r0 = new tv
            r0.<init>(r7, r9)
        L18:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            ew8 r7 = r7.b
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2e
            java.lang.Object r8 = r0.b
            android.graphics.drawable.Drawable r8 = (android.graphics.drawable.Drawable) r8
            defpackage.br7.v(r9)
            goto L85
        L2e:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r4
        L34:
            defpackage.br7.v(r9)
            boolean r9 = r8 instanceof android.graphics.drawable.AnimatedImageDrawable
            if (r9 != 0) goto L3c
            return r8
        L3c:
            q84 r9 = defpackage.guc.j
            java.lang.Object r2 = defpackage.k40.c0(r7, r9)
            java.lang.Number r2 = (java.lang.Number) r2
            int r2 = r2.intValue()
            r5 = -2
            if (r2 == r5) goto L5b
            r2 = r8
            android.graphics.drawable.AnimatedImageDrawable r2 = (android.graphics.drawable.AnimatedImageDrawable) r2
            java.lang.Object r9 = defpackage.k40.c0(r7, r9)
            java.lang.Number r9 = (java.lang.Number) r9
            int r9 = r9.intValue()
            r2.setRepeatCount(r9)
        L5b:
            q84 r9 = defpackage.guc.l
            java.lang.Object r9 = defpackage.k40.c0(r7, r9)
            m45 r9 = (defpackage.m45) r9
            q84 r2 = defpackage.guc.m
            java.lang.Object r2 = defpackage.k40.c0(r7, r2)
            m45 r2 = (defpackage.m45) r2
            if (r9 != 0) goto L6f
            if (r2 == 0) goto L85
        L6f:
            r13 r5 = defpackage.xg3.a
            ei5 r5 = defpackage.ff7.a
            ei5 r5 = r5.f
            uv r6 = new uv
            r6.<init>(r8, r9, r2, r4)
            r0.b = r8
            r0.e = r3
            java.lang.Object r9 = defpackage.vx0.m0(r5, r6, r0)
            if (r9 != r1) goto L85
            return r1
        L85:
            eqb r9 = new eqb
            dqb r7 = r7.c
            r9.<init>(r8, r7)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vv.c(android.graphics.drawable.Drawable, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.lw2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.n92 r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.rv
            if (r0 == 0) goto L13
            r0 = r8
            rv r0 = (defpackage.rv) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L1a
        L13:
            rv r0 = new rv
            p92 r8 = (defpackage.p92) r8
            r0.<init>(r7, r8)
        L1a:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 2
            r4 = 1
            if (r2 == 0) goto L3f
            if (r2 == r4) goto L36
            if (r2 != r3) goto L2e
            nya r7 = r0.b
            defpackage.br7.v(r8)
            goto L68
        L2e:
            r7 = 0
            java.lang.String r7 = androidx.compose.material.internal.Yzq.QFTsJPDEnO.dYhtv
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L36:
            nya r2 = r0.b
            defpackage.br7.v(r8)
            r6 = r2
            r2 = r8
            r8 = r6
            goto L58
        L3f:
            defpackage.br7.v(r8)
            nya r8 = new nya
            r8.<init>()
            n r2 = new n
            r5 = 7
            r2.<init>(r7, r5, r8)
            r0.b = r8
            r0.e = r4
            java.lang.Object r2 = defpackage.flb.x0(r2, r0)
            if (r2 != r1) goto L58
            goto L64
        L58:
            android.graphics.drawable.Drawable r2 = (android.graphics.drawable.Drawable) r2
            r0.b = r8
            r0.e = r3
            java.lang.Object r7 = r7.c(r2, r0)
            if (r7 != r1) goto L65
        L64:
            return r1
        L65:
            r6 = r8
            r8 = r7
            r7 = r6
        L68:
            android.graphics.drawable.Drawable r8 = (android.graphics.drawable.Drawable) r8
            ew5 r8 = defpackage.dm2.y(r8)
            boolean r7 = r7.a
            gw2 r0 = new gw2
            r0.<init>(r8, r7)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vv.a(n92):java.lang.Object");
    }
}
