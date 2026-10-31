package com.google.android.gms.internal.measurement;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class y2 {

    /* renamed from: f, reason: collision with root package name */
    public static final y2 f33241f = new y2(0, new int[0], new Object[0], false);

    /* renamed from: a, reason: collision with root package name */
    public int f33242a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f33243b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f33244c;

    /* renamed from: d, reason: collision with root package name */
    public int f33245d = -1;

    /* renamed from: e, reason: collision with root package name */
    public boolean f33246e;

    public y2(int i5, int[] iArr, Object[] objArr, boolean z11) {
        this.f33242a = i5;
        this.f33243b = iArr;
        this.f33244c = objArr;
        this.f33246e = z11;
    }

    public static y2 a() {
        return new y2(0, new int[8], new Object[8], true);
    }

    public final void b(d2 d2Var) {
        c1 c1Var = (c1) d2Var.f32451b;
        if (this.f33242a != 0) {
            for (int i5 = 0; i5 < this.f33242a; i5++) {
                int i11 = this.f33243b[i5];
                Object obj = this.f33244c[i5];
                int i12 = i11 & 7;
                int i13 = i11 >>> 3;
                if (i12 == 0) {
                    c1Var.v(i13, ((Long) obj).longValue());
                } else if (i12 == 1) {
                    c1Var.w(i13, ((Long) obj).longValue());
                } else if (i12 == 2) {
                    c1Var.z(i13, (v0) obj);
                } else if (i12 == 3) {
                    c1Var.r(i13, 3);
                    ((y2) obj).b(d2Var);
                    c1Var.r(i13, 4);
                } else {
                    if (i12 != 5) {
                        throw new RuntimeException(new zzaeg());
                    }
                    c1Var.u(i13, ((Integer) obj).intValue());
                }
            }
        }
    }

    public final int c() {
        int iP;
        int iQ;
        int iP2;
        int i5 = this.f33245d;
        if (i5 != -1) {
            return i5;
        }
        int iF = 0;
        for (int i11 = 0; i11 < this.f33242a; i11++) {
            int i12 = this.f33243b[i11];
            int i13 = i12 >>> 3;
            int i14 = i12 & 7;
            if (i14 != 0) {
                if (i14 == 1) {
                    ((Long) this.f33244c[i11]).getClass();
                    iP2 = c1.p(i13 << 3) + 8;
                } else if (i14 == 2) {
                    int i15 = i13 << 3;
                    v0 v0Var = (v0) this.f33244c[i11];
                    int iP3 = c1.p(i15);
                    int iD = v0Var.d();
                    iF = k2.f(iD, iD, iP3, iF);
                } else if (i14 == 3) {
                    int iP4 = c1.p(i13 << 3);
                    iP = iP4 + iP4;
                    iQ = ((y2) this.f33244c[i11]).c();
                } else {
                    if (i14 != 5) {
                        throw new IllegalStateException(new zzaeg());
                    }
                    ((Integer) this.f33244c[i11]).getClass();
                    iP2 = c1.p(i13 << 3) + 4;
                }
                iF = iP2 + iF;
            } else {
                int i16 = i13 << 3;
                long jLongValue = ((Long) this.f33244c[i11]).longValue();
                iP = c1.p(i16);
                iQ = c1.q(jLongValue);
            }
            iF = iQ + iP + iF;
        }
        this.f33245d = iF;
        return iF;
    }

    public final void d(int i5, Object obj) {
        if (!this.f33246e) {
            throw new UnsupportedOperationException();
        }
        e(this.f33242a + 1);
        int[] iArr = this.f33243b;
        int i11 = this.f33242a;
        iArr[i11] = i5;
        this.f33244c[i11] = obj;
        this.f33242a = i11 + 1;
    }

    public final void e(int i5) {
        int[] iArr = this.f33243b;
        if (i5 > iArr.length) {
            int i11 = this.f33242a;
            int i12 = (i11 / 2) + i11;
            if (i12 >= i5) {
                i5 = i12;
            }
            if (i5 < 8) {
                i5 = 8;
            }
            this.f33243b = Arrays.copyOf(iArr, i5);
            this.f33244c = Arrays.copyOf(this.f33244c, i5);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof y2)) {
            return false;
        }
        y2 y2Var = (y2) obj;
        int i5 = this.f33242a;
        if (i5 == y2Var.f33242a) {
            int[] iArr = this.f33243b;
            int[] iArr2 = y2Var.f33243b;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    Object[] objArr = this.f33244c;
                    Object[] objArr2 = y2Var.f33244c;
                    int i12 = this.f33242a;
                    for (int i13 = 0; i13 < i12; i13++) {
                        if (objArr[i13].equals(objArr2[i13])) {
                        }
                    }
                    return true;
                }
                if (iArr[i11] != iArr2[i11]) {
                    break;
                }
                i11++;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = this.f33242a;
        int i11 = i5 + 527;
        int[] iArr = this.f33243b;
        int iHashCode = 17;
        int i12 = 17;
        for (int i13 = 0; i13 < i5; i13++) {
            i12 = (i12 * 31) + iArr[i13];
        }
        int i14 = ((i11 * 31) + i12) * 31;
        Object[] objArr = this.f33244c;
        int i15 = this.f33242a;
        for (int i16 = 0; i16 < i15; i16++) {
            iHashCode = (iHashCode * 31) + objArr[i16].hashCode();
        }
        return i14 + iHashCode;
    }
}
