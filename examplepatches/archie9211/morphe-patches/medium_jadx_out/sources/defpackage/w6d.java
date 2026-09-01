package defpackage;

import android.view.View;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w6d extends i36 {
    public x45 r;
    public f5f s;

    @Override // defpackage.e36, defpackage.q28
    public final void A0() {
        View viewU = guc.U(this);
        f5f f5fVar = this.s;
        if (f5fVar != null) {
            int i = f5fVar.u - 1;
            f5fVar.u = i;
            if (i == 0) {
                WeakHashMap weakHashMap = ute.a;
                mte.c(viewU, null);
                f4f.a(viewU, null);
                viewU.removeOnAttachStateChangeListener(f5fVar.v);
            }
        }
        super.A0();
    }

    @Override // defpackage.e36, defpackage.q28
    public final void y0() {
        View viewU = guc.U(this);
        WeakHashMap weakHashMap = f5f.w;
        f5f f5fVarT = tr7.t(viewU);
        f5fVarT.a(viewU);
        y3f y3fVar = (y3f) this.r.invoke(f5fVarT);
        if (!g76.L(y3fVar, this.q)) {
            this.q = y3fVar;
            J0();
        }
        this.s = f5fVarT;
        super.y0();
    }
}
