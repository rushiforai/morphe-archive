package bb0;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;

/* loaded from: classes.dex */
public final class e implements za0.a {

    /* renamed from: a, reason: collision with root package name */
    public volatile boolean f17809a = false;

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f17810b = new ConcurrentHashMap();

    /* renamed from: c, reason: collision with root package name */
    public final LinkedBlockingQueue f17811c = new LinkedBlockingQueue();

    @Override // za0.a
    public final synchronized za0.b b(String str) {
        d dVar;
        dVar = (d) this.f17810b.get(str);
        if (dVar == null) {
            dVar = new d(str, this.f17811c, this.f17809a);
            this.f17810b.put(str, dVar);
        }
        return dVar;
    }
}
