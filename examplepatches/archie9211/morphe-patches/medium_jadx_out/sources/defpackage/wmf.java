package defpackage;

import com.google.firebase.auth.FirebaseAuth;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wmf implements y56 {
    public final xj4 a;
    public final h8a b;
    public final h8a c;
    public final Executor d;
    public final Executor e;
    public final Executor f;
    public final ScheduledExecutorService g;
    public final Executor h;
    public final ConcurrentHashMap i = new ConcurrentHashMap();

    public wmf(xj4 xj4Var, h8a h8aVar, h8a h8aVar2, Executor executor, Executor executor2, Executor executor3, ScheduledExecutorService scheduledExecutorService, Executor executor4) {
        this.a = xj4Var;
        this.b = h8aVar;
        this.c = h8aVar2;
        this.d = executor;
        this.e = executor2;
        this.f = executor3;
        this.g = scheduledExecutorService;
        this.h = executor4;
    }

    public final synchronized FirebaseAuth a() {
        if (this.i.containsKey("default")) {
            FirebaseAuth firebaseAuth = (FirebaseAuth) this.i.get("default");
            if (firebaseAuth != null) {
                return firebaseAuth;
            }
            this.i.remove("default");
        }
        if (!this.i.isEmpty()) {
            throw new IllegalStateException("FirebaseAuth instance has already been instantiated with different configuration.");
        }
        slf slfVar = new slf(this.a, this.b, this.e, this.f, this.g, this.h);
        this.i.put("default", slfVar);
        return slfVar;
    }
}
