package defpackage;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ei7 extends o7f {
    public static Object N(Object obj, Map map) {
        map.getClass();
        if (map instanceof xh7) {
            return ((xh7) map).e();
        }
        Object obj2 = map.get(obj);
        if (obj2 != null || map.containsKey(obj)) {
            return obj2;
        }
        throw new NoSuchElementException("Key " + obj + " is missing in the map.");
    }

    public static HashMap O(f09... f09VarArr) {
        HashMap map = new HashMap(P(f09VarArr.length));
        U(map, f09VarArr);
        return map;
    }

    public static int P(int i) {
        if (i < 0) {
            return i;
        }
        if (i < 3) {
            return i + 1;
        }
        if (i < 1073741824) {
            return (int) ((i / 0.75f) + 1.0f);
        }
        return Integer.MAX_VALUE;
    }

    public static Map Q(f09... f09VarArr) {
        if (f09VarArr.length <= 0) {
            return fy3.a;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(P(f09VarArr.length));
        U(linkedHashMap, f09VarArr);
        return linkedHashMap;
    }

    public static LinkedHashMap R(f09... f09VarArr) {
        LinkedHashMap linkedHashMap = new LinkedHashMap(P(f09VarArr.length));
        U(linkedHashMap, f09VarArr);
        return linkedHashMap;
    }

    public static LinkedHashMap S(Map map, Map map2) {
        map.getClass();
        map2.getClass();
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        linkedHashMap.putAll(map2);
        return linkedHashMap;
    }

    public static Map T(Map map, f09 f09Var) {
        Object obj = f09Var.b;
        Object obj2 = f09Var.a;
        map.getClass();
        if (map.isEmpty()) {
            Map mapSingletonMap = Collections.singletonMap(obj2, obj);
            mapSingletonMap.getClass();
            return mapSingletonMap;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        linkedHashMap.put(obj2, obj);
        return linkedHashMap;
    }

    public static final void U(HashMap map, f09[] f09VarArr) {
        for (f09 f09Var : f09VarArr) {
            map.put(f09Var.a, f09Var.b);
        }
    }

    public static Map V(List list) {
        int size = list.size();
        if (size == 0) {
            return fy3.a;
        }
        if (size != 1) {
            LinkedHashMap linkedHashMap = new LinkedHashMap(P(list.size()));
            X(list, linkedHashMap);
            return linkedHashMap;
        }
        f09 f09Var = (f09) list.get(0);
        f09Var.getClass();
        Map mapSingletonMap = Collections.singletonMap(f09Var.a, f09Var.b);
        mapSingletonMap.getClass();
        return mapSingletonMap;
    }

    public static Map W(Map map) {
        map.getClass();
        int size = map.size();
        if (size == 0) {
            return fy3.a;
        }
        if (size != 1) {
            return new LinkedHashMap(map);
        }
        Map.Entry entry = (Map.Entry) map.entrySet().iterator().next();
        Map mapSingletonMap = Collections.singletonMap(entry.getKey(), entry.getValue());
        mapSingletonMap.getClass();
        return mapSingletonMap;
    }

    public static void X(List list, LinkedHashMap linkedHashMap) {
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            f09 f09Var = (f09) it2.next();
            linkedHashMap.put(f09Var.a, f09Var.b);
        }
    }

    public static LinkedHashMap Y(Map map) {
        map.getClass();
        return new LinkedHashMap(map);
    }
}
