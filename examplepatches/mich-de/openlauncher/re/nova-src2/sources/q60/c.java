package q60;

import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import ba0.j;
import ba0.o;
import ba0.r;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes4.dex */
public final class c extends m1 {

    /* renamed from: a, reason: collision with root package name */
    public final SparseArray f83752a;

    /* renamed from: b, reason: collision with root package name */
    public final a f83753b;

    /* renamed from: c, reason: collision with root package name */
    public final b50.d f83754c;

    /* renamed from: d, reason: collision with root package name */
    public LayoutInflater f83755d;

    /* renamed from: e, reason: collision with root package name */
    public h60.b f83756e;

    /* renamed from: f, reason: collision with root package name */
    public List f83757f;

    public c(SparseArray sparseArray, e eVar, b50.d dVar) {
        this.f83752a = sparseArray;
        this.f83753b = eVar;
        this.f83754c = dVar;
        setHasStableIds(true);
    }

    public final a b(int i5) {
        return i5 == 0 ? this.f83753b : (a) this.f83752a.get(i5);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v2, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r6v3, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r6v4, types: [java.util.List] */
    public final void c(h60.b bVar, String str) {
        ?? arrayList;
        j jVarA = bVar.a(str);
        this.f83754c.getClass();
        r rVar = jVarA.f17782b;
        if (rVar == null) {
            arrayList = Collections.singletonList(jVarA);
        } else {
            arrayList = new ArrayList();
            while (rVar != null) {
                if (!(rVar instanceof o)) {
                    arrayList.add(rVar);
                }
                r rVar2 = rVar.f17785e;
                rVar.f();
                rVar = rVar2;
            }
        }
        this.f83753b.b();
        SparseArray sparseArray = this.f83752a;
        int size = sparseArray.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((a) sparseArray.valueAt(i5)).b();
        }
        this.f83756e = bVar;
        this.f83757f = arrayList;
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        List list = this.f83757f;
        if (list != null) {
            return list.size();
        }
        return 0;
    }

    @Override // androidx.recyclerview.widget.m1
    public final long getItemId(int i5) {
        int iHashCode = ((r) this.f83757f.get(i5)).getClass().hashCode();
        if (this.f83752a.indexOfKey(iHashCode) <= -1) {
            iHashCode = 0;
        }
        b(iHashCode).getClass();
        return r4.hashCode();
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemViewType(int i5) {
        int iHashCode = ((r) this.f83757f.get(i5)).getClass().hashCode();
        if (this.f83752a.indexOfKey(iHashCode) > -1) {
            return iHashCode;
        }
        return 0;
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        b bVar = (b) s2Var;
        r rVar = (r) this.f83757f.get(i5);
        int iHashCode = rVar.getClass().hashCode();
        if (this.f83752a.indexOfKey(iHashCode) <= -1) {
            iHashCode = 0;
        }
        b(iHashCode).a(this.f83756e, bVar, rVar);
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        if (this.f83755d == null) {
            this.f83755d = LayoutInflater.from(viewGroup.getContext());
        }
        return b(i5).c(this.f83755d, viewGroup);
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onViewRecycled(s2 s2Var) {
        b bVar = (b) s2Var;
        super.onViewRecycled(bVar);
        b(bVar.getItemViewType()).getClass();
    }
}
