package com.fyber.inneractive.sdk.protobuf;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: classes3.dex */
public abstract class e3 extends AbstractMap {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ int f30788h = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f30789a;

    /* renamed from: b, reason: collision with root package name */
    public List f30790b = Collections.EMPTY_LIST;

    /* renamed from: c, reason: collision with root package name */
    public Map f30791c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f30792d;

    /* renamed from: e, reason: collision with root package name */
    public volatile d3 f30793e;

    /* renamed from: f, reason: collision with root package name */
    public Map f30794f;

    /* renamed from: g, reason: collision with root package name */
    public volatile x2 f30795g;

    public e3(int i5) {
        this.f30789a = i5;
        Map map = Collections.EMPTY_MAP;
        this.f30791c = map;
        this.f30794f = map;
    }

    public final Object a(Comparable comparable, Object obj) {
        a();
        int iA = a(comparable);
        if (iA >= 0) {
            return ((b3) this.f30790b.get(iA)).setValue(obj);
        }
        a();
        if (this.f30790b.isEmpty() && !(this.f30790b instanceof ArrayList)) {
            this.f30790b = new ArrayList(this.f30789a);
        }
        int i5 = -(iA + 1);
        if (i5 >= this.f30789a) {
            return c().put(comparable, obj);
        }
        int size = this.f30790b.size();
        int i11 = this.f30789a;
        if (size == i11) {
            b3 b3Var = (b3) this.f30790b.remove(i11 - 1);
            c().put(b3Var.f30771a, b3Var.f30772b);
        }
        this.f30790b.add(i5, new b3(this, comparable, obj));
        return null;
    }

    public final Iterable b() {
        return this.f30791c.isEmpty() ? a3.f30767b : this.f30791c.entrySet();
    }

    public final SortedMap c() {
        a();
        if (this.f30791c.isEmpty() && !(this.f30791c instanceof TreeMap)) {
            TreeMap treeMap = new TreeMap();
            this.f30791c = treeMap;
            this.f30794f = treeMap.descendingMap();
        }
        return (SortedMap) this.f30791c;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        a();
        if (!this.f30790b.isEmpty()) {
            this.f30790b.clear();
        }
        if (this.f30791c.isEmpty()) {
            return;
        }
        this.f30791c.clear();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Comparable comparable = (Comparable) obj;
        return a(comparable) >= 0 || this.f30791c.containsKey(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        if (this.f30793e == null) {
            this.f30793e = new d3(this);
        }
        return this.f30793e;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e3)) {
            return super.equals(obj);
        }
        e3 e3Var = (e3) obj;
        int size = size();
        if (size != e3Var.size()) {
            return false;
        }
        int size2 = this.f30790b.size();
        if (size2 != e3Var.f30790b.size()) {
            return entrySet().equals(e3Var.entrySet());
        }
        for (int i5 = 0; i5 < size2; i5++) {
            if (!((Map.Entry) this.f30790b.get(i5)).equals((Map.Entry) e3Var.f30790b.get(i5))) {
                return false;
            }
        }
        if (size2 != size) {
            return this.f30791c.equals(e3Var.f30791c);
        }
        return true;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Comparable comparable = (Comparable) obj;
        int iA = a(comparable);
        return iA >= 0 ? ((b3) this.f30790b.get(iA)).f30772b : this.f30791c.get(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int size = this.f30790b.size();
        int iHashCode = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iHashCode += ((b3) this.f30790b.get(i5)).hashCode();
        }
        return this.f30791c.size() > 0 ? this.f30791c.hashCode() + iHashCode : iHashCode;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        a();
        Comparable comparable = (Comparable) obj;
        int iA = a(comparable);
        if (iA < 0) {
            if (this.f30791c.isEmpty()) {
                return null;
            }
            return this.f30791c.remove(comparable);
        }
        a();
        Object obj2 = ((b3) this.f30790b.remove(iA)).f30772b;
        if (!this.f30791c.isEmpty()) {
            Iterator it = c().entrySet().iterator();
            this.f30790b.add(new b3(this, (Map.Entry) it.next()));
            it.remove();
        }
        return obj2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f30791c.size() + this.f30790b.size();
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0024  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(Comparable comparable) {
        int i5;
        int i11;
        int size = this.f30790b.size();
        int i12 = size - 1;
        if (i12 < 0) {
            i5 = 0;
            while (i5 <= i12) {
                int i13 = (i5 + i12) / 2;
                int iCompareTo = comparable.compareTo(((b3) this.f30790b.get(i13)).f30771a);
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
            int iCompareTo2 = comparable.compareTo(((b3) this.f30790b.get(i12)).f30771a);
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

    public final void a() {
        if (this.f30792d) {
            throw new UnsupportedOperationException();
        }
    }
}
