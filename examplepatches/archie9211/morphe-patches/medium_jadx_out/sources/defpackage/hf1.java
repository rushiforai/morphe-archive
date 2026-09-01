package defpackage;

import android.view.View;
import androidx.compose.ui.platform.ComposeView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hf1 extends nr0 {
    public final if1 c;

    public hf1(if1 if1Var) {
        this.c = if1Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((m37) pr0Var.t).a.setContent(new mz1(new gf1(this, 0), true, -1175978378));
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.listitem_catalog_recirc_header;
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        return new m37((ComposeView) view);
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        if (nr0Var instanceof hf1) {
            return this.c == ((hf1) nr0Var).c;
        }
        return false;
    }
}
