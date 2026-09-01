package defpackage;

import java.io.InvalidObjectException;
import java.io.NotSerializableException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dh7 implements Map, Serializable, wh6 {
    public static final dh7 n;
    public Object[] a;
    public Object[] b;
    public int[] c;
    public int[] d;
    public int e;
    public int f;
    public int g;
    public int h;
    public int i;
    public eh7 j;
    public fh7 k;
    public eh7 l;
    public boolean m;

    static {
        dh7 dh7Var = new dh7(0);
        dh7Var.m = true;
        n = dh7Var;
    }

    public dh7(int i) {
        if (i < 0) {
            ay0.e("capacity must be non-negative.");
            throw null;
        }
        Object[] objArr = new Object[i];
        int[] iArr = new int[i];
        int iHighestOneBit = Integer.highestOneBit((i < 1 ? 1 : i) * 3);
        this.a = objArr;
        this.b = null;
        this.c = iArr;
        this.d = new int[iHighestOneBit];
        this.e = 2;
        this.f = 0;
        this.g = Integer.numberOfLeadingZeros(iHighestOneBit) + 1;
    }

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() throws NotSerializableException {
        if (!this.m) {
            throw new NotSerializableException("The map cannot be serialized while it is being built.");
        }
        f0c f0cVar = new f0c();
        f0cVar.a = this;
        return f0cVar;
    }

    public final int a(Object obj) {
        c();
        while (true) {
            int iL = l(obj);
            int i = this.e * 2;
            int length = this.d.length / 2;
            if (i > length) {
                i = length;
            }
            int i2 = 0;
            while (true) {
                int[] iArr = this.d;
                int i3 = iArr[iL];
                if (i3 <= 0) {
                    int i4 = this.f;
                    Object[] objArr = this.a;
                    if (i4 < objArr.length) {
                        int i5 = i4 + 1;
                        this.f = i5;
                        objArr[i4] = obj;
                        this.c[i4] = iL;
                        iArr[iL] = i5;
                        this.i++;
                        this.h++;
                        if (i2 > this.e) {
                            this.e = i2;
                        }
                        return i4;
                    }
                    h(1);
                } else {
                    if (g76.L(this.a[i3 - 1], obj)) {
                        return -i3;
                    }
                    i2++;
                    if (i2 > i) {
                        m(this.d.length * 2);
                        break;
                    }
                    iL = iL == 0 ? this.d.length - 1 : iL - 1;
                }
            }
        }
    }

    public final dh7 b() {
        c();
        this.m = true;
        if (this.i > 0) {
            return this;
        }
        dh7 dh7Var = n;
        dh7Var.getClass();
        return dh7Var;
    }

    public final void c() {
        if (this.m) {
            rd6.b();
        }
    }

    @Override // java.util.Map
    public final void clear() {
        c();
        int i = this.f - 1;
        if (i >= 0) {
            int i2 = 0;
            while (true) {
                int[] iArr = this.c;
                int i3 = iArr[i2];
                if (i3 >= 0) {
                    this.d[i3] = 0;
                    iArr[i2] = -1;
                }
                if (i2 == i) {
                    break;
                } else {
                    i2++;
                }
            }
        }
        w2g.I(0, this.f, this.a);
        Object[] objArr = this.b;
        if (objArr != null) {
            w2g.I(0, this.f, objArr);
        }
        this.i = 0;
        this.f = 0;
        this.h++;
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return j(obj) >= 0;
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return k(obj) >= 0;
    }

    public final void d(boolean z) {
        int i;
        Object[] objArr = this.b;
        int i2 = 0;
        int i3 = 0;
        while (true) {
            i = this.f;
            if (i2 >= i) {
                break;
            }
            int[] iArr = this.c;
            int i4 = iArr[i2];
            if (i4 >= 0) {
                Object[] objArr2 = this.a;
                objArr2[i3] = objArr2[i2];
                if (objArr != null) {
                    objArr[i3] = objArr[i2];
                }
                if (z) {
                    iArr[i3] = i4;
                    this.d[i4] = i3 + 1;
                }
                i3++;
            }
            i2++;
        }
        w2g.I(i3, i, this.a);
        if (objArr != null) {
            w2g.I(i3, this.f, objArr);
        }
        this.f = i3;
    }

    @Override // java.util.Map
    public final Set entrySet() {
        eh7 eh7Var = this.l;
        if (eh7Var != null) {
            return eh7Var;
        }
        eh7 eh7Var2 = new eh7(this, 0);
        this.l = eh7Var2;
        return eh7Var2;
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Map)) {
            return false;
        }
        Map map = (Map) obj;
        return this.i == map.size() && f(map.entrySet());
    }

    public final boolean f(Collection collection) {
        boolean zL;
        collection.getClass();
        for (Object obj : collection) {
            if (obj != null) {
                try {
                    Map.Entry entry = (Map.Entry) obj;
                    int iJ = j(entry.getKey());
                    if (iJ < 0) {
                        zL = false;
                    } else {
                        Object[] objArr = this.b;
                        objArr.getClass();
                        zL = g76.L(objArr[iJ], entry.getValue());
                    }
                    if (!zL) {
                    }
                } catch (ClassCastException unused) {
                }
            }
            return false;
        }
        return true;
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        int iJ = j(obj);
        if (iJ < 0) {
            return null;
        }
        Object[] objArr = this.b;
        objArr.getClass();
        return objArr[iJ];
    }

    public final void h(int i) {
        Object[] objArr = this.a;
        int length = objArr.length;
        int i2 = this.f;
        int i3 = length - i2;
        int i4 = i2 - this.i;
        if (i3 < i && i3 + i4 >= i && i4 >= objArr.length / 4) {
            d(true);
            return;
        }
        int i5 = i2 + i;
        if (i5 < 0) {
            throw new OutOfMemoryError();
        }
        if (i5 > objArr.length) {
            g1 g1Var = k1.Companion;
            int length2 = objArr.length;
            g1Var.getClass();
            int iE = g1.e(length2, i5);
            Object[] objArr2 = this.a;
            objArr2.getClass();
            this.a = Arrays.copyOf(objArr2, iE);
            Object[] objArr3 = this.b;
            this.b = objArr3 != null ? Arrays.copyOf(objArr3, iE) : null;
            this.c = Arrays.copyOf(this.c, iE);
            int iHighestOneBit = Integer.highestOneBit((iE >= 1 ? iE : 1) * 3);
            if (iHighestOneBit > this.d.length) {
                m(iHighestOneBit);
            }
        }
    }

    @Override // java.util.Map
    public final int hashCode() {
        ah7 ah7Var = new ah7(this, 0);
        int i = 0;
        while (ah7Var.hasNext()) {
            int i2 = ah7Var.a;
            dh7 dh7Var = (dh7) ah7Var.d;
            if (i2 >= dh7Var.f) {
                ywb.n();
                return 0;
            }
            ah7Var.a = i2 + 1;
            ah7Var.b = i2;
            Object obj = dh7Var.a[i2];
            int iHashCode = obj != null ? obj.hashCode() : 0;
            Object[] objArr = dh7Var.b;
            objArr.getClass();
            Object obj2 = objArr[ah7Var.b];
            int iHashCode2 = obj2 != null ? obj2.hashCode() : 0;
            ah7Var.f();
            i += iHashCode ^ iHashCode2;
        }
        return i;
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return this.i == 0;
    }

    public final int j(Object obj) {
        int iL = l(obj);
        int i = this.e;
        while (true) {
            int i2 = this.d[iL];
            if (i2 == 0) {
                return -1;
            }
            if (i2 > 0) {
                int i3 = i2 - 1;
                if (g76.L(this.a[i3], obj)) {
                    return i3;
                }
            }
            i--;
            if (i < 0) {
                return -1;
            }
            iL = iL == 0 ? this.d.length - 1 : iL - 1;
        }
    }

    public final int k(Object obj) {
        int i = this.f;
        while (true) {
            i--;
            if (i < 0) {
                return -1;
            }
            if (this.c[i] >= 0) {
                Object[] objArr = this.b;
                objArr.getClass();
                if (g76.L(objArr[i], obj)) {
                    return i;
                }
            }
        }
    }

    @Override // java.util.Map
    public final Set keySet() {
        eh7 eh7Var = this.j;
        if (eh7Var != null) {
            return eh7Var;
        }
        eh7 eh7Var2 = new eh7(this, 1);
        this.j = eh7Var2;
        return eh7Var2;
    }

    public final int l(Object obj) {
        return ((obj != null ? obj.hashCode() : 0) * (-1640531527)) >>> this.g;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0032, code lost:
    
        r3[r0] = r6;
        r5.c[r2] = r0;
        r2 = r6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void m(int r6) {
        /*
            r5 = this;
            int r0 = r5.h
            int r0 = r0 + 1
            r5.h = r0
            int r0 = r5.f
            int r1 = r5.i
            r2 = 0
            if (r0 <= r1) goto L10
            r5.d(r2)
        L10:
            int[] r0 = new int[r6]
            r5.d = r0
            int r6 = java.lang.Integer.numberOfLeadingZeros(r6)
            int r6 = r6 + 1
            r5.g = r6
        L1c:
            int r6 = r5.f
            if (r2 >= r6) goto L4d
            int r6 = r2 + 1
            java.lang.Object[] r0 = r5.a
            r0 = r0[r2]
            int r0 = r5.l(r0)
            int r1 = r5.e
        L2c:
            int[] r3 = r5.d
            r4 = r3[r0]
            if (r4 != 0) goto L3a
            r3[r0] = r6
            int[] r1 = r5.c
            r1[r2] = r0
            r2 = r6
            goto L1c
        L3a:
            int r1 = r1 + (-1)
            if (r1 < 0) goto L48
            int r4 = r0 + (-1)
            if (r0 != 0) goto L46
            int r0 = r3.length
            int r0 = r0 + (-1)
            goto L2c
        L46:
            r0 = r4
            goto L2c
        L48:
            java.lang.String r5 = "This cannot happen with fixed magic multiplier and grow-only hash array. Have object hashCodes changed?"
            defpackage.ygf.f(r5)
        L4d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dh7.m(int):void");
    }

    public final void n(int i) {
        Object[] objArr = this.a;
        objArr.getClass();
        objArr[i] = null;
        Object[] objArr2 = this.b;
        if (objArr2 != null) {
            objArr2[i] = null;
        }
        int length = this.c[i];
        int i2 = this.e * 2;
        int length2 = this.d.length / 2;
        if (i2 > length2) {
            i2 = length2;
        }
        int i3 = i2;
        int i4 = 0;
        int i5 = length;
        while (true) {
            length = length == 0 ? this.d.length - 1 : length - 1;
            i4++;
            int i6 = this.e;
            int[] iArr = this.d;
            if (i4 > i6) {
                iArr[i5] = 0;
                break;
            }
            int i7 = iArr[length];
            if (i7 == 0) {
                iArr[i5] = 0;
                break;
            }
            if (i7 < 0) {
                iArr[i5] = -1;
                i5 = length;
                i4 = 0;
            } else {
                int i8 = i7 - 1;
                int iL = l(this.a[i8]) - length;
                int[] iArr2 = this.d;
                if ((iL & (iArr2.length - 1)) >= i4) {
                    iArr2[i5] = i7;
                    this.c[i8] = i5;
                    i5 = length;
                    i4 = 0;
                }
                iArr = iArr2;
            }
            i3--;
            if (i3 < 0) {
                iArr[i5] = -1;
                break;
            }
        }
        this.c[i] = -1;
        this.i--;
        this.h++;
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        c();
        int iA = a(obj);
        Object[] objArr = this.b;
        if (objArr == null) {
            int length = this.a.length;
            if (length < 0) {
                ay0.e("capacity must be non-negative.");
                return null;
            }
            objArr = new Object[length];
            this.b = objArr;
        }
        if (iA >= 0) {
            objArr[iA] = obj2;
            return null;
        }
        int i = (-iA) - 1;
        Object obj3 = objArr[i];
        objArr[i] = obj2;
        return obj3;
    }

    @Override // java.util.Map
    public final void putAll(Map map) {
        map.getClass();
        c();
        Set<Map.Entry> setEntrySet = map.entrySet();
        if (setEntrySet.isEmpty()) {
            return;
        }
        h(setEntrySet.size());
        for (Map.Entry entry : setEntrySet) {
            int iA = a(entry.getKey());
            Object[] objArr = this.b;
            if (objArr == null) {
                int length = this.a.length;
                if (length < 0) {
                    ay0.e("capacity must be non-negative.");
                    return;
                } else {
                    objArr = new Object[length];
                    this.b = objArr;
                }
            }
            if (iA >= 0) {
                objArr[iA] = entry.getValue();
            } else {
                int i = (-iA) - 1;
                if (!g76.L(entry.getValue(), objArr[i])) {
                    objArr[i] = entry.getValue();
                }
            }
        }
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        c();
        int iJ = j(obj);
        if (iJ < 0) {
            return null;
        }
        Object[] objArr = this.b;
        objArr.getClass();
        Object obj2 = objArr[iJ];
        n(iJ);
        return obj2;
    }

    @Override // java.util.Map
    public final int size() {
        return this.i;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder((this.i * 3) + 2);
        sb.append("{");
        int i = 0;
        ah7 ah7Var = new ah7(this, 0);
        while (ah7Var.hasNext()) {
            if (i > 0) {
                sb.append(", ");
            }
            int i2 = ah7Var.a;
            dh7 dh7Var = (dh7) ah7Var.d;
            if (i2 >= dh7Var.f) {
                ywb.n();
                return null;
            }
            ah7Var.a = i2 + 1;
            ah7Var.b = i2;
            Object obj = dh7Var.a[i2];
            if (obj == dh7Var) {
                sb.append("(this Map)");
            } else {
                sb.append(obj);
            }
            sb.append('=');
            Object[] objArr = dh7Var.b;
            objArr.getClass();
            Object obj2 = objArr[ah7Var.b];
            if (obj2 == dh7Var) {
                sb.append("(this Map)");
            } else {
                sb.append(obj2);
            }
            ah7Var.f();
            i++;
        }
        sb.append("}");
        return sb.toString();
    }

    @Override // java.util.Map
    public final Collection values() {
        fh7 fh7Var = this.k;
        if (fh7Var != null) {
            return fh7Var;
        }
        fh7 fh7Var2 = new fh7(0, this);
        this.k = fh7Var2;
        return fh7Var2;
    }

    public dh7() {
        this(8);
    }
}
