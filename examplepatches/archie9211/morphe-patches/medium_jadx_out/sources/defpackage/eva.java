package defpackage;

import java.lang.ref.Reference;
import java.util.ArrayList;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eva {
    public final long a;
    public final bgd b;
    public final hg3 c;
    public final ConcurrentLinkedQueue d;

    public eva(cgd cgdVar) {
        TimeUnit.MINUTES.getClass();
        this.a = 300000000000L;
        this.b = cgdVar.d();
        this.c = new hg3(1, this, ka1.v(new StringBuilder(), ggf.b, " ConnectionPool connection closer"));
        this.d = new ConcurrentLinkedQueue();
    }

    public final int a(dva dvaVar, long j) {
        TimeZone timeZone = ggf.a;
        ArrayList arrayList = dvaVar.p;
        int i = 0;
        while (i < arrayList.size()) {
            Reference reference = (Reference) arrayList.get(i);
            if (reference.get() != null) {
                i++;
            } else {
                String str = "A connection to " + dvaVar.c.a.h + " was leaked. Did you forget to close a response body?";
                ea9 ea9Var = ea9.a;
                ea9.a.j(str, ((ava) reference).a);
                arrayList.remove(i);
                if (arrayList.isEmpty()) {
                    dvaVar.q = j - this.a;
                    return 0;
                }
            }
        }
        return arrayList.size();
    }
}
