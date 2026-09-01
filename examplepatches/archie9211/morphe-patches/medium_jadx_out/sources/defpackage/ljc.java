package defpackage;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ljc {
    public final AtomicReference a = new AtomicReference(jjc.IDLE);
    public final AtomicLong b = new AtomicLong(0);
    public final ExecutorService c = Executors.newSingleThreadExecutor(kjc.b);
    public final qlb d;
    public final a1a e;
    public final olb f;
    public final List g;
    public final long h;
    public final long i;
    public final long j;
    public final long k;

    public ljc(qlb qlbVar, wz7 wz7Var, a1a a1aVar, olb olbVar, List list, long j, long j2, long j3, long j4) {
        this.d = qlbVar;
        this.e = a1aVar;
        this.f = olbVar;
        this.g = list;
        this.h = j;
        this.i = j2;
        this.j = j3;
        this.k = j4;
    }

    public final void a() {
        if (((jjc) this.a.get()) != jjc.STOPPED) {
            return;
        }
        ygf.f("Service already shutdown");
    }

    public final void b() {
        a();
        if (((jjc) this.a.get()) != jjc.SYNCING) {
            this.c.submit(new jn(13, this));
        }
    }
}
