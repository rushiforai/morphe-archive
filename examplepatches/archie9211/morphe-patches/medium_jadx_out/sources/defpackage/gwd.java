package defpackage;

import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gwd {
    public final LinkedHashMap a;

    public gwd(LinkedHashMap linkedHashMap) {
        this.a = linkedHashMap;
    }

    public final gwd a() {
        LinkedHashMap linkedHashMap = this.a;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            Object key = entry.getKey();
            y96 y96Var = (y96) entry.getValue();
            linkedHashMap2.put(key, new y96(y96Var.a, y96Var.b, y96Var.c, true));
        }
        return new gwd(linkedHashMap2);
    }
}
