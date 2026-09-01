package defpackage;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vv8 extends zh8 {
    public final LinkedHashMap b = new LinkedHashMap();

    @Override // defpackage.zh8
    public final twa a(String str, f31 f31Var) {
        twa twaVar;
        str.getClass();
        f31Var.getClass();
        try {
            ex7 ex7Var = this.a;
            twa twaVarA = ex7Var != null ? ex7Var.a(str, f31Var) : null;
            uv8 uv8Var = (uv8) this.b.get(str);
            if (uv8Var == null) {
                return twaVarA;
            }
            if (twaVarA != null && (twaVar = (twa) twaVarA.b(uv8Var.a).a) != null) {
                return twaVar;
            }
            return uv8Var.a;
        } catch (Exception unused) {
            return null;
        }
    }

    @Override // defpackage.zh8
    public final Set b(twa twaVar, f31 f31Var) {
        f31Var.getClass();
        ex7 ex7Var = this.a;
        return ex7Var != null ? ex7Var.b(twaVar, f31Var) : ny3.a;
    }

    public final LinkedHashMap c() {
        wg6 wg6VarB = n1b.a.b(vv8.class);
        LinkedHashMap linkedHashMap = this.b;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            linkedHashMap2.put(entry.getKey(), ((uv8) entry.getValue()).a);
        }
        Map mapSingletonMap = Collections.singletonMap(wg6VarB, linkedHashMap2);
        mapSingletonMap.getClass();
        ex7 ex7Var = this.a;
        Map mapD = ex7Var != null ? ex7Var.d() : null;
        if (mapD == null) {
            mapD = fy3.a;
        }
        return ei7.S(mapSingletonMap, mapD);
    }

    public final Set d(Collection collection, f31 f31Var) {
        collection.getClass();
        f31Var.getClass();
        ex7 ex7Var = this.a;
        return ex7Var != null ? ex7Var.h(collection, f31Var) : ny3.a;
    }

    public final boolean e(i31 i31Var) {
        boolean z;
        String str = i31Var.a;
        ex7 ex7Var = this.a;
        boolean zI = ex7Var != null ? ex7Var.i(i31Var) : false;
        LinkedHashMap linkedHashMap = this.b;
        uv8 uv8Var = (uv8) linkedHashMap.get(str);
        if (uv8Var == null) {
            return zI;
        }
        linkedHashMap.remove(str);
        while (true) {
            for (i31 i31Var2 : uv8Var.a.c()) {
                z = z && e(new i31(i31Var2.a));
            }
            return z;
        }
    }
}
