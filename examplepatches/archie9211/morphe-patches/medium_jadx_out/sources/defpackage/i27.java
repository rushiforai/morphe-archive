package defpackage;

import android.widget.AbsListView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i27 implements AbsListView.OnScrollListener {
    public final /* synthetic */ k27 a;

    public i27(k27 k27Var) {
        this.a = k27Var;
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public final void onScrollStateChanged(AbsListView absListView, int i) {
        k27 k27Var = this.a;
        g27 g27Var = k27Var.r;
        p20 p20Var = k27Var.z;
        if (i != 1 || p20Var.getInputMethodMode() == 2 || p20Var.getContentView() == null) {
            return;
        }
        k27Var.v.removeCallbacks(g27Var);
        g27Var.run();
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public final void onScroll(AbsListView absListView, int i, int i2, int i3) {
    }
}
