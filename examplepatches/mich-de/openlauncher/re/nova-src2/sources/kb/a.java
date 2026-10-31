package kb;

import android.view.ViewGroup;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import java.util.ArrayList;
import java.util.List;
import lb.b;
import mx.k1;
import mx.l;

/* loaded from: classes2.dex */
public abstract class a extends m1 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f71311a;

    /* renamed from: b, reason: collision with root package name */
    public final List f71312b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f71313c;

    public a(List list) {
        this.f71312b = list;
        ArrayList arrayList = new ArrayList();
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            lb.a aVar = (lb.a) list.get(i5);
            b bVar = new b();
            bVar.f74822b = aVar;
            bVar.f74821a = false;
            arrayList.add(bVar);
            aVar.getClass();
        }
        this.f71311a = arrayList;
        this.f71313c = new ArrayList();
    }

    public final Object b(int i5) {
        if (i5 < 0) {
            return null;
        }
        ArrayList arrayList = this.f71311a;
        if (i5 < arrayList.size()) {
            return arrayList.get(i5);
        }
        return null;
    }

    public abstract void c(l lVar, Object obj);

    public abstract void d(k1 k1Var, lb.a aVar);

    public abstract l e(ViewGroup viewGroup);

    public abstract k1 f(ViewGroup viewGroup);

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        return this.f71311a.size();
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemViewType(int i5) {
        Object objB = b(i5);
        if (objB instanceof b) {
            return 0;
        }
        if (objB != null) {
            return 1;
        }
        throw new IllegalStateException("Null object added");
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.f71313c.add(recyclerView);
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        Object objB = b(i5);
        if (!(objB instanceof b)) {
            if (objB == null) {
                throw new IllegalStateException("Incorrect ViewHolder found");
            }
            c((l) s2Var, objB);
        } else {
            k1 k1Var = (k1) s2Var;
            k1Var.getClass();
            k1Var.itemView.setOnClickListener(k1Var);
            b bVar = (b) objB;
            k1Var.a(bVar.f74821a);
            d(k1Var, bVar.f74822b);
        }
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        if (i5 == 0) {
            k1 k1VarF = f(viewGroup);
            k1VarF.f77194b = this;
            return k1VarF;
        }
        if (i5 == 1) {
            return e(viewGroup);
        }
        throw new IllegalStateException("Incorrect ViewType found");
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.f71313c.remove(recyclerView);
    }
}
