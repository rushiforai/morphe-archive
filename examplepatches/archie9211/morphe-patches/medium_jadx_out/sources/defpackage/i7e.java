package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i7e extends mq7 {
    public final List f;
    public final int g;
    public final String h;
    public final String i;
    public final AtomicLong j = new AtomicLong(0);
    public final a1a k;

    public i7e(ArrayList arrayList, int i, String str, List list, String str2) {
        this.f = DesugarCollections.unmodifiableList(arrayList);
        this.g = i;
        this.h = str;
        this.k = new a1a(DesugarCollections.unmodifiableList(list));
        this.i = str2;
    }

    @Override // defpackage.mq7
    public final String B() {
        return (String) this.f.get(r1.size() - 1);
    }

    public final Map L() {
        a1a a1aVar = this.k;
        Map map = (Map) a1aVar.c;
        if (map != null) {
            return map;
        }
        TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        for (Map.Entry entry : (List) a1aVar.b) {
            ArrayList arrayList = new ArrayList();
            if (treeMap.containsKey(entry.getKey())) {
                arrayList.addAll((Collection) treeMap.get(entry.getKey()));
            }
            arrayList.add((String) entry.getValue());
            treeMap.put((String) entry.getKey(), DesugarCollections.unmodifiableList(arrayList));
        }
        Map mapUnmodifiableMap = DesugarCollections.unmodifiableMap(treeMap);
        a1aVar.c = mapUnmodifiableMap;
        return mapUnmodifiableMap;
    }

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        String strB = B();
        String string = this.f.toString();
        String string2 = ((List) this.k.b).toString();
        long j = this.j.get();
        StringBuilder sbU = y30.u("UrlResponseInfo@[", hexString, "][", strB, "]: urlChain = ");
        sbU.append(string);
        sbU.append(", httpStatus = ");
        sbU.append(this.g);
        sbU.append(" ");
        ka1.C(sbU, this.h, ", headers = ", string2, ", wasCached = false, negotiatedProtocol = ");
        sbU.append(this.i);
        sbU.append(", proxyServer= , receivedByteCount = ");
        sbU.append(j);
        return sbU.toString();
    }

    @Override // defpackage.mq7
    public final int z() {
        return this.g;
    }
}
