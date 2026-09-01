package defpackage;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ysb {
    public final oa2 a;
    public final j92 b;
    public final ea4 c;
    public final f66 d;
    public final AtomicBoolean e;
    public final AtomicReference f;
    public asc g;
    public qu2 h;
    public z5e i;
    public h08 j;
    public a2a k;
    public final ReentrantReadWriteLock l;
    public final LinkedHashMap m;

    public ysb(oa2 oa2Var, j92 j92Var, ea4 ea4Var, f66 f66Var) {
        j92Var.getClass();
        f66Var.getClass();
        this.a = oa2Var;
        this.b = j92Var;
        this.c = ea4Var;
        this.d = f66Var;
        this.e = new AtomicBoolean(false);
        this.f = new AtomicReference(null);
        int i = 20;
        this.g = new hpe(i);
        this.h = new fa4(i);
        this.i = new zi5(i);
        this.j = new wz7(i);
        this.l = new ReentrantReadWriteLock();
        this.m = new LinkedHashMap();
    }

    public final void a(Object obj) {
        LinkedHashMap linkedHashMap;
        ha7 ha7Var = (ha7) this.f.get();
        if (ha7Var == null) {
            f49.K(this.d, d66.INFO, e66.USER, new xu2(this, 1), null, false, 56);
            return;
        }
        l66 l66Var = ha7Var.a;
        if (!(obj instanceof Map)) {
            f49.K(l66Var.e(), d66.WARN, e66.USER, new fa7(0, obj), null, false, 56);
            return;
        }
        Map map = (Map) obj;
        if (!g76.L(map.get("type"), "span_log")) {
            f49.K(l66Var.e(), d66.WARN, e66.USER, new fa7(1, obj), null, false, 56);
            return;
        }
        Object obj2 = map.get("timestamp");
        Long l = obj2 instanceof Long ? (Long) obj2 : null;
        Object obj3 = map.get("message");
        String str = obj3 instanceof String ? (String) obj3 : null;
        Object obj4 = map.get("loggerName");
        String str2 = obj4 instanceof String ? (String) obj4 : null;
        Object obj5 = map.get("attributes");
        Map map2 = obj5 instanceof Map ? (Map) obj5 : null;
        if (map2 != null) {
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            for (Map.Entry entry : map2.entrySet()) {
                if (entry.getKey() instanceof String) {
                    linkedHashMap2.put(entry.getKey(), entry.getValue());
                }
            }
            LinkedHashMap linkedHashMap3 = new LinkedHashMap(ei7.P(linkedHashMap2.size()));
            for (Map.Entry entry2 : linkedHashMap2.entrySet()) {
                Object key = entry2.getKey();
                key.getClass();
                linkedHashMap3.put((String) key, entry2.getValue());
            }
            linkedHashMap = linkedHashMap3;
        } else {
            linkedHashMap = null;
        }
        Object obj6 = map.get("logStatus");
        Integer num = obj6 instanceof Integer ? (Integer) obj6 : null;
        int iIntValue = num != null ? num.intValue() : 2;
        if (str2 == null || str == null || linkedHashMap == null || l == null) {
            f49.K(l66Var.e(), d66.WARN, e66.USER, ot2.E, null, false, 56);
            return;
        }
        ysb feature = l66Var.getFeature(ha7Var.h);
        if (feature != null) {
            feature.b(qo7.B("rum"), new lj2(ha7Var, iIntValue, str, linkedHashMap, l, str2));
        }
    }

    public final void b(Set set, b55 b55Var) {
        r40.C(this.a.a(), ka1.r("withWriteContext-", this.c.getName()), this.d, new ss(this, set, b55Var, 17));
    }
}
