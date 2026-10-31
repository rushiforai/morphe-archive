package ads_mobile_sdk;

import a5.i;
import ads_mobile_sdk.e13;
import ads_mobile_sdk.k33;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.RemoteException;
import b.c5;
import b.y8;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public final class k33 {
    public static final HashMap o = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public final Context f5478a;

    /* renamed from: b, reason: collision with root package name */
    public final c7 f5479b;

    /* renamed from: g, reason: collision with root package name */
    public boolean f5484g;

    /* renamed from: h, reason: collision with root package name */
    public final Intent f5485h;

    /* renamed from: i, reason: collision with root package name */
    public final i f5486i;

    /* renamed from: m, reason: collision with root package name */
    public j33 f5490m;
    public y8 n;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f5481d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final HashSet f5482e = new HashSet();

    /* renamed from: f, reason: collision with root package name */
    public final Object f5483f = new Object();

    /* renamed from: k, reason: collision with root package name */
    public final c5 f5488k = new IBinder.DeathRecipient() { // from class: b.c5
        @Override // android.os.IBinder.DeathRecipient
        public final void binderDied() {
            k33 k33Var = this.f15789a;
            k33Var.f5479b.a("reportBinderDeath", new Object[0]);
            if (k33Var.f5487j.get() != null) {
                throw new ClassCastException();
            }
            k33Var.f5479b.a("%s : Binder has died.", k33Var.f5480c);
            Iterator it = k33Var.f5481d.iterator();
            while (it.hasNext()) {
                e13 e13Var = (e13) it.next();
                RemoteException remoteException = new RemoteException(c0.q(new StringBuilder(), k33Var.f5480c, " : Binder has died."));
                fi.j jVar = e13Var.f2705a;
                if (jVar != null) {
                    jVar.b(remoteException);
                }
            }
            k33Var.f5481d.clear();
            synchronized (k33Var.f5483f) {
                try {
                    Iterator it2 = k33Var.f5482e.iterator();
                    while (it2.hasNext()) {
                        ((fi.j) it2.next()).b(new RemoteException(k33Var.f5480c + " : Binder has died."));
                    }
                    k33Var.f5482e.clear();
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    };

    /* renamed from: l, reason: collision with root package name */
    public final AtomicInteger f5489l = new AtomicInteger(0);

    /* renamed from: c, reason: collision with root package name */
    public final String f5480c = "PrewarmService";

    /* renamed from: j, reason: collision with root package name */
    public final WeakReference f5487j = new WeakReference(null);

    /* JADX WARN: Type inference failed for: r0v3, types: [b.c5] */
    public k33(Context context, c7 c7Var, Intent intent, i iVar) {
        this.f5478a = context;
        this.f5479b = c7Var;
        this.f5485h = intent;
        this.f5486i = iVar;
    }

    public final void a(rl2 rl2Var) {
        y8 y8Var = this.n;
        c7 c7Var = this.f5479b;
        ArrayList arrayList = this.f5481d;
        if (y8Var != null || this.f5484g) {
            if (!this.f5484g) {
                rl2Var.run();
                return;
            } else {
                c7Var.a("Waiting to bind to the service.", new Object[0]);
                arrayList.add(rl2Var);
                return;
            }
        }
        c7Var.a("Initiate binding to the service.", new Object[0]);
        arrayList.add(rl2Var);
        j33 j33Var = new j33(this);
        this.f5490m = j33Var;
        this.f5484g = true;
        if (this.f5478a.bindService(this.f5485h, j33Var, 1)) {
            return;
        }
        c7Var.a("Failed to bind to the service.", new Object[0]);
        this.f5484g = false;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            e13 e13Var = (e13) it.next();
            l33 l33Var = new l33();
            fi.j jVar = e13Var.f2705a;
            if (jVar != null) {
                jVar.b(l33Var);
            }
        }
        arrayList.clear();
    }

    public final void b(e13 e13Var) {
        Handler handler;
        HashMap map = o;
        synchronized (map) {
            try {
                if (!map.containsKey(this.f5480c)) {
                    HandlerThread handlerThread = new HandlerThread(this.f5480c, 10);
                    handlerThread.start();
                    map.put(this.f5480c, new Handler(handlerThread.getLooper()));
                }
                handler = (Handler) map.get(this.f5480c);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        handler.post(e13Var);
    }
}
