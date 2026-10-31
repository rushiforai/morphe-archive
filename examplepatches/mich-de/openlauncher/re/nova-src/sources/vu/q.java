package vu;

import android.content.Context;
import java.util.concurrent.ConcurrentHashMap;
import p6.p0;

/* loaded from: classes4.dex */
public final class q implements qb.b {
    public void a(Context context, com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar, qb.a aVar2) {
        ConcurrentHashMap concurrentHashMap = zb.a.f98506a;
        synchronized (zb.a.class) {
            if (aVar != null) {
                try {
                    ConcurrentHashMap concurrentHashMap2 = zb.a.f98506a;
                    zb.c cVar = (zb.c) concurrentHashMap2.get(aVar.wie());
                    if (cVar == null) {
                        cVar = new zb.c(context, aVar);
                        concurrentHashMap2.put(aVar.wie(), cVar);
                        aVar.lt();
                        aVar.wie();
                    }
                    cVar.c(aVar2);
                    aVar.lt();
                    aVar.wie();
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        sb.b bVar = p0.f82233e;
        if (bVar != null) {
            ((ar.g) bVar).a();
        }
    }
}
