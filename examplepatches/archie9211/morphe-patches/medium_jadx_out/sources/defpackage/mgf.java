package defpackage;

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

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mgf {
    public static final HashMap o = new HashMap();
    public final Context a;
    public final jif b;
    public boolean g;
    public final Intent h;
    public final dq1 i;
    public lgf m;
    public hif n;
    public final ArrayList d = new ArrayList();
    public final HashSet e = new HashSet();
    public final Object f = new Object();
    public final lif k = new lif(0, this);
    public final AtomicInteger l = new AtomicInteger(0);
    public final String c = "ExpressIntegrityService";
    public final WeakReference j = new WeakReference(null);

    public mgf(Context context, jif jifVar, Intent intent, dq1 dq1Var) {
        this.a = context;
        this.b = jifVar;
        this.h = intent;
        this.i = dq1Var;
    }

    public static void b(mgf mgfVar, ohf ohfVar) {
        hif hifVar = mgfVar.n;
        jif jifVar = mgfVar.b;
        ArrayList arrayList = mgfVar.d;
        int i = 0;
        if (hifVar != null || mgfVar.g) {
            if (!mgfVar.g) {
                ohfVar.run();
                return;
            } else {
                jifVar.b("Waiting to bind to the service.", new Object[0]);
                arrayList.add(ohfVar);
                return;
            }
        }
        jifVar.b("Initiate binding to the service.", new Object[0]);
        arrayList.add(ohfVar);
        lgf lgfVar = new lgf(i, mgfVar);
        mgfVar.m = lgfVar;
        mgfVar.g = true;
        if (mgfVar.a.bindService(mgfVar.h, lgfVar, 1)) {
            return;
        }
        jifVar.b("Failed to bind to the service.", new Object[0]);
        mgfVar.g = false;
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((kif) it2.next()).a(new af("Failed to bind to the service."));
        }
        arrayList.clear();
    }

    public final Handler a() {
        Handler handler;
        HashMap map = o;
        synchronized (map) {
            try {
                if (!map.containsKey(this.c)) {
                    HandlerThread handlerThread = new HandlerThread(this.c, 10);
                    handlerThread.start();
                    map.put(this.c, new Handler(handlerThread.getLooper()));
                }
                handler = (Handler) map.get(this.c);
            } catch (Throwable th) {
                throw th;
            }
        }
        return handler;
    }

    public final void c(wfd wfdVar) {
        synchronized (this.f) {
            this.e.remove(wfdVar);
        }
        a().post(new kgf(1, this));
    }

    public final void d() {
        HashSet hashSet = this.e;
        Iterator it2 = hashSet.iterator();
        while (it2.hasNext()) {
            ((wfd) it2.next()).c(new RemoteException(String.valueOf(this.c).concat(" : Binder has died.")));
        }
        hashSet.clear();
    }
}
