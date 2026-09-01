package defpackage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y21 {
    public final LinkedHashMap a;

    public y21(LinkedHashMap linkedHashMap) {
        this.a = linkedHashMap;
    }

    public final Object a(Object obj, List list) {
        if (obj instanceof i31) {
            return a(this.a.get(list), list);
        }
        if (obj instanceof List) {
            Iterable iterable = (Iterable) obj;
            ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
            int i = 0;
            for (Object obj2 : iterable) {
                int i2 = i + 1;
                if (i < 0) {
                    d46.i0();
                    throw null;
                }
                arrayList.add(a(obj2, bu1.R0(list, Integer.valueOf(i))));
                i = i2;
            }
            return arrayList;
        }
        if (!(obj instanceof Map)) {
            return obj;
        }
        Map map = (Map) obj;
        LinkedHashMap linkedHashMap = new LinkedHashMap(ei7.P(map.size()));
        for (Map.Entry entry : map.entrySet()) {
            Object key = entry.getKey();
            Object value = entry.getValue();
            Object key2 = entry.getKey();
            key2.getClass();
            linkedHashMap.put(key, a(value, bu1.R0(list, (String) key2)));
        }
        return linkedHashMap;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof y21) && this.a.equals(((y21) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "CacheBatchReaderData(data=" + this.a + ')';
    }
}
