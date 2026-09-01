package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ft8 {
    public boolean a;
    public final xpc b = vv2.j(fy3.a);
    public final LinkedHashMap c = new LinkedHashMap();
    public int d;

    public final void a(String str, String str2) {
        xpc xpcVar;
        Object value;
        Map mapSingletonMap;
        str.getClass();
        str2.getClass();
        do {
            xpcVar = this.b;
            value = xpcVar.getValue();
            Map map = (Map) value;
            Collection collection = (List) map.get(str);
            if (collection == null) {
                collection = ey3.a;
            }
            ArrayList arrayListR0 = bu1.R0(collection, str2);
            if (map.isEmpty()) {
                mapSingletonMap = Collections.singletonMap(str, arrayListR0);
                mapSingletonMap.getClass();
            } else {
                LinkedHashMap linkedHashMap = new LinkedHashMap(map);
                linkedHashMap.put(str, arrayListR0);
                mapSingletonMap = linkedHashMap;
            }
        } while (!xpcVar.k(value, mapSingletonMap));
    }

    public final synchronized nr8 b(String str) {
        Object objValueOf;
        try {
            str.getClass();
            LinkedHashMap linkedHashMap = this.c;
            objValueOf = linkedHashMap.get(str);
            if (objValueOf == null) {
                int i = this.d;
                this.d = (i + 1) % or8.a.size();
                objValueOf = Integer.valueOf(i);
                linkedHashMap.put(str, objValueOf);
            }
        } catch (Throwable th) {
            throw th;
        }
        return (nr8) or8.a.get(((Number) objValueOf).intValue());
    }
}
