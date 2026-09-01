package defpackage;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class s33 {
    public final LinkedHashMap a;
    public final LinkedHashMap b;
    public final LinkedHashSet c;
    public final LinkedHashSet d;
    public boolean e;
    public boolean f;

    public s33() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        this.a = linkedHashMap;
        this.b = linkedHashMap;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        this.c = linkedHashSet;
        this.d = linkedHashSet;
        this.e = true;
    }

    public static void a(Map map, Map map2) {
        for (Map.Entry entry : map2.entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            if (map.containsKey(str)) {
                Object obj = map.get(str);
                if ((obj instanceof Map) && (!(obj instanceof th6) || (obj instanceof wh6))) {
                    Object obj2 = map.get(str);
                    obj2.getClass();
                    Map mapY = pwd.y(obj2);
                    Map map3 = value instanceof Map ? (Map) value : null;
                    if (map3 == null) {
                        rd6.o("'", str, "' is an object in destination but not in map");
                        return;
                    }
                    a(mapY, map3);
                }
            }
            map.put(str, value);
        }
    }

    public final LinkedHashMap b(Map map) {
        Object obj;
        LinkedHashMap linkedHashMap = this.b;
        boolean zIsEmpty = linkedHashMap.isEmpty();
        LinkedHashMap linkedHashMap2 = this.a;
        if (zIsEmpty) {
            linkedHashMap2.putAll(map);
            return linkedHashMap;
        }
        Object obj2 = map.get("incremental");
        List<Map> list = obj2 instanceof List ? (List) obj2 : null;
        if (list == null) {
            this.f = true;
        } else {
            this.f = false;
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            for (Map map2 : list) {
                String str = fiHTiFJ.pjcbsfvHrFPRZMh;
                Map map3 = (Map) map2.get(str);
                Object obj3 = map2.get("path");
                obj3.getClass();
                List list2 = (List) obj3;
                Object obj4 = linkedHashMap.get(str);
                obj4.getClass();
                Object obj5 = (Map) obj4;
                if (map3 != null) {
                    for (Object obj6 : list2) {
                        if (obj5 instanceof List) {
                            obj6.getClass();
                            obj = ((List) obj5).get(((Integer) obj6).intValue());
                        } else {
                            obj5.getClass();
                            obj = ((Map) obj5).get(obj6);
                        }
                        obj5 = obj;
                    }
                    obj5.getClass();
                    a(pwd.y(obj5), map3);
                    this.c.add(new r33(list2, (String) map2.get("label")));
                }
                Object obj7 = map2.get("errors");
                List list3 = obj7 instanceof List ? (List) obj7 : null;
                if (list3 != null) {
                    bu1.n0(list3, arrayList);
                }
                Object obj8 = map2.get("extensions");
                Map map4 = obj8 instanceof Map ? (Map) obj8 : null;
                if (map4 != null) {
                    arrayList2.add(map4);
                }
            }
            if (arrayList.isEmpty()) {
                linkedHashMap2.remove("errors");
            } else {
                linkedHashMap2.put("errors", arrayList);
            }
            if (arrayList2.isEmpty()) {
                linkedHashMap2.remove("extensions");
            } else {
                Map mapSingletonMap = Collections.singletonMap("incremental", arrayList2);
                mapSingletonMap.getClass();
                linkedHashMap2.put("extensions", mapSingletonMap);
            }
        }
        Boolean bool = (Boolean) map.get("hasNext");
        this.e = bool != null ? bool.booleanValue() : false;
        return linkedHashMap;
    }
}
