package com.fyber.inneractive.sdk.protobuf;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class n3 {

    /* renamed from: f, reason: collision with root package name */
    public static final n3 f30860f = new n3(0, new int[0], new Object[0], false);

    /* renamed from: a, reason: collision with root package name */
    public int f30861a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f30862b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f30863c;

    /* renamed from: d, reason: collision with root package name */
    public int f30864d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f30865e;

    public n3() {
        this(0, new int[8], new Object[8], true);
    }

    public static n3 a(n3 n3Var, n3 n3Var2) {
        int i5 = n3Var.f30861a + n3Var2.f30861a;
        int[] iArrCopyOf = Arrays.copyOf(n3Var.f30862b, i5);
        System.arraycopy(n3Var2.f30862b, 0, iArrCopyOf, n3Var.f30861a, n3Var2.f30861a);
        Object[] objArrCopyOf = Arrays.copyOf(n3Var.f30863c, i5);
        System.arraycopy(n3Var2.f30863c, 0, objArrCopyOf, n3Var.f30861a, n3Var2.f30861a);
        return new n3(i5, iArrCopyOf, objArrCopyOf, true);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof n3)) {
            return false;
        }
        n3 n3Var = (n3) obj;
        int i5 = this.f30861a;
        if (i5 == n3Var.f30861a) {
            int[] iArr = this.f30862b;
            int[] iArr2 = n3Var.f30862b;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    Object[] objArr = this.f30863c;
                    Object[] objArr2 = n3Var.f30863c;
                    int i12 = this.f30861a;
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
        int i5 = this.f30861a;
        int i11 = (i5 + 527) * 31;
        int[] iArr = this.f30862b;
        int iHashCode = 17;
        int i12 = 17;
        for (int i13 = 0; i13 < i5; i13++) {
            i12 = (i12 * 31) + iArr[i13];
        }
        int i14 = (i11 + i12) * 31;
        Object[] objArr = this.f30863c;
        int i15 = this.f30861a;
        for (int i16 = 0; i16 < i15; i16++) {
            iHashCode = (iHashCode * 31) + objArr[i16].hashCode();
        }
        return i14 + iHashCode;
    }

    public n3(int i5, int[] iArr, Object[] objArr, boolean z11) {
        this.f30864d = -1;
        this.f30861a = i5;
        this.f30862b = iArr;
        this.f30863c = objArr;
        this.f30865e = z11;
    }

    public final boolean a(int i5, w wVar) throws m1 {
        int iT;
        if (!this.f30865e) {
            throw new UnsupportedOperationException();
        }
        int i11 = i5 >>> 3;
        int i12 = i5 & 7;
        if (i12 == 0) {
            a(i5, Long.valueOf(wVar.l()));
            return true;
        }
        if (i12 == 1) {
            a(i5, Long.valueOf(wVar.i()));
            return true;
        }
        if (i12 == 2) {
            a(i5, wVar.e());
            return true;
        }
        if (i12 != 3) {
            if (i12 == 4) {
                return false;
            }
            if (i12 == 5) {
                a(i5, Integer.valueOf(wVar.h()));
                return true;
            }
            int i13 = n1.f30859a;
            throw new m1();
        }
        n3 n3Var = new n3();
        do {
            iT = wVar.t();
            if (iT == 0) {
                break;
            }
        } while (n3Var.a(iT, wVar));
        wVar.a((i11 << 3) | 4);
        a(i5, n3Var);
        return true;
    }

    public final void a(int i5, Object obj) {
        if (this.f30865e) {
            int i11 = this.f30861a;
            int[] iArr = this.f30862b;
            if (i11 == iArr.length) {
                int i12 = i11 + (i11 < 4 ? 8 : i11 >> 1);
                this.f30862b = Arrays.copyOf(iArr, i12);
                this.f30863c = Arrays.copyOf(this.f30863c, i12);
            }
            int[] iArr2 = this.f30862b;
            int i13 = this.f30861a;
            iArr2[i13] = i5;
            this.f30863c[i13] = obj;
            this.f30861a = i13 + 1;
            return;
        }
        throw new UnsupportedOperationException();
    }

    public final void a(c0 c0Var) {
        if (this.f30861a == 0) {
            return;
        }
        c0Var.getClass();
        for (int i5 = 0; i5 < this.f30861a; i5++) {
            int i11 = this.f30862b[i5];
            Object obj = this.f30863c[i5];
            int i12 = i11 >>> 3;
            int i13 = i11 & 7;
            if (i13 == 0) {
                c0Var.f30775a.b(i12, ((Long) obj).longValue());
            } else if (i13 == 1) {
                c0Var.f30775a.a(i12, ((Long) obj).longValue());
            } else if (i13 == 2) {
                c0Var.f30775a.a(i12, (s) obj);
            } else if (i13 == 3) {
                c0Var.f30775a.c(i12, 3);
                ((n3) obj).a(c0Var);
                c0Var.f30775a.c(i12, 4);
            } else if (i13 == 5) {
                c0Var.f30775a.a(i12, ((Integer) obj).intValue());
            } else {
                int i14 = n1.f30859a;
                throw new RuntimeException(new m1());
            }
        }
    }

    public final int a() {
        int iB;
        int i5 = this.f30864d;
        if (i5 != -1) {
            return i5;
        }
        int iA = 0;
        for (int i11 = 0; i11 < this.f30861a; i11++) {
            int i12 = this.f30862b[i11];
            int i13 = i12 >>> 3;
            int i14 = i12 & 7;
            if (i14 == 0) {
                iB = b0.b(i13) + b0.a(((Long) this.f30863c[i11]).longValue());
            } else if (i14 == 1) {
                ((Long) this.f30863c[i11]).getClass();
                iB = b0.b(i13) + 8;
            } else if (i14 == 2) {
                iB = b0.a((s) this.f30863c[i11]) + b0.b(i13);
            } else if (i14 == 3) {
                iA = ((n3) this.f30863c[i11]).a() + (b0.b(i13) * 2) + iA;
            } else if (i14 == 5) {
                ((Integer) this.f30863c[i11]).getClass();
                iB = b0.b(i13) + 4;
            } else {
                int i15 = n1.f30859a;
                throw new IllegalStateException(new m1());
            }
            iA = iB + iA;
        }
        this.f30864d = iA;
        return iA;
    }
}
