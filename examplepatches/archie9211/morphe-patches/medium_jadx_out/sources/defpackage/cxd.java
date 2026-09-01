package defpackage;

import android.graphics.Typeface;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cxd {
    public final Map a;
    public final LinkedHashMap b;

    public cxd(Map map) {
        map.getClass();
        this.a = map;
        Set<Map.Entry> setEntrySet = map.entrySet();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : setEntrySet) {
            Typeface typeface = (Typeface) entry.getValue();
            Object arrayList = linkedHashMap.get(typeface);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(typeface, arrayList);
            }
            ((List) arrayList).add((nq7) entry.getKey());
        }
        this.b = linkedHashMap;
    }

    public final Typeface a(nq7 nq7Var) {
        nq7Var.getClass();
        return (Typeface) this.a.get(nq7Var);
    }
}
