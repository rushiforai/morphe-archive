package t1;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.ListIterator;
import kotlin.collections.AbstractMutableList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableCollection;
import p1.o1;

/* loaded from: classes2.dex */
public final class f extends AbstractMutableList implements Collection, KMutableCollection {

    /* renamed from: a, reason: collision with root package name */
    public s1.d f88441a;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f88442b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f88443c;

    /* renamed from: d, reason: collision with root package name */
    public int f88444d;

    /* renamed from: e, reason: collision with root package name */
    public w1.b f88445e = new w1.b();

    /* renamed from: f, reason: collision with root package name */
    public Object[] f88446f;

    /* renamed from: g, reason: collision with root package name */
    public Object[] f88447g;

    /* renamed from: h, reason: collision with root package name */
    public int f88448h;

    public f(c cVar, Object[] objArr, Object[] objArr2, int i5) {
        this.f88441a = cVar;
        this.f88442b = objArr;
        this.f88443c = objArr2;
        this.f88444d = i5;
        this.f88446f = objArr;
        this.f88447g = objArr2;
        this.f88448h = cVar.size();
    }

    public static void f(Object[] objArr, int i5, Iterator it) {
        while (i5 < 32 && it.hasNext()) {
            objArr[i5] = it.next();
            i5++;
        }
    }

    public final int A(Function1 function1, Object[] objArr, int i5, b5.f fVar) {
        Object[] objArrO = objArr;
        int i11 = i5;
        boolean z11 = false;
        for (int i12 = 0; i12 < i5; i12++) {
            Object obj = objArr[i12];
            if (((Boolean) function1.invoke(obj)).booleanValue()) {
                if (!z11) {
                    objArrO = o(objArr);
                    z11 = true;
                    i11 = i12;
                }
            } else if (z11) {
                objArrO[i11] = obj;
                i11++;
            }
        }
        fVar.f17550a = objArrO;
        return i11;
    }

    public final int B(Function1 function1, int i5, b5.f fVar) {
        int iA = A(function1, this.f88447g, i5, fVar);
        if (iA == i5) {
            return i5;
        }
        Object obj = fVar.f17550a;
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
        Object[] objArr = (Object[]) obj;
        Arrays.fill(objArr, iA, i5, (Object) null);
        this.f88447g = objArr;
        this.f88448h -= i5 - iA;
        return iA;
    }

    public final boolean D(Function1 function1) {
        Object[] objArrV;
        int i5;
        Function1 function12 = function1;
        int iJ = J();
        Object[] objArrS = null;
        b5.f fVar = new b5.f(objArrS);
        boolean z11 = false;
        if (this.f88446f != null) {
            a aVarN = n(0);
            int iA = 32;
            while (iA == 32 && aVarN.hasNext()) {
                iA = A(function12, (Object[]) aVarN.next(), 32, fVar);
            }
            if (iA == 32) {
                int iB = B(function12, iJ, fVar);
                if (iB == 0) {
                    u(this.f88446f, this.f88448h, this.f88444d);
                }
                if (iB != iJ) {
                }
            } else {
                int i11 = (aVarN.f88431a - 1) << 5;
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                int iZ = iA;
                while (aVarN.hasNext()) {
                    iZ = z(function12, (Object[]) aVarN.next(), 32, iZ, fVar, arrayList2, arrayList);
                    function12 = function1;
                }
                int iZ2 = z(function1, this.f88447g, iJ, iZ, fVar, arrayList2, arrayList);
                Object obj = fVar.f17550a;
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
                Object[] objArr = (Object[]) obj;
                Arrays.fill(objArr, iZ2, 32, (Object) null);
                if (arrayList.isEmpty()) {
                    objArrV = this.f88446f;
                    Intrinsics.d(objArrV);
                } else {
                    objArrV = v(this.f88446f, i11, this.f88444d, arrayList.iterator());
                }
                int size = i11 + (arrayList.size() << 5);
                if ((size & 31) != 0) {
                    o1.a("invalid size");
                }
                if (size == 0) {
                    this.f88444d = 0;
                } else {
                    int i12 = size - 1;
                    while (true) {
                        i5 = this.f88444d;
                        if ((i12 >> i5) != 0) {
                            break;
                        }
                        this.f88444d = i5 - 5;
                        Object[] objArr2 = objArrV[0];
                        Intrinsics.e(objArr2, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
                        objArrV = objArr2;
                    }
                    objArrS = s(objArrV, i12, i5);
                }
                this.f88446f = objArrS;
                this.f88447g = objArr;
                this.f88448h = size + iZ2;
            }
            z11 = true;
        } else if (B(function12, iJ, fVar) != iJ) {
            z11 = true;
        }
        if (z11) {
            ((AbstractList) this).modCount++;
        }
        return z11;
    }

    public final Object[] E(Object[] objArr, int i5, int i11, b5.f fVar) {
        int iB0 = bh.g.b0(i11, i5);
        if (i5 == 0) {
            Object obj = objArr[iB0];
            Object[] objArrO = o(objArr);
            u90.b.t(objArr, iB0, objArrO, iB0 + 1, 32);
            objArrO[31] = fVar.f17550a;
            fVar.f17550a = obj;
            return objArrO;
        }
        int iB02 = objArr[31] == null ? bh.g.b0(G() - 1, i5) : 31;
        Object[] objArrO2 = o(objArr);
        int i12 = i5 - 5;
        int i13 = iB0 + 1;
        if (i13 <= iB02) {
            while (true) {
                Object obj2 = objArrO2[iB02];
                Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
                objArrO2[iB02] = E((Object[]) obj2, i12, 0, fVar);
                if (iB02 == i13) {
                    break;
                }
                iB02--;
            }
        }
        Object obj3 = objArrO2[iB0];
        Intrinsics.e(obj3, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
        objArrO2[iB0] = E((Object[]) obj3, i12, i11, fVar);
        return objArrO2;
    }

    public final Object F(Object[] objArr, int i5, int i11, int i12) {
        int i13 = this.f88448h - i5;
        if (i13 == 1) {
            Object obj = this.f88447g[0];
            u(objArr, i5, i11);
            return obj;
        }
        Object[] objArr2 = this.f88447g;
        Object obj2 = objArr2[i12];
        Object[] objArrO = o(objArr2);
        u90.b.t(objArr2, i12, objArrO, i12 + 1, i13);
        objArrO[i13 - 1] = null;
        this.f88446f = objArr;
        this.f88447g = objArrO;
        this.f88448h = (i5 + i13) - 1;
        this.f88444d = i11;
        return obj2;
    }

    public final int G() {
        int i5 = this.f88448h;
        if (i5 <= 32) {
            return 0;
        }
        return (i5 - 1) & (-32);
    }

    public final Object[] H(Object[] objArr, int i5, int i11, Object obj, b5.f fVar) {
        int iB0 = bh.g.b0(i11, i5);
        Object[] objArrO = o(objArr);
        if (i5 != 0) {
            Object obj2 = objArrO[iB0];
            Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
            objArrO[iB0] = H((Object[]) obj2, i5 - 5, i11, obj, fVar);
            return objArrO;
        }
        if (objArrO != objArr) {
            ((AbstractList) this).modCount++;
        }
        fVar.f17550a = objArrO[iB0];
        objArrO[iB0] = obj;
        return objArrO;
    }

    public final void I(Collection collection, int i5, Object[] objArr, int i11, Object[][] objArr2, int i12, Object[] objArr3) {
        Object[] objArrQ;
        if (i12 < 1) {
            o1.a("requires at least one nullBuffer");
        }
        Object[] objArrO = o(objArr);
        objArr2[0] = objArrO;
        int i13 = i5 & 31;
        int size = ((collection.size() + i5) - 1) & 31;
        int i14 = (i11 - i13) + size;
        if (i14 < 32) {
            u90.b.t(objArrO, size + 1, objArr3, i13, i11);
        } else {
            int i15 = i14 - 31;
            if (i12 == 1) {
                objArrQ = objArrO;
            } else {
                objArrQ = q();
                i12--;
                objArr2[i12] = objArrQ;
            }
            int i16 = i11 - i15;
            u90.b.t(objArrO, 0, objArr3, i16, i11);
            u90.b.t(objArrO, size + 1, objArrQ, i13, i16);
            objArr3 = objArrQ;
        }
        Iterator it = collection.iterator();
        f(objArrO, i13, it);
        for (int i17 = 1; i17 < i12; i17++) {
            Object[] objArrQ2 = q();
            f(objArrQ2, 0, it);
            objArr2[i17] = objArrQ2;
        }
        f(objArr3, 0, it);
    }

    public final int J() {
        int i5 = this.f88448h;
        return i5 <= 32 ? i5 : i5 - ((i5 - 1) & (-32));
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        p6.j.h(i5, getF71724c());
        if (i5 == getF71724c()) {
            add(obj);
            return;
        }
        ((AbstractList) this).modCount++;
        int iG = G();
        if (i5 >= iG) {
            k(obj, this.f88446f, i5 - iG);
            return;
        }
        b5.f fVar = new b5.f((Object) null);
        Object[] objArr = this.f88446f;
        Intrinsics.d(objArr);
        k(fVar.f17550a, j(objArr, this.f88444d, i5, obj, fVar), 0);
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i5, Collection collection) {
        Collection collection2;
        f fVar;
        Object[] objArrQ;
        p6.j.h(i5, this.f88448h);
        if (i5 == this.f88448h) {
            return addAll(collection);
        }
        if (collection.isEmpty()) {
            return false;
        }
        ((AbstractList) this).modCount++;
        int i11 = (i5 >> 5) << 5;
        int size = ((collection.size() + (this.f88448h - i11)) - 1) / 32;
        if (size == 0) {
            int i12 = i5 & 31;
            int size2 = ((collection.size() + i5) - 1) & 31;
            Object[] objArr = this.f88447g;
            Object[] objArrO = o(objArr);
            u90.b.t(objArr, size2 + 1, objArrO, i12, J());
            f(objArrO, i12, collection.iterator());
            this.f88447g = objArrO;
            this.f88448h = collection.size() + this.f88448h;
            return true;
        }
        Object[][] objArr2 = new Object[size][];
        int iJ = J();
        int size3 = collection.size() + this.f88448h;
        if (size3 > 32) {
            size3 -= (size3 - 1) & (-32);
        }
        if (i5 >= G()) {
            objArrQ = q();
            collection2 = collection;
            I(collection2, i5, this.f88447g, iJ, objArr2, size, objArrQ);
            fVar = this;
            objArr2 = objArr2;
        } else {
            collection2 = collection;
            fVar = this;
            if (size3 > iJ) {
                int i13 = size3 - iJ;
                Object[] objArrP = p(i13, fVar.f88447g);
                fVar.h(collection2, i5, i13, objArr2, size, objArrP);
                objArr2 = objArr2;
                objArrQ = objArrP;
            } else {
                Object[] objArr3 = fVar.f88447g;
                objArrQ = q();
                int i14 = iJ - size3;
                u90.b.t(objArr3, 0, objArrQ, i14, iJ);
                int i15 = 32 - i14;
                Object[] objArrP2 = p(i15, fVar.f88447g);
                int i16 = size - 1;
                objArr2[i16] = objArrP2;
                fVar.h(collection2, i5, i15, objArr2, i16, objArrP2);
                collection2 = collection2;
            }
        }
        fVar.f88446f = w(fVar.f88446f, i11, objArr2);
        fVar.f88447g = objArrQ;
        fVar.f88448h = collection2.size() + fVar.f88448h;
        return true;
    }

    @Override // kotlin.collections.AbstractMutableList
    /* renamed from: c */
    public final int getF71724c() {
        return this.f88448h;
    }

    @Override // kotlin.collections.AbstractMutableList
    public final Object d(int i5) {
        p6.j.g(i5, getF71724c());
        ((AbstractList) this).modCount++;
        int iG = G();
        if (i5 >= iG) {
            return F(this.f88446f, iG, this.f88444d, i5 - iG);
        }
        b5.f fVar = new b5.f(this.f88447g[0]);
        Object[] objArr = this.f88446f;
        Intrinsics.d(objArr);
        F(E(objArr, this.f88444d, i5, fVar), iG, this.f88444d, 0);
        return fVar.f17550a;
    }

    public final s1.d e() {
        s1.d eVar;
        Object[] objArr = this.f88446f;
        if (objArr == this.f88442b && this.f88447g == this.f88443c) {
            eVar = this.f88441a;
        } else {
            this.f88445e = new w1.b();
            this.f88442b = objArr;
            Object[] objArr2 = this.f88447g;
            this.f88443c = objArr2;
            if (objArr != null) {
                Object[] objArr3 = this.f88446f;
                Intrinsics.d(objArr3);
                eVar = new e(this.f88448h, this.f88444d, objArr3, this.f88447g);
            } else if (objArr2.length == 0) {
                eVar = i.f88455c;
            } else {
                Object[] objArrCopyOf = Arrays.copyOf(this.f88447g, this.f88448h);
                Intrinsics.f(objArrCopyOf, "copyOf(...)");
                eVar = new i(objArrCopyOf);
            }
        }
        this.f88441a = eVar;
        return eVar;
    }

    public final int g() {
        return ((AbstractList) this).modCount;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        Object[] objArr;
        p6.j.g(i5, getF71724c());
        if (G() <= i5) {
            objArr = this.f88447g;
        } else {
            objArr = this.f88446f;
            Intrinsics.d(objArr);
            for (int i11 = this.f88444d; i11 > 0; i11 -= 5) {
                Object obj = objArr[bh.g.b0(i5, i11)];
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
                objArr = (Object[]) obj;
            }
        }
        return objArr[i5 & 31];
    }

    public final void h(Collection collection, int i5, int i11, Object[][] objArr, int i12, Object[] objArr2) {
        if (this.f88446f == null) {
            throw new IllegalStateException("root is null");
        }
        int i13 = i5 >> 5;
        a aVarN = n(G() >> 5);
        int i14 = i12;
        Object[] objArrP = objArr2;
        while (aVarN.f88431a - 1 != i13) {
            Object[] objArr3 = (Object[]) aVarN.previous();
            u90.b.t(objArr3, 0, objArrP, 32 - i11, 32);
            objArrP = p(i11, objArr3);
            i14--;
            objArr[i14] = objArrP;
        }
        Object[] objArr4 = (Object[]) aVarN.previous();
        int iG = i12 - (((G() >> 5) - 1) - i13);
        if (iG < i12) {
            objArr2 = objArr[iG];
            Intrinsics.d(objArr2);
        }
        I(collection, i5, objArr4, 32, objArr, iG, objArr2);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator(0);
    }

    public final Object[] j(Object[] objArr, int i5, int i11, Object obj, b5.f fVar) {
        Object obj2;
        int iB0 = bh.g.b0(i11, i5);
        if (i5 == 0) {
            fVar.f17550a = objArr[31];
            Object[] objArrO = o(objArr);
            u90.b.t(objArr, iB0 + 1, objArrO, iB0, 31);
            objArrO[iB0] = obj;
            return objArrO;
        }
        Object[] objArrO2 = o(objArr);
        int i12 = i5 - 5;
        Object obj3 = objArrO2[iB0];
        Intrinsics.e(obj3, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
        objArrO2[iB0] = j((Object[]) obj3, i12, i11, obj, fVar);
        while (true) {
            iB0++;
            if (iB0 >= 32 || (obj2 = objArrO2[iB0]) == null) {
                break;
            }
            objArrO2[iB0] = j((Object[]) obj2, i12, 0, fVar.f17550a, fVar);
        }
        return objArrO2;
    }

    public final void k(Object obj, Object[] objArr, int i5) {
        int iJ = J();
        Object[] objArrO = o(this.f88447g);
        if (iJ < 32) {
            u90.b.t(this.f88447g, i5 + 1, objArrO, i5, iJ);
            objArrO[i5] = obj;
            this.f88446f = objArr;
            this.f88447g = objArrO;
            this.f88448h++;
            return;
        }
        Object[] objArr2 = this.f88447g;
        Object obj2 = objArr2[31];
        u90.b.t(objArr2, i5 + 1, objArrO, i5, 31);
        objArrO[i5] = obj;
        x(objArr, objArrO, r(obj2));
    }

    public final boolean l(Object[] objArr) {
        return objArr.length == 33 && objArr[32] == this.f88445e;
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        p6.j.h(i5, this.f88448h);
        return new h(this, i5);
    }

    public final a n(int i5) {
        Object[] objArr = this.f88446f;
        if (objArr == null) {
            throw new IllegalStateException("Invalid root");
        }
        int iG = G() >> 5;
        p6.j.h(i5, iG);
        int i11 = this.f88444d;
        return i11 == 0 ? new d(objArr, i5) : new j(objArr, i5, iG, i11 / 5);
    }

    public final Object[] o(Object[] objArr) {
        if (objArr == null) {
            return q();
        }
        if (l(objArr)) {
            return objArr;
        }
        Object[] objArrQ = q();
        int length = objArr.length;
        if (length > 32) {
            length = 32;
        }
        u90.b.w(objArr, 0, objArrQ, length, 6);
        return objArrQ;
    }

    public final Object[] p(int i5, Object[] objArr) {
        if (l(objArr)) {
            u90.b.t(objArr, i5, objArr, 0, 32 - i5);
            return objArr;
        }
        Object[] objArrQ = q();
        u90.b.t(objArr, i5, objArrQ, 0, 32 - i5);
        return objArrQ;
    }

    public final Object[] q() {
        Object[] objArr = new Object[33];
        objArr[32] = this.f88445e;
        return objArr;
    }

    public final Object[] r(Object obj) {
        Object[] objArr = new Object[33];
        objArr[0] = obj;
        objArr[32] = this.f88445e;
        return objArr;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean removeAll(Collection collection) {
        return D(new b(1, collection));
    }

    public final Object[] s(Object[] objArr, int i5, int i11) {
        if (i11 < 0) {
            o1.a("shift should be positive");
        }
        if (i11 == 0) {
            return objArr;
        }
        int iB0 = bh.g.b0(i5, i11);
        Object obj = objArr[iB0];
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
        Object objS = s((Object[]) obj, i5, i11 - 5);
        if (iB0 < 31) {
            int i12 = iB0 + 1;
            if (objArr[i12] != null) {
                if (l(objArr)) {
                    Arrays.fill(objArr, i12, 32, (Object) null);
                }
                Object[] objArrQ = q();
                u90.b.t(objArr, 0, objArrQ, 0, i12);
                objArr = objArrQ;
            }
        }
        if (objS == objArr[iB0]) {
            return objArr;
        }
        Object[] objArrO = o(objArr);
        objArrO[iB0] = objS;
        return objArrO;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        p6.j.g(i5, getF71724c());
        if (G() > i5) {
            b5.f fVar = new b5.f((Object) null);
            Object[] objArr = this.f88446f;
            Intrinsics.d(objArr);
            this.f88446f = H(objArr, this.f88444d, i5, obj, fVar);
            return fVar.f17550a;
        }
        Object[] objArrO = o(this.f88447g);
        if (objArrO != this.f88447g) {
            ((AbstractList) this).modCount++;
        }
        int i11 = i5 & 31;
        Object obj2 = objArrO[i11];
        objArrO[i11] = obj;
        this.f88447g = objArrO;
        return obj2;
    }

    public final Object[] t(Object[] objArr, int i5, int i11, b5.f fVar) {
        Object[] objArrT;
        int iB0 = bh.g.b0(i11 - 1, i5);
        if (i5 == 5) {
            fVar.f17550a = objArr[iB0];
            objArrT = null;
        } else {
            Object obj = objArr[iB0];
            Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
            objArrT = t((Object[]) obj, i5 - 5, i11, fVar);
        }
        if (objArrT == null && iB0 == 0) {
            return null;
        }
        Object[] objArrO = o(objArr);
        objArrO[iB0] = objArrT;
        return objArrO;
    }

    public final void u(Object[] objArr, int i5, int i11) {
        Object obj = null;
        if (i11 == 0) {
            this.f88446f = null;
            if (objArr == null) {
                objArr = new Object[0];
            }
            this.f88447g = objArr;
            this.f88448h = i5;
            this.f88444d = i11;
            return;
        }
        b5.f fVar = new b5.f(obj);
        Intrinsics.d(objArr);
        Object[] objArrT = t(objArr, i11, i5, fVar);
        Intrinsics.d(objArrT);
        Object obj2 = fVar.f17550a;
        Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
        this.f88447g = (Object[]) obj2;
        this.f88448h = i5;
        if (objArrT[1] == null) {
            this.f88446f = (Object[]) objArrT[0];
            this.f88444d = i11 - 5;
        } else {
            this.f88446f = objArrT;
            this.f88444d = i11;
        }
    }

    public final Object[] v(Object[] objArr, int i5, int i11, Iterator it) {
        if (!it.hasNext()) {
            o1.a("invalid buffersIterator");
        }
        if (!(i11 >= 0)) {
            o1.a("negative shift");
        }
        if (i11 == 0) {
            return (Object[]) it.next();
        }
        Object[] objArrO = o(objArr);
        int iB0 = bh.g.b0(i5, i11);
        int i12 = i11 - 5;
        objArrO[iB0] = v((Object[]) objArrO[iB0], i5, i12, it);
        while (true) {
            iB0++;
            if (iB0 >= 32 || !it.hasNext()) {
                break;
            }
            objArrO[iB0] = v((Object[]) objArrO[iB0], 0, i12, it);
        }
        return objArrO;
    }

    public final Object[] w(Object[] objArr, int i5, Object[][] objArr2) {
        b70.a aVarA = ArrayIteratorKt.a(objArr2);
        int i11 = i5 >> 5;
        int i12 = this.f88444d;
        Object[] objArrV = i11 < (1 << i12) ? v(objArr, i5, i12, aVarA) : o(objArr);
        while (aVarA.hasNext()) {
            this.f88444d += 5;
            objArrV = r(objArrV);
            int i13 = this.f88444d;
            v(objArrV, 1 << i13, i13, aVarA);
        }
        return objArrV;
    }

    public final void x(Object[] objArr, Object[] objArr2, Object[] objArr3) {
        int i5 = this.f88448h;
        int i11 = i5 >> 5;
        int i12 = this.f88444d;
        if (i11 > (1 << i12)) {
            this.f88446f = y(this.f88444d + 5, r(objArr), objArr2);
            this.f88447g = objArr3;
            this.f88444d += 5;
            this.f88448h++;
            return;
        }
        if (objArr == null) {
            this.f88446f = objArr2;
            this.f88447g = objArr3;
            this.f88448h = i5 + 1;
        } else {
            this.f88446f = y(i12, objArr, objArr2);
            this.f88447g = objArr3;
            this.f88448h++;
        }
    }

    public final Object[] y(int i5, Object[] objArr, Object[] objArr2) {
        int iB0 = bh.g.b0(getF71724c() - 1, i5);
        Object[] objArrO = o(objArr);
        if (i5 == 5) {
            objArrO[iB0] = objArr2;
            return objArrO;
        }
        objArrO[iB0] = y(i5 - 5, (Object[]) objArrO[iB0], objArr2);
        return objArrO;
    }

    public final int z(Function1 function1, Object[] objArr, int i5, int i11, b5.f fVar, ArrayList arrayList, ArrayList arrayList2) {
        if (l(objArr)) {
            arrayList.add(objArr);
        }
        Object obj = fVar.f17550a;
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
        Object[] objArr2 = (Object[]) obj;
        Object[] objArrQ = objArr2;
        for (int i12 = 0; i12 < i5; i12++) {
            Object obj2 = objArr[i12];
            if (!((Boolean) function1.invoke(obj2)).booleanValue()) {
                if (i11 == 32) {
                    objArrQ = !arrayList.isEmpty() ? (Object[]) arrayList.remove(arrayList.size() - 1) : q();
                    i11 = 0;
                }
                objArrQ[i11] = obj2;
                i11++;
            }
        }
        fVar.f17550a = objArrQ;
        if (objArr2 != objArrQ) {
            arrayList2.add(objArr2);
        }
        return i11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        ((AbstractList) this).modCount++;
        int iJ = J();
        if (iJ < 32) {
            Object[] objArrO = o(this.f88447g);
            objArrO[iJ] = obj;
            this.f88447g = objArrO;
            this.f88448h = getF71724c() + 1;
        } else {
            x(this.f88446f, this.f88447g, r(obj));
        }
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        if (collection.isEmpty()) {
            return false;
        }
        ((AbstractList) this).modCount++;
        int iJ = J();
        Iterator it = collection.iterator();
        if (32 - iJ >= collection.size()) {
            Object[] objArrO = o(this.f88447g);
            f(objArrO, iJ, it);
            this.f88447g = objArrO;
            this.f88448h = collection.size() + this.f88448h;
            return true;
        }
        int size = ((collection.size() + iJ) - 1) / 32;
        Object[][] objArr = new Object[size][];
        Object[] objArrO2 = o(this.f88447g);
        f(objArrO2, iJ, it);
        objArr[0] = objArrO2;
        for (int i5 = 1; i5 < size; i5++) {
            Object[] objArrQ = q();
            f(objArrQ, 0, it);
            objArr[i5] = objArrQ;
        }
        this.f88446f = w(this.f88446f, G(), objArr);
        Object[] objArrQ2 = q();
        f(objArrQ2, 0, it);
        this.f88447g = objArrQ2;
        this.f88448h = collection.size() + this.f88448h;
        return true;
    }
}
