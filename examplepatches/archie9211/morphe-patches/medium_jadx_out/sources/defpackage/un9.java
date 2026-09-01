package defpackage;

import android.view.View;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class un9 extends nr0 {
    public final ko9 c;

    public un9(ko9 ko9Var) {
        this.c = ko9Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((hve) pr0Var.t).a.setContent(new mz1(new tn9(this, 0), true, -1363851913));
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
        if (nr0Var instanceof un9) {
            return this.c == ((un9) nr0Var).c;
        }
        return false;
    }
}
