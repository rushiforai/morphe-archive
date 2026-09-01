package defpackage;

import android.view.View;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ey6 extends vxa {
    public final LinkedHashSet a = new LinkedHashSet();
    public final /* synthetic */ gy6 b;

    public ey6(gy6 gy6Var) {
        this.b = gy6Var;
    }

    @Override // defpackage.vxa
    public final void a(RecyclerView recyclerView, int i, int i2) {
        b(recyclerView);
    }

    public final void b(RecyclerView recyclerView) {
        int iH;
        gy6 gy6Var;
        int I = iq7.I(recyclerView);
        sxa layoutManager = recyclerView.getLayoutManager();
        if (layoutManager instanceof LinearLayoutManager) {
            LinearLayoutManager linearLayoutManager = (LinearLayoutManager) layoutManager;
            View viewP0 = linearLayoutManager.P0(linearLayoutManager.v() - 1, -1, true, false);
            iH = viewP0 == null ? -1 : sxa.H(viewP0);
        } else if (layoutManager instanceof StaggeredGridLayoutManager) {
            StaggeredGridLayoutManager staggeredGridLayoutManager = (StaggeredGridLayoutManager) layoutManager;
            int[] iArr = new int[staggeredGridLayoutManager.p];
            for (int i = 0; i < staggeredGridLayoutManager.p; i++) {
                bd7 bd7Var = staggeredGridLayoutManager.q[i];
                iArr[i] = ((StaggeredGridLayoutManager) bd7Var.g).w ? bd7Var.g(0, ((ArrayList) bd7Var.f).size(), true, true, false) : bd7Var.g(r8.size() - 1, -1, true, true, false);
            }
            iH = iArr[0];
        } else {
            iH = 0;
        }
        LinkedHashSet linkedHashSet = this.a;
        if (I == -1 || iH == -1) {
            Iterator it2 = linkedHashSet.iterator();
            while (it2.hasNext()) {
                ((nr0) it2.next()).k(false);
            }
            linkedHashSet.clear();
            return;
        }
        n46 n46Var = new n46(I, iH, 1);
        ArrayList arrayList = new ArrayList();
        Iterator it3 = n46Var.iterator();
        while (true) {
            boolean z = ((m46) it3).c;
            gy6Var = this.b;
            if (!z) {
                break;
            } else {
                arrayList.add(op8.X(((g46) it3).nextInt(), gy6Var.c));
            }
        }
        Set setQ1 = bu1.q1(arrayList);
        w25 w25Var = gy6Var.g;
        w25Var.b();
        if (!w25Var.e.d.isAtLeast(vx6.RESUMED)) {
            gy6Var.h = true;
            return;
        }
        Set setT = qo7.t(linkedHashSet, setQ1);
        Set setT2 = qo7.t(setQ1, linkedHashSet);
        Iterator it4 = setT.iterator();
        while (it4.hasNext()) {
            ((nr0) it4.next()).k(false);
        }
        Iterator it5 = setT2.iterator();
        while (it5.hasNext()) {
            ((nr0) it5.next()).k(true);
        }
        linkedHashSet.clear();
        linkedHashSet.addAll(setQ1);
    }
}
