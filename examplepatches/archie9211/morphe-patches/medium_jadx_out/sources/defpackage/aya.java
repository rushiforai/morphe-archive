package defpackage;

import androidx.recyclerview.widget.RecyclerView;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aya {
    public final /* synthetic */ RecyclerView a;

    public aya(RecyclerView recyclerView) {
        this.a = recyclerView;
    }

    public final void a() {
        RecyclerView recyclerView = this.a;
        if (!recyclerView.t || !recyclerView.s) {
            recyclerView.A = true;
            recyclerView.requestLayout();
        } else {
            gxa gxaVar = recyclerView.i;
            WeakHashMap weakHashMap = ute.a;
            recyclerView.postOnAnimation(gxaVar);
        }
    }
}
