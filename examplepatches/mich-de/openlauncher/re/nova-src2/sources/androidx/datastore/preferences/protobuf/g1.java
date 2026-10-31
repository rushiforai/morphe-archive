package androidx.datastore.preferences.protobuf;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class g1 {

    /* renamed from: f, reason: collision with root package name */
    public static final g1 f14318f = new g1(0, new int[0], new Object[0], false);

    /* renamed from: a, reason: collision with root package name */
    public int f14319a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f14320b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f14321c;

    /* renamed from: d, reason: collision with root package name */
    public int f14322d = -1;

    /* renamed from: e, reason: collision with root package name */
    public boolean f14323e;

    public g1(int i5, int[] iArr, Object[] objArr, boolean z11) {
        this.f14319a = i5;
        this.f14320b = iArr;
        this.f14321c = objArr;
        this.f14323e = z11;
    }

    public final void a(int i5) {
        int[] iArr = this.f14320b;
        if (i5 > iArr.length) {
            int i11 = this.f14319a;
            int i12 = (i11 / 2) + i11;
            if (i12 >= i5) {
                i5 = i12;
            }
            if (i5 < 8) {
                i5 = 8;
            }
            this.f14320b = Arrays.copyOf(iArr, i5);
            this.f14321c = Arrays.copyOf(this.f14321c, i5);
        }
    }

    public final int b() {
        int iH0;
        int iJ0;
        int iH02;
        int i5 = this.f14322d;
        if (i5 != -1) {
            return i5;
        }
        int iB = 0;
        for (int i11 = 0; i11 < this.f14319a; i11++) {
            int i12 = this.f14320b[i11];
            int i13 = i12 >>> 3;
            int i14 = i12 & 7;
            if (i14 != 0) {
                if (i14 == 1) {
                    ((Long) this.f14321c[i11]).getClass();
                    iH02 = m.h0(i13) + 8;
                } else if (i14 == 2) {
                    h hVar = (h) this.f14321c[i11];
                    int iH03 = m.h0(i13);
                    int size = hVar.size();
                    iB = a2.c.b(size, size, iH03, iB);
                } else if (i14 == 3) {
                    iH0 = m.h0(i13) * 2;
                    iJ0 = ((g1) this.f14321c[i11]).b();
                } else {
                    if (i14 != 5) {
                        throw new IllegalStateException(InvalidProtocolBufferException.b());
                    }
                    ((Integer) this.f14321c[i11]).getClass();
                    iH02 = m.h0(i13) + 4;
                }
                iB = iH02 + iB;
            } else {
                long jLongValue = ((Long) this.f14321c[i11]).longValue();
                iH0 = m.h0(i13);
                iJ0 = m.j0(jLongValue);
            }
            iB = iJ0 + iH0 + iB;
        }
        this.f14322d = iB;
        return iB;
    }

    public final void c(int i5, Object obj) {
        if (!this.f14323e) {
            throw new UnsupportedOperationException();
        }
        a(this.f14319a + 1);
        int[] iArr = this.f14320b;
        int i11 = this.f14319a;
        iArr[i11] = i5;
        this.f14321c[i11] = obj;
        this.f14319a = i11 + 1;
    }

    public final void d(j0 j0Var) {
        if (this.f14319a == 0) {
            return;
        }
        j0Var.getClass();
        for (int i5 = 0; i5 < this.f14319a; i5++) {
            int i11 = this.f14320b[i5];
            Object obj = this.f14321c[i5];
            int i12 = i11 >>> 3;
            int i13 = i11 & 7;
            if (i13 == 0) {
                ((m) j0Var.f14337a).D0(i12, ((Long) obj).longValue());
            } else if (i13 == 1) {
                ((m) j0Var.f14337a).t0(i12, ((Long) obj).longValue());
            } else if (i13 == 2) {
                ((m) j0Var.f14337a).p0(i12, (h) obj);
            } else if (i13 == 3) {
                m mVar = (m) j0Var.f14337a;
                mVar.A0(i12, 3);
                ((g1) obj).d(j0Var);
                mVar.A0(i12, 4);
            } else {
                if (i13 != 5) {
                    throw new RuntimeException(InvalidProtocolBufferException.b());
                }
                ((m) j0Var.f14337a).r0(i12, ((Integer) obj).intValue());
            }
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof g1)) {
            return false;
        }
        g1 g1Var = (g1) obj;
        int i5 = this.f14319a;
        if (i5 == g1Var.f14319a) {
            int[] iArr = this.f14320b;
            int[] iArr2 = g1Var.f14320b;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    Object[] objArr = this.f14321c;
                    Object[] objArr2 = g1Var.f14321c;
                    int i12 = this.f14319a;
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
        int i5 = this.f14319a;
        int i11 = (527 + i5) * 31;
        int[] iArr = this.f14320b;
        int iHashCode = 17;
        int i12 = 17;
        for (int i13 = 0; i13 < i5; i13++) {
            i12 = (i12 * 31) + iArr[i13];
        }
        int i14 = (i11 + i12) * 31;
        Object[] objArr = this.f14321c;
        int i15 = this.f14319a;
        for (int i16 = 0; i16 < i15; i16++) {
            iHashCode = (iHashCode * 31) + objArr[i16].hashCode();
        }
        return i14 + iHashCode;
    }
}
