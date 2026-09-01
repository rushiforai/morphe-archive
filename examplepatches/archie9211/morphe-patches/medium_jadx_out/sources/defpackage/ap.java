package defpackage;

import android.view.DragEvent;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ap implements View.OnDragListener, bk3 {
    public final dk3 a;
    public final d80 b;
    public final zo c;

    public ap() {
        dk3 dk3Var = new dk3();
        dk3Var.q = 0L;
        this.a = dk3Var;
        this.b = new d80(0);
        this.c = new zo(this);
    }

    @Override // android.view.View.OnDragListener
    public final boolean onDrag(View view, DragEvent dragEvent) {
        md5 md5Var = new md5(14, dragEvent);
        int action = dragEvent.getAction();
        d80 d80Var = this.b;
        dk3 dk3Var = this.a;
        switch (action) {
            case 1:
                nya nyaVar = new nya();
                ck3 ck3Var = new ck3(md5Var, dk3Var, nyaVar);
                if (ck3Var.invoke(dk3Var) == rsd.ContinueTraversal) {
                    br7.C(dk3Var, ck3Var);
                }
                boolean z = nyaVar.a;
                t70 t70Var = new t70(d80Var);
                while (t70Var.hasNext()) {
                    ((dk3) t70Var.next()).M0();
                }
                break;
            case 2:
                dk3Var.L0(md5Var);
                break;
            case 4:
                ce ceVar = new ce(16, md5Var);
                if (ceVar.invoke(dk3Var) == rsd.ContinueTraversal) {
                    br7.C(dk3Var, ceVar);
                }
                d80Var.clear();
                break;
            case 5:
                dk3Var.J0();
                break;
            case 6:
                dk3Var.K0();
                break;
        }
        return false;
    }
}
