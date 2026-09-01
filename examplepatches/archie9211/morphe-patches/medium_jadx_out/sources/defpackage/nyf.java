package defpackage;

import j$.util.Map;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nyf extends dyf implements NavigableMap, Map {
    public static final nyf f;
    public final transient wzf c;
    public final transient ayf d;
    public final transient nyf e;

    static {
        wzf wzfVarE = ryf.E(czf.b);
        hxf hxfVar = ayf.f;
        f = new nyf(wzfVarE, hzf.i, null);
    }

    public nyf(wzf wzfVar, ayf ayfVar, nyf nyfVar) {
        this.c = wzfVar;
        this.d = ayfVar;
        this.e = nyfVar;
    }

    public static nyf b(TreeMap treeMap) {
        czf czfVar = czf.b;
        Comparator comparator = treeMap.comparator();
        int i = 1;
        int i2 = 0;
        boolean z = comparator == null || czfVar == comparator;
        Collection collectionEntrySet = treeMap.entrySet();
        if (!(collectionEntrySet instanceof Collection)) {
            Iterator it2 = collectionEntrySet.iterator();
            ArrayList arrayList = new ArrayList();
            it2.getClass();
            while (it2.hasNext()) {
                arrayList.add(it2.next());
            }
            collectionEntrySet = arrayList;
        }
        Map.Entry[] entryArr = (Map.Entry[]) collectionEntrySet.toArray(dyf.b);
        int length = entryArr.length;
        if (length == 0) {
            return c(czfVar);
        }
        if (length == 1) {
            Map.Entry entry = entryArr[0];
            Objects.requireNonNull(entry);
            Object key = entry.getKey();
            Object value = entry.getValue();
            Object[] objArr = {key};
            for (int i3 = 0; i3 < 1; i3++) {
                if (objArr[i3] == null) {
                    z72.c(b09.w(i3, "at index "));
                    return null;
                }
            }
            wzf wzfVar = new wzf(ayf.A(1, objArr), czfVar);
            Object[] objArr2 = {value};
            while (i2 < 1) {
                if (objArr2[i2] == null) {
                    z72.c(b09.w(i2, "at index "));
                    return null;
                }
                i2++;
            }
            return new nyf(wzfVar, ayf.A(1, objArr2), null);
        }
        Object[] objArr3 = new Object[length];
        Object[] objArr4 = new Object[length];
        if (z) {
            while (i2 < length) {
                Map.Entry entry2 = entryArr[i2];
                Objects.requireNonNull(entry2);
                Object key2 = entry2.getKey();
                Object value2 = entry2.getValue();
                rr7.F(key2, value2);
                objArr3[i2] = key2;
                objArr4[i2] = value2;
                i2++;
            }
        } else {
            Arrays.sort(entryArr, 0, length, new lva(15));
            Map.Entry entry3 = entryArr[0];
            Objects.requireNonNull(entry3);
            Object key3 = entry3.getKey();
            objArr3[0] = key3;
            Object value3 = entry3.getValue();
            objArr4[0] = value3;
            rr7.F(objArr3[0], value3);
            while (i < length) {
                Map.Entry entry4 = entryArr[i - 1];
                Objects.requireNonNull(entry4);
                Map.Entry entry5 = entryArr[i];
                Objects.requireNonNull(entry5);
                Object key4 = entry5.getKey();
                Object value4 = entry5.getValue();
                rr7.F(key4, value4);
                objArr3[i] = key4;
                objArr4[i] = value4;
                if (czfVar.compare(key3, key4) == 0) {
                    ay0.e(lv8.r("Multiple entries with same key: ", String.valueOf(entry4), " and ", String.valueOf(entry5)));
                    return null;
                }
                i++;
                key3 = key4;
            }
        }
        return new nyf(new wzf(ayf.A(length, objArr3), czfVar), ayf.A(length, objArr4), null);
    }

    public static nyf c(Comparator comparator) {
        if (czf.b == comparator) {
            return f;
        }
        wzf wzfVarE = ryf.E(comparator);
        hxf hxfVar = ayf.f;
        return new nyf(wzfVarE, hzf.i, null);
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
        return this.c.h;
    }

    @Override // java.util.NavigableMap
    /* JADX INFO: renamed from: d, reason: merged with bridge method [inline-methods] */
    public final nyf headMap(Object obj, boolean z) {
        obj.getClass();
        return h(0, this.c.F(obj, z));
    }

    @Override // java.util.NavigableMap
    public final /* synthetic */ NavigableSet descendingKeySet() {
        return this.c.descendingSet();
    }

    @Override // java.util.NavigableMap
    public final /* bridge */ /* synthetic */ NavigableMap descendingMap() {
        nyf nyfVar = this.e;
        if (nyfVar != null) {
            return nyfVar;
        }
        boolean zIsEmpty = isEmpty();
        wzf wzfVar = this.c;
        if (!zIsEmpty) {
            return new nyf((wzf) wzfVar.descendingSet(), this.d.y(), this);
        }
        Comparator comparator = wzfVar.h;
        return c((comparator instanceof gzf ? (gzf) comparator : new axf(comparator)).a());
    }

    @Override // java.util.NavigableMap
    /* JADX INFO: renamed from: f, reason: merged with bridge method [inline-methods] */
    public final nyf subMap(Object obj, boolean z, Object obj2, boolean z2) {
        obj.getClass();
        obj2.getClass();
        if (this.c.h.compare(obj, obj2) <= 0) {
            return headMap(obj2, z2).tailMap(obj, z);
        }
        ay0.e(qq7.H("expected fromKey <= toKey but %s > %s", obj, obj2));
        return null;
    }

    @Override // java.util.NavigableMap
    public final Map.Entry firstEntry() {
        if (isEmpty()) {
            return null;
        }
        return (Map.Entry) entrySet().A().get(0);
    }

    @Override // java.util.SortedMap
    public final Object firstKey() {
        return this.c.first();
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

    @Override // java.util.NavigableMap
    /* JADX INFO: renamed from: g, reason: merged with bridge method [inline-methods] */
    public final nyf tailMap(Object obj, boolean z) {
        obj.getClass();
        return h(this.c.G(obj, z), this.d.size());
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0005  */
    @Override // defpackage.dyf, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object get(java.lang.Object r4) {
        /*
            r3 = this;
            wzf r0 = r3.c
            r1 = -1
            if (r4 != 0) goto L7
        L5:
            r4 = r1
            goto L12
        L7:
            ayf r2 = r0.j     // Catch: java.lang.ClassCastException -> L5
            java.util.Comparator r0 = r0.h     // Catch: java.lang.ClassCastException -> L5
            int r4 = java.util.Collections.binarySearch(r2, r4, r0)     // Catch: java.lang.ClassCastException -> L5
            if (r4 >= 0) goto L12
            goto L5
        L12:
            if (r4 != r1) goto L16
            r3 = 0
            return r3
        L16:
            ayf r3 = r3.d
            java.lang.Object r3 = r3.get(r4)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nyf.get(java.lang.Object):java.lang.Object");
    }

    public final nyf h(int i, int i2) {
        ayf ayfVar = this.d;
        if (i == 0) {
            if (i2 == ayfVar.size()) {
                return this;
            }
            i = 0;
        }
        wzf wzfVar = this.c;
        return i == i2 ? c(wzfVar.h) : new nyf(wzfVar.H(i, i2), ayfVar.subList(i, i2), null);
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
        return this.c;
    }

    @Override // java.util.NavigableMap
    public final Map.Entry lastEntry() {
        if (isEmpty()) {
            return null;
        }
        return (Map.Entry) entrySet().A().get(this.d.size() - 1);
    }

    @Override // java.util.SortedMap
    public final Object lastKey() {
        return this.c.last();
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
        return this.c;
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
        return this.d.size();
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
        return this.d;
    }
}
