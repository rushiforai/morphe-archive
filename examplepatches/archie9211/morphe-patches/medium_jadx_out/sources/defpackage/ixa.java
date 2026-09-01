package defpackage;

import android.view.View;
import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ixa {
    public final /* synthetic */ RecyclerView a;

    public /* synthetic */ ixa(RecyclerView recyclerView) {
        this.a = recyclerView;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void a(defpackage.pr0 r8, defpackage.yqa r9, defpackage.yqa r10) {
        /*
            r7 = this;
            r0 = 0
            r8.m(r0)
            androidx.recyclerview.widget.RecyclerView r7 = r7.a
            pxa r0 = r7.L
            r1 = r0
            c03 r1 = (defpackage.c03) r1
            if (r9 == 0) goto L1d
            r1.getClass()
            int r3 = r9.b
            int r5 = r10.b
            if (r3 != r5) goto L1f
            int r0 = r9.c
            int r2 = r10.c
            if (r0 == r2) goto L1d
            goto L1f
        L1d:
            r2 = r8
            goto L29
        L1f:
            int r4 = r9.c
            int r6 = r10.c
            r2 = r8
            boolean r8 = r1.g(r2, r3, r4, r5, r6)
            goto L38
        L29:
            r1.l(r2)
            android.view.View r8 = r2.a
            r9 = 0
            r8.setAlpha(r9)
            java.util.ArrayList r8 = r1.i
            r8.add(r2)
            r8 = 1
        L38:
            if (r8 == 0) goto L3d
            r7.U()
        L3d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ixa.a(pr0, yqa, yqa):void");
    }

    public void b(pr0 pr0Var, yqa yqaVar, yqa yqaVar2) {
        boolean zG;
        RecyclerView recyclerView = this.a;
        recyclerView.c.m(pr0Var);
        recyclerView.g(pr0Var);
        pr0Var.m(false);
        c03 c03Var = (c03) recyclerView.L;
        c03Var.getClass();
        int i = yqaVar.b;
        int i2 = yqaVar.c;
        View view = pr0Var.a;
        int left = yqaVar2 == null ? view.getLeft() : yqaVar2.b;
        int top = yqaVar2 == null ? view.getTop() : yqaVar2.c;
        if (pr0Var.g() || (i == left && i2 == top)) {
            c03Var.l(pr0Var);
            c03Var.h.add(pr0Var);
            zG = true;
        } else {
            view.layout(left, top, view.getWidth() + left, view.getHeight() + top);
            zG = c03Var.g(pr0Var, i, i2, left, top);
        }
        if (zG) {
            recyclerView.U();
        }
    }

    public void c(int i) {
        RecyclerView recyclerView = this.a;
        View childAt = recyclerView.getChildAt(i);
        if (childAt != null) {
            recyclerView.p(childAt);
            childAt.clearAnimation();
        }
        recyclerView.removeViewAt(i);
    }
}
