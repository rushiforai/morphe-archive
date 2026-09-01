package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e34 implements zwc, xoa {
    public final HashMap a = new HashMap();
    public ArrayDeque b = new ArrayDeque();
    public final Executor c;

    public e34(Executor executor) {
        this.c = executor;
    }

    public final void a(ik4 ik4Var) {
        Executor executor = this.c;
        synchronized (this) {
            try {
                executor.getClass();
                if (!this.a.containsKey(ht2.class)) {
                    this.a.put(ht2.class, new ConcurrentHashMap());
                }
                ((ConcurrentHashMap) this.a.get(ht2.class)).put(ik4Var, executor);
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
