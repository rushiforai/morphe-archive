package defpackage;

import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w16 {
    public final LinkedHashMap a;

    public w16(ce8 ce8Var) {
        Map map = ce8Var.a;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : map.entrySet()) {
            linkedHashMap.put(entry.getKey(), bu1.n1((Collection) entry.getValue()));
        }
        this.a = linkedHashMap;
    }

    public void a(wg6 wg6Var, x45 x45Var) {
        wg6Var.getClass();
        x45Var.getClass();
        LinkedHashMap linkedHashMap = this.a;
        if (linkedHashMap.containsKey(wg6Var)) {
            ik4.b(46, wg6Var.d(), "A `initializer` with the same `clazz` has already been added: ");
        } else {
            linkedHashMap.put(wg6Var, new sue(wg6Var, x45Var));
        }
    }

    public w7 b() {
        Collection collectionValues = this.a.values();
        collectionValues.getClass();
        sue[] sueVarArr = (sue[]) collectionValues.toArray(new sue[0]);
        return new w7(3, (sue[]) Arrays.copyOf(sueVarArr, sueVarArr.length));
    }

    public void c(String str) {
        String lowerCase = "Cache-Control".toLowerCase(Locale.ROOT);
        lowerCase.getClass();
        this.a.put(lowerCase, d46.T(str));
    }

    public w16() {
        this.a = new LinkedHashMap();
    }
}
