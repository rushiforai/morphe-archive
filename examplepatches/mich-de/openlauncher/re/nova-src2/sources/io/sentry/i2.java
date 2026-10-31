package io.sentry;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes4.dex */
public final class i2 implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public r0 f67298a;

    /* renamed from: b, reason: collision with root package name */
    public io.sentry.protocol.f0 f67299b;

    /* renamed from: c, reason: collision with root package name */
    public io.sentry.protocol.o f67300c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f67301d;

    /* renamed from: e, reason: collision with root package name */
    public final o4 f67302e;

    /* renamed from: f, reason: collision with root package name */
    public final ConcurrentHashMap f67303f;

    /* renamed from: g, reason: collision with root package name */
    public final ConcurrentHashMap f67304g;

    /* renamed from: h, reason: collision with root package name */
    public final CopyOnWriteArrayList f67305h;

    /* renamed from: i, reason: collision with root package name */
    public final w3 f67306i;

    /* renamed from: j, reason: collision with root package name */
    public volatile h4 f67307j;

    /* renamed from: k, reason: collision with root package name */
    public final Object f67308k;

    /* renamed from: l, reason: collision with root package name */
    public final Object f67309l;

    /* renamed from: m, reason: collision with root package name */
    public final Object f67310m;
    public final io.sentry.protocol.c n;
    public final CopyOnWriteArrayList o;

    /* renamed from: p, reason: collision with root package name */
    public fl.l f67311p;

    /* renamed from: q, reason: collision with root package name */
    public final io.sentry.protocol.u f67312q;

    public i2(w3 w3Var) {
        this.f67301d = new ArrayList();
        this.f67303f = new ConcurrentHashMap();
        this.f67304g = new ConcurrentHashMap();
        this.f67305h = new CopyOnWriteArrayList();
        this.f67308k = new Object();
        this.f67309l = new Object();
        this.f67310m = new Object();
        this.n = new io.sentry.protocol.c();
        this.o = new CopyOnWriteArrayList();
        this.f67312q = io.sentry.protocol.u.f67620b;
        this.f67306i = w3Var;
        int maxBreadcrumbs = w3Var.getMaxBreadcrumbs();
        this.f67302e = maxBreadcrumbs > 0 ? new o4(new g(maxBreadcrumbs)) : new o4(new p());
        this.f67311p = new fl.l(16);
    }

    public final void a() {
        Object obj;
        synchronized (this.f67309l) {
            obj = null;
            this.f67298a = null;
        }
        Iterator<n0> it = this.f67306i.getScopeObservers().iterator();
        while (it.hasNext()) {
            io.sentry.cache.f fVar = (io.sentry.cache.f) it.next();
            fVar.getClass();
            int i5 = 21;
            fVar.b(new fa.l0(i5, fVar, obj));
            fVar.b(new androidx.fragment.app.d(i5, fVar, obj, this));
        }
    }

    public final void b(r0 r0Var) {
        synchronized (this.f67309l) {
            try {
                this.f67298a = r0Var;
                for (n0 n0Var : this.f67306i.getScopeObservers()) {
                    if (r0Var != null) {
                        String name = r0Var.getName();
                        io.sentry.cache.f fVar = (io.sentry.cache.f) n0Var;
                        fVar.getClass();
                        fVar.b(new fa.l0(21, fVar, name));
                        fVar.b(new androidx.fragment.app.d(21, fVar, r0Var.o(), this));
                    } else {
                        io.sentry.cache.f fVar2 = (io.sentry.cache.f) n0Var;
                        fVar2.getClass();
                        Object obj = null;
                        fVar2.b(new fa.l0(21, fVar2, obj));
                        fVar2.b(new androidx.fragment.app.d(21, fVar2, obj, this));
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final fl.l c(h2 h2Var) {
        fl.l lVar;
        synchronized (this.f67310m) {
            h2Var.e(this.f67311p);
            lVar = new fl.l(this.f67311p);
        }
        return lVar;
    }

    public final Object clone() {
        return new i2(this);
    }

    public i2(i2 i2Var) {
        io.sentry.protocol.f0 f0Var;
        o4 o4Var;
        this.f67301d = new ArrayList();
        this.f67303f = new ConcurrentHashMap();
        this.f67304g = new ConcurrentHashMap();
        this.f67305h = new CopyOnWriteArrayList();
        this.f67308k = new Object();
        this.f67309l = new Object();
        this.f67310m = new Object();
        this.n = new io.sentry.protocol.c();
        this.o = new CopyOnWriteArrayList();
        this.f67312q = io.sentry.protocol.u.f67620b;
        this.f67298a = i2Var.f67298a;
        this.f67307j = i2Var.f67307j;
        this.f67306i = i2Var.f67306i;
        io.sentry.protocol.f0 f0Var2 = i2Var.f67299b;
        io.sentry.protocol.o oVar = null;
        if (f0Var2 != null) {
            f0Var = new io.sentry.protocol.f0();
            f0Var.f67496a = f0Var2.f67496a;
            f0Var.f67498c = f0Var2.f67498c;
            f0Var.f67497b = f0Var2.f67497b;
            f0Var.f67500e = f0Var2.f67500e;
            f0Var.f67499d = f0Var2.f67499d;
            f0Var.f67501f = f0Var2.f67501f;
            f0Var.f67502g = f0Var2.f67502g;
            f0Var.f67503h = com.google.android.gms.internal.consent_sdk.k0.y(f0Var2.f67503h);
            f0Var.f67504i = com.google.android.gms.internal.consent_sdk.k0.y(f0Var2.f67504i);
        } else {
            f0Var = null;
        }
        this.f67299b = f0Var;
        this.f67312q = i2Var.f67312q;
        io.sentry.protocol.o oVar2 = i2Var.f67300c;
        if (oVar2 != null) {
            oVar = new io.sentry.protocol.o();
            oVar.f67585a = oVar2.f67585a;
            oVar.f67589e = oVar2.f67589e;
            oVar.f67586b = oVar2.f67586b;
            oVar.f67587c = oVar2.f67587c;
            oVar.f67590f = com.google.android.gms.internal.consent_sdk.k0.y(oVar2.f67590f);
            oVar.f67591g = com.google.android.gms.internal.consent_sdk.k0.y(oVar2.f67591g);
            oVar.f67593i = com.google.android.gms.internal.consent_sdk.k0.y(oVar2.f67593i);
            oVar.f67596l = com.google.android.gms.internal.consent_sdk.k0.y(oVar2.f67596l);
            oVar.f67588d = oVar2.f67588d;
            oVar.f67594j = oVar2.f67594j;
            oVar.f67592h = oVar2.f67592h;
            oVar.f67595k = oVar2.f67595k;
        }
        this.f67300c = oVar;
        this.f67301d = new ArrayList(i2Var.f67301d);
        this.f67305h = new CopyOnWriteArrayList(i2Var.f67305h);
        e[] eVarArr = (e[]) i2Var.f67302e.toArray(new e[0]);
        int maxBreadcrumbs = i2Var.f67306i.getMaxBreadcrumbs();
        if (maxBreadcrumbs > 0) {
            o4Var = new o4(new g(maxBreadcrumbs));
        } else {
            o4Var = new o4(new p());
        }
        for (e eVar : eVarArr) {
            o4Var.add(new e(eVar));
        }
        this.f67302e = o4Var;
        ConcurrentHashMap concurrentHashMap = i2Var.f67303f;
        ConcurrentHashMap concurrentHashMap2 = new ConcurrentHashMap();
        for (Map.Entry entry : concurrentHashMap.entrySet()) {
            if (entry != null) {
                concurrentHashMap2.put((String) entry.getKey(), (String) entry.getValue());
            }
        }
        this.f67303f = concurrentHashMap2;
        ConcurrentHashMap concurrentHashMap3 = i2Var.f67304g;
        ConcurrentHashMap concurrentHashMap4 = new ConcurrentHashMap();
        for (Map.Entry entry2 : concurrentHashMap3.entrySet()) {
            if (entry2 != null) {
                concurrentHashMap4.put((String) entry2.getKey(), entry2.getValue());
            }
        }
        this.f67304g = concurrentHashMap4;
        this.n = new io.sentry.protocol.c(i2Var.n);
        this.o = new CopyOnWriteArrayList(i2Var.o);
        this.f67311p = new fl.l(i2Var.f67311p);
    }
}
