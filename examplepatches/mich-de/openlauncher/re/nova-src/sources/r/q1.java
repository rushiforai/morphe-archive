package r;

import android.database.DataSetObserver;

/* loaded from: classes.dex */
public final class q1 extends DataSetObserver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t1 f84848a;

    public q1(t1 t1Var) {
        this.f84848a = t1Var;
    }

    @Override // android.database.DataSetObserver
    public final void onChanged() {
        t1 t1Var = this.f84848a;
        if (t1Var.f84883z.isShowing()) {
            t1Var.show();
        }
    }

    @Override // android.database.DataSetObserver
    public final void onInvalidated() {
        this.f84848a.dismiss();
    }
}
