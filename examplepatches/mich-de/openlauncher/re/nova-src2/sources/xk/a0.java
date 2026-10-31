package xk;

import java.io.Serializable;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes3.dex */
public final class a0 extends AbstractMap implements Serializable {

    /* renamed from: j, reason: collision with root package name */
    public static final Object f95848j = new Object();

    /* renamed from: a, reason: collision with root package name */
    public transient Object f95849a;

    /* renamed from: b, reason: collision with root package name */
    public transient int[] f95850b;

    /* renamed from: c, reason: collision with root package name */
    public transient Object[] f95851c;

    /* renamed from: d, reason: collision with root package name */
    public transient Object[] f95852d;

    /* renamed from: e, reason: collision with root package name */
    public transient int f95853e;

    /* renamed from: f, reason: collision with root package name */
    public transient int f95854f;

    /* renamed from: g, reason: collision with root package name */
    public transient y f95855g;

    /* renamed from: h, reason: collision with root package name */
    public transient y f95856h;

    /* renamed from: i, reason: collision with root package name */
    public transient wk.a0 f95857i;

    public static a0 a() {
        a0 a0Var = new a0();
        a0Var.f95853e = ul.b.u(3, 1);
        return a0Var;
    }

    public static a0 b() {
        a0 a0Var = new a0();
        a0Var.f95853e = ul.b.u(8, 1);
        return a0Var;
    }

    public final Map c() {
        Object obj = this.f95849a;
        if (obj instanceof Map) {
            return (Map) obj;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        if (g()) {
            return;
        }
        this.f95853e += 32;
        Map mapC = c();
        if (mapC != null) {
            this.f95853e = ul.b.u(size(), 3);
            mapC.clear();
            this.f95849a = null;
            this.f95854f = 0;
            return;
        }
        Arrays.fill(j(), 0, this.f95854f, (Object) null);
        Arrays.fill(k(), 0, this.f95854f, (Object) null);
        Object obj = this.f95849a;
        Objects.requireNonNull(obj);
        if (obj instanceof byte[]) {
            Arrays.fill((byte[]) obj, (byte) 0);
        } else if (obj instanceof short[]) {
            Arrays.fill((short[]) obj, (short) 0);
        } else {
            Arrays.fill((int[]) obj, 0);
        }
        Arrays.fill(i(), 0, this.f95854f, 0);
        this.f95854f = 0;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Map mapC = c();
        return mapC != null ? mapC.containsKey(obj) : e(obj) != -1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsValue(Object obj) {
        Map mapC = c();
        if (mapC != null) {
            return mapC.containsValue(obj);
        }
        for (int i5 = 0; i5 < this.f95854f; i5++) {
            if (ps.v.q(obj, k()[i5])) {
                return true;
            }
        }
        return false;
    }

    public final int d() {
        return (1 << (this.f95853e & 31)) - 1;
    }

    public final int e(Object obj) {
        if (g()) {
            return -1;
        }
        int iQ = w20.h.q(obj);
        int iD = d();
        Object obj2 = this.f95849a;
        Objects.requireNonNull(obj2);
        int iY = w.y(iQ & iD, obj2);
        if (iY == 0) {
            return -1;
        }
        int i5 = ~iD;
        int i11 = iQ & i5;
        do {
            int i12 = iY - 1;
            int i13 = i()[i12];
            if ((i13 & i5) == i11 && ps.v.q(obj, j()[i12])) {
                return i12;
            }
            iY = i13 & iD;
        } while (iY != 0);
        return -1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        y yVar = this.f95856h;
        if (yVar != null) {
            return yVar;
        }
        y yVar2 = new y(this, 0);
        this.f95856h = yVar2;
        return yVar2;
    }

    public final void f(int i5, int i11) {
        Object obj = this.f95849a;
        Objects.requireNonNull(obj);
        int[] iArrI = i();
        Object[] objArrJ = j();
        Object[] objArrK = k();
        int size = size();
        int i12 = size - 1;
        if (i5 >= i12) {
            objArrJ[i5] = null;
            objArrK[i5] = null;
            iArrI[i5] = 0;
            return;
        }
        Object obj2 = objArrJ[i12];
        objArrJ[i5] = obj2;
        objArrK[i5] = objArrK[i12];
        objArrJ[i12] = null;
        objArrK[i12] = null;
        iArrI[i5] = iArrI[i12];
        iArrI[i12] = 0;
        int iQ = w20.h.q(obj2) & i11;
        int iY = w.y(iQ, obj);
        if (iY == size) {
            w.z(iQ, i5 + 1, obj);
            return;
        }
        while (true) {
            int i13 = iY - 1;
            int i14 = iArrI[i13];
            int i15 = i14 & i11;
            if (i15 == size) {
                iArrI[i13] = w.o(i14, i5 + 1, i11);
                return;
            }
            iY = i15;
        }
    }

    public final boolean g() {
        return this.f95849a == null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Map mapC = c();
        if (mapC != null) {
            return mapC.get(obj);
        }
        int iE = e(obj);
        if (iE == -1) {
            return null;
        }
        return k()[iE];
    }

    public final Object h(Object obj) {
        if (!g()) {
            int iD = d();
            Object obj2 = this.f95849a;
            Objects.requireNonNull(obj2);
            int iW = w.w(obj, null, iD, obj2, i(), j(), null);
            if (iW != -1) {
                Object obj3 = k()[iW];
                f(iW, iD);
                this.f95854f--;
                this.f95853e += 32;
                return obj3;
            }
        }
        return f95848j;
    }

    public final int[] i() {
        int[] iArr = this.f95850b;
        Objects.requireNonNull(iArr);
        return iArr;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean isEmpty() {
        return size() == 0;
    }

    public final Object[] j() {
        Object[] objArr = this.f95851c;
        Objects.requireNonNull(objArr);
        return objArr;
    }

    public final Object[] k() {
        Object[] objArr = this.f95852d;
        Objects.requireNonNull(objArr);
        return objArr;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set keySet() {
        y yVar = this.f95855g;
        if (yVar != null) {
            return yVar;
        }
        y yVar2 = new y(this, 1);
        this.f95855g = yVar2;
        return yVar2;
    }

    public final int l(int i5, int i11, int i12, int i13) {
        Object objG = w.g(i11);
        int i14 = i11 - 1;
        if (i13 != 0) {
            w.z(i12 & i14, i13 + 1, objG);
        }
        Object obj = this.f95849a;
        Objects.requireNonNull(obj);
        int[] iArrI = i();
        for (int i15 = 0; i15 <= i5; i15++) {
            int iY = w.y(i15, obj);
            while (iY != 0) {
                int i16 = iY - 1;
                int i17 = iArrI[i16];
                int i18 = ((~i5) & i17) | i15;
                int i19 = i18 & i14;
                int iY2 = w.y(i19, objG);
                w.z(i19, iY, objG);
                iArrI[i16] = w.o(i18, iY2, i14);
                iY = i17 & i5;
            }
        }
        this.f95849a = objG;
        this.f95853e = w.o(this.f95853e, 32 - Integer.numberOfLeadingZeros(i14), 31);
        return i14;
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00de  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x00f1 -> B:34:0x00d9). Please report as a decompilation issue!!! */
    @Override // java.util.AbstractMap, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object put(Object obj, Object obj2) {
        int i5;
        int i11 = 1;
        if (g()) {
            vk.b0.j("Arrays already allocated", g());
            int i12 = this.f95853e;
            int iMax = Math.max(i12 + 1, 2);
            int iHighestOneBit = Integer.highestOneBit(iMax);
            if (iMax > ((int) (1.0d * iHighestOneBit)) && (iHighestOneBit = iHighestOneBit << 1) <= 0) {
                iHighestOneBit = 1073741824;
            }
            int iMax2 = Math.max(4, iHighestOneBit);
            this.f95849a = w.g(iMax2);
            this.f95853e = w.o(this.f95853e, 32 - Integer.numberOfLeadingZeros(iMax2 - 1), 31);
            this.f95850b = new int[i12];
            this.f95851c = new Object[i12];
            this.f95852d = new Object[i12];
        }
        Map mapC = c();
        if (mapC != null) {
            return mapC.put(obj, obj2);
        }
        int[] iArrI = i();
        Object[] objArrJ = j();
        Object[] objArrK = k();
        int i13 = this.f95854f;
        int i14 = i13 + 1;
        int iQ = w20.h.q(obj);
        int iD = d();
        int i15 = iQ & iD;
        Object obj3 = this.f95849a;
        Objects.requireNonNull(obj3);
        int iY = w.y(i15, obj3);
        if (iY == 0) {
            if (i14 > iD) {
                iD = l(iD, w.r(iD), iQ, i13);
            } else {
                Object obj4 = this.f95849a;
                Objects.requireNonNull(obj4);
                w.z(i15, i14, obj4);
            }
            i5 = 1;
        } else {
            int i16 = ~iD;
            int i17 = iQ & i16;
            int i18 = 0;
            while (true) {
                int i19 = iY - i11;
                int i21 = iArrI[i19];
                i5 = i11;
                if ((i21 & i16) == i17 && ps.v.q(obj, objArrJ[i19])) {
                    Object obj5 = objArrK[i19];
                    objArrK[i19] = obj2;
                    return obj5;
                }
                int i22 = i21 & iD;
                int i23 = i18 + 1;
                if (i22 != 0) {
                    iY = i22;
                    i18 = i23;
                    i11 = i5;
                } else {
                    if (i23 >= 9) {
                        LinkedHashMap linkedHashMap = new LinkedHashMap(d() + 1, 1.0f);
                        int i24 = isEmpty() ? -1 : 0;
                        while (i24 >= 0) {
                            linkedHashMap.put(j()[i24], k()[i24]);
                            i24++;
                            if (i24 >= this.f95854f) {
                                while (i24 >= 0) {
                                }
                            }
                        }
                        this.f95849a = linkedHashMap;
                        this.f95850b = null;
                        this.f95851c = null;
                        this.f95852d = null;
                        this.f95853e += 32;
                        return linkedHashMap.put(obj, obj2);
                    }
                    if (i14 > iD) {
                        iD = l(iD, w.r(iD), iQ, i13);
                    } else {
                        iArrI[i19] = w.o(i21, i14, iD);
                    }
                }
            }
        }
        int length = i().length;
        if (i14 > length) {
            int i25 = i5;
            int iMin = Math.min(1073741823, (Math.max(i25, length >>> 1) + length) | i25);
            if (iMin != length) {
                this.f95850b = Arrays.copyOf(i(), iMin);
                this.f95851c = Arrays.copyOf(j(), iMin);
                this.f95852d = Arrays.copyOf(k(), iMin);
            }
        }
        i()[i13] = w.o(iQ, 0, iD);
        j()[i13] = obj;
        k()[i13] = obj2;
        this.f95854f = i14;
        this.f95853e += 32;
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        Map mapC = c();
        if (mapC != null) {
            return mapC.remove(obj);
        }
        Object objH = h(obj);
        if (objH == f95848j) {
            return null;
        }
        return objH;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        Map mapC = c();
        return mapC != null ? mapC.size() : this.f95854f;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Collection values() {
        wk.a0 a0Var = this.f95857i;
        if (a0Var != null) {
            return a0Var;
        }
        wk.a0 a0Var2 = new wk.a0(this, 2);
        this.f95857i = a0Var2;
        return a0Var2;
    }
}
