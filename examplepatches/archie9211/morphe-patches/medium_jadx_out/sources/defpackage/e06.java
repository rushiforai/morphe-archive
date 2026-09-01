package defpackage;

import android.view.View;
import androidx.compose.ui.platform.ComposeView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e06 extends nr0 {
    public final j06 c;

    public e06(j06 j06Var) {
        this.c = j06Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((hue) pr0Var.t).a.setContent(new mz1(new d06(this, 0), true, -1035942696));
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.view_in_response_to_post;
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        return new hue((ComposeView) view);
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        return (nr0Var instanceof e06) && ((e06) nr0Var).c == this.c;
    }
}
