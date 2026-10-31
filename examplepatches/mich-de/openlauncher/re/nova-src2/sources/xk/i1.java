package xk;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedMap;

/* loaded from: classes3.dex */
public final class i1 extends p0 implements NavigableMap {

    /* renamed from: h, reason: collision with root package name */
    public static final i1 f95933h;

    /* renamed from: e, reason: collision with root package name */
    public final transient a3 f95934e;

    /* renamed from: f, reason: collision with root package name */
    public final transient v0 f95935f;

    /* renamed from: g, reason: collision with root package name */
    public final transient i1 f95936g;

    static {
        a3 a3VarU = k1.u(i2.f95937b);
        l0 l0Var = v0.f96030b;
        f95933h = new i1(a3VarU, r2.f96007e, null);
    }

    public i1(a3 a3Var, v0 v0Var, i1 i1Var) {
        super(1);
        this.f95934e = a3Var;
        this.f95935f = v0Var;
        this.f95936g = i1Var;
    }

    @Override // java.util.NavigableMap
    public final Map.Entry ceilingEntry(Object obj) {
        return tailMap(obj, true).firstEntry();
    }

    @Override // java.util.NavigableMap
    public final Object ceilingKey(Object obj) {
        Map.Entry entryCeilingEntry = ceilingEntry(obj);
        if (entryCeilingEntry == null) {
            return null;
        }
        return entryCeilingEntry.getKey();
    }

    @Override // java.util.SortedMap
    public final Comparator comparator() {
        return this.f95934e.f95950d;
    }

    @Override // xk.x0
    public final d1 d() {
        if (!isEmpty()) {
            return new h1(this);
        }
        int i5 = d1.f95891c;
        return z2.f96074j;
    }

    @Override // java.util.NavigableMap
    public final NavigableSet descendingKeySet() {
        return this.f95934e.descendingSet();
    }

    @Override // java.util.NavigableMap
    public final NavigableMap descendingMap() {
        i1 i1Var = this.f95936g;
        if (i1Var != null) {
            return i1Var;
        }
        boolean zIsEmpty = isEmpty();
        a3 a3Var = this.f95934e;
        if (!zIsEmpty) {
            return new i1((a3) a3Var.descendingSet(), this.f95935f.u(), this);
        }
        l2 l2VarB = l2.a(a3Var.f95950d).b();
        return i2.f95937b.equals(l2VarB) ? f95933h : new i1(k1.u(l2VarB), r2.f96007e, null);
    }

    @Override // xk.x0
    public final d1 e() {
        throw new AssertionError("should never be called");
    }

    @Override // xk.x0, java.util.Map, java.util.SortedMap
    public final Set entrySet() {
        return super.entrySet();
    }

    @Override // xk.p0, xk.x0
    public final q0 f() {
        throw new AssertionError("should never be called");
    }

    @Override // java.util.NavigableMap
    public final Map.Entry firstEntry() {
        if (isEmpty()) {
            return null;
        }
        return (Map.Entry) super.entrySet().c().get(0);
    }

    @Override // java.util.SortedMap
    public final Object firstKey() {
        return this.f95934e.first();
    }

    @Override // java.util.NavigableMap
    public final Map.Entry floorEntry(Object obj) {
        return headMap(obj, true).lastEntry();
    }

    @Override // java.util.NavigableMap
    public final Object floorKey(Object obj) {
        Map.Entry entryFloorEntry = floorEntry(obj);
        if (entryFloorEntry == null) {
            return null;
        }
        return entryFloorEntry.getKey();
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0008  */
    @Override // xk.x0, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object get(Object obj) {
        int iBinarySearch;
        a3 a3Var = this.f95934e;
        a3Var.getClass();
        if (obj == null) {
            iBinarySearch = -1;
        } else {
            try {
                iBinarySearch = Collections.binarySearch(a3Var.f95860g, obj, a3Var.f95950d);
                if (iBinarySearch < 0) {
                }
            } catch (ClassCastException unused) {
            }
        }
        if (iBinarySearch == -1) {
            return null;
        }
        return this.f95935f.get(iBinarySearch);
    }

    @Override // xk.x0
    public final boolean h() {
        return this.f95934e.f95860g.h() || this.f95935f.h();
    }

    @Override // java.util.NavigableMap
    public final Map.Entry higherEntry(Object obj) {
        return tailMap(obj, false).firstEntry();
    }

    @Override // java.util.NavigableMap
    public final Object higherKey(Object obj) {
        Map.Entry entryHigherEntry = higherEntry(obj);
        if (entryHigherEntry == null) {
            return null;
        }
        return entryHigherEntry.getKey();
    }

    @Override // xk.x0
    /* renamed from: i */
    public final d1 keySet() {
        return this.f95934e;
    }

    @Override // xk.p0, xk.x0
    /* renamed from: j */
    public final q0 values() {
        return this.f95935f;
    }

    public final i1 k(int i5, int i11) {
        v0 v0Var = this.f95935f;
        if (i5 == 0 && i11 == v0Var.size()) {
            return this;
        }
        a3 a3Var = this.f95934e;
        if (i5 != i11) {
            return new i1(a3Var.w(i5, i11), v0Var.subList(i5, i11), null);
        }
        Comparator comparator = a3Var.f95950d;
        return i2.f95937b.equals(comparator) ? f95933h : new i1(k1.u(comparator), r2.f96007e, null);
    }

    @Override // xk.x0, java.util.Map, java.util.SortedMap
    public final Set keySet() {
        return this.f95934e;
    }

    @Override // java.util.NavigableMap
    /* renamed from: l, reason: merged with bridge method [inline-methods] */
    public final i1 headMap(Object obj, boolean z11) {
        obj.getClass();
        return k(0, this.f95934e.x(obj, z11));
    }

    @Override // java.util.NavigableMap
    public final Map.Entry lastEntry() {
        if (isEmpty()) {
            return null;
        }
        return (Map.Entry) super.entrySet().c().get(this.f95935f.size() - 1);
    }

    @Override // java.util.SortedMap
    public final Object lastKey() {
        return this.f95934e.last();
    }

    @Override // java.util.NavigableMap
    public final Map.Entry lowerEntry(Object obj) {
        return headMap(obj, false).lastEntry();
    }

    @Override // java.util.NavigableMap
    public final Object lowerKey(Object obj) {
        Map.Entry entryLowerEntry = lowerEntry(obj);
        if (entryLowerEntry == null) {
            return null;
        }
        return entryLowerEntry.getKey();
    }

    @Override // java.util.NavigableMap
    /* renamed from: m, reason: merged with bridge method [inline-methods] */
    public final i1 subMap(Object obj, boolean z11, Object obj2, boolean z12) {
        obj.getClass();
        obj2.getClass();
        if (this.f95934e.f95950d.compare(obj, obj2) <= 0) {
            return headMap(obj2, z12).tailMap(obj, z11);
        }
        throw new IllegalArgumentException(vk.b0.p("expected fromKey <= toKey but %s > %s", obj, obj2));
    }

    @Override // java.util.NavigableMap
    /* renamed from: n, reason: merged with bridge method [inline-methods] */
    public final i1 tailMap(Object obj, boolean z11) {
        obj.getClass();
        return k(this.f95934e.y(obj, z11), this.f95935f.size());
    }

    @Override // java.util.NavigableMap
    public final NavigableSet navigableKeySet() {
        return this.f95934e;
    }

    @Override // java.util.NavigableMap
    public final Map.Entry pollFirstEntry() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableMap
    public final Map.Entry pollLastEntry() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final int size() {
        return this.f95935f.size();
    }

    @Override // xk.p0, xk.x0, java.util.Map, java.util.SortedMap
    public final Collection values() {
        return this.f95935f;
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final SortedMap headMap(Object obj) {
        return headMap(obj, false);
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final SortedMap subMap(Object obj, Object obj2) {
        return subMap(obj, true, obj2, false);
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final SortedMap tailMap(Object obj) {
        return tailMap(obj, true);
    }

    public i1(a3 a3Var, v0 v0Var) {
        this(a3Var, v0Var, null);
    }
}
