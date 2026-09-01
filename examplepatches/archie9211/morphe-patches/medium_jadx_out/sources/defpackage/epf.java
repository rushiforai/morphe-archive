package defpackage;

import com.google.android.recaptcha.internal.zzacz;
import com.google.android.recaptcha.internal.zzaej;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class epf {
    public static final epf f = new epf(0, new int[0], new Object[0], false);
    public int a;
    public int[] b;
    public Object[] c;
    public int d = -1;
    public boolean e;

    public epf(int i, int[] iArr, Object[] objArr, boolean z) {
        this.a = i;
        this.b = iArr;
        this.c = objArr;
        this.e = z;
    }

    public static epf a() {
        return new epf(0, new int[8], new Object[8], true);
    }

    public final void b(ujf ujfVar) throws zzacz {
        h30 h30Var = (h30) ujfVar.b;
        if (this.a != 0) {
            for (int i = 0; i < this.a; i++) {
                int i2 = this.b[i];
                Object obj = this.c[i];
                int i3 = i2 >>> 3;
                int i4 = i2 & 7;
                if (i4 == 0) {
                    h30Var.S(i3, ((Long) obj).longValue());
                } else if (i4 == 1) {
                    h30Var.T(i3, ((Long) obj).longValue());
                } else if (i4 == 2) {
                    h30Var.V(i3, (pmf) obj);
                } else if (i4 == 3) {
                    h30Var.O(i3, 3);
                    ((epf) obj).b(ujfVar);
                    h30Var.O(i3, 4);
                } else {
                    if (i4 != 5) {
                        ik4.j(new zzaej());
                        return;
                    }
                    h30Var.R(i3, ((Integer) obj).intValue());
                }
            }
        }
    }

    public final int c() {
        int iC0;
        int iD0;
        int iC02;
        int i = this.d;
        if (i != -1) {
            return i;
        }
        int iM = 0;
        for (int i2 = 0; i2 < this.a; i2++) {
            int i3 = this.b[i2];
            int i4 = i3 >>> 3;
            int i5 = i3 & 7;
            if (i5 != 0) {
                if (i5 == 1) {
                    ((Long) this.c[i2]).getClass();
                    iC02 = h30.c0(i4 << 3) + 8;
                } else if (i5 == 2) {
                    int i6 = i4 << 3;
                    pmf pmfVar = (pmf) this.c[i2];
                    int iC03 = h30.c0(i6);
                    int iM2 = pmfVar.m();
                    iM = wgd.m(iM2, iM2, iC03, iM);
                } else if (i5 == 3) {
                    int iC04 = h30.c0(i4 << 3);
                    iC0 = iC04 + iC04;
                    iD0 = ((epf) this.c[i2]).c();
                } else {
                    if (i5 != 5) {
                        throw new IllegalStateException(new zzaej());
                    }
                    ((Integer) this.c[i2]).getClass();
                    iC02 = h30.c0(i4 << 3) + 4;
                }
                iM = iC02 + iM;
            } else {
                int i7 = i4 << 3;
                long jLongValue = ((Long) this.c[i2]).longValue();
                iC0 = h30.c0(i7);
                iD0 = h30.d0(jLongValue);
            }
            iM = iD0 + iC0 + iM;
        }
        this.d = iM;
        return iM;
    }

    public final void d(int i, Object obj) {
        if (!this.e) {
            rd6.b();
            return;
        }
        e(this.a + 1);
        int[] iArr = this.b;
        int i2 = this.a;
        iArr[i2] = i;
        this.c[i2] = obj;
        this.a = i2 + 1;
    }

    public final void e(int i) {
        int[] iArr = this.b;
        if (i > iArr.length) {
            int i2 = this.a;
            int i3 = (i2 / 2) + i2;
            if (i3 >= i) {
                i = i3;
            }
            if (i < 8) {
                i = 8;
            }
            this.b = Arrays.copyOf(iArr, i);
            this.c = Arrays.copyOf(this.c, i);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof epf)) {
            epf epfVar = (epf) obj;
            int i = this.a;
            if (i == epfVar.a) {
                int[] iArr = this.b;
                int[] iArr2 = epfVar.b;
                int i2 = 0;
                while (true) {
                    if (i2 >= i) {
                        Object[] objArr = this.c;
                        Object[] objArr2 = epfVar.c;
                        int i3 = this.a;
                        for (int i4 = 0; i4 < i3; i4++) {
                            if (objArr[i4].equals(objArr2[i4])) {
                            }
                        }
                        return true;
                    }
                    if (iArr[i2] != iArr2[i2]) {
                        break;
                    }
                    i2++;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        int i = this.a;
        int i2 = i + 527;
        int[] iArr = this.b;
        int iHashCode = 17;
        int i3 = 17;
        for (int i4 = 0; i4 < i; i4++) {
            i3 = (i3 * 31) + iArr[i4];
        }
        int i5 = ((i2 * 31) + i3) * 31;
        Object[] objArr = this.c;
        int i6 = this.a;
        for (int i7 = 0; i7 < i6; i7++) {
            iHashCode = (iHashCode * 31) + objArr[i7].hashCode();
        }
        return i5 + iHashCode;
    }
}
