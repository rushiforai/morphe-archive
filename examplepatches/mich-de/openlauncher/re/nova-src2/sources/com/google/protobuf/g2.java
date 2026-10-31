package com.google.protobuf;

import com.google.protobuf.InvalidProtocolBufferException;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class g2 {

    /* renamed from: f, reason: collision with root package name */
    public static final g2 f34861f = new g2(0, new int[0], new Object[0], false);

    /* renamed from: a, reason: collision with root package name */
    public int f34862a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f34863b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f34864c;

    /* renamed from: d, reason: collision with root package name */
    public int f34865d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f34866e;

    public g2() {
        this(0, new int[8], new Object[8], true);
    }

    public static g2 e(g2 g2Var, g2 g2Var2) {
        int i5 = g2Var.f34862a + g2Var2.f34862a;
        int[] iArrCopyOf = Arrays.copyOf(g2Var.f34863b, i5);
        System.arraycopy(g2Var2.f34863b, 0, iArrCopyOf, g2Var.f34862a, g2Var2.f34862a);
        Object[] objArrCopyOf = Arrays.copyOf(g2Var.f34864c, i5);
        System.arraycopy(g2Var2.f34864c, 0, objArrCopyOf, g2Var.f34862a, g2Var2.f34862a);
        return new g2(i5, iArrCopyOf, objArrCopyOf, true);
    }

    public final void a() {
        if (!this.f34866e) {
            throw new UnsupportedOperationException();
        }
    }

    public final void b(int i5) {
        int[] iArr = this.f34863b;
        if (i5 > iArr.length) {
            int i11 = this.f34862a;
            int i12 = (i11 / 2) + i11;
            if (i12 >= i5) {
                i5 = i12;
            }
            if (i5 < 8) {
                i5 = 8;
            }
            this.f34863b = Arrays.copyOf(iArr, i5);
            this.f34864c = Arrays.copyOf(this.f34864c, i5);
        }
    }

    public final int c() {
        int iG;
        int I;
        int iG2;
        int i5 = this.f34865d;
        if (i5 != -1) {
            return i5;
        }
        int iB = 0;
        for (int i11 = 0; i11 < this.f34862a; i11++) {
            int i12 = this.f34863b[i11];
            int i13 = i12 >>> 3;
            int i14 = i12 & 7;
            if (i14 != 0) {
                if (i14 == 1) {
                    ((Long) this.f34864c[i11]).getClass();
                    iG2 = t.G(i13) + 8;
                } else if (i14 == 2) {
                    l lVar = (l) this.f34864c[i11];
                    int iG3 = t.G(i13);
                    int size = lVar.size();
                    iB = a2.c.B(size, size, iG3, iB);
                } else if (i14 == 3) {
                    iG = t.G(i13) * 2;
                    I = ((g2) this.f34864c[i11]).c();
                } else {
                    if (i14 != 5) {
                        throw new IllegalStateException(InvalidProtocolBufferException.c());
                    }
                    ((Integer) this.f34864c[i11]).getClass();
                    iG2 = t.G(i13) + 4;
                }
                iB = iG2 + iB;
            } else {
                long jLongValue = ((Long) this.f34864c[i11]).longValue();
                iG = t.G(i13);
                I = t.I(jLongValue);
            }
            iB = I + iG + iB;
        }
        this.f34865d = iB;
        return iB;
    }

    public final boolean d(int i5, p pVar) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iE;
        a();
        int i11 = i5 >>> 3;
        int i12 = i5 & 7;
        if (i12 == 0) {
            f(i5, Long.valueOf(pVar.u()));
            return true;
        }
        if (i12 == 1) {
            f(i5, Long.valueOf(pVar.q()));
            return true;
        }
        if (i12 == 2) {
            f(i5, pVar.m());
            return true;
        }
        if (i12 != 3) {
            if (i12 == 4) {
                return false;
            }
            if (i12 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            f(i5, Integer.valueOf(pVar.p()));
            return true;
        }
        g2 g2Var = new g2();
        do {
            iE = pVar.E();
            if (iE == 0) {
                break;
            }
        } while (g2Var.d(iE, pVar));
        pVar.a((i11 << 3) | 4);
        f(i5, g2Var);
        return true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof g2)) {
            return false;
        }
        g2 g2Var = (g2) obj;
        int i5 = this.f34862a;
        if (i5 == g2Var.f34862a) {
            int[] iArr = this.f34863b;
            int[] iArr2 = g2Var.f34863b;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    Object[] objArr = this.f34864c;
                    Object[] objArr2 = g2Var.f34864c;
                    int i12 = this.f34862a;
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

    public final void f(int i5, Object obj) {
        a();
        b(this.f34862a + 1);
        int[] iArr = this.f34863b;
        int i11 = this.f34862a;
        iArr[i11] = i5;
        this.f34864c[i11] = obj;
        this.f34862a = i11 + 1;
    }

    public final void g(h1 h1Var) {
        if (this.f34862a == 0) {
            return;
        }
        h1Var.getClass();
        t tVar = (t) h1Var.f34871a;
        for (int i5 = 0; i5 < this.f34862a; i5++) {
            int i11 = this.f34863b[i5];
            Object obj = this.f34864c[i5];
            int i12 = i11 >>> 3;
            int i13 = i11 & 7;
            if (i13 == 0) {
                tVar.e0(i12, ((Long) obj).longValue());
            } else if (i13 == 1) {
                tVar.R(i12, ((Long) obj).longValue());
            } else if (i13 == 2) {
                tVar.N(i12, (l) obj);
            } else if (i13 == 3) {
                tVar.b0(i12, 3);
                ((g2) obj).g(h1Var);
                tVar.b0(i12, 4);
            } else {
                if (i13 != 5) {
                    throw new RuntimeException(InvalidProtocolBufferException.c());
                }
                tVar.P(i12, ((Integer) obj).intValue());
            }
        }
    }

    public final int hashCode() {
        int i5 = this.f34862a;
        int i11 = (527 + i5) * 31;
        int[] iArr = this.f34863b;
        int iHashCode = 17;
        int i12 = 17;
        for (int i13 = 0; i13 < i5; i13++) {
            i12 = (i12 * 31) + iArr[i13];
        }
        int i14 = (i11 + i12) * 31;
        Object[] objArr = this.f34864c;
        int i15 = this.f34862a;
        for (int i16 = 0; i16 < i15; i16++) {
            iHashCode = (iHashCode * 31) + objArr[i16].hashCode();
        }
        return i14 + iHashCode;
    }

    public g2(int i5, int[] iArr, Object[] objArr, boolean z11) {
        this.f34865d = -1;
        this.f34862a = i5;
        this.f34863b = iArr;
        this.f34864c = objArr;
        this.f34866e = z11;
    }
}
