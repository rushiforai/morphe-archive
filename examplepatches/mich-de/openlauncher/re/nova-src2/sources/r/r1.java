package r;

import android.widget.AbsListView;

/* loaded from: classes.dex */
public final class r1 implements AbsListView.OnScrollListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t1 f84851a;

    public r1(t1 t1Var) {
        this.f84851a = t1Var;
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public final void onScroll(AbsListView absListView, int i5, int i11, int i12) {
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public final void onScrollStateChanged(AbsListView absListView, int i5) {
        t1 t1Var = this.f84851a;
        p1 p1Var = t1Var.f84875r;
        u uVar = t1Var.f84883z;
        if (i5 != 1 || uVar.getInputMethodMode() == 2 || uVar.getContentView() == null) {
            return;
        }
        t1Var.f84879v.removeCallbacks(p1Var);
        p1Var.run();
    }
}
