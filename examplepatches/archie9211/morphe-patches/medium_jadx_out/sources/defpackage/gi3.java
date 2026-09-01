package defpackage;

import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gi3 extends e1 {
    public final Iterator c;
    public final mr9 d;
    public final HashSet e;

    public gi3(Iterator it2, mr9 mr9Var) {
        it2.getClass();
        this.c = it2;
        this.d = mr9Var;
        this.e = new HashSet();
    }

    @Override // defpackage.e1
    public final void a() {
        Object next;
        do {
            Iterator it2 = this.c;
            if (!it2.hasNext()) {
                this.a = 2;
                return;
            } else {
                next = it2.next();
            }
        } while (!this.e.add(this.d.invoke(next)));
        this.b = next;
        this.a = 1;
    }
}
