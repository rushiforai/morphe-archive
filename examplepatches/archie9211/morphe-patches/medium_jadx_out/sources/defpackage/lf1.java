package defpackage;

import android.view.View;
import androidx.compose.ui.platform.ComposeView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lf1 extends nr0 {
    public final mf1 c;

    public lf1(mf1 mf1Var) {
        this.c = mf1Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((n37) pr0Var.t).a.setContent(new mz1(new kf1(this, 0), true, 1134173378));
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.listitem_catalog_recirc_see_list;
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        return new n37((ComposeView) view);
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        if (nr0Var instanceof lf1) {
            return this.c == ((lf1) nr0Var).c;
        }
        return false;
    }
}
