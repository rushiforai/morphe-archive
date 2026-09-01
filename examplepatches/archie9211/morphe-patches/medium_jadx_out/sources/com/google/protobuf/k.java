package com.google.protobuf;

import com.google.protobuf.InvalidProtocolBufferException;
import defpackage.aq1;
import defpackage.f21;
import defpackage.ik4;
import defpackage.rd6;
import defpackage.sp1;
import defpackage.zm7;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k {
    public static final k f = new k(0, new int[0], new Object[0], false);
    public int a;
    public int[] b;
    public Object[] c;
    public int d;
    public boolean e;

    public k(int i, int[] iArr, Object[] objArr, boolean z) {
        this.d = -1;
        this.a = i;
        this.b = iArr;
        this.c = objArr;
        this.e = z;
    }

    public static k e(k kVar, k kVar2) {
        int i = kVar.a + kVar2.a;
        int[] iArrCopyOf = Arrays.copyOf(kVar.b, i);
        System.arraycopy(kVar2.b, 0, iArrCopyOf, kVar.a, kVar2.a);
        Object[] objArrCopyOf = Arrays.copyOf(kVar.c, i);
        System.arraycopy(kVar2.c, 0, objArrCopyOf, kVar.a, kVar2.a);
        return new k(i, iArrCopyOf, objArrCopyOf, true);
    }

    public final void a() {
        if (this.e) {
            return;
        }
        rd6.b();
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

    public final int c() {
        int iH;
        int iK;
        int iD;
        int i = this.d;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        for (int i3 = 0; i3 < this.a; i3++) {
            int i4 = this.b[i3];
            int i5 = i4 >>> 3;
            int i6 = i4 & 7;
            if (i6 != 0) {
                if (i6 == 1) {
                    ((Long) this.c[i3]).getClass();
                    iD = aq1.d(i5);
                } else if (i6 == 2) {
                    iD = aq1.a(i5, (f21) this.c[i3]);
                } else if (i6 == 3) {
                    iH = aq1.h(i5) * 2;
                    iK = ((k) this.c[i3]).c();
                } else {
                    if (i6 != 5) {
                        throw new IllegalStateException(InvalidProtocolBufferException.c());
                    }
                    ((Integer) this.c[i3]).getClass();
                    iD = aq1.c(i5);
                }
                i2 = iD + i2;
            } else {
                long jLongValue = ((Long) this.c[i3]).longValue();
                iH = aq1.h(i5);
                iK = aq1.k(jLongValue);
            }
            i2 = iK + iH + i2;
        }
        this.d = i2;
        return i2;
    }

    public final boolean d(int i, sp1 sp1Var) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iZ;
        a();
        int i2 = i >>> 3;
        int i3 = i & 7;
        if (i3 == 0) {
            f(i, Long.valueOf(sp1Var.r()));
            return true;
        }
        if (i3 == 1) {
            f(i, Long.valueOf(sp1Var.o()));
            return true;
        }
        if (i3 == 2) {
            f(i, sp1Var.k());
            return true;
        }
        if (i3 != 3) {
            if (i3 == 4) {
                return false;
            }
            if (i3 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            f(i, Integer.valueOf(sp1Var.n()));
            return true;
        }
        k kVar = new k();
        do {
            iZ = sp1Var.z();
            if (iZ == 0) {
                break;
            }
        } while (kVar.d(iZ, sp1Var));
        sp1Var.a((i2 << 3) | 4);
        f(i, kVar);
        return true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        int i = this.a;
        if (i == kVar.a) {
            int[] iArr = this.b;
            int[] iArr2 = kVar.b;
            int i2 = 0;
            while (true) {
                if (i2 >= i) {
                    Object[] objArr = this.c;
                    Object[] objArr2 = kVar.c;
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

    public final void f(int i, Object obj) {
        a();
        b(this.a + 1);
        int[] iArr = this.b;
        int i2 = this.a;
        iArr[i2] = i;
        this.c[i2] = obj;
        this.a = i2 + 1;
    }

    public final void g(zm7 zm7Var) {
        if (this.a == 0) {
            return;
        }
        zm7Var.getClass();
        for (int i = 0; i < this.a; i++) {
            int i2 = this.b[i];
            Object obj = this.c[i];
            int i3 = i2 >>> 3;
            int i4 = i2 & 7;
            if (i4 == 0) {
                zm7Var.o0(i3, ((Long) obj).longValue());
            } else if (i4 == 1) {
                zm7Var.i0(i3, ((Long) obj).longValue());
            } else if (i4 == 2) {
                zm7Var.Y(i3, (f21) obj);
            } else if (i4 == 3) {
                aq1 aq1Var = (aq1) zm7Var.b;
                aq1Var.C(i3, 3);
                ((k) obj).g(zm7Var);
                aq1Var.C(i3, 4);
            } else {
                if (i4 != 5) {
                    ik4.j(InvalidProtocolBufferException.c());
                    return;
                }
                zm7Var.h0(i3, ((Integer) obj).intValue());
            }
        }
    }

    public final int hashCode() {
        int i = this.a;
        int i2 = (527 + i) * 31;
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

    public k() {
        this(0, new int[8], new Object[8], true);
    }
}
