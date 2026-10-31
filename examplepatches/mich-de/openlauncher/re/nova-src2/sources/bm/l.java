package bm;

import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class l implements km.c, km.b {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f18092a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayDeque f18093b;

    /* renamed from: c, reason: collision with root package name */
    public final cm.l f18094c;

    public l() {
        cm.l lVar = cm.l.f20128a;
        this.f18092a = new HashMap();
        this.f18093b = new ArrayDeque();
        this.f18094c = lVar;
    }

    public final synchronized void a(Executor executor, km.a aVar) {
        try {
            executor.getClass();
            if (!this.f18092a.containsKey(ul.b.class)) {
                this.f18092a.put(ul.b.class, new ConcurrentHashMap());
            }
            ((ConcurrentHashMap) this.f18092a.get(ul.b.class)).put(aVar, executor);
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
