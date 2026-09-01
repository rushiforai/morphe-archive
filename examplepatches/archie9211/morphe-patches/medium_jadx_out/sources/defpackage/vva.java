package defpackage;

import android.view.ViewTreeObserver;
import android.widget.ImageView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vva implements lfc {
    public final ImageView b;

    public vva(ImageView imageView) {
        this.b = imageView;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof vva) && this.b.equals(((vva) obj).b);
    }

    @Override // defpackage.lfc
    public final Object f(p92 p92Var) {
        cfc cfcVarJ = wgd.j(this);
        if (cfcVarJ != null) {
            return cfcVarJ;
        }
        x51 x51Var = new x51(1, pwd.Q(p92Var));
        x51Var.s();
        ViewTreeObserver viewTreeObserver = this.b.getViewTreeObserver();
        nve nveVar = new nve(this, viewTreeObserver, x51Var);
        viewTreeObserver.addOnPreDrawListener(nveVar);
        x51Var.v(new v67(this, viewTreeObserver, nveVar, 2));
        return x51Var.q();
    }

    public final int hashCode() {
        return (this.b.hashCode() * 31) + 1231;
    }

    public final String toString() {
        return "RealViewSizeResolver(view=" + this.b + ", subtractPadding=true)";
    }
}
