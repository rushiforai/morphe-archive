package defpackage;

import com.google.android.gms.internal.play_billing.zzfm;
import com.google.android.gms.internal.play_billing.zzgr;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c9g {
    public static final c9g f = new c9g(0, new int[0], new Object[0], false);
    public int a;
    public int[] b;
    public Object[] c;
    public int d = -1;
    public boolean e;

    public c9g(int i, int[] iArr, Object[] objArr, boolean z) {
        this.a = i;
        this.b = iArr;
        this.c = objArr;
        this.e = z;
    }

    public static c9g b() {
        return new c9g(0, new int[8], new Object[8], true);
    }

    public final int a() {
        int iP;
        int iQ;
        int iP2;
        int i = this.d;
        if (i != -1) {
            return i;
        }
        int iA = 0;
        for (int i2 = 0; i2 < this.a; i2++) {
            int i3 = this.b[i2];
            int i4 = i3 >>> 3;
            int i5 = i3 & 7;
            if (i5 != 0) {
                if (i5 == 1) {
                    ((Long) this.c[i2]).getClass();
                    iP2 = c4g.p(i4 << 3) + 8;
                } else if (i5 == 2) {
                    int i6 = i4 << 3;
                    t3g t3gVar = (t3g) this.c[i2];
                    int iP3 = c4g.p(i6);
                    int iF = t3gVar.f();
                    iA = wgd.A(iF, iF, iP3, iA);
                } else if (i5 == 3) {
                    int iP4 = c4g.p(i4 << 3);
                    iP = iP4 + iP4;
                    iQ = ((c9g) this.c[i2]).a();
                } else {
                    if (i5 != 5) {
                        throw new IllegalStateException(new zzgr());
                    }
                    ((Integer) this.c[i2]).getClass();
                    iP2 = c4g.p(i4 << 3) + 4;
                }
                iA = iP2 + iA;
            } else {
                int i7 = i4 << 3;
                long jLongValue = ((Long) this.c[i2]).longValue();
                iP = c4g.p(i7);
                iQ = c4g.q(jLongValue);
            }
            iA = iQ + iP + iA;
        }
        this.d = iA;
        return iA;
    }

    public final void c(int i, Object obj) {
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

    public final void d(ujf ujfVar) throws zzfm {
        c4g c4gVar = (c4g) ujfVar.b;
        if (this.a != 0) {
            for (int i = 0; i < this.a; i++) {
                int i2 = this.b[i];
                Object obj = this.c[i];
                int i3 = i2 & 7;
                int i4 = i2 >>> 3;
                if (i3 == 0) {
                    c4gVar.n(i4, ((Long) obj).longValue());
                } else if (i3 == 1) {
                    c4gVar.f(i4, ((Long) obj).longValue());
                } else if (i3 == 2) {
                    t3g t3gVar = (t3g) obj;
                    c4gVar.m((i4 << 3) | 2);
                    c4gVar.m(t3gVar.f());
                    t3gVar.q(c4gVar);
                } else if (i3 == 3) {
                    c4gVar.k(i4, 3);
                    ((c9g) obj).d(ujfVar);
                    c4gVar.k(i4, 4);
                } else {
                    if (i3 != 5) {
                        ik4.j(new zzgr());
                        return;
                    }
                    c4gVar.d(i4, ((Integer) obj).intValue());
                }
            }
        }
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
        if (obj != null && (obj instanceof c9g)) {
            c9g c9gVar = (c9g) obj;
            int i = this.a;
            if (i == c9gVar.a) {
                int[] iArr = this.b;
                int[] iArr2 = c9gVar.b;
                int i2 = 0;
                while (true) {
                    if (i2 >= i) {
                        Object[] objArr = this.c;
                        Object[] objArr2 = c9gVar.c;
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
