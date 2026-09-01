package defpackage;

import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i8f {
    public final elb a;
    public final u73 b = new u73(7);

    public i8f(elb elbVar) {
        this.a = elbVar;
    }

    public final void a(String str, Set set) {
        str.getClass();
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            n01.c0(this.a, false, true, new vrd(this, 23, new h8f((String) it2.next(), str)));
        }
    }
}
