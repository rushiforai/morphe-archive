package defpackage;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rwe extends vxa {
    public int a;
    public int b = -1;
    public int c = -1;

    @Override // defpackage.vxa
    public final void a(RecyclerView recyclerView, int i, int i2) {
        int iN0;
        int I = iq7.I(recyclerView);
        sxa layoutManager = recyclerView.getLayoutManager();
        if (layoutManager instanceof LinearLayoutManager) {
            iN0 = ((LinearLayoutManager) layoutManager).N0();
        } else if (layoutManager instanceof StaggeredGridLayoutManager) {
            StaggeredGridLayoutManager staggeredGridLayoutManager = (StaggeredGridLayoutManager) layoutManager;
            int[] iArr = new int[staggeredGridLayoutManager.p];
            for (int i3 = 0; i3 < staggeredGridLayoutManager.p; i3++) {
                bd7 bd7Var = staggeredGridLayoutManager.q[i3];
                iArr[i3] = ((StaggeredGridLayoutManager) bd7Var.g).w ? bd7Var.g(0, ((ArrayList) bd7Var.f).size(), false, true, false) : bd7Var.g(r6.size() - 1, -1, false, true, false);
            }
            iN0 = iArr[0];
        } else {
            iN0 = 0;
        }
        sxa layoutManager2 = recyclerView.getLayoutManager();
        int iC = layoutManager2 != null ? layoutManager2.C() : 0;
        if (this.b != I || this.c != iN0) {
            this.b = I;
            this.c = iN0;
            b(recyclerView, iN0);
        }
        if (iC > this.a) {
            this.a = iC;
        }
        if (I != -1 && iN0 != -1) {
            c(recyclerView, I, iN0);
            return;
        }
        uld uldVar = wld.a;
        StringBuilder sbB = ev6.B(I, iN0, "VisibleItemsChangedScrollListener first: ", " last: ", " dy: ");
        sbB.append(i2);
        uldVar.a(sbB.toString(), new Object[0]);
    }

    public void b(RecyclerView recyclerView, int i) {
    }

    public void c(RecyclerView recyclerView, int i, int i2) {
    }
}
