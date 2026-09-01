package defpackage;

import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class yxa {
    public final ArrayList a;
    public ArrayList b;
    public final ArrayList c;
    public final List d;
    public int e;
    public int f;
    public xxa g;
    public final /* synthetic */ RecyclerView h;

    public yxa(RecyclerView recyclerView) {
        this.h = recyclerView;
        ArrayList arrayList = new ArrayList();
        this.a = arrayList;
        this.b = null;
        this.c = new ArrayList();
        this.d = DesugarCollections.unmodifiableList(arrayList);
        this.e = 2;
        this.f = 2;
    }

    public final void a(pr0 pr0Var, boolean z) {
        RecyclerView.j(pr0Var);
        View view = pr0Var.a;
        RecyclerView recyclerView = this.h;
        jya jyaVar = recyclerView.B0;
        if (jyaVar != null) {
            iya iyaVar = jyaVar.e;
            ute.o(view, iyaVar != null ? (l4) iyaVar.e.remove(view) : null);
        }
        if (z) {
            ArrayList arrayList = recyclerView.o;
            if (arrayList.size() > 0) {
                arrayList.get(0).getClass();
                rd6.m();
                return;
            }
            if (recyclerView.m != null) {
                pr0Var.s.m(pr0Var);
            }
            if (recyclerView.u0 != null) {
                recyclerView.g.Y(pr0Var);
            }
            if (RecyclerView.Q0) {
                Log.d("RecyclerView", "dispatchViewRecycled: " + pr0Var);
            }
        }
        pr0Var.r = null;
        pr0Var.q = null;
        xxa xxaVarC = c();
        xxaVarC.getClass();
        int i = pr0Var.e;
        ArrayList arrayList2 = xxaVarC.a(i).a;
        if (((wxa) xxaVarC.a.get(i)).b <= arrayList2.size()) {
            rr7.w(view);
        } else if (RecyclerView.P0 && arrayList2.contains(pr0Var)) {
            ay0.e("this scrap item already exists");
        } else {
            pr0Var.l();
            arrayList2.add(pr0Var);
        }
    }

    public final int b(int i) {
        RecyclerView recyclerView = this.h;
        eya eyaVar = recyclerView.u0;
        if (i >= 0 && i < eyaVar.b()) {
            return !eyaVar.g ? i : recyclerView.e.g(i, 0);
        }
        StringBuilder sbC = ev6.C("invalid position ", i, ". State item count is ");
        sbC.append(eyaVar.b());
        sbC.append(recyclerView.A());
        throw new IndexOutOfBoundsException(sbC.toString());
    }

    public final xxa c() {
        if (this.g == null) {
            this.g = new xxa();
            e();
        }
        return this.g;
    }

    public final View d(int i) {
        return l(i, Long.MAX_VALUE).a;
    }

    public final void e() {
        RecyclerView recyclerView;
        kxa kxaVar;
        xxa xxaVar = this.g;
        if (xxaVar == null || (kxaVar = (recyclerView = this.h).m) == null || !recyclerView.s) {
            return;
        }
        xxaVar.c.add(kxaVar);
    }

    public final void f(kxa kxaVar, boolean z) {
        xxa xxaVar = this.g;
        if (xxaVar != null) {
            SparseArray sparseArray = xxaVar.a;
            Set set = xxaVar.c;
            set.remove(kxaVar);
            if (set.size() != 0 || z) {
                return;
            }
            for (int i = 0; i < sparseArray.size(); i++) {
                ArrayList arrayList = ((wxa) sparseArray.get(sparseArray.keyAt(i))).a;
                for (int i2 = 0; i2 < arrayList.size(); i2++) {
                    rr7.w(((pr0) arrayList.get(i2)).a);
                }
            }
        }
    }

    public final void g() {
        ArrayList arrayList = this.c;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            h(size);
        }
        arrayList.clear();
        if (RecyclerView.U0) {
            ym0 ym0Var = this.h.t0;
            int[] iArr = (int[]) ym0Var.e;
            if (iArr != null) {
                Arrays.fill(iArr, -1);
            }
            ym0Var.d = 0;
        }
    }

    public final void h(int i) {
        if (RecyclerView.Q0) {
            Log.d("RecyclerView", "Recycling cached view at index " + i);
        }
        ArrayList arrayList = this.c;
        pr0 pr0Var = (pr0) arrayList.get(i);
        if (RecyclerView.Q0) {
            Log.d("RecyclerView", "CachedViewHolder to be recycled: " + pr0Var);
        }
        a(pr0Var, true);
        arrayList.remove(i);
    }

    public final void i(View view) {
        pr0 pr0VarK = RecyclerView.K(view);
        boolean zI = pr0VarK.i();
        RecyclerView recyclerView = this.h;
        if (zI) {
            recyclerView.removeDetachedView(view, false);
        }
        if (pr0VarK.h()) {
            pr0VarK.m.m(pr0VarK);
        } else if (pr0VarK.o()) {
            pr0VarK.i &= -33;
        }
        j(pr0VarK);
        if (recyclerView.L == null || pr0VarK.f()) {
            return;
        }
        recyclerView.L.d(pr0VarK);
    }

    public final void k(View view) {
        pxa pxaVar;
        pr0 pr0VarK = RecyclerView.K(view);
        int i = pr0VarK.i & 12;
        RecyclerView recyclerView = this.h;
        if (i == 0 && pr0VarK.j() && (pxaVar = recyclerView.L) != null) {
            c03 c03Var = (c03) pxaVar;
            if (pr0VarK.c().isEmpty() && c03Var.g && !pr0VarK.e()) {
                ArrayList arrayList = this.b;
                if (arrayList == null) {
                    arrayList = new ArrayList();
                    this.b = arrayList;
                }
                pr0VarK.m = this;
                pr0VarK.n = true;
                arrayList.add(pr0VarK);
                return;
            }
        }
        if (pr0VarK.e() && !pr0VarK.g()) {
            recyclerView.m.getClass();
            ay0.e("Called scrap view with an invalid view. Invalid views cannot be reused from scrap, they should rebound from recycler pool.".concat(recyclerView.A()));
        } else {
            pr0VarK.m = this;
            pr0VarK.n = false;
            this.a.add(pr0VarK);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:111:0x01c9  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x021d  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x02a3  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x0368  */
    /* JADX WARN: Removed duplicated region for block: B:195:0x037c  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x03a7  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x03c2  */
    /* JADX WARN: Removed duplicated region for block: B:221:0x03f3  */
    /* JADX WARN: Removed duplicated region for block: B:227:0x040a  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x0417  */
    /* JADX WARN: Removed duplicated region for block: B:231:0x0421  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x0423  */
    /* JADX WARN: Removed duplicated region for block: B:234:0x0426  */
    /* JADX WARN: Removed duplicated region for block: B:238:0x0450  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x0459  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:258:0x04d4  */
    /* JADX WARN: Removed duplicated region for block: B:261:0x04e4  */
    /* JADX WARN: Removed duplicated region for block: B:269:0x0503  */
    /* JADX WARN: Removed duplicated region for block: B:273:0x051a  */
    /* JADX WARN: Removed duplicated region for block: B:276:0x0527  */
    /* JADX WARN: Removed duplicated region for block: B:297:0x0565  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:300:0x056a  */
    /* JADX WARN: Removed duplicated region for block: B:304:0x0573  */
    /* JADX WARN: Removed duplicated region for block: B:305:0x057d  */
    /* JADX WARN: Removed duplicated region for block: B:311:0x0593 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:313:0x0597  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.pr0 l(int r28, long r29) {
        /*
            Method dump skipped, instruction units count: 1470
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yxa.l(int, long):pr0");
    }

    public final void m(pr0 pr0Var) {
        if (pr0Var.n) {
            this.b.remove(pr0Var);
        } else {
            this.a.remove(pr0Var);
        }
        pr0Var.m = null;
        pr0Var.n = false;
        pr0Var.i &= -33;
    }

    public final void n() {
        sxa sxaVar = this.h.n;
        this.f = this.e + (sxaVar != null ? sxaVar.j : 0);
        ArrayList arrayList = this.c;
        for (int size = arrayList.size() - 1; size >= 0 && arrayList.size() > this.f; size--) {
            h(size);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:65:0x00dc, code lost:
    
        r6 = r6 - 1;
     */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00bf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void j(defpackage.pr0 r13) {
        /*
            Method dump skipped, instruction units count: 340
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yxa.j(pr0):void");
    }
}
