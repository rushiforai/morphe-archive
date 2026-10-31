package rk;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.RemoteException;
import com.google.android.play.core.review.internal.zzu;
import fi.j;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;
import kk.i;
import kk.l;

/* loaded from: classes3.dex */
public final class g {
    public static final HashMap n = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public final Context f86021a;

    /* renamed from: b, reason: collision with root package name */
    public final ex.a f86022b;

    /* renamed from: g, reason: collision with root package name */
    public boolean f86027g;

    /* renamed from: h, reason: collision with root package name */
    public final Intent f86028h;

    /* renamed from: l, reason: collision with root package name */
    public l f86032l;

    /* renamed from: m, reason: collision with root package name */
    public c f86033m;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f86024d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final HashSet f86025e = new HashSet();

    /* renamed from: f, reason: collision with root package name */
    public final Object f86026f = new Object();

    /* renamed from: j, reason: collision with root package name */
    public final i f86030j = new i(this, 2);

    /* renamed from: k, reason: collision with root package name */
    public final AtomicInteger f86031k = new AtomicInteger(0);

    /* renamed from: c, reason: collision with root package name */
    public final String f86023c = "com.google.android.finsky.inappreviewservice.InAppReviewService";

    /* renamed from: i, reason: collision with root package name */
    public final WeakReference f86029i = new WeakReference(null);

    public g(Context context, ex.a aVar, Intent intent) {
        this.f86021a = context;
        this.f86022b = aVar;
        this.f86028h = intent;
    }

    public static void b(g gVar, qk.a aVar) {
        c cVar = gVar.f86033m;
        ex.a aVar2 = gVar.f86022b;
        ArrayList arrayList = gVar.f86024d;
        if (cVar != null || gVar.f86027g) {
            if (!gVar.f86027g) {
                aVar.run();
                return;
            } else {
                aVar2.h("Waiting to bind to the service.", new Object[0]);
                arrayList.add(aVar);
                return;
            }
        }
        aVar2.h("Initiate binding to the service.", new Object[0]);
        arrayList.add(aVar);
        l lVar = new l(gVar, 2);
        gVar.f86032l = lVar;
        gVar.f86027g = true;
        if (gVar.f86021a.bindService(gVar.f86028h, lVar, 1)) {
            return;
        }
        aVar2.h("Failed to bind to the service.", new Object[0]);
        gVar.f86027g = false;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            d dVar = (d) it.next();
            zzu zzuVar = new zzu();
            j jVar = dVar.f86015a;
            if (jVar != null) {
                jVar.b(zzuVar);
            }
        }
        arrayList.clear();
    }

    public final Handler a() {
        Handler handler;
        HashMap map = n;
        synchronized (map) {
            try {
                if (!map.containsKey(this.f86023c)) {
                    HandlerThread handlerThread = new HandlerThread(this.f86023c, 10);
                    handlerThread.start();
                    map.put(this.f86023c, new Handler(handlerThread.getLooper()));
                }
                handler = (Handler) map.get(this.f86023c);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return handler;
    }

    public final void c() {
        HashSet hashSet = this.f86025e;
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            ((j) it.next()).b(new RemoteException(String.valueOf(this.f86023c).concat(" : Binder has died.")));
        }
        hashSet.clear();
    }
}
