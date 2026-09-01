package defpackage;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x89 extends s1 implements Collection, uh6 {
    public y1 a;
    public Object[] b;
    public Object[] c;
    public int d;
    public no3 e = new no3(19);
    public Object[] f;
    public Object[] g;
    public int h;

    public x89(y1 y1Var, Object[] objArr, Object[] objArr2, int i) {
        this.a = y1Var;
        this.b = objArr;
        this.c = objArr2;
        this.d = i;
        this.f = objArr;
        this.g = objArr2;
        this.h = y1Var.getSize();
    }

    public static void f(Object[] objArr, int i, Iterator it2) {
        while (i < 32 && it2.hasNext()) {
            objArr[i] = it2.next();
            i++;
        }
    }

    public final void A(int i, int i2, Object[] objArr) {
        if (i2 == 0) {
            this.f = null;
            if (objArr == null) {
                objArr = new Object[0];
            }
            this.g = objArr;
            this.h = i;
            this.d = i2;
            return;
        }
        e7 e7Var = new e7(null);
        objArr.getClass();
        Object[] objArrZ = z(objArr, i2, i, e7Var);
        objArrZ.getClass();
        Object obj = e7Var.a;
        obj.getClass();
        this.g = (Object[]) obj;
        this.h = i;
        if (objArrZ[1] == null) {
            this.f = (Object[]) objArrZ[0];
            this.d = i2 - 5;
        } else {
            this.f = objArrZ;
            this.d = i2;
        }
    }

    public final Object[] B(Object[] objArr, int i, int i2, Iterator it2) {
        if (!it2.hasNext()) {
            xx9.a("invalid buffersIterator");
        }
        if (!(i2 >= 0)) {
            xx9.a("negative shift");
        }
        if (i2 == 0) {
            return (Object[]) it2.next();
        }
        Object[] objArrU = u(objArr);
        int iZ = ur7.z(i, i2);
        int i3 = i2 - 5;
        objArrU[iZ] = B((Object[]) objArrU[iZ], i, i3, it2);
        while (true) {
            iZ++;
            if (iZ >= 32 || !it2.hasNext()) {
                break;
            }
            objArrU[iZ] = B((Object[]) objArrU[iZ], 0, i3, it2);
        }
        return objArrU;
    }

    public final Object[] C(Object[] objArr, int i, Object[][] objArr2) {
        h1 h1Var = new h1(objArr2);
        int i2 = i >> 5;
        int i3 = this.d;
        Object[] objArrB = i2 < (1 << i3) ? B(objArr, i, i3, h1Var) : u(objArr);
        while (h1Var.hasNext()) {
            this.d += 5;
            objArrB = x(objArrB);
            int i4 = this.d;
            B(objArrB, 1 << i4, i4, h1Var);
        }
        return objArrB;
    }

    public final void D(Object[] objArr, Object[] objArr2, Object[] objArr3) {
        int i = this.h;
        int i2 = i >> 5;
        int i3 = this.d;
        if (i2 > (1 << i3)) {
            this.f = E(this.d + 5, x(objArr), objArr2);
            this.g = objArr3;
            this.d += 5;
            this.h++;
            return;
        }
        if (objArr == null) {
            this.f = objArr2;
            this.g = objArr3;
            this.h = i + 1;
        } else {
            this.f = E(i3, objArr, objArr2);
            this.g = objArr3;
            this.h++;
        }
    }

    public final Object[] E(int i, Object[] objArr, Object[] objArr2) {
        int iZ = ur7.z(getSize() - 1, i);
        Object[] objArrU = u(objArr);
        if (i == 5) {
            objArrU[iZ] = objArr2;
            return objArrU;
        }
        objArrU[iZ] = E(i - 5, (Object[]) objArrU[iZ], objArr2);
        return objArrU;
    }

    public final int F(x45 x45Var, Object[] objArr, int i, int i2, e7 e7Var, ArrayList arrayList, ArrayList arrayList2) {
        if (s(objArr)) {
            arrayList.add(objArr);
        }
        Object obj = e7Var.a;
        obj.getClass();
        Object[] objArr2 = (Object[]) obj;
        Object[] objArrW = objArr2;
        for (int i3 = 0; i3 < i; i3++) {
            Object obj2 = objArr[i3];
            if (!((Boolean) x45Var.invoke(obj2)).booleanValue()) {
                if (i2 == 32) {
                    objArrW = !arrayList.isEmpty() ? (Object[]) arrayList.remove(arrayList.size() - 1) : w();
                    i2 = 0;
                }
                objArrW[i2] = obj2;
                i2++;
            }
        }
        e7Var.a = objArrW;
        if (objArr2 != objArrW) {
            arrayList2.add(objArr2);
        }
        return i2;
    }

    public final int G(x45 x45Var, Object[] objArr, int i, e7 e7Var) {
        Object[] objArrU = objArr;
        int i2 = i;
        boolean z = false;
        for (int i3 = 0; i3 < i; i3++) {
            Object obj = objArr[i3];
            if (((Boolean) x45Var.invoke(obj)).booleanValue()) {
                if (!z) {
                    objArrU = u(objArr);
                    z = true;
                    i2 = i3;
                }
            } else if (z) {
                objArrU[i2] = obj;
                i2++;
            }
        }
        e7Var.a = objArrU;
        return i2;
    }

    public final int H(x45 x45Var, int i, e7 e7Var) {
        int iG = G(x45Var, this.g, i, e7Var);
        Object obj = e7Var.a;
        if (iG == i) {
            return i;
        }
        obj.getClass();
        Object[] objArr = (Object[]) obj;
        Arrays.fill(objArr, iG, i, (Object) null);
        this.g = objArr;
        this.h -= i - iG;
        return iG;
    }

    public final boolean I(x45 x45Var) {
        int i;
        x45 x45Var2 = x45Var;
        int iO = O();
        Object[] objArrY = null;
        e7 e7Var = new e7(null);
        boolean z = false;
        if (this.f != null) {
            l1 l1VarT = t(0);
            int iG = 32;
            while (iG == 32 && l1VarT.hasNext()) {
                iG = G(x45Var2, (Object[]) l1VarT.next(), 32, e7Var);
            }
            if (iG == 32) {
                int iH = H(x45Var2, iO, e7Var);
                if (iH == 0) {
                    A(this.h, this.d, this.f);
                }
                if (iH != iO) {
                }
            } else {
                int i2 = (l1VarT.b - 1) << 5;
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                int iF = iG;
                while (l1VarT.hasNext()) {
                    iF = F(x45Var2, (Object[]) l1VarT.next(), 32, iF, e7Var, arrayList2, arrayList);
                    x45Var2 = x45Var;
                }
                int iF2 = F(x45Var, this.g, iO, iF, e7Var, arrayList2, arrayList);
                Object obj = e7Var.a;
                obj.getClass();
                Object[] objArr = (Object[]) obj;
                Arrays.fill(objArr, iF2, 32, (Object) null);
                boolean zIsEmpty = arrayList.isEmpty();
                Object[] objArrB = this.f;
                if (zIsEmpty) {
                    objArrB.getClass();
                } else {
                    objArrB = B(objArrB, i2, this.d, arrayList.iterator());
                }
                int size = i2 + (arrayList.size() << 5);
                if ((size & 31) != 0) {
                    xx9.a("invalid size");
                }
                if (size == 0) {
                    this.d = 0;
                } else {
                    int i3 = size - 1;
                    while (true) {
                        i = this.d;
                        if ((i3 >> i) != 0) {
                            break;
                        }
                        this.d = i - 5;
                        Object[] objArr2 = objArrB[0];
                        objArr2.getClass();
                        objArrB = objArr2;
                    }
                    objArrY = y(i3, i, objArrB);
                }
                this.f = objArrY;
                this.g = objArr;
                this.h = size + iF2;
            }
            z = true;
        } else if (H(x45Var2, iO, e7Var) != iO) {
            z = true;
        }
        if (z) {
            ((AbstractList) this).modCount++;
        }
        return z;
    }

    public final Object[] J(Object[] objArr, int i, int i2, e7 e7Var) {
        int iZ = ur7.z(i2, i);
        if (i == 0) {
            Object obj = objArr[iZ];
            Object[] objArrU = u(objArr);
            k80.g0(iZ, iZ + 1, 32, objArr, objArrU);
            objArrU[31] = e7Var.a;
            e7Var.a = obj;
            return objArrU;
        }
        int iZ2 = objArr[31] == null ? ur7.z(L() - 1, i) : 31;
        Object[] objArrU2 = u(objArr);
        int i3 = i - 5;
        int i4 = iZ + 1;
        if (i4 <= iZ2) {
            while (true) {
                Object obj2 = objArrU2[iZ2];
                obj2.getClass();
                objArrU2[iZ2] = J((Object[]) obj2, i3, 0, e7Var);
                if (iZ2 == i4) {
                    break;
                }
                iZ2--;
            }
        }
        Object obj3 = objArrU2[iZ];
        obj3.getClass();
        objArrU2[iZ] = J((Object[]) obj3, i3, i2, e7Var);
        return objArrU2;
    }

    public final Object K(Object[] objArr, int i, int i2, int i3) {
        int i4 = this.h - i;
        Object[] objArr2 = this.g;
        if (i4 == 1) {
            Object obj = objArr2[0];
            A(i, i2, objArr);
            return obj;
        }
        Object obj2 = objArr2[i3];
        Object[] objArrU = u(objArr2);
        k80.g0(i3, i3 + 1, i4, objArr2, objArrU);
        objArrU[i4 - 1] = null;
        this.f = objArr;
        this.g = objArrU;
        this.h = (i + i4) - 1;
        this.d = i2;
        return obj2;
    }

    public final int L() {
        int i = this.h;
        if (i <= 32) {
            return 0;
        }
        return (i - 1) & (-32);
    }

    public final Object[] M(Object[] objArr, int i, int i2, Object obj, e7 e7Var) {
        int iZ = ur7.z(i2, i);
        Object[] objArrU = u(objArr);
        if (i != 0) {
            Object obj2 = objArrU[iZ];
            obj2.getClass();
            objArrU[iZ] = M((Object[]) obj2, i - 5, i2, obj, e7Var);
            return objArrU;
        }
        if (objArrU != objArr) {
            ((AbstractList) this).modCount++;
        }
        e7Var.a = objArrU[iZ];
        objArrU[iZ] = obj;
        return objArrU;
    }

    public final void N(Collection collection, int i, Object[] objArr, int i2, Object[][] objArr2, int i3, Object[] objArr3) {
        Object[] objArrW;
        if (i3 < 1) {
            xx9.a("requires at least one nullBuffer");
        }
        Object[] objArrU = u(objArr);
        objArr2[0] = objArrU;
        int i4 = i & 31;
        int size = ((collection.size() + i) - 1) & 31;
        int i5 = (i2 - i4) + size;
        if (i5 < 32) {
            k80.g0(size + 1, i4, i2, objArrU, objArr3);
        } else {
            int i6 = i5 - 31;
            if (i3 == 1) {
                objArrW = objArrU;
            } else {
                objArrW = w();
                i3--;
                objArr2[i3] = objArrW;
            }
            int i7 = i2 - i6;
            k80.g0(0, i7, i2, objArrU, objArr3);
            k80.g0(size + 1, i4, i7, objArrU, objArrW);
            objArr3 = objArrW;
        }
        Iterator it2 = collection.iterator();
        f(objArrU, i4, it2);
        for (int i8 = 1; i8 < i3; i8++) {
            Object[] objArrW2 = w();
            f(objArrW2, 0, it2);
            objArr2[i8] = objArrW2;
        }
        f(objArr3, 0, it2);
    }

    public final int O() {
        int i = this.h;
        return i <= 32 ? i : i - ((i - 1) & (-32));
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        hlg.n(i, getSize());
        if (i == getSize()) {
            add(obj);
            return;
        }
        ((AbstractList) this).modCount++;
        int iL = L();
        if (i >= iL) {
            r(i - iL, obj, this.f);
            return;
        }
        e7 e7Var = new e7(null);
        Object[] objArr = this.f;
        objArr.getClass();
        r(0, e7Var.a, q(objArr, this.d, i, obj, e7Var));
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i, Collection collection) {
        Collection collection2;
        Object[] objArrW;
        hlg.n(i, this.h);
        if (i == this.h) {
            return addAll(collection);
        }
        if (collection.isEmpty()) {
            return false;
        }
        ((AbstractList) this).modCount++;
        int i2 = (i >> 5) << 5;
        int size = ((collection.size() + (this.h - i2)) - 1) / 32;
        if (size == 0) {
            int i3 = i & 31;
            int size2 = ((collection.size() + i) - 1) & 31;
            Object[] objArr = this.g;
            Object[] objArrU = u(objArr);
            k80.g0(size2 + 1, i3, O(), objArr, objArrU);
            f(objArrU, i3, collection.iterator());
            this.g = objArrU;
            this.h = collection.size() + this.h;
            return true;
        }
        Object[][] objArr2 = new Object[size][];
        int iO = O();
        int size3 = collection.size() + this.h;
        if (size3 > 32) {
            size3 -= (size3 - 1) & (-32);
        }
        if (i >= L()) {
            objArrW = w();
            collection2 = collection;
            N(collection2, i, this.g, iO, objArr2, size, objArrW);
            objArr2 = objArr2;
        } else {
            collection2 = collection;
            Object[] objArr3 = this.g;
            if (size3 > iO) {
                int i4 = size3 - iO;
                Object[] objArrV = v(i4, objArr3);
                p(collection2, i, i4, objArr2, size, objArrV);
                objArr2 = objArr2;
                objArrW = objArrV;
            } else {
                objArrW = w();
                int i5 = iO - size3;
                k80.g0(0, i5, iO, objArr3, objArrW);
                int i6 = 32 - i5;
                Object[] objArrV2 = v(i6, this.g);
                int i7 = size - 1;
                objArr2[i7] = objArrV2;
                p(collection2, i, i6, objArr2, i7, objArrV2);
                collection2 = collection2;
            }
        }
        this.f = C(this.f, i2, objArr2);
        this.g = objArrW;
        this.h = collection2.size() + this.h;
        return true;
    }

    public final y1 d() {
        y1 lgcVar;
        Object[] objArr = this.f;
        if (objArr == this.b && this.g == this.c) {
            lgcVar = this.a;
        } else {
            this.e = new no3(19);
            this.b = objArr;
            Object[] objArr2 = this.g;
            this.c = objArr2;
            lgcVar = objArr == null ? objArr2.length == 0 ? lgc.b : new lgc(Arrays.copyOf(objArr2, this.h)) : new v89(objArr, objArr2, this.h, this.d);
        }
        this.a = lgcVar;
        return lgcVar;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        Object[] objArr;
        hlg.m(i, getSize());
        if (L() <= i) {
            objArr = this.g;
        } else {
            Object[] objArr2 = this.f;
            objArr2.getClass();
            for (int i2 = this.d; i2 > 0; i2 -= 5) {
                Object[] objArr3 = objArr2[ur7.z(i, i2)];
                objArr3.getClass();
                objArr2 = objArr3;
            }
            objArr = objArr2;
        }
        return objArr[i & 31];
    }

    @Override // defpackage.s1
    public final int getSize() {
        return this.h;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i) {
        hlg.n(i, this.h);
        return new b99(this, i);
    }

    public final int m() {
        return ((AbstractList) this).modCount;
    }

    public final void p(Collection collection, int i, int i2, Object[][] objArr, int i3, Object[] objArr2) {
        if (this.f == null) {
            ygf.f("root is null");
            return;
        }
        int i4 = i >> 5;
        l1 l1VarT = t(L() >> 5);
        int i5 = i3;
        Object[] objArrV = objArr2;
        while (l1VarT.b - 1 != i4) {
            Object[] objArr3 = (Object[]) l1VarT.previous();
            k80.g0(0, 32 - i2, 32, objArr3, objArrV);
            objArrV = v(i2, objArr3);
            i5--;
            objArr[i5] = objArrV;
        }
        Object[] objArr4 = (Object[]) l1VarT.previous();
        int iL = i3 - (((L() >> 5) - 1) - i4);
        if (iL < i3) {
            objArr2 = objArr[iL];
            objArr2.getClass();
        }
        N(collection, i, objArr4, 32, objArr, iL, objArr2);
    }

    public final Object[] q(Object[] objArr, int i, int i2, Object obj, e7 e7Var) {
        Object obj2;
        int iZ = ur7.z(i2, i);
        if (i == 0) {
            e7Var.a = objArr[31];
            Object[] objArrU = u(objArr);
            k80.g0(iZ + 1, iZ, 31, objArr, objArrU);
            objArrU[iZ] = obj;
            return objArrU;
        }
        Object[] objArrU2 = u(objArr);
        int i3 = i - 5;
        Object obj3 = objArrU2[iZ];
        obj3.getClass();
        objArrU2[iZ] = q((Object[]) obj3, i3, i2, obj, e7Var);
        while (true) {
            iZ++;
            if (iZ >= 32 || (obj2 = objArrU2[iZ]) == null) {
                break;
            }
            objArrU2[iZ] = q((Object[]) obj2, i3, 0, e7Var.a, e7Var);
        }
        return objArrU2;
    }

    public final void r(int i, Object obj, Object[] objArr) {
        int iO = O();
        Object[] objArrU = u(this.g);
        Object[] objArr2 = this.g;
        if (iO >= 32) {
            Object obj2 = objArr2[31];
            k80.g0(i + 1, i, 31, objArr2, objArrU);
            objArrU[i] = obj;
            D(objArr, objArrU, x(obj2));
            return;
        }
        k80.g0(i + 1, i, iO, objArr2, objArrU);
        objArrU[i] = obj;
        this.f = objArr;
        this.g = objArrU;
        this.h++;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean removeAll(Collection collection) {
        return I(new w1(2, collection));
    }

    @Override // defpackage.s1
    public final Object removeAt(int i) {
        hlg.m(i, getSize());
        ((AbstractList) this).modCount++;
        int iL = L();
        if (i >= iL) {
            return K(this.f, iL, this.d, i - iL);
        }
        e7 e7Var = new e7(this.g[0]);
        Object[] objArr = this.f;
        objArr.getClass();
        K(J(objArr, this.d, i, e7Var), iL, this.d, 0);
        return e7Var.a;
    }

    public final boolean s(Object[] objArr) {
        return objArr.length == 33 && objArr[32] == this.e;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        hlg.m(i, getSize());
        if (L() > i) {
            e7 e7Var = new e7(null);
            Object[] objArr = this.f;
            objArr.getClass();
            this.f = M(objArr, this.d, i, obj, e7Var);
            return e7Var.a;
        }
        Object[] objArrU = u(this.g);
        if (objArrU != this.g) {
            ((AbstractList) this).modCount++;
        }
        int i2 = i & 31;
        Object obj2 = objArrU[i2];
        objArrU[i2] = obj;
        this.g = objArrU;
        return obj2;
    }

    public final l1 t(int i) {
        Object[] objArr = this.f;
        if (objArr == null) {
            ygf.f("Invalid root");
            return null;
        }
        int iL = L() >> 5;
        hlg.n(i, iL);
        int i2 = this.d;
        return i2 == 0 ? new mz0(i, objArr) : new ysd(objArr, i, iL, i2 / 5);
    }

    public final Object[] u(Object[] objArr) {
        if (objArr == null) {
            return w();
        }
        if (s(objArr)) {
            return objArr;
        }
        Object[] objArrW = w();
        int length = objArr.length;
        if (length > 32) {
            length = 32;
        }
        k80.j0(0, length, 6, objArr, objArrW);
        return objArrW;
    }

    public final Object[] v(int i, Object[] objArr) {
        if (s(objArr)) {
            k80.g0(i, 0, 32 - i, objArr, objArr);
            return objArr;
        }
        Object[] objArrW = w();
        k80.g0(i, 0, 32 - i, objArr, objArrW);
        return objArrW;
    }

    public final Object[] w() {
        Object[] objArr = new Object[33];
        objArr[32] = this.e;
        return objArr;
    }

    public final Object[] x(Object obj) {
        Object[] objArr = new Object[33];
        objArr[0] = obj;
        objArr[32] = this.e;
        return objArr;
    }

    public final Object[] y(int i, int i2, Object[] objArr) {
        if (i2 < 0) {
            xx9.a("shift should be positive");
        }
        if (i2 == 0) {
            return objArr;
        }
        int iZ = ur7.z(i, i2);
        Object obj = objArr[iZ];
        obj.getClass();
        Object objY = y(i, i2 - 5, (Object[]) obj);
        if (iZ < 31) {
            int i3 = iZ + 1;
            if (objArr[i3] != null) {
                if (s(objArr)) {
                    Arrays.fill(objArr, i3, 32, (Object) null);
                }
                Object[] objArrW = w();
                k80.g0(0, 0, i3, objArr, objArrW);
                objArr = objArrW;
            }
        }
        if (objY == objArr[iZ]) {
            return objArr;
        }
        Object[] objArrU = u(objArr);
        objArrU[iZ] = objY;
        return objArrU;
    }

    public final Object[] z(Object[] objArr, int i, int i2, e7 e7Var) {
        Object[] objArrZ;
        int iZ = ur7.z(i2 - 1, i);
        if (i == 5) {
            e7Var.a = objArr[iZ];
            objArrZ = null;
        } else {
            Object obj = objArr[iZ];
            obj.getClass();
            objArrZ = z((Object[]) obj, i - 5, i2, e7Var);
        }
        if (objArrZ == null && iZ == 0) {
            return null;
        }
        Object[] objArrU = u(objArr);
        objArrU[iZ] = objArrZ;
        return objArrU;
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        ((AbstractList) this).modCount++;
        int iO = O();
        if (iO < 32) {
            Object[] objArrU = u(this.g);
            objArrU[iO] = obj;
            this.g = objArrU;
            this.h = getSize() + 1;
        } else {
            D(this.f, this.g, x(obj));
        }
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        if (collection.isEmpty()) {
            return false;
        }
        ((AbstractList) this).modCount++;
        int iO = O();
        Iterator it2 = collection.iterator();
        if (32 - iO >= collection.size()) {
            Object[] objArrU = u(this.g);
            f(objArrU, iO, it2);
            this.g = objArrU;
            this.h = collection.size() + this.h;
            return true;
        }
        int size = ((collection.size() + iO) - 1) / 32;
        Object[][] objArr = new Object[size][];
        Object[] objArrU2 = u(this.g);
        f(objArrU2, iO, it2);
        objArr[0] = objArrU2;
        for (int i = 1; i < size; i++) {
            Object[] objArrW = w();
            f(objArrW, 0, it2);
            objArr[i] = objArrW;
        }
        this.f = C(this.f, L(), objArr);
        Object[] objArrW2 = w();
        f(objArrW2, 0, it2);
        this.g = objArrW2;
        this.h = collection.size() + this.h;
        return true;
    }
}
