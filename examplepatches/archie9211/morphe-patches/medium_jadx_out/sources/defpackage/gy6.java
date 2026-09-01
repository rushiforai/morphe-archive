package defpackage;

import android.util.SparseIntArray;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gy6 extends kxa {
    public final ArrayList c = new ArrayList();
    public nr0 d;
    public final rz2 e;
    public final u80 f;
    public final w25 g;
    public boolean h;
    public final ey6 i;

    public gy6(w25 w25Var) {
        rz2 rz2Var = new rz2(18, this);
        this.e = rz2Var;
        this.f = new u80(rz2Var);
        new SparseIntArray();
        new SparseIntArray();
        this.g = w25Var;
        this.i = new ey6(this);
    }

    @Override // defpackage.kxa
    public final pr0 a(ViewGroup viewGroup, int i) {
        nr0 nr0Var;
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(viewGroup.getContext());
        nr0 nr0Var2 = this.d;
        if (nr0Var2 == null || nr0Var2.e() != i) {
            int i2 = 0;
            while (true) {
                ArrayList arrayList = this.c;
                if (i2 >= op8.Y(arrayList)) {
                    ygf.f(b09.w(i, "Could not find model for view type: "));
                    return null;
                }
                nr0 nr0VarX = op8.X(i2, arrayList);
                if (nr0VarX.e() == i) {
                    nr0Var = nr0VarX;
                    break;
                }
                i2++;
            }
        } else {
            nr0Var = this.d;
        }
        pr0 pr0VarC = nr0Var.c(layoutInflaterFrom.inflate(nr0Var.d(), viewGroup, false));
        pr0VarC.getClass();
        ly6 ly6Var = pr0VarC.v;
        ly6Var.getClass();
        w25 w25Var = this.g;
        w25Var.getClass();
        boolean zAdd = ly6Var.k.add(w25Var);
        if (ly6Var.m && zAdd) {
            ly6Var.i();
            w25Var.b();
            w25Var.e.a(ly6Var.l);
        }
        return pr0VarC;
    }

    public final nr0 b(int i) {
        int i2 = 0;
        for (nr0 nr0Var : this.c) {
            nr0Var.getClass();
            if (i - i2 < 1) {
                return nr0Var;
            }
            i2++;
        }
        z10.i(ev6.s(i, i2, "Requested position ", " in group adapter but there are only ", " items"));
        return null;
    }

    public final void c(Collection collection) {
        ArrayList arrayList = this.c;
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((nr0) it2.next()).getClass();
        }
        arrayList.clear();
        arrayList.addAll(collection);
        Iterator it3 = collection.iterator();
        while (it3.hasNext()) {
            ((nr0) it3.next()).getClass();
        }
    }
}
