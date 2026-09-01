package defpackage;

import android.view.View;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xe0 extends nr0 {
    public final gf0 c;

    public xe0(gf0 gf0Var) {
        this.c = gf0Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((hve) pr0Var.t).a.setContent(new mz1(new we0(this, 0), true, -1180528829));
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.view_post_item_compose;
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        return hve.a(view);
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        if (nr0Var instanceof xe0) {
            return this.c == ((xe0) nr0Var).c;
        }
        return false;
    }
}
