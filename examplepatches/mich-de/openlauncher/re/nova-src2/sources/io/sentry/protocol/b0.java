package io.sentry.protocol;

import cl.l0;
import com.tiktok.util.TTConst;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.f4;
import io.sentry.i1;
import io.sentry.i4;
import io.sentry.j4;
import io.sentry.r2;
import io.sentry.y1;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class b0 extends r2 implements i1 {

    /* renamed from: p, reason: collision with root package name */
    public String f67471p;

    /* renamed from: q, reason: collision with root package name */
    public Double f67472q;

    /* renamed from: r, reason: collision with root package name */
    public Double f67473r;

    /* renamed from: s, reason: collision with root package name */
    public final ArrayList f67474s;

    /* renamed from: t, reason: collision with root package name */
    public final HashMap f67475t;

    /* renamed from: u, reason: collision with root package name */
    public Map f67476u;

    /* renamed from: v, reason: collision with root package name */
    public c0 f67477v;

    /* renamed from: w, reason: collision with root package name */
    public ConcurrentHashMap f67478w;

    public b0(f4 f4Var) {
        super(f4Var.f67224a);
        this.f67474s = new ArrayList();
        this.f67475t = new HashMap();
        i4 i4Var = f4Var.f67225b;
        this.f67472q = Double.valueOf(i4Var.f67314a.d() / 1.0E9d);
        this.f67473r = Double.valueOf(i4Var.f67314a.c(i4Var.f67315b) / 1.0E9d);
        this.f67471p = f4Var.f67228e;
        Iterator it = f4Var.f67226c.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            i4 i4Var2 = (i4) it.next();
            Boolean bool = Boolean.TRUE;
            tm.o oVar = i4Var2.f67316c.f67355d;
            if (bool.equals(oVar != null ? (Boolean) oVar.f89494c : null)) {
                this.f67474s.add(new x(i4Var2));
            }
        }
        c cVar = this.f67683b;
        cVar.putAll(f4Var.f67237p);
        j4 j4Var = i4Var.f67316c;
        cVar.c(new j4(j4Var.f67352a, j4Var.f67353b, j4Var.f67354c, j4Var.f67356e, j4Var.f67357f, j4Var.f67355d, j4Var.f67358g, j4Var.f67360i));
        for (Map.Entry entry : j4Var.f67359h.entrySet()) {
            b((String) entry.getKey(), (String) entry.getValue());
        }
        ConcurrentHashMap concurrentHashMap = i4Var.f67323j;
        if (concurrentHashMap != null) {
            for (Map.Entry entry2 : concurrentHashMap.entrySet()) {
                String str = (String) entry2.getKey();
                Object value = entry2.getValue();
                if (this.o == null) {
                    this.o = new HashMap();
                }
                this.o.put(str, value);
            }
        }
        this.f67477v = new c0(f4Var.n.apiName());
        io.sentry.metrics.b bVar = (io.sentry.metrics.b) i4Var.f67325l.a();
        if (bVar != null) {
            this.f67476u = bVar.a();
        } else {
            this.f67476u = null;
        }
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67471p != null) {
            e3Var.o("transaction");
            e3Var.A(this.f67471p);
        }
        e3Var.o("start_timestamp");
        BigDecimal bigDecimalValueOf = BigDecimal.valueOf(this.f67472q.doubleValue());
        RoundingMode roundingMode = RoundingMode.DOWN;
        e3Var.x(iLogger, bigDecimalValueOf.setScale(6, roundingMode));
        if (this.f67473r != null) {
            e3Var.o("timestamp");
            e3Var.x(iLogger, BigDecimal.valueOf(this.f67473r.doubleValue()).setScale(6, roundingMode));
        }
        ArrayList arrayList = this.f67474s;
        if (!arrayList.isEmpty()) {
            e3Var.o("spans");
            e3Var.x(iLogger, arrayList);
        }
        e3Var.o(TTConst.TRACK_TYPE);
        e3Var.A("transaction");
        HashMap map = this.f67475t;
        if (!map.isEmpty()) {
            e3Var.o("measurements");
            e3Var.x(iLogger, map);
        }
        Map map2 = this.f67476u;
        if (map2 != null && !map2.isEmpty()) {
            e3Var.o("_metrics_summary");
            e3Var.x(iLogger, this.f67476u);
        }
        e3Var.o("transaction_info");
        e3Var.x(iLogger, this.f67477v);
        l0.N(this, e3Var, iLogger);
        ConcurrentHashMap concurrentHashMap = this.f67478w;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67478w, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }

    public b0(ArrayList arrayList, HashMap map, c0 c0Var) {
        Double dValueOf = Double.valueOf(0.0d);
        ArrayList arrayList2 = new ArrayList();
        this.f67474s = arrayList2;
        HashMap map2 = new HashMap();
        this.f67475t = map2;
        this.f67471p = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f67472q = dValueOf;
        this.f67473r = null;
        arrayList2.addAll(arrayList);
        map2.putAll(map);
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            this.f67475t.putAll(((x) it.next()).f67640l);
        }
        this.f67477v = c0Var;
        this.f67476u = null;
    }
}
