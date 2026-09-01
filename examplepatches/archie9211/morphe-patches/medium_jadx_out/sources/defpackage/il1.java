package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class il1 {
    public final /* synthetic */ int a;
    public long b;
    public Object c;

    public il1(yua yuaVar) {
        this.a = 1;
        this.c = yuaVar;
        this.b = 262144L;
    }

    public void a(int i) {
        if (i < 64) {
            this.b &= ~(1 << i);
            return;
        }
        il1 il1Var = (il1) this.c;
        if (il1Var != null) {
            il1Var.a(i - 64);
        }
    }

    public int b(int i) {
        il1 il1Var = (il1) this.c;
        if (il1Var == null) {
            long j = this.b;
            return i >= 64 ? Long.bitCount(j) : Long.bitCount(((1 << i) - 1) & j);
        }
        if (i < 64) {
            return Long.bitCount(((1 << i) - 1) & this.b);
        }
        return Long.bitCount(this.b) + il1Var.b(i - 64);
    }

    public void c() {
        if (((il1) this.c) == null) {
            this.c = new il1();
        }
    }

    public boolean d(int i) {
        if (i < 64) {
            return ((1 << i) & this.b) != 0;
        }
        c();
        return ((il1) this.c).d(i - 64);
    }

    public long e(float f, long j, boolean z) {
        long jE;
        long j2 = this.b;
        if (z) {
            jE = ip8.e(j2, j);
            this.b = jE;
        } else {
            jE = ip8.e(j2, j);
        }
        if ((((hw8) this.c) == null ? ip8.c(jE) : Math.abs(g(jE))) < f) {
            return 9205357640488583168L;
        }
        hw8 hw8Var = (hw8) this.c;
        long j3 = this.b;
        if (hw8Var == null) {
            float fC = ip8.c(j3);
            float fIntBitsToFloat = Float.intBitsToFloat((int) (j3 >> 32)) / fC;
            return ip8.d(this.b, ip8.f(f, (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j3 & 4294967295L)) / fC)) & 4294967295L) | (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32)));
        }
        float fG = g(j3) - (Math.signum(g(this.b)) * f);
        long j4 = this.b;
        hw8 hw8Var2 = (hw8) this.c;
        hw8 hw8Var3 = hw8.Horizontal;
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (hw8Var2 == hw8Var3 ? j4 & 4294967295L : j4 >> 32));
        if (((hw8) this.c) != hw8Var3) {
            return (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) << 32) | (((long) Float.floatToRawIntBits(fG)) & 4294967295L);
        }
        return (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L) | (((long) Float.floatToRawIntBits(fG)) << 32);
    }

    public void f(int i, boolean z) {
        if (i >= 64) {
            c();
            ((il1) this.c).f(i - 64, z);
            return;
        }
        long j = this.b;
        boolean z2 = (Long.MIN_VALUE & j) != 0;
        long j2 = (1 << i) - 1;
        this.b = ((j & (~j2)) << 1) | (j & j2);
        if (z) {
            j(i);
        } else {
            a(i);
        }
        if (z2 || ((il1) this.c) != null) {
            c();
            ((il1) this.c).f(0, z2);
        }
    }

    public float g(long j) {
        return Float.intBitsToFloat(((hw8) this.c) == hw8.Horizontal ? (int) (j >> 32) : (int) (j & 4294967295L));
    }

    public boolean h(int i) {
        if (i >= 64) {
            c();
            return ((il1) this.c).h(i - 64);
        }
        long j = 1 << i;
        long j2 = this.b;
        boolean z = (j2 & j) != 0;
        long j3 = j2 & (~j);
        this.b = j3;
        long j4 = j - 1;
        this.b = (j3 & j4) | Long.rotateRight((~j4) & j3, 1);
        il1 il1Var = (il1) this.c;
        if (il1Var != null) {
            if (il1Var.d(0)) {
                j(63);
            }
            ((il1) this.c).h(0);
        }
        return z;
    }

    public void i() {
        this.b = 0L;
        il1 il1Var = (il1) this.c;
        if (il1Var != null) {
            il1Var.i();
        }
    }

    public void j(int i) {
        if (i < 64) {
            this.b |= 1 << i;
        } else {
            c();
            ((il1) this.c).j(i - 64);
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                if (((il1) this.c) == null) {
                    return Long.toBinaryString(this.b);
                }
                return ((il1) this.c).toString() + "xx" + Long.toBinaryString(this.b);
            default:
                return super.toString();
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public il1(hw8 hw8Var) {
        this(0L, hw8Var);
        this.a = 2;
    }

    public il1() {
        this.a = 0;
        this.b = 0L;
    }

    public il1(long j, hw8 hw8Var) {
        this.a = 2;
        this.c = hw8Var;
        this.b = j;
    }
}
