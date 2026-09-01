package defpackage;

import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bx7 {
    public final twa a;
    public final int b;

    public bx7(twa twaVar) {
        twaVar.getClass();
        this.a = twaVar;
        System.currentTimeMillis();
        LinkedHashMap linkedHashMap = twaVar.d;
        int size = linkedHashMap != null ? linkedHashMap.size() * 8 : 0;
        int length = qq7.m(twaVar.a).length + 16;
        for (Map.Entry entry : twaVar.b.entrySet()) {
            String str = (String) entry.getKey();
            length += ek7.O(entry.getValue()) + qq7.m(str).length;
        }
        this.b = length + size + 8;
    }
}
