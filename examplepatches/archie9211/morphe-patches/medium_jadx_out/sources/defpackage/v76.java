package defpackage;

import java.util.LinkedHashMap;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v76 {
    public final elb a;
    public final mtd b;
    public final LinkedHashMap c;
    public final ReentrantLock d;
    public final e73 e;
    public final e73 f;
    public final hx4 g;
    public final Object h;

    public v76(elb elbVar, LinkedHashMap linkedHashMap, LinkedHashMap linkedHashMap2, String... strArr) {
        this.a = elbVar;
        mtd mtdVar = new mtd(elbVar, linkedHashMap, linkedHashMap2, strArr, elbVar.k, new k0(1, this, v76.class, "notifyInvalidatedObservers", "notifyInvalidatedObservers(Ljava/util/Set;)V", 0, 20));
        this.b = mtdVar;
        this.c = new LinkedHashMap();
        this.d = new ReentrantLock();
        this.e = new e73(this, 22);
        this.f = new e73(this, 23);
        this.g = new hx4(elbVar);
        this.h = new Object();
        mtdVar.k = new em4(12, this);
    }
}
