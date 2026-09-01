package defpackage;

import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class oqb {
    static {
        Boolean.getBoolean("rx2.scheduler.use-nanotime");
        Long.getLong("rx2.scheduler.drift-tolerance", 15L).longValue();
    }

    public abstract nqb a();

    public sh3 b(p0g p0gVar) {
        nqb nqbVarA = a();
        mqb mqbVar = new mqb(p0gVar, nqbVarA);
        nqbVarA.a(mqbVar, 0L, TimeUnit.NANOSECONDS);
        return mqbVar;
    }
}
