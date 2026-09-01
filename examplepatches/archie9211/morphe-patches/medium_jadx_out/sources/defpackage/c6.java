package defpackage;

import android.view.View;
import androidx.appcompat.view.menu.ActionMenuItemView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c6 extends u05 {
    public final /* synthetic */ int j = 0;
    public final /* synthetic */ View k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c6(ActionMenuItemView actionMenuItemView) {
        super(actionMenuItemView);
        this.k = actionMenuItemView;
    }

    @Override // defpackage.u05
    public final p9c b() {
        e6 e6Var;
        int i = this.j;
        View view = this.k;
        switch (i) {
            case 0:
                d6 d6Var = ((ActionMenuItemView) view).m;
                if (d6Var == null || (e6Var = ((f6) d6Var).a.t) == null) {
                    return null;
                }
                return e6Var.a();
            default:
                e6 e6Var2 = ((g6) view).d.s;
                if (e6Var2 == null) {
                    return null;
                }
                return e6Var2.a();
        }
    }

    @Override // defpackage.u05
    public final boolean c() {
        p9c p9cVarB;
        int i = this.j;
        View view = this.k;
        switch (i) {
            case 0:
                ActionMenuItemView actionMenuItemView = (ActionMenuItemView) view;
                kx7 kx7Var = actionMenuItemView.k;
                if (kx7Var == null || !kx7Var.a(actionMenuItemView.h) || (p9cVarB = b()) == null || !p9cVarB.a()) {
                }
                break;
            default:
                ((g6) view).d.l();
                break;
        }
        return true;
    }

    @Override // defpackage.u05
    public boolean d() {
        switch (this.j) {
            case 1:
                h6 h6Var = ((g6) this.k).d;
                if (h6Var.u != null) {
                    return false;
                }
                h6Var.e();
                return true;
            default:
                return super.d();
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c6(g6 g6Var, g6 g6Var2) {
        super(g6Var2);
        this.k = g6Var;
    }
}
