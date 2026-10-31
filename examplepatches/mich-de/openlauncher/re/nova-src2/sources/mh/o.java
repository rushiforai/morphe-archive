package mh;

import ai.r2;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Objects;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: classes3.dex */
public final class o extends k implements NavigableMap {

    /* renamed from: f, reason: collision with root package name */
    public static final o f76362f;

    /* renamed from: c, reason: collision with root package name */
    public final transient w f76363c;

    /* renamed from: d, reason: collision with root package name */
    public final transient j f76364d;

    /* renamed from: e, reason: collision with root package name */
    public final transient o f76365e;

    static {
        w wVarL = p.l(s.f76375b);
        g gVar = j.f76346b;
        f76362f = new o(wVarL, u.f76380e, null);
    }

    public o(w wVar, j jVar, o oVar) {
        this.f76363c = wVar;
        this.f76364d = jVar;
        this.f76365e = oVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static o b(TreeMap treeMap) {
        s sVar = s.f76375b;
        Comparator comparator = treeMap.comparator();
        int i5 = 1;
        boolean zEquals = comparator == null ? true : sVar.equals(comparator);
        Set setEntrySet = treeMap.entrySet();
        if (!(setEntrySet instanceof Collection)) {
            Iterator it = setEntrySet.iterator();
            ArrayList arrayList = new ArrayList();
            it.getClass();
            while (it.hasNext()) {
                arrayList.add(it.next());
            }
            setEntrySet = arrayList;
        }
        Map.Entry[] entryArr = (Map.Entry[]) setEntrySet.toArray(k.f76349b);
        int length = entryArr.length;
        if (length == 0) {
            return c(sVar);
        }
        int i11 = 0;
        if (length == 1) {
            Map.Entry entry = entryArr[0];
            Objects.requireNonNull(entry);
            Object key = entry.getKey();
            Object value = entry.getValue();
            Object[] objArr = {key};
            for (int i12 = 0; i12 < 1; i12++) {
                if (objArr[i12] == null) {
                    throw new NullPointerException(b.c0.h(i12, "at index "));
                }
            }
            w wVar = new w(j.j(1, objArr), sVar);
            Object[] objArr2 = {value};
            while (i11 < 1) {
                if (objArr2[i11] == null) {
                    throw new NullPointerException(b.c0.h(i11, "at index "));
                }
                i11++;
            }
            return new o(wVar, j.j(1, objArr2), null);
        }
        Object[] objArr3 = new Object[length];
        Object[] objArr4 = new Object[length];
        if (zEquals) {
            while (i11 < length) {
                Map.Entry entry2 = entryArr[i11];
                Objects.requireNonNull(entry2);
                Object key2 = entry2.getKey();
                Object value2 = entry2.getValue();
                a.f(key2, value2);
                objArr3[i11] = key2;
                objArr4[i11] = value2;
                i11++;
            }
        } else {
            Arrays.sort(entryArr, 0, length, new r2(22));
            Map.Entry entry3 = entryArr[0];
            Objects.requireNonNull(entry3);
            Object key3 = entry3.getKey();
            objArr3[0] = key3;
            Object value3 = entry3.getValue();
            objArr4[0] = value3;
            a.f(objArr3[0], value3);
            while (i5 < length) {
                Map.Entry entry4 = entryArr[i5 - 1];
                Objects.requireNonNull(entry4);
                Map.Entry entry5 = entryArr[i5];
                Objects.requireNonNull(entry5);
                Object key4 = entry5.getKey();
                Object value4 = entry5.getValue();
                a.f(key4, value4);
                objArr3[i5] = key4;
                objArr4[i5] = value4;
                if (sVar.compare(key3, key4) == 0) {
                    throw new IllegalArgumentException(b.c0.m("Multiple entries with same key: ", String.valueOf(entry4), " and ", String.valueOf(entry5)));
                }
                i5++;
                key3 = key4;
            }
        }
        return new o(new w(j.j(length, objArr3), sVar), j.j(length, objArr4), null);
    }

    public static o c(Comparator comparator) {
        if (s.f76375b.equals(comparator)) {
            return f76362f;
        }
        w wVarL = p.l(comparator);
        g gVar = j.f76346b;
        return new o(wVarL, u.f76380e, null);
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
        return this.f76363c.f76367d;
    }

    @Override // java.util.NavigableMap
    /* renamed from: d, reason: merged with bridge method [inline-methods] */
    public final o headMap(Object obj, boolean z11) {
        obj.getClass();
        return g(0, this.f76363c.n(obj, z11));
    }

    @Override // java.util.NavigableMap
    public final /* synthetic */ NavigableSet descendingKeySet() {
        return this.f76363c.descendingSet();
    }

    @Override // java.util.NavigableMap
    public final /* bridge */ /* synthetic */ NavigableMap descendingMap() {
        o oVar = this.f76365e;
        if (oVar != null) {
            return oVar;
        }
        boolean zIsEmpty = isEmpty();
        w wVar = this.f76363c;
        if (!zIsEmpty) {
            return new o((w) wVar.descendingSet(), this.f76364d.g(), this);
        }
        Comparator comparator = wVar.f76367d;
        return c((comparator instanceof t ? (t) comparator : new e(comparator)).a());
    }

    @Override // java.util.NavigableMap
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    public final o subMap(Object obj, boolean z11, Object obj2, boolean z12) {
        obj.getClass();
        obj2.getClass();
        if (this.f76363c.f76367d.compare(obj, obj2) <= 0) {
            return headMap(obj2, z12).tailMap(obj, z11);
        }
        throw new IllegalArgumentException(a.c("expected fromKey <= toKey but %s > %s", obj, obj2));
    }

    @Override // java.util.NavigableMap
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public final o tailMap(Object obj, boolean z11) {
        obj.getClass();
        return g(this.f76363c.o(obj, z11), this.f76364d.size());
    }

    @Override // java.util.NavigableMap
    public final Map.Entry firstEntry() {
        if (isEmpty()) {
            return null;
        }
        return (Map.Entry) entrySet().g().get(0);
    }

    @Override // java.util.SortedMap
    public final Object firstKey() {
        return this.f76363c.first();
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

    public final o g(int i5, int i11) {
        j jVar = this.f76364d;
        if (i5 == 0) {
            if (i11 == jVar.size()) {
                return this;
            }
            i5 = 0;
        }
        w wVar = this.f76363c;
        return i5 == i11 ? c(wVar.f76367d) : new o(wVar.p(i5, i11), jVar.subList(i5, i11), null);
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0005  */
    @Override // mh.k, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object get(Object obj) {
        int iBinarySearch;
        w wVar = this.f76363c;
        if (obj == null) {
            iBinarySearch = -1;
        } else {
            try {
                iBinarySearch = Collections.binarySearch(wVar.f76397f, obj, wVar.f76367d);
                if (iBinarySearch < 0) {
                }
            } catch (ClassCastException unused) {
            }
        }
        if (iBinarySearch == -1) {
            return null;
        }
        return this.f76364d.get(iBinarySearch);
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final /* synthetic */ SortedMap headMap(Object obj) {
        return headMap(obj, false);
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

    @Override // java.util.Map, java.util.SortedMap
    public final /* synthetic */ Set keySet() {
        return this.f76363c;
    }

    @Override // java.util.NavigableMap
    public final Map.Entry lastEntry() {
        if (isEmpty()) {
            return null;
        }
        return (Map.Entry) entrySet().g().get(this.f76364d.size() - 1);
    }

    @Override // java.util.SortedMap
    public final Object lastKey() {
        return this.f76363c.last();
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
    public final /* synthetic */ NavigableSet navigableKeySet() {
        return this.f76363c;
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
        return this.f76364d.size();
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final /* bridge */ /* synthetic */ SortedMap subMap(Object obj, Object obj2) {
        return subMap(obj, true, obj2, false);
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final /* synthetic */ SortedMap tailMap(Object obj) {
        return tailMap(obj, true);
    }

    @Override // java.util.Map, java.util.SortedMap
    public final /* synthetic */ Collection values() {
        return this.f76364d;
    }
}
