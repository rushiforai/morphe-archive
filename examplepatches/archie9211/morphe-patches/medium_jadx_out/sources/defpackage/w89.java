package defpackage;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w89 extends s1 implements Collection, uh6 {
    public int a;
    public x1 b;
    public hpe c;
    public Object[] d;
    public Object[] e;
    public int f;

    public w89(x1 x1Var, Object[] objArr, Object[] objArr2, int i) {
        objArr2.getClass();
        this.a = i;
        this.b = x1Var;
        this.c = new hpe(19);
        this.d = objArr;
        this.e = objArr2;
        this.f = x1Var.getSize();
    }

    public static void f(Object[] objArr, int i, Iterator it2) {
        while (i < 32 && it2.hasNext()) {
            objArr[i] = it2.next();
            i++;
        }
    }

    public final void A(int i, int i2, Object[] objArr) {
        if (i2 == 0) {
            M(null);
            if (objArr == null) {
                objArr = new Object[0];
            }
            N(objArr);
            this.f = i;
            this.a = i2;
            return;
        }
        q84 q84Var = new q84(null);
        objArr.getClass();
        Object[] objArrZ = z(objArr, i2, i, q84Var);
        objArrZ.getClass();
        Object obj = q84Var.a;
        obj.getClass();
        N((Object[]) obj);
        this.f = i;
        if (objArrZ[1] == null) {
            M((Object[]) objArrZ[0]);
            this.a = i2 - 5;
        } else {
            M(objArrZ);
            this.a = i2;
        }
    }

    public final Object[] B(Object[] objArr, int i, int i2, Iterator it2) {
        if (!it2.hasNext()) {
            ygf.f("Check failed.");
            return null;
        }
        if (i2 < 0) {
            ygf.f("Check failed.");
            return null;
        }
        if (i2 == 0) {
            return (Object[]) it2.next();
        }
        Object[] objArrU = u(objArr);
        int iU = tr7.u(i, i2);
        int i3 = i2 - 5;
        objArrU[iU] = B((Object[]) objArrU[iU], i, i3, it2);
        while (true) {
            iU++;
            if (iU >= 32 || !it2.hasNext()) {
                break;
            }
            objArrU[iU] = B((Object[]) objArrU[iU], 0, i3, it2);
        }
        return objArrU;
    }

    public final Object[] C(Object[] objArr, int i, Object[][] objArr2) {
        h1 h1Var = new h1(objArr2);
        int i2 = i >> 5;
        int i3 = this.a;
        Object[] objArrB = i2 < (1 << i3) ? B(objArr, i, i3, h1Var) : u(objArr);
        while (h1Var.hasNext()) {
            this.a += 5;
            objArrB = x(objArrB);
            int i4 = this.a;
            B(objArrB, 1 << i4, i4, h1Var);
        }
        return objArrB;
    }

    public final void D(Object[] objArr, Object[] objArr2, Object[] objArr3) {
        int i = this.f >> 5;
        int i2 = this.a;
        if (i > (1 << i2)) {
            M(E(this.a + 5, x(objArr), objArr2));
            N(objArr3);
            this.a += 5;
            this.f++;
            return;
        }
        if (objArr == null) {
            M(objArr2);
            N(objArr3);
            this.f++;
        } else {
            M(E(i2, objArr, objArr2));
            N(objArr3);
            this.f++;
        }
    }

    public final Object[] E(int i, Object[] objArr, Object[] objArr2) {
        int iU = tr7.u(getSize() - 1, i);
        Object[] objArrU = u(objArr);
        if (i == 5) {
            objArrU[iU] = objArr2;
            return objArrU;
        }
        objArrU[iU] = E(i - 5, (Object[]) objArrU[iU], objArr2);
        return objArrU;
    }

    public final int F(w1 w1Var, Object[] objArr, int i, int i2, q84 q84Var, ArrayList arrayList, ArrayList arrayList2) {
        if (s(objArr)) {
            arrayList.add(objArr);
        }
        Object obj = q84Var.a;
        obj.getClass();
        Object[] objArr2 = (Object[]) obj;
        Object[] objArrW = objArr2;
        for (int i3 = 0; i3 < i; i3++) {
            Object obj2 = objArr[i3];
            if (!((Boolean) w1Var.invoke(obj2)).booleanValue()) {
                if (i2 == 32) {
                    objArrW = !arrayList.isEmpty() ? (Object[]) arrayList.remove(arrayList.size() - 1) : w();
                    i2 = 0;
                }
                objArrW[i2] = obj2;
                i2++;
            }
        }
        q84Var.a = objArrW;
        if (objArr2 != objArrW) {
            arrayList2.add(objArr2);
        }
        return i2;
    }

    public final int G(w1 w1Var, Object[] objArr, int i, q84 q84Var) {
        Object[] objArrU = objArr;
        int i2 = i;
        boolean z = false;
        for (int i3 = 0; i3 < i; i3++) {
            Object obj = objArr[i3];
            if (((Boolean) w1Var.invoke(obj)).booleanValue()) {
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
        q84Var.a = objArrU;
        return i2;
    }

    public final int H(w1 w1Var, int i, q84 q84Var) {
        int iG = G(w1Var, this.e, i, q84Var);
        Object obj = q84Var.a;
        if (iG == i) {
            return i;
        }
        obj.getClass();
        Object[] objArr = (Object[]) obj;
        Arrays.fill(objArr, iG, i, (Object) null);
        N(objArr);
        this.f -= i - iG;
        return iG;
    }

    public final Object[] I(Object[] objArr, int i, int i2, q84 q84Var) {
        int iU = tr7.u(i2, i);
        if (i == 0) {
            Object obj = objArr[iU];
            Object[] objArrU = u(objArr);
            k80.g0(iU, iU + 1, 32, objArr, objArrU);
            objArrU[31] = q84Var.a;
            q84Var.a = obj;
            return objArrU;
        }
        int iU2 = objArr[31] == null ? tr7.u(K() - 1, i) : 31;
        Object[] objArrU2 = u(objArr);
        int i3 = i - 5;
        int i4 = iU + 1;
        if (i4 <= iU2) {
            while (true) {
                Object obj2 = objArrU2[iU2];
                obj2.getClass();
                objArrU2[iU2] = I((Object[]) obj2, i3, 0, q84Var);
                if (iU2 == i4) {
                    break;
                }
                iU2--;
            }
        }
        Object obj3 = objArrU2[iU];
        obj3.getClass();
        objArrU2[iU] = I((Object[]) obj3, i3, i2, q84Var);
        return objArrU2;
    }

    public final Object J(Object[] objArr, int i, int i2, int i3) {
        int i4 = this.f - i;
        Object[] objArr2 = this.e;
        if (i4 == 1) {
            Object obj = objArr2[0];
            A(i, i2, objArr);
            return obj;
        }
        Object obj2 = objArr2[i3];
        Object[] objArrU = u(objArr2);
        k80.g0(i3, i3 + 1, i4, objArr2, objArrU);
        objArrU[i4 - 1] = null;
        M(objArr);
        N(objArrU);
        this.f = (i + i4) - 1;
        this.a = i2;
        return obj2;
    }

    public final int K() {
        int i = this.f;
        if (i <= 32) {
            return 0;
        }
        return (i - 1) & (-32);
    }

    public final Object[] L(Object[] objArr, int i, int i2, Object obj, q84 q84Var) {
        int iU = tr7.u(i2, i);
        Object[] objArrU = u(objArr);
        if (i != 0) {
            Object obj2 = objArrU[iU];
            obj2.getClass();
            objArrU[iU] = L((Object[]) obj2, i - 5, i2, obj, q84Var);
            return objArrU;
        }
        if (objArrU != objArr) {
            ((AbstractList) this).modCount++;
        }
        q84Var.a = objArrU[iU];
        objArrU[iU] = obj;
        return objArrU;
    }

    public final void M(Object[] objArr) {
        if (objArr != this.d) {
            this.b = null;
            this.d = objArr;
        }
    }

    public final void N(Object[] objArr) {
        if (objArr != this.e) {
            this.b = null;
            this.e = objArr;
        }
    }

    public final void O(Collection collection, int i, Object[] objArr, int i2, Object[][] objArr2, int i3, Object[] objArr3) {
        Object[] objArrW;
        if (i3 < 1) {
            ygf.f("Check failed.");
            return;
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

    public final int P() {
        int i = this.f;
        return i <= 32 ? i : i - ((i - 1) & (-32));
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        sgg.G(i, getSize());
        if (i == getSize()) {
            add(obj);
            return;
        }
        ((AbstractList) this).modCount++;
        int iK = K();
        if (i >= iK) {
            r(i - iK, obj, this.d);
            return;
        }
        q84 q84Var = new q84(null);
        Object[] objArr = this.d;
        objArr.getClass();
        r(0, q84Var.a, p(objArr, this.a, i, obj, q84Var));
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i, Collection collection) {
        Collection collection2;
        Object[] objArrW;
        collection.getClass();
        sgg.G(i, this.f);
        if (i == this.f) {
            return addAll(collection);
        }
        if (collection.isEmpty()) {
            return false;
        }
        ((AbstractList) this).modCount++;
        int i2 = (i >> 5) << 5;
        int size = ((collection.size() + (this.f - i2)) - 1) / 32;
        if (size == 0) {
            int i3 = i & 31;
            int size2 = ((collection.size() + i) - 1) & 31;
            Object[] objArr = this.e;
            Object[] objArrU = u(objArr);
            k80.g0(size2 + 1, i3, P(), objArr, objArrU);
            f(objArrU, i3, collection.iterator());
            N(objArrU);
            this.f = collection.size() + this.f;
            return true;
        }
        Object[][] objArr2 = new Object[size][];
        int iP = P();
        int size3 = collection.size() + this.f;
        if (size3 > 32) {
            size3 -= (size3 - 1) & (-32);
        }
        if (i >= K()) {
            objArrW = w();
            collection2 = collection;
            O(collection2, i, this.e, iP, objArr2, size, objArrW);
            objArr2 = objArr2;
        } else {
            collection2 = collection;
            Object[] objArr3 = this.e;
            if (size3 > iP) {
                int i4 = size3 - iP;
                Object[] objArrV = v(i4, objArr3);
                q(collection2, i, i4, objArr2, size, objArrV);
                objArr2 = objArr2;
                objArrW = objArrV;
            } else {
                objArrW = w();
                int i5 = iP - size3;
                k80.g0(0, i5, iP, objArr3, objArrW);
                int i6 = 32 - i5;
                Object[] objArrV2 = v(i6, this.e);
                int i7 = size - 1;
                objArr2[i7] = objArrV2;
                q(collection2, i, i6, objArr2, i7, objArrV2);
                collection2 = collection2;
            }
        }
        M(C(this.d, i2, objArr2));
        N(objArrW);
        this.f = collection2.size() + this.f;
        return true;
    }

    public final x1 d() {
        x1 kgcVar = this.b;
        if (kgcVar == null) {
            Object[] objArr = this.d;
            Object[] objArr2 = this.e;
            this.c = new hpe(19);
            kgcVar = objArr == null ? objArr2.length == 0 ? kgc.b : new kgc(Arrays.copyOf(objArr2, this.f)) : new u89(objArr, objArr2, this.f, this.a);
            this.b = kgcVar;
        }
        return kgcVar;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        Object[] objArr;
        sgg.F(i, getSize());
        if (K() <= i) {
            objArr = this.e;
        } else {
            Object[] objArr2 = this.d;
            objArr2.getClass();
            for (int i2 = this.a; i2 > 0; i2 -= 5) {
                Object[] objArr3 = objArr2[tr7.u(i, i2)];
                objArr3.getClass();
                objArr2 = objArr3;
            }
            objArr = objArr2;
        }
        return objArr[i & 31];
    }

    @Override // defpackage.s1
    public final int getSize() {
        return this.f;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i) {
        sgg.G(i, this.f);
        return new a99(this, i);
    }

    public final int m() {
        return ((AbstractList) this).modCount;
    }

    public final Object[] p(Object[] objArr, int i, int i2, Object obj, q84 q84Var) {
        Object obj2;
        int iU = tr7.u(i2, i);
        if (i == 0) {
            q84Var.a = objArr[31];
            Object[] objArrU = u(objArr);
            k80.g0(iU + 1, iU, 31, objArr, objArrU);
            objArrU[iU] = obj;
            return objArrU;
        }
        Object[] objArrU2 = u(objArr);
        int i3 = i - 5;
        Object obj3 = objArrU2[iU];
        obj3.getClass();
        objArrU2[iU] = p((Object[]) obj3, i3, i2, obj, q84Var);
        while (true) {
            iU++;
            if (iU >= 32 || (obj2 = objArrU2[iU]) == null) {
                break;
            }
            objArrU2[iU] = p((Object[]) obj2, i3, 0, q84Var.a, q84Var);
        }
        return objArrU2;
    }

    public final void q(Collection collection, int i, int i2, Object[][] objArr, int i3, Object[] objArr2) {
        if (this.d == null) {
            ygf.f("Required value was null.");
            return;
        }
        int i4 = i >> 5;
        l1 l1VarT = t(K() >> 5);
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
        int iK = i3 - (((K() >> 5) - 1) - i4);
        if (iK < i3) {
            objArr2 = objArr[iK];
            objArr2.getClass();
        }
        O(collection, i, objArr4, 32, objArr, iK, objArr2);
    }

    public final void r(int i, Object obj, Object[] objArr) {
        int iP = P();
        Object[] objArrU = u(this.e);
        Object[] objArr2 = this.e;
        if (iP >= 32) {
            Object obj2 = objArr2[31];
            k80.g0(i + 1, i, 31, objArr2, objArrU);
            objArrU[i] = obj;
            D(objArr, objArrU, x(obj2));
            return;
        }
        k80.g0(i + 1, i, iP, objArr2, objArrU);
        objArrU[i] = obj;
        M(objArr);
        N(objArrU);
        this.f++;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0029, code lost:
    
        r2 = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0057, code lost:
    
        if (r2 != r15) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0023, code lost:
    
        if (H(r3, r15, r7) != r15) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0025, code lost:
    
        r2 = r14;
     */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean removeAll(java.util.Collection r15) {
        /*
            Method dump skipped, instruction units count: 232
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w89.removeAll(java.util.Collection):boolean");
    }

    @Override // defpackage.s1
    public final Object removeAt(int i) {
        sgg.F(i, getSize());
        ((AbstractList) this).modCount++;
        int iK = K();
        if (i >= iK) {
            return J(this.d, iK, this.a, i - iK);
        }
        q84 q84Var = new q84(this.e[0]);
        Object[] objArr = this.d;
        objArr.getClass();
        J(I(objArr, this.a, i, q84Var), iK, this.a, 0);
        return q84Var.a;
    }

    public final boolean s(Object[] objArr) {
        return objArr.length == 33 && objArr[32] == this.c;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        sgg.F(i, getSize());
        if (K() > i) {
            q84 q84Var = new q84(null);
            Object[] objArr = this.d;
            objArr.getClass();
            M(L(objArr, this.a, i, obj, q84Var));
            return q84Var.a;
        }
        Object[] objArrU = u(this.e);
        if (objArrU != this.e) {
            ((AbstractList) this).modCount++;
        }
        int i2 = i & 31;
        Object obj2 = objArrU[i2];
        objArrU[i2] = obj;
        N(objArrU);
        return obj2;
    }

    public final l1 t(int i) {
        if (this.d == null) {
            ygf.f("Required value was null.");
            return null;
        }
        int iK = K() >> 5;
        sgg.G(i, iK);
        int i2 = this.a;
        Object[] objArr = this.d;
        if (i2 == 0) {
            objArr.getClass();
            return new lz0(i, objArr);
        }
        objArr.getClass();
        return new xsd(objArr, i, iK, i2 / 5);
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
        objArr[32] = this.c;
        return objArr;
    }

    public final Object[] x(Object obj) {
        Object[] objArr = new Object[33];
        objArr[0] = obj;
        objArr[32] = this.c;
        return objArr;
    }

    public final Object[] y(int i, int i2, Object[] objArr) {
        if (i2 < 0) {
            ygf.f("Check failed.");
            return null;
        }
        if (i2 == 0) {
            return objArr;
        }
        int iU = tr7.u(i, i2);
        Object obj = objArr[iU];
        obj.getClass();
        Object objY = y(i, i2 - 5, (Object[]) obj);
        if (iU < 31) {
            int i3 = iU + 1;
            if (objArr[i3] != null) {
                if (s(objArr)) {
                    Arrays.fill(objArr, i3, 32, (Object) null);
                }
                Object[] objArrW = w();
                k80.g0(0, 0, i3, objArr, objArrW);
                objArr = objArrW;
            }
        }
        if (objY == objArr[iU]) {
            return objArr;
        }
        Object[] objArrU = u(objArr);
        objArrU[iU] = objY;
        return objArrU;
    }

    public final Object[] z(Object[] objArr, int i, int i2, q84 q84Var) {
        Object[] objArrZ;
        int iU = tr7.u(i2 - 1, i);
        if (i == 5) {
            q84Var.a = objArr[iU];
            objArrZ = null;
        } else {
            Object obj = objArr[iU];
            obj.getClass();
            objArrZ = z((Object[]) obj, i - 5, i2, q84Var);
        }
        if (objArrZ == null && iU == 0) {
            return null;
        }
        Object[] objArrU = u(objArr);
        objArrU[iU] = objArrZ;
        return objArrU;
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        ((AbstractList) this).modCount++;
        int iP = P();
        if (iP < 32) {
            Object[] objArrU = u(this.e);
            objArrU[iP] = obj;
            N(objArrU);
            this.f = getSize() + 1;
        } else {
            D(this.d, this.e, x(obj));
        }
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        collection.getClass();
        if (collection.isEmpty()) {
            return false;
        }
        ((AbstractList) this).modCount++;
        int iP = P();
        Iterator it2 = collection.iterator();
        if (32 - iP >= collection.size()) {
            Object[] objArrU = u(this.e);
            f(objArrU, iP, it2);
            N(objArrU);
            this.f = collection.size() + this.f;
            return true;
        }
        int size = ((collection.size() + iP) - 1) / 32;
        Object[][] objArr = new Object[size][];
        Object[] objArrU2 = u(this.e);
        f(objArrU2, iP, it2);
        objArr[0] = objArrU2;
        for (int i = 1; i < size; i++) {
            Object[] objArrW = w();
            f(objArrW, 0, it2);
            objArr[i] = objArrW;
        }
        M(C(this.d, K(), objArr));
        Object[] objArrW2 = w();
        f(objArrW2, 0, it2);
        N(objArrW2);
        this.f = collection.size() + this.f;
        return true;
    }
}
