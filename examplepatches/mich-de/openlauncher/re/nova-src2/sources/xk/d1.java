package xk;

import java.util.Arrays;
import java.util.Collection;
import java.util.Objects;
import java.util.Set;
import java.util.SortedSet;

/* loaded from: classes.dex */
public abstract class d1 extends q0 implements Set {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f95891c = 0;

    /* renamed from: b, reason: collision with root package name */
    public transient v0 f95892b;

    public static int k(int i5) {
        int iMax = Math.max(i5, 2);
        if (iMax >= 751619276) {
            vk.b0.b("collection too large", iMax < 1073741824);
            return 1073741824;
        }
        int iHighestOneBit = Integer.highestOneBit(iMax - 1) << 1;
        while (iHighestOneBit * 0.7d < iMax) {
            iHighestOneBit <<= 1;
        }
        return iHighestOneBit;
    }

    public static d1 l(int i5, Object... objArr) {
        if (i5 == 0) {
            return z2.f96074j;
        }
        if (i5 == 1) {
            Object obj = objArr[0];
            Objects.requireNonNull(obj);
            return new e1(obj);
        }
        int iK = k(i5);
        Object[] objArr2 = new Object[iK];
        int i11 = iK - 1;
        int i12 = 0;
        int i13 = 0;
        for (int i14 = 0; i14 < i5; i14++) {
            Object obj2 = objArr[i14];
            if (obj2 == null) {
                throw new NullPointerException(b.c0.h(i14, "at index "));
            }
            int iHashCode = obj2.hashCode();
            int iP = w20.h.p(iHashCode);
            while (true) {
                int i15 = iP & i11;
                Object obj3 = objArr2[i15];
                if (obj3 == null) {
                    objArr[i13] = obj2;
                    objArr2[i15] = obj2;
                    i12 += iHashCode;
                    i13++;
                    break;
                }
                if (obj3.equals(obj2)) {
                    break;
                }
                iP++;
            }
        }
        Arrays.fill(objArr, i13, i5, (Object) null);
        if (i13 == 1) {
            Object obj4 = objArr[0];
            Objects.requireNonNull(obj4);
            return new e1(obj4);
        }
        if (k(i13) < iK / 2) {
            return l(i13, objArr);
        }
        int length = objArr.length;
        if (i13 < (length >> 1) + (length >> 2)) {
            objArr = Arrays.copyOf(objArr, i13);
        }
        return new z2(objArr, i12, objArr2, i11, i13);
    }

    public static d1 n(Collection collection) {
        if ((collection instanceof d1) && !(collection instanceof SortedSet)) {
            d1 d1Var = (d1) collection;
            if (!d1Var.h()) {
                return d1Var;
            }
        }
        Object[] array = collection.toArray();
        return l(array.length, array);
    }

    public static d1 o(Object[] objArr) {
        int length = objArr.length;
        return length != 0 ? length != 1 ? l(objArr.length, (Object[]) objArr.clone()) : new e1(objArr[0]) : z2.f96074j;
    }

    public static d1 r(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object... objArr) {
        vk.b0.b("the total number of elements must fit in an int", objArr.length <= 2147483641);
        int length = objArr.length + 6;
        Object[] objArr2 = new Object[length];
        objArr2[0] = obj;
        objArr2[1] = obj2;
        objArr2[2] = obj3;
        objArr2[3] = obj4;
        objArr2[4] = obj5;
        objArr2[5] = obj6;
        System.arraycopy(objArr, 0, objArr2, 6, objArr.length);
        return l(length, objArr2);
    }

    @Override // xk.q0
    public v0 c() {
        v0 v0Var = this.f95892b;
        if (v0Var != null) {
            return v0Var;
        }
        v0 v0VarP = p();
        this.f95892b = v0VarP;
        return v0VarP;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof d1) && q() && ((d1) obj).q() && hashCode() != obj.hashCode()) {
            return false;
        }
        return w.h(this, obj);
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        return w.l(this);
    }

    public v0 p() {
        Object[] array = toArray(q0.f95992a);
        l0 l0Var = v0.f96030b;
        return v0.k(array.length, array);
    }

    public boolean q() {
        return this instanceof z2;
    }
}
