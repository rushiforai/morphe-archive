package defpackage;

import android.content.Context;
import android.os.Build;
import android.widget.EdgeEffect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ep implements fx8 {
    public final m73 a;
    public long b = 9205357640488583168L;
    public final do3 c;
    public final k49 d;
    public final boolean e;
    public boolean f;
    public long g;
    public long h;
    public final b43 i;

    public ep(Context context, m73 m73Var, long j, jy8 jy8Var) {
        this.a = m73Var;
        do3 do3Var = new do3(context, op8.n0(j));
        this.c = do3Var;
        this.d = new k49(c1e.a, y3b.h);
        this.e = true;
        this.g = 0L;
        this.h = -1L;
        dp dpVar = new dp(0, this);
        lb9 lb9Var = r4d.a;
        w4d w4dVar = new w4d(null, null, dpVar);
        this.i = Build.VERSION.SDK_INT >= 31 ? new buc(w4dVar, this, do3Var) : new vd5(w4dVar, this, do3Var, jy8Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:50:0x012b, code lost:
    
        if (r4 == r6) goto L51;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    @Override // defpackage.fx8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(long r19, defpackage.b55 r21, defpackage.n92 r22) {
        /*
            Method dump skipped, instruction units count: 471
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ep.a(long, b55, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:108:0x021d  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0222  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0231 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0237  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x023f  */
    /* JADX WARN: Removed duplicated region for block: B:187:0x034a  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x012b A[PHI: r7
      0x012b: PHI (r7v9 float) = (r7v8 float), (r7v12 float) binds: [B:73:0x0159, B:62:0x0124] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0177  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01e5  */
    @Override // defpackage.fx8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long b(long r20, int r22, defpackage.x45 r23) {
        /*
            Method dump skipped, instruction units count: 850
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ep.b(long, int, x45):long");
    }

    @Override // defpackage.fx8
    public final a43 c() {
        return this.i;
    }

    @Override // defpackage.fx8
    public final boolean d() {
        do3 do3Var = this.c;
        EdgeEffect edgeEffect = do3Var.d;
        if (edgeEffect != null) {
            if ((Build.VERSION.SDK_INT >= 31 ? io.i(edgeEffect) : 0.0f) != 0.0f) {
                return true;
            }
        }
        EdgeEffect edgeEffect2 = do3Var.e;
        if (edgeEffect2 != null) {
            if ((Build.VERSION.SDK_INT >= 31 ? io.i(edgeEffect2) : 0.0f) != 0.0f) {
                return true;
            }
        }
        EdgeEffect edgeEffect3 = do3Var.f;
        if (edgeEffect3 != null) {
            if ((Build.VERSION.SDK_INT >= 31 ? io.i(edgeEffect3) : 0.0f) != 0.0f) {
                return true;
            }
        }
        EdgeEffect edgeEffect4 = do3Var.g;
        if (edgeEffect4 != null) {
            return (Build.VERSION.SDK_INT >= 31 ? io.i(edgeEffect4) : 0.0f) != 0.0f;
        }
        return false;
    }

    public final void e() {
        boolean z;
        do3 do3Var = this.c;
        EdgeEffect edgeEffect = do3Var.d;
        boolean z2 = true;
        if (edgeEffect != null) {
            edgeEffect.onRelease();
            z = !edgeEffect.isFinished();
        } else {
            z = false;
        }
        EdgeEffect edgeEffect2 = do3Var.e;
        if (edgeEffect2 != null) {
            edgeEffect2.onRelease();
            z = !edgeEffect2.isFinished() || z;
        }
        EdgeEffect edgeEffect3 = do3Var.f;
        if (edgeEffect3 != null) {
            edgeEffect3.onRelease();
            z = !edgeEffect3.isFinished() || z;
        }
        EdgeEffect edgeEffect4 = do3Var.g;
        if (edgeEffect4 != null) {
            edgeEffect4.onRelease();
            if (edgeEffect4.isFinished() && !z) {
                z2 = false;
            }
            z = z2;
        }
        if (z) {
            g();
        }
    }

    public final long f() {
        long jS = this.b;
        if ((9223372034707292159L & jS) == 9205357640488583168L) {
            jS = hk7.s(this.g);
        }
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jS >> 32)) / Float.intBitsToFloat((int) (this.g >> 32));
        return (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (jS & 4294967295L)) / Float.intBitsToFloat((int) (this.g & 4294967295L)))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }

    public final void g() {
        if (this.e) {
            this.d.setValue(c1e.a);
        }
    }

    public final float h(long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (f() >> 32));
        int i = (int) (j & 4294967295L);
        float fIntBitsToFloat2 = Float.intBitsToFloat(i) / Float.intBitsToFloat((int) (this.g & 4294967295L));
        EdgeEffect edgeEffectB = this.c.b();
        float fO = -fIntBitsToFloat2;
        float f = 1.0f - fIntBitsToFloat;
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 31) {
            fO = io.o(edgeEffectB, fO, f);
        } else {
            edgeEffectB.onPull(fO, f);
        }
        return (i2 >= 31 ? io.i(edgeEffectB) : 0.0f) == 0.0f ? Float.intBitsToFloat((int) (4294967295L & this.g)) * (-fO) : Float.intBitsToFloat(i);
    }

    public final float i(long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (f() & 4294967295L));
        int i = (int) (j >> 32);
        float fIntBitsToFloat2 = Float.intBitsToFloat(i) / Float.intBitsToFloat((int) (this.g >> 32));
        EdgeEffect edgeEffectC = this.c.c();
        float f = 1.0f - fIntBitsToFloat;
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 31) {
            fIntBitsToFloat2 = io.o(edgeEffectC, fIntBitsToFloat2, f);
        } else {
            edgeEffectC.onPull(fIntBitsToFloat2, f);
        }
        return (i2 >= 31 ? io.i(edgeEffectC) : 0.0f) == 0.0f ? Float.intBitsToFloat((int) (this.g >> 32)) * fIntBitsToFloat2 : Float.intBitsToFloat(i);
    }

    public final float j(long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (f() & 4294967295L));
        int i = (int) (j >> 32);
        float fIntBitsToFloat2 = Float.intBitsToFloat(i) / Float.intBitsToFloat((int) (this.g >> 32));
        EdgeEffect edgeEffectD = this.c.d();
        float fO = -fIntBitsToFloat2;
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 31) {
            fO = io.o(edgeEffectD, fO, fIntBitsToFloat);
        } else {
            edgeEffectD.onPull(fO, fIntBitsToFloat);
        }
        return (i2 >= 31 ? io.i(edgeEffectD) : 0.0f) == 0.0f ? Float.intBitsToFloat((int) (this.g >> 32)) * (-fO) : Float.intBitsToFloat(i);
    }

    public final float k(long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (f() >> 32));
        int i = (int) (j & 4294967295L);
        float fIntBitsToFloat2 = Float.intBitsToFloat(i) / Float.intBitsToFloat((int) (this.g & 4294967295L));
        EdgeEffect edgeEffectE = this.c.e();
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 31) {
            fIntBitsToFloat2 = io.o(edgeEffectE, fIntBitsToFloat2, fIntBitsToFloat);
        } else {
            edgeEffectE.onPull(fIntBitsToFloat2, fIntBitsToFloat);
        }
        return (i2 >= 31 ? io.i(edgeEffectE) : 0.0f) == 0.0f ? Float.intBitsToFloat((int) (4294967295L & this.g)) * fIntBitsToFloat2 : Float.intBitsToFloat(i);
    }

    public final void l(long j) {
        boolean zA = dfc.a(this.g, 0L);
        boolean zA2 = dfc.a(j, this.g);
        this.g = j;
        if (!zA2) {
            int iW0 = nk7.w0(Float.intBitsToFloat((int) (j >> 32)));
            long jW0 = (((long) nk7.w0(Float.intBitsToFloat((int) (j & 4294967295L)))) & 4294967295L) | (((long) iW0) << 32);
            do3 do3Var = this.c;
            do3Var.c = jW0;
            EdgeEffect edgeEffect = do3Var.d;
            if (edgeEffect != null) {
                edgeEffect.setSize((int) (jW0 >> 32), (int) (jW0 & 4294967295L));
            }
            EdgeEffect edgeEffect2 = do3Var.e;
            if (edgeEffect2 != null) {
                edgeEffect2.setSize((int) (jW0 >> 32), (int) (jW0 & 4294967295L));
            }
            EdgeEffect edgeEffect3 = do3Var.f;
            if (edgeEffect3 != null) {
                edgeEffect3.setSize((int) (jW0 & 4294967295L), (int) (jW0 >> 32));
            }
            EdgeEffect edgeEffect4 = do3Var.g;
            if (edgeEffect4 != null) {
                edgeEffect4.setSize((int) (jW0 & 4294967295L), (int) (jW0 >> 32));
            }
            EdgeEffect edgeEffect5 = do3Var.h;
            if (edgeEffect5 != null) {
                edgeEffect5.setSize((int) (jW0 >> 32), (int) (jW0 & 4294967295L));
            }
            EdgeEffect edgeEffect6 = do3Var.i;
            if (edgeEffect6 != null) {
                edgeEffect6.setSize((int) (jW0 >> 32), (int) (jW0 & 4294967295L));
            }
            EdgeEffect edgeEffect7 = do3Var.j;
            if (edgeEffect7 != null) {
                edgeEffect7.setSize((int) (jW0 & 4294967295L), (int) (jW0 >> 32));
            }
            EdgeEffect edgeEffect8 = do3Var.k;
            if (edgeEffect8 != null) {
                edgeEffect8.setSize((int) (4294967295L & jW0), (int) (jW0 >> 32));
            }
        }
        if (zA || zA2) {
            return;
        }
        e();
    }
}
