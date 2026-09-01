package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sv6 implements qob, nob {
    public final rob a;
    public final nob b;
    public final g78 c;

    public sv6(qob qobVar, Map map, nob nobVar) {
        ff4 ff4Var = new ff4(21, qobVar);
        sn3 sn3Var = sob.a;
        this.a = new rob(map, ff4Var);
        this.b = nobVar;
        g78 g78Var = iqb.a;
        this.c = new g78();
    }

    @Override // defpackage.qob
    public final boolean a(Object obj) {
        return this.a.a(obj);
    }

    @Override // defpackage.qob
    public final pob b(String str, m45 m45Var) {
        return this.a.b(str, m45Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0042  */
    @Override // defpackage.qob
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.Map c() {
        /*
            r14 = this;
            g78 r0 = r14.c
            java.lang.Object[] r1 = r0.b
            long[] r0 = r0.a
            int r2 = r0.length
            int r2 = r2 + (-2)
            if (r2 < 0) goto L47
            r3 = 0
            r4 = r3
        Ld:
            r5 = r0[r4]
            long r7 = ~r5
            r9 = 7
            long r7 = r7 << r9
            long r7 = r7 & r5
            r9 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r7 = r7 & r9
            int r7 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            if (r7 == 0) goto L42
            int r7 = r4 - r2
            int r7 = ~r7
            int r7 = r7 >>> 31
            r8 = 8
            int r7 = 8 - r7
            r9 = r3
        L27:
            if (r9 >= r7) goto L40
            r10 = 255(0xff, double:1.26E-321)
            long r10 = r10 & r5
            r12 = 128(0x80, double:6.3E-322)
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 >= 0) goto L3c
            int r10 = r4 << 3
            int r10 = r10 + r9
            r10 = r1[r10]
            nob r11 = r14.b
            r11.f(r10)
        L3c:
            long r5 = r5 >> r8
            int r9 = r9 + 1
            goto L27
        L40:
            if (r7 != r8) goto L47
        L42:
            if (r4 == r2) goto L47
            int r4 = r4 + 1
            goto Ld
        L47:
            rob r14 = r14.a
            java.util.Map r14 = r14.c()
            return r14
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sv6.c():java.util.Map");
    }

    @Override // defpackage.qob
    public final Object d(String str) {
        return this.a.d(str);
    }

    @Override // defpackage.nob
    public final void e(Object obj, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-858296452);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(obj) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(this) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            this.b.e(obj, mz1Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            boolean zH = p65Var.h(this) | p65Var.h(obj);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new si3(this, 22, obj);
                p65Var.j0(objM);
            }
            kyd.h(obj, (x45) objM, p65Var);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 1, this, obj, mz1Var);
        }
    }

    @Override // defpackage.nob
    public final void f(Object obj) {
        this.b.f(obj);
    }
}
