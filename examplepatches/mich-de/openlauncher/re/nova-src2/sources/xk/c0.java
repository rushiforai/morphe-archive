package xk;

import java.io.Serializable;
import java.util.AbstractSet;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes3.dex */
public final class c0 extends AbstractSet implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public transient Object f95878a;

    /* renamed from: b, reason: collision with root package name */
    public transient int[] f95879b;

    /* renamed from: c, reason: collision with root package name */
    public transient Object[] f95880c;

    /* renamed from: d, reason: collision with root package name */
    public transient int f95881d;

    /* renamed from: e, reason: collision with root package name */
    public transient int f95882e;

    public static c0 c() {
        c0 c0Var = new c0();
        c0Var.f95881d = ul.b.u(3, 1);
        return c0Var;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        int iMin;
        char c11 = 31;
        if (e()) {
            vk.b0.j("Arrays already allocated", e());
            int i5 = this.f95881d;
            int iMax = Math.max(i5 + 1, 2);
            int iHighestOneBit = Integer.highestOneBit(iMax);
            if (iMax > ((int) (1.0d * iHighestOneBit)) && (iHighestOneBit = iHighestOneBit << 1) <= 0) {
                iHighestOneBit = 1073741824;
            }
            int iMax2 = Math.max(4, iHighestOneBit);
            this.f95878a = w.g(iMax2);
            this.f95881d = w.o(this.f95881d, 32 - Integer.numberOfLeadingZeros(iMax2 - 1), 31);
            this.f95879b = new int[i5];
            this.f95880c = new Object[i5];
        }
        Set setD = d();
        if (setD != null) {
            return setD.add(obj);
        }
        int[] iArrG = g();
        Object[] objArrF = f();
        int i11 = this.f95882e;
        int i12 = i11 + 1;
        int iQ = w20.h.q(obj);
        int iH = (1 << (this.f95881d & 31)) - 1;
        int i13 = iQ & iH;
        Object obj2 = this.f95878a;
        Objects.requireNonNull(obj2);
        int iY = w.y(i13, obj2);
        if (iY != 0) {
            int i14 = ~iH;
            int i15 = iQ & i14;
            int i16 = 0;
            while (true) {
                int i17 = iY - 1;
                int i18 = iArrG[i17];
                char c12 = c11;
                if ((i18 & i14) == i15 && ps.v.q(obj, objArrF[i17])) {
                    return false;
                }
                int i19 = i18 & iH;
                i16++;
                if (i19 != 0) {
                    iY = i19;
                    c11 = c12;
                } else {
                    if (i16 >= 9) {
                        LinkedHashSet linkedHashSet = new LinkedHashSet(1 << (this.f95881d & 31), 1.0f);
                        int i21 = isEmpty() ? -1 : 0;
                        while (i21 >= 0) {
                            linkedHashSet.add(f()[i21]);
                            i21++;
                            if (i21 >= this.f95882e) {
                                i21 = -1;
                            }
                        }
                        this.f95878a = linkedHashSet;
                        this.f95879b = null;
                        this.f95880c = null;
                        this.f95881d += 32;
                        return linkedHashSet.add(obj);
                    }
                    if (i12 > iH) {
                        iH = h(iH, w.r(iH), iQ, i11);
                    } else {
                        iArrG[i17] = w.o(i18, i12, iH);
                    }
                }
            }
        } else if (i12 > iH) {
            iH = h(iH, w.r(iH), iQ, i11);
        } else {
            Object obj3 = this.f95878a;
            Objects.requireNonNull(obj3);
            w.z(i13, i12, obj3);
        }
        int length = g().length;
        if (i12 > length && (iMin = Math.min(1073741823, (Math.max(1, length >>> 1) + length) | 1)) != length) {
            this.f95879b = Arrays.copyOf(g(), iMin);
            this.f95880c = Arrays.copyOf(f(), iMin);
        }
        g()[i11] = w.o(iQ, 0, iH);
        f()[i11] = obj;
        this.f95882e = i12;
        this.f95881d += 32;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        if (e()) {
            return;
        }
        this.f95881d += 32;
        Set setD = d();
        if (setD != null) {
            this.f95881d = ul.b.u(size(), 3);
            setD.clear();
            this.f95878a = null;
            this.f95882e = 0;
            return;
        }
        Arrays.fill(f(), 0, this.f95882e, (Object) null);
        Object obj = this.f95878a;
        Objects.requireNonNull(obj);
        if (obj instanceof byte[]) {
            Arrays.fill((byte[]) obj, (byte) 0);
        } else if (obj instanceof short[]) {
            Arrays.fill((short[]) obj, (short) 0);
        } else {
            Arrays.fill((int[]) obj, 0);
        }
        Arrays.fill(g(), 0, this.f95882e, 0);
        this.f95882e = 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (e()) {
            return false;
        }
        Set setD = d();
        if (setD != null) {
            return setD.contains(obj);
        }
        int iQ = w20.h.q(obj);
        int i5 = (1 << (this.f95881d & 31)) - 1;
        Object obj2 = this.f95878a;
        Objects.requireNonNull(obj2);
        int iY = w.y(iQ & i5, obj2);
        if (iY == 0) {
            return false;
        }
        int i11 = ~i5;
        int i12 = iQ & i11;
        do {
            int i13 = iY - 1;
            int i14 = g()[i13];
            if ((i14 & i11) == i12 && ps.v.q(obj, f()[i13])) {
                return true;
            }
            iY = i14 & i5;
        } while (iY != 0);
        return false;
    }

    public final Set d() {
        Object obj = this.f95878a;
        if (obj instanceof Set) {
            return (Set) obj;
        }
        return null;
    }

    public final boolean e() {
        return this.f95878a == null;
    }

    public final Object[] f() {
        Object[] objArr = this.f95880c;
        Objects.requireNonNull(objArr);
        return objArr;
    }

    public final int[] g() {
        int[] iArr = this.f95879b;
        Objects.requireNonNull(iArr);
        return iArr;
    }

    public final int h(int i5, int i11, int i12, int i13) {
        Object objG = w.g(i11);
        int i14 = i11 - 1;
        if (i13 != 0) {
            w.z(i12 & i14, i13 + 1, objG);
        }
        Object obj = this.f95878a;
        Objects.requireNonNull(obj);
        int[] iArrG = g();
        for (int i15 = 0; i15 <= i5; i15++) {
            int iY = w.y(i15, obj);
            while (iY != 0) {
                int i16 = iY - 1;
                int i17 = iArrG[i16];
                int i18 = ((~i5) & i17) | i15;
                int i19 = i18 & i14;
                int iY2 = w.y(i19, objG);
                w.z(i19, iY, objG);
                iArrG[i16] = w.o(i18, iY2, i14);
                iY = i17 & i5;
            }
        }
        this.f95878a = objG;
        this.f95881d = w.o(this.f95881d, 32 - Integer.numberOfLeadingZeros(i14), 31);
        return i14;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        return size() == 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        Set setD = d();
        return setD != null ? setD.iterator() : new b0(this);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        int i5;
        int i11;
        if (!e()) {
            Set setD = d();
            if (setD != null) {
                return setD.remove(obj);
            }
            int i12 = (1 << (this.f95881d & 31)) - 1;
            Object obj2 = this.f95878a;
            Objects.requireNonNull(obj2);
            int iW = w.w(obj, null, i12, obj2, g(), f(), null);
            if (iW != -1) {
                Object obj3 = this.f95878a;
                Objects.requireNonNull(obj3);
                int[] iArrG = g();
                Object[] objArrF = f();
                int size = size();
                int i13 = size - 1;
                if (iW < i13) {
                    Object obj4 = objArrF[i13];
                    objArrF[iW] = obj4;
                    objArrF[i13] = null;
                    iArrG[iW] = iArrG[i13];
                    iArrG[i13] = 0;
                    int iQ = w20.h.q(obj4) & i12;
                    int iY = w.y(iQ, obj3);
                    if (iY == size) {
                        w.z(iQ, iW + 1, obj3);
                    } else {
                        while (true) {
                            i5 = iY - 1;
                            i11 = iArrG[i5];
                            int i14 = i11 & i12;
                            if (i14 == size) {
                                break;
                            }
                            iY = i14;
                        }
                        iArrG[i5] = w.o(i11, iW + 1, i12);
                    }
                } else {
                    objArrF[iW] = null;
                    iArrG[iW] = 0;
                }
                this.f95882e--;
                this.f95881d += 32;
                return true;
            }
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        Set setD = d();
        return setD != null ? setD.size() : this.f95882e;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final Object[] toArray() {
        if (e()) {
            return new Object[0];
        }
        Set setD = d();
        return setD != null ? setD.toArray() : Arrays.copyOf(f(), this.f95882e);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final Object[] toArray(Object[] objArr) {
        if (e()) {
            if (objArr.length > 0) {
                objArr[0] = null;
            }
            return objArr;
        }
        Set setD = d();
        if (setD != null) {
            return setD.toArray(objArr);
        }
        Object[] objArrF = f();
        int i5 = this.f95882e;
        vk.b0.i(0, i5, objArrF.length);
        if (objArr.length < i5) {
            objArr = w.q(i5, objArr);
        } else if (objArr.length > i5) {
            objArr[i5] = null;
        }
        System.arraycopy(objArrF, 0, objArr, 0, i5);
        return objArr;
    }
}
