package com.bytedance.adsdk.zb;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class ycx<E> implements Collection<E>, Set<E> {
    private static int fby;

    /* renamed from: lt, reason: collision with root package name */
    private static int f23145lt;
    private static Object[] lud;

    /* renamed from: ul, reason: collision with root package name */
    private static Object[] f23146ul;

    /* renamed from: jc, reason: collision with root package name */
    private syc<E, E> f23147jc;

    /* renamed from: jw, reason: collision with root package name */
    private int[] f23148jw;
    Object[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    int f23149zb;
    private static final int[] sya = new int[0];

    /* renamed from: dj, reason: collision with root package name */
    private static final Object[] f23144dj = new Object[0];

    public ycx() {
        this(0);
    }

    private void dj(int i5) {
        if (i5 == 8) {
            synchronized (ycx.class) {
                Object[] objArr = f23146ul;
                if (objArr != null) {
                    this.ycx = objArr;
                    f23146ul = (Object[]) objArr[0];
                    this.f23148jw = (int[]) objArr[1];
                    objArr[1] = null;
                    objArr[0] = null;
                    fby--;
                    return;
                }
            }
        } else if (i5 == 4) {
            synchronized (ycx.class) {
                Object[] objArr2 = lud;
                if (objArr2 != null) {
                    this.ycx = objArr2;
                    lud = (Object[]) objArr2[0];
                    this.f23148jw = (int[]) objArr2[1];
                    objArr2[1] = null;
                    objArr2[0] = null;
                    f23145lt--;
                    return;
                }
            }
        }
        this.f23148jw = new int[i5];
        this.ycx = new Object[i5];
    }

    private int ycx(Object obj, int i5) {
        int i11 = this.f23149zb;
        if (i11 == 0) {
            return -1;
        }
        int iYcx = zb.ycx(this.f23148jw, i11, i5);
        if (iYcx < 0 || obj.equals(this.ycx[iYcx])) {
            return iYcx;
        }
        int i12 = iYcx + 1;
        while (i12 < i11 && this.f23148jw[i12] == i5) {
            if (obj.equals(this.ycx[i12])) {
                return i12;
            }
            i12++;
        }
        for (int i13 = iYcx - 1; i13 >= 0 && this.f23148jw[i13] == i5; i13--) {
            if (obj.equals(this.ycx[i13])) {
                return i13;
            }
        }
        return ~i12;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean add(E e3) {
        int i5;
        int iYcx;
        if (e3 == null) {
            iYcx = ycx();
            i5 = 0;
        } else {
            int iHashCode = e3.hashCode();
            i5 = iHashCode;
            iYcx = ycx(e3, iHashCode);
        }
        if (iYcx >= 0) {
            return false;
        }
        int i11 = ~iYcx;
        int i12 = this.f23149zb;
        int[] iArr = this.f23148jw;
        if (i12 >= iArr.length) {
            int i13 = 8;
            if (i12 >= 8) {
                i13 = (i12 >> 1) + i12;
            } else if (i12 < 4) {
                i13 = 4;
            }
            Object[] objArr = this.ycx;
            dj(i13);
            int[] iArr2 = this.f23148jw;
            if (iArr2.length > 0) {
                System.arraycopy(iArr, 0, iArr2, 0, iArr.length);
                System.arraycopy(objArr, 0, this.ycx, 0, objArr.length);
            }
            ycx(iArr, objArr, this.f23149zb);
        }
        int i14 = this.f23149zb;
        if (i11 < i14) {
            int[] iArr3 = this.f23148jw;
            int i15 = i11 + 1;
            System.arraycopy(iArr3, i11, iArr3, i15, i14 - i11);
            Object[] objArr2 = this.ycx;
            System.arraycopy(objArr2, i11, objArr2, i15, this.f23149zb - i11);
        }
        this.f23148jw[i11] = i5;
        this.ycx[i11] = e3;
        this.f23149zb++;
        return true;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean addAll(Collection<? extends E> collection) {
        ycx(collection.size() + this.f23149zb);
        Iterator<? extends E> it = collection.iterator();
        boolean zAdd = false;
        while (it.hasNext()) {
            zAdd |= add(it.next());
        }
        return zAdd;
    }

    @Override // java.util.Collection, java.util.Set
    public void clear() {
        int i5 = this.f23149zb;
        if (i5 != 0) {
            ycx(this.f23148jw, this.ycx, i5);
            this.f23148jw = sya;
            this.ycx = f23144dj;
            this.f23149zb = 0;
        }
    }

    @Override // java.util.Collection, java.util.Set
    public boolean contains(Object obj) {
        return ycx(obj) >= 0;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean containsAll(Collection<?> collection) {
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Set) {
            Set set = (Set) obj;
            if (size() != set.size()) {
                return false;
            }
            for (int i5 = 0; i5 < this.f23149zb; i5++) {
                try {
                    if (!set.contains(zb(i5))) {
                        return false;
                    }
                } catch (ClassCastException | NullPointerException unused) {
                }
            }
            return true;
        }
        return false;
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        int[] iArr = this.f23148jw;
        int i5 = this.f23149zb;
        int i11 = 0;
        for (int i12 = 0; i12 < i5; i12++) {
            i11 += iArr[i12];
        }
        return i11;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean isEmpty() {
        return this.f23149zb <= 0;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator<E> iterator() {
        return zb().dj().iterator();
    }

    @Override // java.util.Collection, java.util.Set
    public boolean remove(Object obj) {
        int iYcx = ycx(obj);
        if (iYcx < 0) {
            return false;
        }
        sya(iYcx);
        return true;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean removeAll(Collection<?> collection) {
        Iterator<?> it = collection.iterator();
        boolean zRemove = false;
        while (it.hasNext()) {
            zRemove |= remove(it.next());
        }
        return zRemove;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean retainAll(Collection<?> collection) {
        boolean z11 = false;
        for (int i5 = this.f23149zb - 1; i5 >= 0; i5--) {
            if (!collection.contains(this.ycx[i5])) {
                sya(i5);
                z11 = true;
            }
        }
        return z11;
    }

    @Override // java.util.Collection, java.util.Set
    public int size() {
        return this.f23149zb;
    }

    public E sya(int i5) {
        Object[] objArr = this.ycx;
        E e3 = (E) objArr[i5];
        int i11 = this.f23149zb;
        if (i11 <= 1) {
            ycx(this.f23148jw, objArr, i11);
            this.f23148jw = sya;
            this.ycx = f23144dj;
            this.f23149zb = 0;
            return e3;
        }
        int[] iArr = this.f23148jw;
        if (iArr.length <= 8 || i11 >= iArr.length / 3) {
            int i12 = i11 - 1;
            this.f23149zb = i12;
            if (i5 < i12) {
                int i13 = i5 + 1;
                System.arraycopy(iArr, i13, iArr, i5, i12 - i5);
                Object[] objArr2 = this.ycx;
                System.arraycopy(objArr2, i13, objArr2, i5, this.f23149zb - i5);
            }
            this.ycx[this.f23149zb] = null;
            return e3;
        }
        dj(i11 > 8 ? i11 + (i11 >> 1) : 8);
        this.f23149zb--;
        if (i5 > 0) {
            System.arraycopy(iArr, 0, this.f23148jw, 0, i5);
            System.arraycopy(objArr, 0, this.ycx, 0, i5);
        }
        int i14 = this.f23149zb;
        if (i5 < i14) {
            int i15 = i5 + 1;
            System.arraycopy(iArr, i15, this.f23148jw, i5, i14 - i5);
            System.arraycopy(objArr, i15, this.ycx, i5, this.f23149zb - i5);
        }
        return e3;
    }

    @Override // java.util.Collection, java.util.Set
    public Object[] toArray() {
        int i5 = this.f23149zb;
        Object[] objArr = new Object[i5];
        System.arraycopy(this.ycx, 0, objArr, 0, i5);
        return objArr;
    }

    public String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder sb2 = new StringBuilder(this.f23149zb * 14);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        for (int i5 = 0; i5 < this.f23149zb; i5++) {
            if (i5 > 0) {
                sb2.append(", ");
            }
            E eZb = zb(i5);
            if (eZb != this) {
                sb2.append(eZb);
            } else {
                sb2.append("(this Set)");
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }

    public E zb(int i5) {
        return (E) this.ycx[i5];
    }

    public ycx(int i5) {
        if (i5 == 0) {
            this.f23148jw = sya;
            this.ycx = f23144dj;
        } else {
            dj(i5);
        }
        this.f23149zb = 0;
    }

    private syc<E, E> zb() {
        if (this.f23147jc == null) {
            this.f23147jc = new syc<E, E>() { // from class: com.bytedance.adsdk.zb.ycx.1
                @Override // com.bytedance.adsdk.zb.syc
                public void sya() {
                    ycx.this.clear();
                }

                @Override // com.bytedance.adsdk.zb.syc
                public int ycx() {
                    return ycx.this.f23149zb;
                }

                @Override // com.bytedance.adsdk.zb.syc
                public Map<E, E> zb() {
                    throw new UnsupportedOperationException("not a map");
                }

                @Override // com.bytedance.adsdk.zb.syc
                public Object ycx(int i5, int i11) {
                    return ycx.this.ycx[i5];
                }

                @Override // com.bytedance.adsdk.zb.syc
                public int ycx(Object obj) {
                    return ycx.this.ycx(obj);
                }

                @Override // com.bytedance.adsdk.zb.syc
                public void ycx(int i5) {
                    ycx.this.sya(i5);
                }
            };
        }
        return this.f23147jc;
    }

    @Override // java.util.Collection, java.util.Set
    public <T> T[] toArray(T[] tArr) {
        if (tArr.length < this.f23149zb) {
            tArr = (T[]) ((Object[]) Array.newInstance(tArr.getClass().getComponentType(), this.f23149zb));
        }
        System.arraycopy(this.ycx, 0, tArr, 0, this.f23149zb);
        int length = tArr.length;
        int i5 = this.f23149zb;
        if (length > i5) {
            tArr[i5] = null;
        }
        return tArr;
    }

    private int ycx() {
        int i5 = this.f23149zb;
        if (i5 == 0) {
            return -1;
        }
        int iYcx = zb.ycx(this.f23148jw, i5, 0);
        if (iYcx < 0 || this.ycx[iYcx] == null) {
            return iYcx;
        }
        int i11 = iYcx + 1;
        while (i11 < i5 && this.f23148jw[i11] == 0) {
            if (this.ycx[i11] == null) {
                return i11;
            }
            i11++;
        }
        for (int i12 = iYcx - 1; i12 >= 0 && this.f23148jw[i12] == 0; i12--) {
            if (this.ycx[i12] == null) {
                return i12;
            }
        }
        return ~i11;
    }

    private static void ycx(int[] iArr, Object[] objArr, int i5) {
        if (iArr.length == 8) {
            synchronized (ycx.class) {
                try {
                    if (fby < 10) {
                        objArr[0] = f23146ul;
                        objArr[1] = iArr;
                        for (int i11 = i5 - 1; i11 >= 2; i11--) {
                            objArr[i11] = null;
                        }
                        f23146ul = objArr;
                        fby++;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return;
        }
        if (iArr.length == 4) {
            synchronized (ycx.class) {
                try {
                    if (f23145lt < 10) {
                        objArr[0] = lud;
                        objArr[1] = iArr;
                        for (int i12 = i5 - 1; i12 >= 2; i12--) {
                            objArr[i12] = null;
                        }
                        lud = objArr;
                        f23145lt++;
                    }
                } catch (Throwable th3) {
                    throw th3;
                }
            }
        }
    }

    public void ycx(int i5) {
        int[] iArr = this.f23148jw;
        if (iArr.length < i5) {
            Object[] objArr = this.ycx;
            dj(i5);
            int i11 = this.f23149zb;
            if (i11 > 0) {
                System.arraycopy(iArr, 0, this.f23148jw, 0, i11);
                System.arraycopy(objArr, 0, this.ycx, 0, this.f23149zb);
            }
            ycx(iArr, objArr, this.f23149zb);
        }
    }

    public int ycx(Object obj) {
        return obj == null ? ycx() : ycx(obj, obj.hashCode());
    }
}
