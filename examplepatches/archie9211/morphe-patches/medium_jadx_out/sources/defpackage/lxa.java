package defpackage;

import android.database.Observable;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lxa extends Observable {
    public final void a() {
        for (int size = ((Observable) this).mObservers.size() - 1; size >= 0; size--) {
            RecyclerView recyclerView = ((aya) ((Observable) this).mObservers.get(size)).a;
            recyclerView.i(null);
            recyclerView.u0.f = true;
            recyclerView.W(true);
            if (!recyclerView.e.j()) {
                recyclerView.requestLayout();
            }
        }
    }

    public final void b(int i, int i2) {
        for (int size = ((Observable) this).mObservers.size() - 1; size >= 0; size--) {
            aya ayaVar = (aya) ((Observable) this).mObservers.get(size);
            RecyclerView recyclerView = ayaVar.a;
            recyclerView.i(null);
            e8 e8Var = recyclerView.e;
            ArrayList arrayList = (ArrayList) e8Var.c;
            if (i != i2) {
                arrayList.add(e8Var.l(null, 8, i, i2));
                e8Var.a |= 8;
                if (arrayList.size() == 1) {
                    ayaVar.a();
                }
            }
        }
    }

    public final void c(int i, int i2) {
        for (int size = ((Observable) this).mObservers.size() - 1; size >= 0; size--) {
            aya ayaVar = (aya) ((Observable) this).mObservers.get(size);
            RecyclerView recyclerView = ayaVar.a;
            recyclerView.i(null);
            e8 e8Var = recyclerView.e;
            ArrayList arrayList = (ArrayList) e8Var.c;
            if (i2 >= 1) {
                arrayList.add(e8Var.l(null, 4, i, i2));
                e8Var.a |= 4;
                if (arrayList.size() == 1) {
                    ayaVar.a();
                }
            }
        }
    }

    public final void d(int i, int i2) {
        for (int size = ((Observable) this).mObservers.size() - 1; size >= 0; size--) {
            aya ayaVar = (aya) ((Observable) this).mObservers.get(size);
            RecyclerView recyclerView = ayaVar.a;
            recyclerView.i(null);
            e8 e8Var = recyclerView.e;
            ArrayList arrayList = (ArrayList) e8Var.c;
            if (i2 >= 1) {
                arrayList.add(e8Var.l(null, 1, i, i2));
                e8Var.a |= 1;
                if (arrayList.size() == 1) {
                    ayaVar.a();
                }
            }
        }
    }

    public final void e(int i, int i2) {
        for (int size = ((Observable) this).mObservers.size() - 1; size >= 0; size--) {
            aya ayaVar = (aya) ((Observable) this).mObservers.get(size);
            RecyclerView recyclerView = ayaVar.a;
            recyclerView.i(null);
            e8 e8Var = recyclerView.e;
            ArrayList arrayList = (ArrayList) e8Var.c;
            if (i2 >= 1) {
                arrayList.add(e8Var.l(null, 2, i, i2));
                e8Var.a |= 2;
                if (arrayList.size() == 1) {
                    ayaVar.a();
                }
            }
        }
    }
}
