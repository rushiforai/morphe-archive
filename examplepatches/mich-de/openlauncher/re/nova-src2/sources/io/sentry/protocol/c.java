package io.sentry.protocol;

import com.google.android.gms.internal.consent_sdk.k0;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.j4;
import io.sentry.y1;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class c extends ConcurrentHashMap implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f67479a = new Object();

    public c() {
    }

    public final j4 a() {
        return (j4) d(j4.class, "trace");
    }

    public final void b(a aVar) {
        put("app", aVar);
    }

    public final void c(j4 j4Var) {
        i30.j.Q(j4Var, "traceContext is required");
        put("trace", j4Var);
    }

    public final Object d(Class cls, String str) {
        Object obj = get(str);
        if (cls.isInstance(obj)) {
            return cls.cast(obj);
        }
        return null;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        ArrayList<String> list = Collections.list(keys());
        Collections.sort(list);
        for (String str : list) {
            Object obj = get(str);
            if (obj != null) {
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }

    public c(c cVar) {
        Iterator it = cVar.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            if (entry != null) {
                Object value = entry.getValue();
                if ("app".equals(entry.getKey()) && (value instanceof a)) {
                    a aVar = (a) value;
                    a aVar2 = new a();
                    aVar2.f67451g = aVar.f67451g;
                    aVar2.f67445a = aVar.f67445a;
                    aVar2.f67449e = aVar.f67449e;
                    aVar2.f67446b = aVar.f67446b;
                    aVar2.f67450f = aVar.f67450f;
                    aVar2.f67448d = aVar.f67448d;
                    aVar2.f67447c = aVar.f67447c;
                    aVar2.f67452h = k0.y(aVar.f67452h);
                    aVar2.f67455k = aVar.f67455k;
                    List list = aVar.f67453i;
                    aVar2.f67453i = list != null ? new ArrayList(list) : null;
                    aVar2.f67454j = aVar.f67454j;
                    aVar2.f67456l = k0.y(aVar.f67456l);
                    b(aVar2);
                } else if ("browser".equals(entry.getKey()) && (value instanceof b)) {
                    b bVar = (b) value;
                    b bVar2 = new b();
                    bVar2.f67468a = bVar.f67468a;
                    bVar2.f67469b = bVar.f67469b;
                    bVar2.f67470c = k0.y(bVar.f67470c);
                    put("browser", bVar2);
                } else if ("device".equals(entry.getKey()) && (value instanceof g)) {
                    g gVar = (g) value;
                    g gVar2 = new g();
                    gVar2.f67505a = gVar.f67505a;
                    gVar2.f67506b = gVar.f67506b;
                    gVar2.f67507c = gVar.f67507c;
                    gVar2.f67508d = gVar.f67508d;
                    gVar2.f67509e = gVar.f67509e;
                    gVar2.f67510f = gVar.f67510f;
                    gVar2.f67513i = gVar.f67513i;
                    gVar2.f67514j = gVar.f67514j;
                    gVar2.f67515k = gVar.f67515k;
                    gVar2.f67516l = gVar.f67516l;
                    gVar2.f67517m = gVar.f67517m;
                    gVar2.n = gVar.n;
                    gVar2.o = gVar.o;
                    gVar2.f67518p = gVar.f67518p;
                    gVar2.f67519q = gVar.f67519q;
                    gVar2.f67520r = gVar.f67520r;
                    gVar2.f67521s = gVar.f67521s;
                    gVar2.f67522t = gVar.f67522t;
                    gVar2.f67523u = gVar.f67523u;
                    gVar2.f67524v = gVar.f67524v;
                    gVar2.f67525w = gVar.f67525w;
                    gVar2.f67526x = gVar.f67526x;
                    gVar2.f67527y = gVar.f67527y;
                    gVar2.A = gVar.A;
                    gVar2.B = gVar.B;
                    gVar2.D = gVar.D;
                    gVar2.E = gVar.E;
                    gVar2.f67512h = gVar.f67512h;
                    String[] strArr = gVar.f67511g;
                    gVar2.f67511g = strArr != null ? (String[]) strArr.clone() : null;
                    gVar2.C = gVar.C;
                    TimeZone timeZone = gVar.f67528z;
                    gVar2.f67528z = timeZone != null ? (TimeZone) timeZone.clone() : null;
                    gVar2.F = gVar.F;
                    gVar2.G = gVar.G;
                    gVar2.H = gVar.H;
                    gVar2.I = k0.y(gVar.I);
                    put("device", gVar2);
                } else if ("os".equals(entry.getKey()) && (value instanceof n)) {
                    n nVar = (n) value;
                    n nVar2 = new n();
                    nVar2.f67578a = nVar.f67578a;
                    nVar2.f67579b = nVar.f67579b;
                    nVar2.f67580c = nVar.f67580c;
                    nVar2.f67581d = nVar.f67581d;
                    nVar2.f67582e = nVar.f67582e;
                    nVar2.f67583f = nVar.f67583f;
                    nVar2.f67584g = k0.y(nVar.f67584g);
                    put("os", nVar2);
                } else if ("runtime".equals(entry.getKey()) && (value instanceof w)) {
                    w wVar = (w) value;
                    w wVar2 = new w();
                    wVar2.f67625a = wVar.f67625a;
                    wVar2.f67626b = wVar.f67626b;
                    wVar2.f67627c = wVar.f67627c;
                    wVar2.f67628d = k0.y(wVar.f67628d);
                    put("runtime", wVar2);
                } else if ("gpu".equals(entry.getKey()) && (value instanceof i)) {
                    i iVar = (i) value;
                    i iVar2 = new i();
                    iVar2.f67548a = iVar.f67548a;
                    iVar2.f67549b = iVar.f67549b;
                    iVar2.f67550c = iVar.f67550c;
                    iVar2.f67551d = iVar.f67551d;
                    iVar2.f67552e = iVar.f67552e;
                    iVar2.f67553f = iVar.f67553f;
                    iVar2.f67554g = iVar.f67554g;
                    iVar2.f67555h = iVar.f67555h;
                    iVar2.f67556i = iVar.f67556i;
                    iVar2.f67557j = k0.y(iVar.f67557j);
                    put("gpu", iVar2);
                } else if ("trace".equals(entry.getKey()) && (value instanceof j4)) {
                    c(new j4((j4) value));
                } else if ("response".equals(entry.getKey()) && (value instanceof q)) {
                    q qVar = (q) value;
                    q qVar2 = new q();
                    qVar2.f67597a = qVar.f67597a;
                    qVar2.f67598b = k0.y(qVar.f67598b);
                    qVar2.f67602f = k0.y(qVar.f67602f);
                    qVar2.f67599c = qVar.f67599c;
                    qVar2.f67600d = qVar.f67600d;
                    qVar2.f67601e = qVar.f67601e;
                    synchronized (this.f67479a) {
                        put("response", qVar2);
                    }
                } else {
                    put((String) entry.getKey(), value);
                }
            }
        }
    }
}
