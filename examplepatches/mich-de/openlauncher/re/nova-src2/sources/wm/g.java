package wm;

import android.app.Application;
import android.content.Context;
import b.c0;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.crashlytics.internal.common.m;
import com.google.firebase.remoteconfig.internal.ConfigFetchHttpClient;
import java.util.Collections;
import java.util.HashMap;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicReference;
import x7.h;
import x7.l;
import xm.i;
import xm.j;
import xm.n;
import xm.o;

/* loaded from: classes.dex */
public final class g implements zm.a {

    /* renamed from: j, reason: collision with root package name */
    public static final Random f94612j = new Random();

    /* renamed from: k, reason: collision with root package name */
    public static final HashMap f94613k = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final Context f94615b;

    /* renamed from: c, reason: collision with root package name */
    public final ScheduledExecutorService f94616c;

    /* renamed from: d, reason: collision with root package name */
    public final ul.g f94617d;

    /* renamed from: e, reason: collision with root package name */
    public final om.e f94618e;

    /* renamed from: f, reason: collision with root package name */
    public final vl.b f94619f;

    /* renamed from: g, reason: collision with root package name */
    public final nm.c f94620g;

    /* renamed from: h, reason: collision with root package name */
    public final String f94621h;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f94614a = new HashMap();

    /* renamed from: i, reason: collision with root package name */
    public final HashMap f94622i = new HashMap();

    public g(Context context, ScheduledExecutorService scheduledExecutorService, ul.g gVar, om.e eVar, vl.b bVar, nm.c cVar) {
        this.f94615b = context;
        this.f94616c = scheduledExecutorService;
        this.f94617d = gVar;
        this.f94618e = eVar;
        this.f94619f = bVar;
        this.f94620g = cVar;
        gVar.a();
        this.f94621h = gVar.f91322c.f91336b;
        AtomicReference atomicReference = f.f94611a;
        Application application = (Application) context.getApplicationContext();
        AtomicReference atomicReference2 = f.f94611a;
        if (atomicReference2.get() == null) {
            f fVar = new f();
            while (true) {
                if (atomicReference2.compareAndSet(null, fVar)) {
                    rg.c.b(application);
                    rg.c.f85862e.a(fVar);
                    break;
                } else if (atomicReference2.get() != null) {
                    break;
                }
            }
        }
        Tasks.b(new m(this, 2), scheduledExecutorService);
    }

    public final synchronized c a() throws Throwable {
        l lVar;
        try {
            try {
                xm.c cVarC = c("fetch");
                xm.c cVarC2 = c("activate");
                xm.c cVarC3 = c("defaults");
                n nVar = new n(this.f94615b.getSharedPreferences("frc_" + this.f94621h + "_firebase_settings", 0));
                j jVar = new j(this.f94616c, cVarC2, cVarC3);
                ul.g gVar = this.f94617d;
                nm.c cVar = this.f94620g;
                gVar.a();
                if (gVar.f91321b.equals("[DEFAULT]")) {
                    lVar = new l();
                    lVar.f95146b = Collections.synchronizedMap(new HashMap());
                    lVar.f95145a = cVar;
                } else {
                    lVar = null;
                }
                if (lVar != null) {
                    e eVar = new e(lVar);
                    synchronized (jVar.f96139a) {
                        jVar.f96139a.add(eVar);
                    }
                }
                l lVar2 = new l();
                lVar2.f95145a = cVarC2;
                lVar2.f95146b = cVarC3;
                ScheduledExecutorService scheduledExecutorService = this.f94616c;
                h hVar = new h(11, false);
                hVar.f95140e = Collections.newSetFromMap(new ConcurrentHashMap());
                hVar.f95137b = cVarC2;
                hVar.f95138c = lVar2;
                hVar.f95139d = scheduledExecutorService;
                return b(this.f94617d, this.f94618e, this.f94619f, this.f94616c, cVarC, cVarC2, cVarC3, d(cVarC, nVar), jVar, nVar, hVar);
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public final synchronized c b(ul.g gVar, om.e eVar, vl.b bVar, Executor executor, xm.c cVar, xm.c cVar2, xm.c cVar3, i iVar, j jVar, n nVar, h hVar) {
        if (!this.f94614a.containsKey("firebase")) {
            Context context = this.f94615b;
            gVar.a();
            vl.b bVar2 = gVar.f91321b.equals("[DEFAULT]") ? bVar : null;
            Context context2 = this.f94615b;
            synchronized (this) {
                c cVar4 = new c(context, bVar2, executor, cVar, cVar2, cVar3, iVar, jVar, nVar, new i50.c(gVar, eVar, iVar, cVar2, context2, nVar, this.f94616c), hVar);
                cVar2.b();
                cVar3.b();
                cVar.b();
                this.f94614a.put("firebase", cVar4);
                f94613k.put("firebase", cVar4);
            }
        }
        return (c) this.f94614a.get("firebase");
    }

    public final xm.c c(String str) {
        o oVar;
        xm.c cVar;
        String strN = c0.n("frc_", this.f94621h, "_firebase_", str, ".json");
        ScheduledExecutorService scheduledExecutorService = this.f94616c;
        Context context = this.f94615b;
        HashMap map = o.f96170c;
        synchronized (o.class) {
            try {
                HashMap map2 = o.f96170c;
                if (!map2.containsKey(strN)) {
                    map2.put(strN, new o(context, strN));
                }
                oVar = (o) map2.get(strN);
            } finally {
            }
        }
        HashMap map3 = xm.c.f96097d;
        synchronized (xm.c.class) {
            try {
                String str2 = oVar.f96172b;
                HashMap map4 = xm.c.f96097d;
                if (!map4.containsKey(str2)) {
                    map4.put(str2, new xm.c(scheduledExecutorService, oVar));
                }
                cVar = (xm.c) map4.get(str2);
            } finally {
            }
        }
        return cVar;
    }

    public final synchronized i d(xm.c cVar, n nVar) {
        om.e eVar;
        nm.c hVar;
        ScheduledExecutorService scheduledExecutorService;
        Random random;
        String str;
        ul.g gVar;
        try {
            eVar = this.f94618e;
            ul.g gVar2 = this.f94617d;
            gVar2.a();
            hVar = gVar2.f91321b.equals("[DEFAULT]") ? this.f94620g : new tm.h(1);
            scheduledExecutorService = this.f94616c;
            random = f94612j;
            ul.g gVar3 = this.f94617d;
            gVar3.a();
            str = gVar3.f91322c.f91335a;
            gVar = this.f94617d;
            gVar.a();
        } catch (Throwable th2) {
            throw th2;
        }
        return new i(eVar, hVar, scheduledExecutorService, random, cVar, new ConfigFetchHttpClient(this.f94615b, gVar.f91322c.f91336b, str, nVar.c(), nVar.c()), nVar, this.f94622i);
    }
}
