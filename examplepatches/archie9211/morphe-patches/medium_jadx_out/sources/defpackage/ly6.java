package defpackage;

import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ly6 extends ky6 {
    public final Set k;
    public final di4 l;
    public boolean m;

    public ly6(pr0 pr0Var) {
        super(pr0Var, true);
        this.k = Collections.newSetFromMap(new WeakHashMap());
        this.l = new di4(2, this);
        this.m = true;
        j(false);
    }

    @Override // defpackage.ky6
    public final void e(ux6 ux6Var) {
        ux6Var.getClass();
        throw new UnsupportedOperationException("This should not be invoked directly but rather on its child lifecycleOwners.");
    }

    public final void i() {
        vx6 vx6Var = vx6.RESUMED;
        Iterator it2 = this.k.iterator();
        while (it2.hasNext()) {
            vx6 vx6Var2 = ((ky6) ((iy6) it2.next()).getLifecycle()).d;
            vx6Var.getClass();
            vx6Var2.getClass();
            if (vx6Var.compareTo(vx6Var2) > 0) {
                vx6Var = vx6Var2;
            }
        }
        g(vx6Var);
    }

    public final void j(boolean z) {
        if (this.m != z) {
            this.m = z;
            di4 di4Var = this.l;
            Set set = this.k;
            if (z) {
                set.getClass();
                Iterator it2 = set.iterator();
                while (it2.hasNext()) {
                    ((iy6) it2.next()).getLifecycle().a(di4Var);
                }
                return;
            }
            set.getClass();
            Iterator it3 = set.iterator();
            while (it3.hasNext()) {
                ((iy6) it3.next()).getLifecycle().b(di4Var);
            }
        }
    }
}
