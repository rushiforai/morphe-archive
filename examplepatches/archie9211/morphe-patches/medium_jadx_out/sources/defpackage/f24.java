package defpackage;

import android.view.View;
import androidx.compose.ui.platform.ComposeView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f24 extends nr0 {
    public final h24 c;
    public final d24 d;
    public final b24 e;

    public f24(h24 h24Var, d24 d24Var, b24 b24Var, p13 p13Var) {
        d24Var.getClass();
        this.c = h24Var;
        this.d = d24Var;
        this.e = b24Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((g24) pr0Var.t).a.setContent(new mz1(new c24(this, pr0Var, 0), true, 963573355));
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.error_state_item;
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        return new g24((ComposeView) view);
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        return (nr0Var instanceof f24) && ((f24) nr0Var).c == this.c;
    }
}
