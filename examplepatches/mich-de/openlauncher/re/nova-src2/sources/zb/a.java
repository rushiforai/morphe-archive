package zb;

import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final ConcurrentHashMap f98506a = new ConcurrentHashMap();

    public static synchronized void a(com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar) {
        try {
            c cVar = (c) f98506a.remove(aVar.wie());
            if (cVar != null) {
                cVar.f98509c = true;
            }
            aVar.lt();
            aVar.wie();
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
