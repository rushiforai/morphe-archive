package defpackage;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.RemoteException;
import com.google.android.play.core.review.internal.zzu;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bmg {
    public static final HashMap n = new HashMap();
    public final Context a;
    public final d1g b;
    public boolean g;
    public final Intent h;
    public lgf l;
    public m3g m;
    public final ArrayList d = new ArrayList();
    public final HashSet e = new HashSet();
    public final Object f = new Object();
    public final lif j = new lif(1, this);
    public final AtomicInteger k = new AtomicInteger(0);
    public final String c = "com.google.android.finsky.inappreviewservice.InAppReviewService";
    public final WeakReference i = new WeakReference(null);

    public bmg(Context context, d1g d1gVar, Intent intent) {
        this.a = context;
        this.b = d1gVar;
        this.h = intent;
    }

    public static void b(bmg bmgVar, q3g q3gVar) {
        m3g m3gVar = bmgVar.m;
        d1g d1gVar = bmgVar.b;
        ArrayList<aag> arrayList = bmgVar.d;
        if (m3gVar != null || bmgVar.g) {
            if (!bmgVar.g) {
                q3gVar.run();
                return;
            } else {
                d1gVar.h("Waiting to bind to the service.", new Object[0]);
                arrayList.add(q3gVar);
                return;
            }
        }
        d1gVar.h("Initiate binding to the service.", new Object[0]);
        arrayList.add(q3gVar);
        lgf lgfVar = new lgf(1, bmgVar);
        bmgVar.l = lgfVar;
        bmgVar.g = true;
        if (bmgVar.a.bindService(bmgVar.h, lgfVar, 1)) {
            return;
        }
        d1gVar.h("Failed to bind to the service.", new Object[0]);
        bmgVar.g = false;
        for (aag aagVar : arrayList) {
            zzu zzuVar = new zzu("Failed to bind to the service.");
            wfd wfdVar = aagVar.a;
            if (wfdVar != null) {
                wfdVar.c(zzuVar);
            }
        }
        arrayList.clear();
    }

    public final Handler a() {
        Handler handler;
        HashMap map = n;
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

    public final void c() {
        HashSet hashSet = this.e;
        Iterator it2 = hashSet.iterator();
        while (it2.hasNext()) {
            ((wfd) it2.next()).c(new RemoteException(String.valueOf(this.c).concat(" : Binder has died.")));
        }
        hashSet.clear();
    }
}
