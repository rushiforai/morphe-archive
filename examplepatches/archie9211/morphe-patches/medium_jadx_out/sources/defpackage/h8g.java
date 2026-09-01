package defpackage;

import java.util.AbstractMap;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h8g extends AbstractMap {
    public static final /* synthetic */ int g = 0;
    public Object[] a;
    public int b;
    public Map c;
    public boolean d;
    public volatile s70 e;
    public Map f;

    public h8g() {
        Map map = Collections.EMPTY_MAP;
        this.c = map;
        this.f = map;
    }

    public final Set a() {
        return this.c.isEmpty() ? Collections.EMPTY_SET : this.c.entrySet();
    }

    @Override // java.util.AbstractMap, java.util.Map
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public final Object put(Comparable comparable, Object obj) {
        h();
        int iD = d(comparable);
        if (iD >= 0) {
            return ((j8g) this.a[iD]).setValue(obj);
        }
        h();
        Object[] objArr = this.a;
        if (objArr == null) {
            objArr = new Object[16];
            this.a = objArr;
        }
        int i = -(iD + 1);
        if (i >= 16) {
            return g().put(comparable, obj);
        }
        if (this.b == 16) {
            j8g j8gVar = (j8g) objArr[15];
            this.b = 15;
            g().put(j8gVar.a, j8gVar.b);
        }
        Object[] objArr2 = this.a;
        int length = objArr2.length;
        System.arraycopy(objArr2, i, objArr2, i + 1, 15 - i);
        this.a[i] = new j8g(this, comparable, obj);
        this.b++;
        return null;
    }

    public final j8g c(int i) {
        if (i < this.b) {
            return (j8g) this.a[i];
        }
        throw new ArrayIndexOutOfBoundsException(i);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        h();
        if (this.b != 0) {
            this.a = null;
            this.b = 0;
        }
        if (this.c.isEmpty()) {
            return;
        }
        this.c.clear();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Comparable comparable = (Comparable) obj;
        return d(comparable) >= 0 || this.c.containsKey(comparable);
    }

    public final int d(Comparable comparable) {
        int i = this.b;
        int i2 = i - 1;
        int i3 = 0;
        if (i2 >= 0) {
            int iCompareTo = comparable.compareTo(((j8g) this.a[i2]).a);
            if (iCompareTo > 0) {
                return -(i + 1);
            }
            if (iCompareTo == 0) {
                return i2;
            }
        }
        while (i3 <= i2) {
            int i4 = (i3 + i2) / 2;
            int iCompareTo2 = comparable.compareTo(((j8g) this.a[i4]).a);
            if (iCompareTo2 < 0) {
                i2 = i4 - 1;
            } else {
                if (iCompareTo2 <= 0) {
                    return i4;
                }
                i3 = i4 + 1;
            }
        }
        return -(i3 + 1);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        if (this.e == null) {
            this.e = new s70(4, this);
        }
        return this.e;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h8g)) {
            return super.equals(obj);
        }
        h8g h8gVar = (h8g) obj;
        int size = size();
        if (size == h8gVar.size()) {
            int i = this.b;
            if (i != h8gVar.b) {
                return entrySet().equals(h8gVar.entrySet());
            }
            for (int i2 = 0; i2 < i; i2++) {
                if (c(i2).equals(h8gVar.c(i2))) {
                }
            }
            if (i != size) {
                return this.c.equals(h8gVar.c);
            }
            return true;
        }
        return false;
    }

    public final Object f(int i) {
        h();
        Object[] objArr = this.a;
        Object obj = ((j8g) objArr[i]).b;
        System.arraycopy(objArr, i + 1, objArr, i, (this.b - i) - 1);
        this.b--;
        if (!this.c.isEmpty()) {
            Iterator it2 = g().entrySet().iterator();
            Object[] objArr2 = this.a;
            int i2 = this.b;
            Map.Entry entry = (Map.Entry) it2.next();
            objArr2[i2] = new j8g(this, (Comparable) entry.getKey(), entry.getValue());
            this.b++;
            it2.remove();
        }
        return obj;
    }

    public final SortedMap g() {
        h();
        if (this.c.isEmpty() && !(this.c instanceof TreeMap)) {
            TreeMap treeMap = new TreeMap();
            this.c = treeMap;
            this.f = treeMap.descendingMap();
        }
        return (SortedMap) this.c;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Comparable comparable = (Comparable) obj;
        int iD = d(comparable);
        return iD >= 0 ? ((j8g) this.a[iD]).b : this.c.get(comparable);
    }

    public final void h() {
        if (this.d) {
            rd6.b();
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int i = this.b;
        int iHashCode = 0;
        for (int i2 = 0; i2 < i; i2++) {
            iHashCode += this.a[i2].hashCode();
        }
        return this.c.size() > 0 ? this.c.hashCode() + iHashCode : iHashCode;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        h();
        Comparable comparable = (Comparable) obj;
        int iD = d(comparable);
        if (iD >= 0) {
            return f(iD);
        }
        if (this.c.isEmpty()) {
            return null;
        }
        return this.c.remove(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.c.size() + this.b;
    }
}
