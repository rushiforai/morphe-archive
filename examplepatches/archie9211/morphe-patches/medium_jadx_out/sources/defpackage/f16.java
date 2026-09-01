package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f16 {
    public final el3 a;
    public a16 b;
    public d16 c;
    public c16 d;
    public b16 e;
    public r40 f;
    public nec g;
    public long h = 9205357640488583168L;
    public il1 i;
    public final ad j;
    public final ad k;
    public long l;

    public f16(el3 el3Var) {
        this.a = el3Var;
        ad adVar = new ad((char) 0, 6);
        adVar.c = new x68();
        this.j = adVar;
        ad adVar2 = new ad((char) 0, 11);
        adVar2.c = new o68();
        this.k = adVar2;
        this.l = 0L;
    }

    public static void c(f16 f16Var, y06 y06Var, long j, long j2, int i) {
        if ((i & 4) != 0) {
            j2 = 0;
        }
        el3 el3Var = f16Var.a;
        c16 c16Var = f16Var.d;
        if (c16Var == null) {
            c16Var = new c16();
            c16Var.q = null;
            c16Var.r = Long.MAX_VALUE;
            c16Var.s = false;
            f16Var.d = c16Var;
        }
        c16Var.q = y06Var;
        c16Var.r = j;
        il1 il1Var = f16Var.i;
        hw8 hw8Var = el3Var.q;
        if (il1Var == null) {
            f16Var.i = new il1(hw8Var);
        } else {
            il1Var.c = hw8Var;
            il1Var.b = j2;
        }
        c16Var.s = false;
        f16Var.f = c16Var;
    }

    public final void a() {
        a16 a16Var = this.b;
        if (a16Var == null) {
            z06 z06Var = z06.NotInitialized;
            a16Var = new a16();
            a16Var.q = z06Var;
            a16Var.r = false;
            this.b = a16Var;
        }
        a16Var.q = z06.NotInitialized;
        a16Var.r = false;
        this.f = a16Var;
    }

    public final void b(y06 y06Var, long j, il1 il1Var) {
        b16 b16Var = this.e;
        if (b16Var == null) {
            b16Var = new b16();
            b16Var.q = null;
            b16Var.r = Long.MAX_VALUE;
            this.e = b16Var;
        }
        b16Var.q = y06Var;
        b16Var.r = j;
        il1Var.b = 0L;
        this.f = b16Var;
    }

    public final nec d() {
        nec necVar = this.g;
        if (necVar != null) {
            return necVar;
        }
        ay0.e("Velocity Tracker not initialized.");
        return null;
    }

    public final void e(y06 y06Var, x06 x06Var, long j) {
        el3 el3Var = this.a;
        long jP = flb.u0(el3Var).p(0L);
        if (!ip8.b(this.h, 9205357640488583168L) && !ip8.b(jP, this.h)) {
            this.l = ip8.e(this.l, ip8.d(jP, this.h));
        }
        this.h = jP;
        hw8 hw8Var = el3Var.q;
        hw8Var.getClass();
        ol3 ol3Var = pl3.a;
        if (Math.abs(Float.intBitsToFloat((int) (hw8Var == hw8.Vertical ? j & 4294967295L : j >> 32))) > 2.0f) {
            t40.A(d(), y06Var, el3Var.q, x06Var, this.j, this.l);
            ad adVar = this.k;
            o68 o68Var = (o68) adVar.c;
            int i = o68Var.b;
            if (i == 3) {
                int i2 = adVar.b;
                adVar.b = i2 + 1;
                if (i2 < 0 || i2 >= i) {
                    z10.i("Index must be between 0 and size");
                    return;
                } else {
                    long[] jArr = o68Var.a;
                    long j2 = jArr[i2];
                    jArr[i2] = j;
                }
            } else {
                o68Var.a(j);
            }
            if (adVar.b == 3) {
                adVar.b = 0;
            }
            long[] jArr2 = o68Var.a;
            int i3 = o68Var.b;
            float fIntBitsToFloat = 0.0f;
            float fIntBitsToFloat2 = 0.0f;
            for (int i4 = 0; i4 < i3; i4++) {
                fIntBitsToFloat2 += Float.intBitsToFloat((int) (jArr2[i4] >> 32));
            }
            int i5 = o68Var.b;
            float f = fIntBitsToFloat2 / i5;
            long[] jArr3 = o68Var.a;
            for (int i6 = 0; i6 < i5; i6++) {
                fIntBitsToFloat += Float.intBitsToFloat((int) (jArr3[i6] & 4294967295L));
            }
            el3Var.Q0(new lk3((((long) Float.floatToRawIntBits(f)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat / o68Var.b)) & 4294967295L), true));
        }
    }

    public final void f(y06 y06Var, y06 y06Var2, x06 x06Var, long j) {
        if (this.g == null) {
            this.g = new nec(5, (byte) 0);
        }
        this.l = 0L;
        nec necVarD = d();
        el3 el3Var = this.a;
        t40.A(necVarD, y06Var, el3Var.q, x06Var, this.j, this.l);
        long jD = ip8.d(t40.K(y06Var2, el3Var.q, x06Var), j);
        if (((Boolean) el3Var.r.invoke(new ac9(1))).booleanValue()) {
            this.h = flb.u0(el3Var).p(0L);
            el3Var.Q0(new mk3(jD));
        }
        ad adVar = this.k;
        adVar.b = 0;
        ((o68) adVar.c).b = 0;
    }
}
