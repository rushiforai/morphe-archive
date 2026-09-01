package defpackage;

import android.view.View;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ji3 extends nr0 {
    public final ni3 c;

    public ji3(ni3 ni3Var) {
        this.c = ni3Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((hve) pr0Var.t).a.setContent(new mz1(new ii3(this, 0), true, -1941622237));
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.view_post_item_compose;
    }

    @Override // defpackage.nr0
    public final boolean f(nr0 nr0Var) {
        return (nr0Var instanceof ji3) && this.c.b.equals(((ji3) nr0Var).c.b);
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        return hve.a(view);
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        return nr0Var instanceof ji3;
    }
}
