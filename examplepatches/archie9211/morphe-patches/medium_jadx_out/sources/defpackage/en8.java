package defpackage;

import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class en8 extends rwe {
    public final long d = System.currentTimeMillis();
    public final woa e = new woa();

    @Override // defpackage.rwe
    public final void c(RecyclerView recyclerView, int i, int i2) {
        if (i < 0 || i2 < 0) {
            return;
        }
        kxa adapter = recyclerView.getAdapter();
        gy6 gy6Var = adapter instanceof gy6 ? (gy6) adapter : null;
        if (gy6Var != null) {
            this.e.onNext(new dn8(gy6Var, recyclerView, this.d, i, i2));
        } else {
            ygf.f("This scroll listener expects a GroupAdapter!");
        }
    }
}
