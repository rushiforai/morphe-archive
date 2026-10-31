package androidx.datastore.preferences.protobuf;

import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: classes.dex */
public final class b1 extends AbstractMap {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f14280f = 0;

    /* renamed from: a, reason: collision with root package name */
    public List f14281a = Collections.EMPTY_LIST;

    /* renamed from: b, reason: collision with root package name */
    public Map f14282b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f14283c;

    /* renamed from: d, reason: collision with root package name */
    public volatile e1 f14284d;

    /* renamed from: e, reason: collision with root package name */
    public Map f14285e;

    public b1() {
        Map map = Collections.EMPTY_MAP;
        this.f14282b = map;
        this.f14285e = map;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0026  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(Comparable comparable) {
        int i5;
        int i11;
        int size = this.f14281a.size();
        int i12 = size - 1;
        if (i12 < 0) {
            i5 = 0;
            while (i5 <= i12) {
                int i13 = (i5 + i12) / 2;
                int iCompareTo = comparable.compareTo(((c1) this.f14281a.get(i13)).a());
                if (iCompareTo < 0) {
                    i12 = i13 - 1;
                } else {
                    if (iCompareTo <= 0) {
                        return i13;
                    }
                    i5 = i13 + 1;
                }
            }
            i11 = i5 + 1;
        } else {
            int iCompareTo2 = comparable.compareTo(((c1) this.f14281a.get(i12)).a());
            if (iCompareTo2 > 0) {
                i11 = size + 1;
            } else {
                if (iCompareTo2 == 0) {
                    return i12;
                }
                i5 = 0;
                while (i5 <= i12) {
                }
                i11 = i5 + 1;
            }
        }
        return -i11;
    }

    public final void b() {
        if (this.f14283c) {
            throw new UnsupportedOperationException();
        }
    }

    public final Map.Entry c(int i5) {
        return (Map.Entry) this.f14281a.get(i5);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        b();
        if (!this.f14281a.isEmpty()) {
            this.f14281a.clear();
        }
        if (this.f14282b.isEmpty()) {
            return;
        }
        this.f14282b.clear();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Comparable comparable = (Comparable) obj;
        return a(comparable) >= 0 || this.f14282b.containsKey(comparable);
    }

    public final Set d() {
        return this.f14282b.isEmpty() ? Collections.EMPTY_SET : this.f14282b.entrySet();
    }

    public final SortedMap e() {
        b();
        if (this.f14282b.isEmpty() && !(this.f14282b instanceof TreeMap)) {
            TreeMap treeMap = new TreeMap();
            this.f14282b = treeMap;
            this.f14285e = treeMap.descendingMap();
        }
        return (SortedMap) this.f14282b;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        if (this.f14284d == null) {
            this.f14284d = new e1(this, 0);
        }
        return this.f14284d;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b1)) {
            return super.equals(obj);
        }
        b1 b1Var = (b1) obj;
        int size = size();
        if (size == b1Var.size()) {
            int size2 = this.f14281a.size();
            if (size2 != b1Var.f14281a.size()) {
                return ((AbstractSet) entrySet()).equals(b1Var.entrySet());
            }
            for (int i5 = 0; i5 < size2; i5++) {
                if (c(i5).equals(b1Var.c(i5))) {
                }
            }
            if (size2 != size) {
                return this.f14282b.equals(b1Var.f14282b);
            }
            return true;
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public final Object put(Comparable comparable, Object obj) {
        b();
        int iA = a(comparable);
        if (iA >= 0) {
            return ((c1) this.f14281a.get(iA)).setValue(obj);
        }
        b();
        if (this.f14281a.isEmpty() && !(this.f14281a instanceof ArrayList)) {
            this.f14281a = new ArrayList(16);
        }
        int i5 = -(iA + 1);
        if (i5 >= 16) {
            return e().put(comparable, obj);
        }
        if (this.f14281a.size() == 16) {
            c1 c1Var = (c1) this.f14281a.remove(15);
            e().put(c1Var.a(), c1Var.getValue());
        }
        this.f14281a.add(i5, new c1(this, comparable, obj));
        return null;
    }

    public final Object g(int i5) {
        b();
        Object value = ((c1) this.f14281a.remove(i5)).getValue();
        if (!this.f14282b.isEmpty()) {
            Iterator it = e().entrySet().iterator();
            this.f14281a.add(new c1(this, (Map.Entry) it.next()));
            it.remove();
        }
        return value;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Comparable comparable = (Comparable) obj;
        int iA = a(comparable);
        return iA >= 0 ? ((c1) this.f14281a.get(iA)).getValue() : this.f14282b.get(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int size = this.f14281a.size();
        int iHashCode = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iHashCode += ((c1) this.f14281a.get(i5)).hashCode();
        }
        return this.f14282b.size() > 0 ? this.f14282b.hashCode() + iHashCode : iHashCode;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        b();
        Comparable comparable = (Comparable) obj;
        int iA = a(comparable);
        if (iA >= 0) {
            return g(iA);
        }
        if (this.f14282b.isEmpty()) {
            return null;
        }
        return this.f14282b.remove(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f14282b.size() + this.f14281a.size();
    }
}
