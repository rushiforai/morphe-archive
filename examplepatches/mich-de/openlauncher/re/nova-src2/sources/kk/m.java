package kk;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.RemoteException;
import com.google.android.play.core.appupdate.internal.zzy;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class m {
    public static final HashMap n = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public final Context f71543a;

    /* renamed from: b, reason: collision with root package name */
    public final ex.a f71544b;

    /* renamed from: g, reason: collision with root package name */
    public boolean f71549g;

    /* renamed from: h, reason: collision with root package name */
    public final Intent f71550h;

    /* renamed from: l, reason: collision with root package name */
    public l f71554l;

    /* renamed from: m, reason: collision with root package name */
    public f f71555m;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f71546d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final HashSet f71547e = new HashSet();

    /* renamed from: f, reason: collision with root package name */
    public final Object f71548f = new Object();

    /* renamed from: j, reason: collision with root package name */
    public final i f71552j = new i(this, 0);

    /* renamed from: k, reason: collision with root package name */
    public final AtomicInteger f71553k = new AtomicInteger(0);

    /* renamed from: c, reason: collision with root package name */
    public final String f71545c = "AppUpdateService";

    /* renamed from: i, reason: collision with root package name */
    public final WeakReference f71551i = new WeakReference(null);

    public m(Context context, ex.a aVar, Intent intent) {
        this.f71543a = context;
        this.f71544b = aVar;
        this.f71550h = intent;
    }

    public static void b(m mVar, jk.f fVar) {
        f fVar2 = mVar.f71555m;
        ex.a aVar = mVar.f71544b;
        ArrayList arrayList = mVar.f71546d;
        if (fVar2 != null || mVar.f71549g) {
            if (!mVar.f71549g) {
                fVar.run();
                return;
            } else {
                aVar.i("Waiting to bind to the service.", new Object[0]);
                arrayList.add(fVar);
                return;
            }
        }
        aVar.i("Initiate binding to the service.", new Object[0]);
        arrayList.add(fVar);
        l lVar = new l(mVar, 0);
        mVar.f71554l = lVar;
        mVar.f71549g = true;
        if (mVar.f71543a.bindService(mVar.f71550h, lVar, 1)) {
            return;
        }
        aVar.i("Failed to bind to the service.", new Object[0]);
        mVar.f71549g = false;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            h hVar = (h) it.next();
            zzy zzyVar = new zzy();
            fi.j jVar = hVar.f71534a;
            if (jVar != null) {
                jVar.b(zzyVar);
            }
        }
        arrayList.clear();
    }

    public final Handler a() {
        Handler handler;
        HashMap map = n;
        synchronized (map) {
            try {
                if (!map.containsKey(this.f71545c)) {
                    HandlerThread handlerThread = new HandlerThread(this.f71545c, 10);
                    handlerThread.start();
                    map.put(this.f71545c, new Handler(handlerThread.getLooper()));
                }
                handler = (Handler) map.get(this.f71545c);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return handler;
    }

    public final void c(fi.j jVar) {
        synchronized (this.f71548f) {
            this.f71547e.remove(jVar);
        }
        a().post(new j(this, 0));
    }

    public final void d() {
        HashSet hashSet = this.f71547e;
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            ((fi.j) it.next()).b(new RemoteException(String.valueOf(this.f71545c).concat(" : Binder has died.")));
        }
        hashSet.clear();
    }
}
