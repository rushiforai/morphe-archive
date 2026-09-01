package defpackage;

import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class px7 {
    public final Runnable a;
    public final CopyOnWriteArrayList b = new CopyOnWriteArrayList();
    public final HashMap c = new HashMap();

    public px7(Runnable runnable) {
        this.a = runnable;
    }

    public final boolean a() {
        Iterator it2 = this.b.iterator();
        while (it2.hasNext()) {
            if (((v15) ((ly7) it2.next())).a.o()) {
                return true;
            }
        }
        return false;
    }

    public final void b(ly7 ly7Var) {
        this.b.remove(ly7Var);
        ox7 ox7Var = (ox7) this.c.remove(ly7Var);
        if (ox7Var != null) {
            ox7Var.a.b(ox7Var.b);
            ox7Var.b = null;
        }
        this.a.run();
    }
}
