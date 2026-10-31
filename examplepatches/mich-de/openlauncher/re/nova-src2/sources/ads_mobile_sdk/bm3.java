package ads_mobile_sdk;

import java.util.Arrays;

/* loaded from: classes2.dex */
public final class bm3 {

    /* renamed from: f, reason: collision with root package name */
    public static final bm3 f1463f = new bm3(0, new int[0], new Object[0], false);

    /* renamed from: a, reason: collision with root package name */
    public int f1464a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f1465b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f1466c;

    /* renamed from: d, reason: collision with root package name */
    public int f1467d = -1;

    /* renamed from: e, reason: collision with root package name */
    public boolean f1468e;

    public bm3(int i5, int[] iArr, Object[] objArr, boolean z11) {
        this.f1464a = i5;
        this.f1465b = iArr;
        this.f1466c = objArr;
        this.f1468e = z11;
    }

    public static bm3 b() {
        return new bm3(0, new int[8], new Object[8], true);
    }

    public final void a(int i5) {
        int[] iArr = this.f1465b;
        if (i5 > iArr.length) {
            int i11 = this.f1464a;
            int i12 = (i11 / 2) + i11;
            if (i12 >= i5) {
                i5 = i12;
            }
            if (i5 < 8) {
                i5 = 8;
            }
            this.f1465b = Arrays.copyOf(iArr, i5);
            this.f1466c = Arrays.copyOf(this.f1466c, i5);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof bm3)) {
            return false;
        }
        bm3 bm3Var = (bm3) obj;
        int i5 = this.f1464a;
        if (i5 == bm3Var.f1464a) {
            int[] iArr = this.f1465b;
            int[] iArr2 = bm3Var.f1465b;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    Object[] objArr = this.f1466c;
                    Object[] objArr2 = bm3Var.f1466c;
                    int i12 = this.f1464a;
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
        int i5 = this.f1464a;
        int i11 = (i5 + 527) * 31;
        int[] iArr = this.f1465b;
        int iHashCode = 17;
        int i12 = 17;
        for (int i13 = 0; i13 < i5; i13++) {
            i12 = (i12 * 31) + iArr[i13];
        }
        int i14 = (i11 + i12) * 31;
        Object[] objArr = this.f1466c;
        int i15 = this.f1464a;
        for (int i16 = 0; i16 < i15; i16++) {
            iHashCode = (iHashCode * 31) + objArr[i16].hashCode();
        }
        return i14 + iHashCode;
    }

    public final int a() {
        int iH;
        int i5 = this.f1467d;
        if (i5 != -1) {
            return i5;
        }
        int iA = 0;
        for (int i11 = 0; i11 < this.f1464a; i11++) {
            int i12 = this.f1465b[i11];
            int i13 = i12 >>> 3;
            int i14 = i12 & 7;
            if (i14 == 0) {
                iH = yu.h(i13) + yu.a(((Long) this.f1466c[i11]).longValue());
            } else if (i14 == 1) {
                ((Long) this.f1466c[i11]).getClass();
                iH = yu.h(i13) + 8;
            } else if (i14 == 2) {
                iH = yu.a((sq) this.f1466c[i11]) + yu.h(i13);
            } else if (i14 == 3) {
                iA = ((bm3) this.f1466c[i11]).a() + (yu.h(i13) * 2) + iA;
            } else if (i14 == 5) {
                ((Integer) this.f1466c[i11]).getClass();
                iH = yu.h(i13) + 4;
            } else {
                int i15 = yi1.f12028b;
                throw new IllegalStateException(new xi1());
            }
            iA = iH + iA;
        }
        this.f1467d = iA;
        return iA;
    }

    public static bm3 a(bm3 bm3Var, bm3 bm3Var2) {
        int i5 = bm3Var.f1464a + bm3Var2.f1464a;
        int[] iArrCopyOf = Arrays.copyOf(bm3Var.f1465b, i5);
        System.arraycopy(bm3Var2.f1465b, 0, iArrCopyOf, bm3Var.f1464a, bm3Var2.f1464a);
        Object[] objArrCopyOf = Arrays.copyOf(bm3Var.f1466c, i5);
        System.arraycopy(bm3Var2.f1466c, 0, objArrCopyOf, bm3Var.f1464a, bm3Var2.f1464a);
        return new bm3(i5, iArrCopyOf, objArrCopyOf, true);
    }

    public final void a(int i5, Object obj) {
        if (this.f1468e) {
            a(this.f1464a + 1);
            int[] iArr = this.f1465b;
            int i11 = this.f1464a;
            iArr[i11] = i5;
            this.f1466c[i11] = obj;
            this.f1464a = i11 + 1;
            return;
        }
        throw new UnsupportedOperationException();
    }

    public final void a(c7 c7Var) {
        yu yuVar = (yu) c7Var.f1694a;
        if (this.f1464a == 0) {
            return;
        }
        for (int i5 = 0; i5 < this.f1464a; i5++) {
            int i11 = this.f1465b[i5];
            Object obj = this.f1466c[i5];
            int i12 = i11 >>> 3;
            int i13 = i11 & 7;
            if (i13 == 0) {
                yuVar.e(i12, ((Long) obj).longValue());
            } else if (i13 == 1) {
                yuVar.d(i12, ((Long) obj).longValue());
            } else if (i13 == 2) {
                yuVar.b(i12, (sq) obj);
            } else if (i13 == 3) {
                yuVar.g(i12, 3);
                ((bm3) obj).a(c7Var);
                yuVar.g(i12, 4);
            } else if (i13 == 5) {
                yuVar.e(i12, ((Integer) obj).intValue());
            } else {
                int i14 = yi1.f12028b;
                throw new RuntimeException(new xi1());
            }
        }
    }
}
