package defpackage;

import java.util.Arrays;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v89 extends y1 {
    public final Object[] a;
    public final Object[] b;
    public final int c;
    public final int d;

    public v89(Object[] objArr, Object[] objArr2, int i, int i2) {
        this.a = objArr;
        this.b = objArr2;
        this.c = i;
        this.d = i2;
        if (!(getSize() > 32)) {
            xx9.a("Trie-based persistent vector should have at least 33 elements, got " + getSize());
        }
        int length = objArr2.length;
    }

    public static Object[] B(int i, int i2, Object obj, Object[] objArr) {
        int iZ = ur7.z(i2, i);
        Object[] objArrCopyOf = Arrays.copyOf(objArr, 32);
        if (i == 0) {
            objArrCopyOf[iZ] = obj;
            return objArrCopyOf;
        }
        Object obj2 = objArrCopyOf[iZ];
        obj2.getClass();
        objArrCopyOf[iZ] = B(i - 5, i2, obj, (Object[]) obj2);
        return objArrCopyOf;
    }

    public static Object[] t(Object[] objArr, int i, int i2, Object obj, e7 e7Var) {
        int iZ = ur7.z(i2, i);
        if (i == 0) {
            Object[] objArrCopyOf = iZ == 0 ? new Object[32] : Arrays.copyOf(objArr, 32);
            k80.g0(iZ + 1, iZ, 31, objArr, objArrCopyOf);
            e7Var.a = objArr[31];
            objArrCopyOf[iZ] = obj;
            return objArrCopyOf;
        }
        Object[] objArrCopyOf2 = Arrays.copyOf(objArr, 32);
        int i3 = i - 5;
        Object obj2 = objArr[iZ];
        obj2.getClass();
        objArrCopyOf2[iZ] = t((Object[]) obj2, i3, i2, obj, e7Var);
        while (true) {
            iZ++;
            if (iZ >= 32 || objArrCopyOf2[iZ] == null) {
                break;
            }
            Object obj3 = objArr[iZ];
            obj3.getClass();
            objArrCopyOf2[iZ] = t((Object[]) obj3, i3, 0, e7Var.a, e7Var);
        }
        return objArrCopyOf2;
    }

    public static Object[] v(Object[] objArr, int i, int i2, e7 e7Var) {
        Object[] objArrV;
        int iZ = ur7.z(i2, i);
        if (i == 5) {
            e7Var.a = objArr[iZ];
            objArrV = null;
        } else {
            Object obj = objArr[iZ];
            obj.getClass();
            objArrV = v((Object[]) obj, i - 5, i2, e7Var);
        }
        if (objArrV == null && iZ == 0) {
            return null;
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr, 32);
        objArrCopyOf[iZ] = objArrV;
        return objArrCopyOf;
    }

    public final int A() {
        return (this.c - 1) & (-32);
    }

    @Override // defpackage.y1
    public final y1 d(int i, Object obj) {
        int i2 = this.c;
        hlg.n(i, i2);
        if (i == i2) {
            return f(obj);
        }
        int iA = A();
        Object[] objArr = this.a;
        if (i >= iA) {
            return u(i - iA, obj, objArr);
        }
        e7 e7Var = new e7(null);
        return u(0, e7Var.a, t(objArr, this.d, i, obj, e7Var));
    }

    @Override // defpackage.y1
    public final y1 f(Object obj) {
        int iA = A();
        int i = this.c;
        int i2 = i - iA;
        Object[] objArr = this.a;
        Object[] objArr2 = this.b;
        if (i2 < 32) {
            Object[] objArrCopyOf = Arrays.copyOf(objArr2, 32);
            objArrCopyOf[i2] = obj;
            return new v89(objArr, objArrCopyOf, i + 1, this.d);
        }
        Object[] objArr3 = new Object[32];
        objArr3[0] = obj;
        return w(objArr, objArr2, objArr3);
    }

    @Override // java.util.List
    public final Object get(int i) {
        Object[] objArr;
        hlg.m(i, getSize());
        if (A() <= i) {
            objArr = this.b;
        } else {
            Object[] objArr2 = this.a;
            for (int i2 = this.d; i2 > 0; i2 -= 5) {
                Object[] objArr3 = objArr2[ur7.z(i, i2)];
                objArr3.getClass();
                objArr2 = objArr3;
            }
            objArr = objArr2;
        }
        return objArr[i & 31];
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.c;
    }

    @Override // defpackage.k1, java.util.List
    public final ListIterator listIterator(int i) {
        hlg.n(i, this.c);
        return new z89(i, this.c, (this.d / 5) + 1, this.a, this.b);
    }

    @Override // defpackage.y1
    public final x89 p() {
        return new x89(this, this.a, this.b, this.d);
    }

    @Override // defpackage.y1
    public final y1 q(w1 w1Var) {
        x89 x89Var = new x89(this, this.a, this.b, this.d);
        x89Var.I(w1Var);
        return x89Var.d();
    }

    @Override // defpackage.y1
    public final y1 r(int i) {
        hlg.m(i, getSize());
        int iA = A();
        int i2 = this.d;
        Object[] objArr = this.a;
        return i >= iA ? z(objArr, iA, i2, i - iA) : z(y(objArr, i2, i, new e7(this.b[0])), iA, i2, 0);
    }

    @Override // defpackage.y1
    public final y1 s(int i, Object obj) {
        int i2 = this.c;
        hlg.m(i, i2);
        int iA = A();
        Object[] objArr = this.a;
        Object[] objArr2 = this.b;
        int i3 = this.d;
        if (iA > i) {
            return new v89(B(i3, i, obj, objArr), objArr2, i2, i3);
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr2, 32);
        objArrCopyOf[i & 31] = obj;
        return new v89(objArr, objArrCopyOf, i2, i3);
    }

    public final v89 u(int i, Object obj, Object[] objArr) {
        int iA = A();
        int i2 = this.c;
        int i3 = i2 - iA;
        Object[] objArr2 = this.b;
        Object[] objArrCopyOf = Arrays.copyOf(objArr2, 32);
        if (i3 < 32) {
            k80.g0(i + 1, i, i3, objArr2, objArrCopyOf);
            objArrCopyOf[i] = obj;
            return new v89(objArr, objArrCopyOf, i2 + 1, this.d);
        }
        Object obj2 = objArr2[31];
        k80.g0(i + 1, i, i3 - 1, objArr2, objArrCopyOf);
        objArrCopyOf[i] = obj;
        Object[] objArr3 = new Object[32];
        objArr3[0] = obj2;
        return w(objArr, objArrCopyOf, objArr3);
    }

    public final v89 w(Object[] objArr, Object[] objArr2, Object[] objArr3) {
        int i = this.c;
        int i2 = i >> 5;
        int i3 = this.d;
        if (i2 <= (1 << i3)) {
            return new v89(x(i3, objArr, objArr2), objArr3, i + 1, i3);
        }
        Object[] objArr4 = new Object[32];
        objArr4[0] = objArr;
        int i4 = i3 + 5;
        return new v89(x(i4, objArr4, objArr2), objArr3, i + 1, i4);
    }

    public final Object[] x(int i, Object[] objArr, Object[] objArr2) {
        int iZ = ur7.z(getSize() - 1, i);
        Object[] objArrCopyOf = objArr != null ? Arrays.copyOf(objArr, 32) : new Object[32];
        if (i == 5) {
            objArrCopyOf[iZ] = objArr2;
            return objArrCopyOf;
        }
        objArrCopyOf[iZ] = x(i - 5, (Object[]) objArrCopyOf[iZ], objArr2);
        return objArrCopyOf;
    }

    public final Object[] y(Object[] objArr, int i, int i2, e7 e7Var) {
        int iZ = ur7.z(i2, i);
        if (i == 0) {
            Object[] objArrCopyOf = iZ == 0 ? new Object[32] : Arrays.copyOf(objArr, 32);
            k80.g0(iZ, iZ + 1, 32, objArr, objArrCopyOf);
            objArrCopyOf[31] = e7Var.a;
            e7Var.a = objArr[iZ];
            return objArrCopyOf;
        }
        int iZ2 = objArr[31] == null ? ur7.z(A() - 1, i) : 31;
        Object[] objArrCopyOf2 = Arrays.copyOf(objArr, 32);
        int i3 = i - 5;
        int i4 = iZ + 1;
        if (i4 <= iZ2) {
            while (true) {
                Object obj = objArrCopyOf2[iZ2];
                obj.getClass();
                objArrCopyOf2[iZ2] = y((Object[]) obj, i3, 0, e7Var);
                if (iZ2 == i4) {
                    break;
                }
                iZ2--;
            }
        }
        Object obj2 = objArrCopyOf2[iZ];
        obj2.getClass();
        objArrCopyOf2[iZ] = y((Object[]) obj2, i3, i2, e7Var);
        return objArrCopyOf2;
    }

    public final y1 z(Object[] objArr, int i, int i2, int i3) {
        int i4 = this.c - i;
        if (i4 != 1) {
            Object[] objArr2 = this.b;
            Object[] objArrCopyOf = Arrays.copyOf(objArr2, 32);
            int i5 = i4 - 1;
            if (i3 < i5) {
                k80.g0(i3, i3 + 1, i4, objArr2, objArrCopyOf);
            }
            objArrCopyOf[i5] = null;
            return new v89(objArr, objArrCopyOf, (i + i4) - 1, i2);
        }
        if (i2 == 0) {
            if (objArr.length == 33) {
                objArr = Arrays.copyOf(objArr, 32);
            }
            return new lgc(objArr);
        }
        e7 e7Var = new e7(null);
        Object[] objArrV = v(objArr, i2, i - 1, e7Var);
        objArrV.getClass();
        Object obj = e7Var.a;
        obj.getClass();
        Object[] objArr3 = (Object[]) obj;
        if (objArrV[1] != null) {
            return new v89(objArrV, objArr3, i, i2);
        }
        Object obj2 = objArrV[0];
        obj2.getClass();
        return new v89((Object[]) obj2, objArr3, i, i2 - 5);
    }
}
