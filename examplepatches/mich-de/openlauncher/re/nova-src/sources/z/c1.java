package z;

import java.util.Arrays;
import java.util.ConcurrentModificationException;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public class c1 {

    /* renamed from: a, reason: collision with root package name */
    public int[] f97751a;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f97752b;

    /* renamed from: c, reason: collision with root package name */
    public int f97753c;

    public c1(int i5) {
        this.f97751a = i5 == 0 ? a0.a.f54a : new int[i5];
        this.f97752b = i5 == 0 ? a0.a.f56c : new Object[i5 << 1];
    }

    public final int a(Object obj) {
        int i5 = this.f97753c * 2;
        Object[] objArr = this.f97752b;
        if (obj == null) {
            for (int i11 = 1; i11 < i5; i11 += 2) {
                if (objArr[i11] == null) {
                    return i11 >> 1;
                }
            }
            return -1;
        }
        for (int i12 = 1; i12 < i5; i12 += 2) {
            if (obj.equals(objArr[i12])) {
                return i12 >> 1;
            }
        }
        return -1;
    }

    public final void b(int i5) {
        int i11 = this.f97753c;
        int[] iArr = this.f97751a;
        if (iArr.length < i5) {
            int[] iArrCopyOf = Arrays.copyOf(iArr, i5);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f97751a = iArrCopyOf;
            Object[] objArrCopyOf = Arrays.copyOf(this.f97752b, i5 * 2);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            this.f97752b = objArrCopyOf;
        }
        if (this.f97753c != i11) {
            throw new ConcurrentModificationException();
        }
    }

    public final int c(int i5, Object obj) {
        int i11 = this.f97753c;
        if (i11 == 0) {
            return -1;
        }
        int iA = a0.a.a(i11, i5, this.f97751a);
        if (iA < 0 || Intrinsics.b(obj, this.f97752b[iA << 1])) {
            return iA;
        }
        int i12 = iA + 1;
        while (i12 < i11 && this.f97751a[i12] == i5) {
            if (Intrinsics.b(obj, this.f97752b[i12 << 1])) {
                return i12;
            }
            i12++;
        }
        for (int i13 = iA - 1; i13 >= 0 && this.f97751a[i13] == i5; i13--) {
            if (Intrinsics.b(obj, this.f97752b[i13 << 1])) {
                return i13;
            }
        }
        return ~i12;
    }

    public final void clear() {
        if (this.f97753c > 0) {
            this.f97751a = a0.a.f54a;
            this.f97752b = a0.a.f56c;
            this.f97753c = 0;
        }
        if (this.f97753c > 0) {
            throw new ConcurrentModificationException();
        }
    }

    public boolean containsKey(Object obj) {
        return d(obj) >= 0;
    }

    public boolean containsValue(Object obj) {
        return a(obj) >= 0;
    }

    public final int d(Object obj) {
        return obj == null ? e() : c(obj.hashCode(), obj);
    }

    public final int e() {
        int i5 = this.f97753c;
        if (i5 == 0) {
            return -1;
        }
        int iA = a0.a.a(i5, 0, this.f97751a);
        if (iA < 0 || this.f97752b[iA << 1] == null) {
            return iA;
        }
        int i11 = iA + 1;
        while (i11 < i5 && this.f97751a[i11] == 0) {
            if (this.f97752b[i11 << 1] == null) {
                return i11;
            }
            i11++;
        }
        for (int i12 = iA - 1; i12 >= 0 && this.f97751a[i12] == 0; i12--) {
            if (this.f97752b[i12 << 1] == null) {
                return i12;
            }
        }
        return ~i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        try {
            if (obj instanceof c1) {
                int i5 = this.f97753c;
                if (i5 != ((c1) obj).f97753c) {
                    return false;
                }
                c1 c1Var = (c1) obj;
                for (int i11 = 0; i11 < i5; i11++) {
                    Object objF = f(i11);
                    Object objJ = j(i11);
                    Object obj2 = c1Var.get(objF);
                    if (objJ == null) {
                        if (obj2 != null || !c1Var.containsKey(objF)) {
                            return false;
                        }
                    } else if (!objJ.equals(obj2)) {
                        return false;
                    }
                }
                return true;
            }
            if (!(obj instanceof Map) || this.f97753c != ((Map) obj).size()) {
                return false;
            }
            int i12 = this.f97753c;
            for (int i13 = 0; i13 < i12; i13++) {
                Object objF2 = f(i13);
                Object objJ2 = j(i13);
                Object obj3 = ((Map) obj).get(objF2);
                if (objJ2 == null) {
                    if (obj3 != null || !((Map) obj).containsKey(objF2)) {
                        return false;
                    }
                } else if (!objJ2.equals(obj3)) {
                    return false;
                }
            }
            return true;
        } catch (ClassCastException | NullPointerException unused) {
        }
        return false;
    }

    public final Object f(int i5) {
        boolean z11 = false;
        if (i5 >= 0 && i5 < this.f97753c) {
            z11 = true;
        }
        if (z11) {
            return this.f97752b[i5 << 1];
        }
        android.support.v4.media.session.b.k0("Expected index to be within 0..size()-1, but was " + i5);
        throw null;
    }

    public final void g(c1 map) {
        Intrinsics.g(map, "map");
        int i5 = map.f97753c;
        b(this.f97753c + i5);
        if (this.f97753c != 0) {
            for (int i11 = 0; i11 < i5; i11++) {
                put(map.f(i11), map.j(i11));
            }
        } else if (i5 > 0) {
            u90.b.p(0, 0, map.f97751a, this.f97751a, i5);
            u90.b.t(map.f97752b, 0, this.f97752b, 0, i5 << 1);
            this.f97753c = i5;
        }
    }

    public Object get(Object obj) {
        int iD = d(obj);
        if (iD >= 0) {
            return this.f97752b[(iD << 1) + 1];
        }
        return null;
    }

    public final Object getOrDefault(Object obj, Object obj2) {
        int iD = d(obj);
        return iD >= 0 ? this.f97752b[(iD << 1) + 1] : obj2;
    }

    public final Object h(int i5) {
        int i11;
        if (i5 < 0 || i5 >= (i11 = this.f97753c)) {
            android.support.v4.media.session.b.k0("Expected index to be within 0..size()-1, but was " + i5);
            throw null;
        }
        Object[] objArr = this.f97752b;
        int i12 = i5 << 1;
        Object obj = objArr[i12 + 1];
        if (i11 <= 1) {
            clear();
            return obj;
        }
        int i13 = i11 - 1;
        int[] iArr = this.f97751a;
        if (iArr.length <= 8 || i11 >= iArr.length / 3) {
            if (i5 < i13) {
                int i14 = i5 + 1;
                u90.b.p(i5, i14, iArr, iArr, i11);
                Object[] objArr2 = this.f97752b;
                u90.b.t(objArr2, i12, objArr2, i14 << 1, i11 << 1);
            }
            Object[] objArr3 = this.f97752b;
            int i15 = i13 << 1;
            objArr3[i15] = null;
            objArr3[i15 + 1] = null;
        } else {
            int i16 = i11 > 8 ? i11 + (i11 >> 1) : 8;
            int[] iArrCopyOf = Arrays.copyOf(iArr, i16);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f97751a = iArrCopyOf;
            Object[] objArrCopyOf = Arrays.copyOf(this.f97752b, i16 << 1);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            this.f97752b = objArrCopyOf;
            if (i11 != this.f97753c) {
                throw new ConcurrentModificationException();
            }
            if (i5 > 0) {
                u90.b.p(0, 0, iArr, this.f97751a, i5);
                u90.b.t(objArr, 0, this.f97752b, 0, i12);
            }
            if (i5 < i13) {
                int i17 = i5 + 1;
                u90.b.p(i5, i17, iArr, this.f97751a, i11);
                u90.b.t(objArr, i12, this.f97752b, i17 << 1, i11 << 1);
            }
        }
        if (i11 != this.f97753c) {
            throw new ConcurrentModificationException();
        }
        this.f97753c = i13;
        return obj;
    }

    public final int hashCode() {
        int[] iArr = this.f97751a;
        Object[] objArr = this.f97752b;
        int i5 = this.f97753c;
        int i11 = 1;
        int i12 = 0;
        int iHashCode = 0;
        while (i12 < i5) {
            Object obj = objArr[i11];
            iHashCode += (obj != null ? obj.hashCode() : 0) ^ iArr[i12];
            i12++;
            i11 += 2;
        }
        return iHashCode;
    }

    public final Object i(int i5, Object obj) {
        boolean z11 = false;
        if (i5 >= 0 && i5 < this.f97753c) {
            z11 = true;
        }
        if (!z11) {
            android.support.v4.media.session.b.k0("Expected index to be within 0..size()-1, but was " + i5);
            throw null;
        }
        int i11 = (i5 << 1) + 1;
        Object[] objArr = this.f97752b;
        Object obj2 = objArr[i11];
        objArr[i11] = obj;
        return obj2;
    }

    public final boolean isEmpty() {
        return this.f97753c <= 0;
    }

    public final Object j(int i5) {
        boolean z11 = false;
        if (i5 >= 0 && i5 < this.f97753c) {
            z11 = true;
        }
        if (z11) {
            return this.f97752b[(i5 << 1) + 1];
        }
        android.support.v4.media.session.b.k0("Expected index to be within 0..size()-1, but was " + i5);
        throw null;
    }

    public Object put(Object obj, Object obj2) {
        int i5 = this.f97753c;
        int iHashCode = obj != null ? obj.hashCode() : 0;
        int iC = obj != null ? c(iHashCode, obj) : e();
        if (iC >= 0) {
            int i11 = (iC << 1) + 1;
            Object[] objArr = this.f97752b;
            Object obj3 = objArr[i11];
            objArr[i11] = obj2;
            return obj3;
        }
        int i12 = ~iC;
        int[] iArr = this.f97751a;
        if (i5 >= iArr.length) {
            int i13 = 8;
            if (i5 >= 8) {
                i13 = (i5 >> 1) + i5;
            } else if (i5 < 4) {
                i13 = 4;
            }
            int[] iArrCopyOf = Arrays.copyOf(iArr, i13);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f97751a = iArrCopyOf;
            Object[] objArrCopyOf = Arrays.copyOf(this.f97752b, i13 << 1);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            this.f97752b = objArrCopyOf;
            if (i5 != this.f97753c) {
                throw new ConcurrentModificationException();
            }
        }
        if (i12 < i5) {
            int[] iArr2 = this.f97751a;
            int i14 = i12 + 1;
            u90.b.p(i14, i12, iArr2, iArr2, i5);
            Object[] objArr2 = this.f97752b;
            u90.b.t(objArr2, i14 << 1, objArr2, i12 << 1, this.f97753c << 1);
        }
        int i15 = this.f97753c;
        if (i5 == i15) {
            int[] iArr3 = this.f97751a;
            if (i12 < iArr3.length) {
                iArr3[i12] = iHashCode;
                Object[] objArr3 = this.f97752b;
                int i16 = i12 << 1;
                objArr3[i16] = obj;
                objArr3[i16 + 1] = obj2;
                this.f97753c = i15 + 1;
                return null;
            }
        }
        throw new ConcurrentModificationException();
    }

    public final Object putIfAbsent(Object obj, Object obj2) {
        Object obj3 = get(obj);
        return obj3 == null ? put(obj, obj2) : obj3;
    }

    public Object remove(Object obj) {
        int iD = d(obj);
        if (iD >= 0) {
            return h(iD);
        }
        return null;
    }

    public final Object replace(Object obj, Object obj2) {
        int iD = d(obj);
        if (iD >= 0) {
            return i(iD, obj2);
        }
        return null;
    }

    public final int size() {
        return this.f97753c;
    }

    public final String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder sb2 = new StringBuilder(this.f97753c * 28);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        int i5 = this.f97753c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (i11 > 0) {
                sb2.append(", ");
            }
            Object objF = f(i11);
            if (objF != sb2) {
                sb2.append(objF);
            } else {
                sb2.append("(this Map)");
            }
            sb2.append('=');
            Object objJ = j(i11);
            if (objJ != sb2) {
                sb2.append(objJ);
            } else {
                sb2.append("(this Map)");
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public final boolean remove(Object obj, Object obj2) {
        int iD = d(obj);
        if (iD < 0 || !Intrinsics.b(obj2, j(iD))) {
            return false;
        }
        h(iD);
        return true;
    }

    public final boolean replace(Object obj, Object obj2, Object obj3) {
        int iD = d(obj);
        if (iD < 0 || !Intrinsics.b(obj2, j(iD))) {
            return false;
        }
        i(iD, obj3);
        return true;
    }
}
