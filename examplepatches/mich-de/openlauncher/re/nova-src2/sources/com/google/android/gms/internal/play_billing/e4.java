package com.google.android.gms.internal.play_billing;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class e4 {

    /* renamed from: f, reason: collision with root package name */
    public static final e4 f33387f = new e4(0, new int[0], new Object[0], false);

    /* renamed from: a, reason: collision with root package name */
    public int f33388a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f33389b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f33390c;

    /* renamed from: d, reason: collision with root package name */
    public int f33391d = -1;

    /* renamed from: e, reason: collision with root package name */
    public boolean f33392e;

    public e4(int i5, int[] iArr, Object[] objArr, boolean z11) {
        this.f33388a = i5;
        this.f33389b = iArr;
        this.f33390c = objArr;
        this.f33392e = z11;
    }

    public static e4 b() {
        return new e4(0, new int[8], new Object[8], true);
    }

    public final int a() {
        int iD0;
        int iE0;
        int iD02;
        int i5 = this.f33391d;
        if (i5 != -1) {
            return i5;
        }
        int iB = 0;
        for (int i11 = 0; i11 < this.f33388a; i11++) {
            int i12 = this.f33389b[i11];
            int i13 = i12 >>> 3;
            int i14 = i12 & 7;
            if (i14 != 0) {
                if (i14 == 1) {
                    ((Long) this.f33390c[i11]).getClass();
                    iD02 = n2.D0(i13 << 3) + 8;
                } else if (i14 == 2) {
                    int i15 = i13 << 3;
                    l2 l2Var = (l2) this.f33390c[i11];
                    int iD03 = n2.D0(i15);
                    int iF = l2Var.f();
                    iB = com.google.android.gms.internal.measurement.k2.B(iF, iF, iD03, iB);
                } else if (i14 == 3) {
                    int iD04 = n2.D0(i13 << 3);
                    iD0 = iD04 + iD04;
                    iE0 = ((e4) this.f33390c[i11]).a();
                } else {
                    if (i14 != 5) {
                        throw new IllegalStateException(new zzgb());
                    }
                    ((Integer) this.f33390c[i11]).getClass();
                    iD02 = n2.D0(i13 << 3) + 4;
                }
                iB = iD02 + iB;
            } else {
                int i16 = i13 << 3;
                long jLongValue = ((Long) this.f33390c[i11]).longValue();
                iD0 = n2.D0(i16);
                iE0 = n2.E0(jLongValue);
            }
            iB = iE0 + iD0 + iB;
        }
        this.f33391d = iB;
        return iB;
    }

    public final void c(int i5, Object obj) {
        if (!this.f33392e) {
            throw new UnsupportedOperationException();
        }
        e(this.f33388a + 1);
        int[] iArr = this.f33389b;
        int i11 = this.f33388a;
        iArr[i11] = i5;
        this.f33390c[i11] = obj;
        this.f33388a = i11 + 1;
    }

    public final void d(k3 k3Var) throws zzfa {
        n2 n2Var = (n2) k3Var.f33440a;
        if (this.f33388a != 0) {
            for (int i5 = 0; i5 < this.f33388a; i5++) {
                int i11 = this.f33389b[i5];
                Object obj = this.f33390c[i5];
                int i12 = i11 & 7;
                int i13 = i11 >>> 3;
                if (i12 == 0) {
                    n2Var.B0(i13, ((Long) obj).longValue());
                } else if (i12 == 1) {
                    n2Var.t0(i13, ((Long) obj).longValue());
                } else if (i12 == 2) {
                    n2Var.q0(i13, (l2) obj);
                } else if (i12 == 3) {
                    n2Var.y0(i13, 3);
                    ((e4) obj).d(k3Var);
                    n2Var.y0(i13, 4);
                } else {
                    if (i12 != 5) {
                        throw new RuntimeException(new zzgb());
                    }
                    n2Var.r0(i13, ((Integer) obj).intValue());
                }
            }
        }
    }

    public final void e(int i5) {
        int[] iArr = this.f33389b;
        if (i5 > iArr.length) {
            int i11 = this.f33388a;
            int i12 = (i11 / 2) + i11;
            if (i12 >= i5) {
                i5 = i12;
            }
            if (i5 < 8) {
                i5 = 8;
            }
            this.f33389b = Arrays.copyOf(iArr, i5);
            this.f33390c = Arrays.copyOf(this.f33390c, i5);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof e4)) {
            return false;
        }
        e4 e4Var = (e4) obj;
        int i5 = this.f33388a;
        if (i5 == e4Var.f33388a) {
            int[] iArr = this.f33389b;
            int[] iArr2 = e4Var.f33389b;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    Object[] objArr = this.f33390c;
                    Object[] objArr2 = e4Var.f33390c;
                    int i12 = this.f33388a;
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
        int i5 = this.f33388a;
        int i11 = i5 + 527;
        int[] iArr = this.f33389b;
        int iHashCode = 17;
        int i12 = 17;
        for (int i13 = 0; i13 < i5; i13++) {
            i12 = (i12 * 31) + iArr[i13];
        }
        int i14 = ((i11 * 31) + i12) * 31;
        Object[] objArr = this.f33390c;
        int i15 = this.f33388a;
        for (int i16 = 0; i16 < i15; i16++) {
            iHashCode = (iHashCode * 31) + objArr[i16].hashCode();
        }
        return i14 + iHashCode;
    }
}
