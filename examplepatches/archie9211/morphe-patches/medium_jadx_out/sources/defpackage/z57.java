package defpackage;

import android.view.View;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class z57 {
    public static final sn3 a = new sn3(0, new ov6(7));

    public static kc8 a(x12 x12Var) {
        kc8 kc8Var;
        p65 p65Var = (p65) x12Var;
        kc8 kc8Var2 = (kc8) p65Var.j(a);
        if (kc8Var2 != null) {
            p65Var.Y(950834231);
            p65Var.p(false);
            return kc8Var2;
        }
        p65Var.Y(950836184);
        View view = (View) p65Var.j(eo.f);
        view.getClass();
        while (true) {
            kc8Var = null;
            if (view == null) {
                break;
            }
            Object tag = view.getTag(R.id.view_tree_navigation_event_dispatcher_owner);
            kc8 kc8Var3 = tag instanceof kc8 ? (kc8) tag : null;
            if (kc8Var3 != null) {
                kc8Var = kc8Var3;
                break;
            }
            Object objU = ep7.u(view);
            view = objU instanceof View ? (View) objU : null;
        }
        p65Var.p(false);
        return kc8Var;
    }
}
