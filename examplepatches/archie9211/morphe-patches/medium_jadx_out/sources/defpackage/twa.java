package defpackage;

import j$.util.Map;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class twa implements Map, th6, j$.util.Map {
    public final String a;
    public final Map b;
    public final UUID c;
    public LinkedHashMap d;

    public twa(String str, Map map, UUID uuid) {
        str.getClass();
        map.getClass();
        this.a = str;
        this.b = map;
        this.c = uuid;
    }

    public final Set a() {
        Set setKeySet = this.b.keySet();
        ArrayList arrayList = new ArrayList(cu1.k0(setKeySet, 10));
        Iterator it2 = setKeySet.iterator();
        while (it2.hasNext()) {
            arrayList.add(this.a + '.' + ((String) it2.next()));
        }
        return bu1.q1(arrayList);
    }

    public final f09 b(twa twaVar) {
        twaVar.getClass();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Map map = this.b;
        LinkedHashMap linkedHashMapY = ei7.Y(map);
        LinkedHashMap linkedHashMap = this.d;
        LinkedHashMap linkedHashMap2 = linkedHashMap != null ? new LinkedHashMap(linkedHashMap) : new LinkedHashMap();
        Iterator it2 = twaVar.b.entrySet().iterator();
        while (true) {
            boolean zHasNext = it2.hasNext();
            String str = this.a;
            if (!zHasNext) {
                UUID uuid = twaVar.c;
                str.getClass();
                twa twaVar2 = new twa(str, linkedHashMapY, uuid);
                twaVar2.d = linkedHashMap2;
                return new f09(twaVar2, linkedHashSet);
            }
            Map.Entry entry = (Map.Entry) it2.next();
            String str2 = (String) entry.getKey();
            Object value = entry.getValue();
            boolean zContainsKey = map.containsKey(str2);
            Object obj = map.get(str2);
            if (!zContainsKey || !g76.L(obj, value)) {
                linkedHashMapY.put(str2, value);
                linkedHashSet.add(str + '.' + str2);
            }
        }
    }

    public final ArrayList c() {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayListN1 = bu1.n1(this.b.values());
        while (!arrayListN1.isEmpty()) {
            Object objRemove = arrayListN1.remove(arrayListN1.size() - 1);
            if (objRemove instanceof i31) {
                arrayList.add(objRemove);
            } else if (objRemove instanceof Map) {
                arrayListN1.addAll(((Map) objRemove).values());
            } else if (objRemove instanceof List) {
                arrayListN1.addAll((Collection) objRemove);
            }
        }
        return arrayList;
    }

    @Override // java.util.Map
    public final void clear() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ /* synthetic */ Object compute(Object obj, BiFunction biFunction) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ /* synthetic */ Object computeIfAbsent(Object obj, Function function) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ /* synthetic */ Object computeIfPresent(Object obj, BiFunction biFunction) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        if (!(obj instanceof String)) {
            return false;
        }
        return this.b.containsKey((String) obj);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return this.b.containsValue(obj);
    }

    @Override // java.util.Map
    public final Set entrySet() {
        return this.b.entrySet();
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        if (!(obj instanceof String)) {
            return null;
        }
        return this.b.get((String) obj);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object getOrDefault(Object obj, Object obj2) {
        return Map.CC.$default$getOrDefault(this, obj, obj2);
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return this.b.isEmpty();
    }

    @Override // java.util.Map
    public final Set keySet() {
        return this.b.keySet();
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ /* synthetic */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final /* bridge */ /* synthetic */ Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final void putAll(java.util.Map map) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ /* synthetic */ Object putIfAbsent(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ /* synthetic */ Object replace(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map, j$.util.Map
    public final void replaceAll(BiFunction biFunction) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final int size() {
        return this.b.size();
    }

    @Override // java.util.Map
    public final Collection values() {
        return this.b.values();
    }

    @Override // java.util.Map, j$.util.Map
    public final boolean remove(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ /* synthetic */ boolean replace(Object obj, Object obj2, Object obj3) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
