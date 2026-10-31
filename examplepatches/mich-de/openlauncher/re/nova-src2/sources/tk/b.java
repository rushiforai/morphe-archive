package tk;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.RemoteException;
import com.google.android.play.integrity.internal.af;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class b {
    public static final HashMap o = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public final Context f89400a;

    /* renamed from: b, reason: collision with root package name */
    public final s f89401b;

    /* renamed from: g, reason: collision with root package name */
    public boolean f89406g;

    /* renamed from: h, reason: collision with root package name */
    public final Intent f89407h;

    /* renamed from: i, reason: collision with root package name */
    public final b6.e f89408i;

    /* renamed from: m, reason: collision with root package name */
    public kk.l f89412m;
    public q n;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f89403d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final HashSet f89404e = new HashSet();

    /* renamed from: f, reason: collision with root package name */
    public final Object f89405f = new Object();

    /* renamed from: k, reason: collision with root package name */
    public final kk.i f89410k = new kk.i(this, 3);

    /* renamed from: l, reason: collision with root package name */
    public final AtomicInteger f89411l = new AtomicInteger(0);

    /* renamed from: c, reason: collision with root package name */
    public final String f89402c = "ExpressIntegrityService";

    /* renamed from: j, reason: collision with root package name */
    public final WeakReference f89409j = new WeakReference(null);

    public b(Context context, s sVar, Intent intent, b6.e eVar) {
        this.f89400a = context;
        this.f89401b = sVar;
        this.f89407h = intent;
        this.f89408i = eVar;
    }

    public static /* bridge */ /* synthetic */ void b(b bVar, ok.g gVar) {
        q qVar = bVar.n;
        s sVar = bVar.f89401b;
        ArrayList arrayList = bVar.f89403d;
        if (qVar != null || bVar.f89406g) {
            if (!bVar.f89406g) {
                gVar.run();
                return;
            } else {
                sVar.b("Waiting to bind to the service.", new Object[0]);
                arrayList.add(gVar);
                return;
            }
        }
        sVar.b("Initiate binding to the service.", new Object[0]);
        arrayList.add(gVar);
        kk.l lVar = new kk.l(bVar, 3);
        bVar.f89412m = lVar;
        bVar.f89406g = true;
        if (bVar.f89400a.bindService(bVar.f89407h, lVar, 1)) {
            return;
        }
        sVar.b("Failed to bind to the service.", new Object[0]);
        bVar.f89406g = false;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((t) it.next()).a(new af());
        }
        arrayList.clear();
    }

    public final Handler a() {
        Handler handler;
        HashMap map = o;
        synchronized (map) {
            try {
                if (!map.containsKey(this.f89402c)) {
                    HandlerThread handlerThread = new HandlerThread(this.f89402c, 10);
                    handlerThread.start();
                    map.put(this.f89402c, new Handler(handlerThread.getLooper()));
                }
                handler = (Handler) map.get(this.f89402c);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return handler;
    }

    public final void c(fi.j jVar) {
        synchronized (this.f89405f) {
            this.f89404e.remove(jVar);
        }
        a().post(new a(this, 1));
    }

    public final void d() {
        HashSet hashSet = this.f89404e;
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            ((fi.j) it.next()).b(new RemoteException(String.valueOf(this.f89402c).concat(" : Binder has died.")));
        }
        hashSet.clear();
    }
}
