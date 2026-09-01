package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yuf {
    public static final yuf f = new yuf(0, new int[0], new Object[0], false);
    public int a;
    public int[] b;
    public Object[] c;
    public int d = -1;
    public boolean e;

    public yuf(int i, int[] iArr, Object[] objArr, boolean z) {
        this.a = i;
        this.b = iArr;
        this.c = objArr;
        this.e = z;
    }

    public static yuf e() {
        return new yuf(0, new int[8], new Object[8], true);
    }

    public final int a() {
        int iV;
        int iT;
        int i = this.d;
        if (i != -1) {
            return i;
        }
        int iZ = 0;
        for (int i2 = 0; i2 < this.a; i2++) {
            int i3 = this.b[i2];
            int i4 = i3 >>> 3;
            int i5 = i3 & 7;
            if (i5 != 0) {
                if (i5 == 1) {
                    ((Long) this.c[i2]).getClass();
                    iZ = wgd.z(i4 << 3, 8, iZ);
                } else if (i5 == 2) {
                    iZ = htf.o(i4, (hsf) this.c[i2]) + iZ;
                } else if (i5 == 3) {
                    iV = htf.u(i4) << 1;
                    iT = ((yuf) this.c[i2]).a();
                } else {
                    if (i5 != 5) {
                        throw new IllegalStateException(zzale.a());
                    }
                    ((Integer) this.c[i2]).getClass();
                    iZ = wgd.z(i4 << 3, 4, iZ);
                }
            } else {
                long jLongValue = ((Long) this.c[i2]).longValue();
                iV = htf.v(i4 << 3);
                iT = htf.t(jLongValue);
            }
            iZ = iT + iV + iZ;
        }
        this.d = iZ;
        return iZ;
    }

    public final void b(int i) {
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

    public final void c(int i, Object obj) {
        if (!this.e) {
            rd6.b();
            return;
        }
        b(this.a + 1);
        int[] iArr = this.b;
        int i2 = this.a;
        iArr[i2] = i;
        this.c[i2] = obj;
        this.a = i2 + 1;
    }

    public final void d(ujf ujfVar) {
        if (this.a == 0) {
            return;
        }
        for (int i = 0; i < this.a; i++) {
            int i2 = this.b[i];
            Object obj = this.c[i];
            htf htfVar = (htf) ujfVar.b;
            int i3 = i2 >>> 3;
            int i4 = i2 & 7;
            if (i4 == 0) {
                htfVar.m(i3, ((Long) obj).longValue());
            } else if (i4 == 1) {
                htfVar.e(i3, ((Long) obj).longValue());
            } else if (i4 == 2) {
                htfVar.g(i3, (hsf) obj);
            } else if (i4 == 3) {
                htfVar.r(i3, 3);
                ((yuf) obj).d(ujfVar);
                htfVar.r(i3, 4);
            } else {
                if (i4 != 5) {
                    ik4.j(zzale.a());
                    return;
                }
                htfVar.d(i3, ((Integer) obj).intValue());
            }
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof yuf)) {
            return false;
        }
        yuf yufVar = (yuf) obj;
        int i = this.a;
        if (i == yufVar.a) {
            int[] iArr = this.b;
            int[] iArr2 = yufVar.b;
            int i2 = 0;
            while (true) {
                if (i2 >= i) {
                    Object[] objArr = this.c;
                    Object[] objArr2 = yufVar.c;
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
        return false;
    }

    public final int hashCode() {
        int i = this.a;
        int i2 = (i + 527) * 31;
        int[] iArr = this.b;
        int iHashCode = 17;
        int i3 = 17;
        for (int i4 = 0; i4 < i; i4++) {
            i3 = (i3 * 31) + iArr[i4];
        }
        int i5 = (i2 + i3) * 31;
        Object[] objArr = this.c;
        int i6 = this.a;
        for (int i7 = 0; i7 < i6; i7++) {
            iHashCode = (iHashCode * 31) + objArr[i7].hashCode();
        }
        return i5 + iHashCode;
    }
}
