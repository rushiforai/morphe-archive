package androidx.recyclerview.widget;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes2.dex */
public abstract class b1 extends m1 {
    final f mDiffer;
    private final d mListener;

    public b1(t tVar) {
        a1 a1Var = new a1(this);
        this.mListener = a1Var;
        a5.d dVar = new a5.d(this, 12);
        synchronized (c.f14916a) {
            try {
                if (c.f14917b == null) {
                    c.f14917b = Executors.newFixedThreadPool(2);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        ExecutorService executorService = c.f14917b;
        b3 b3Var = new b3();
        b3Var.f14914a = executorService;
        b3Var.f14915b = tVar;
        f fVar = new f(dVar, b3Var);
        this.mDiffer = fVar;
        fVar.f14946d.add(a1Var);
    }

    public List<Object> getCurrentList() {
        return this.mDiffer.f14948f;
    }

    public Object getItem(int i5) {
        return this.mDiffer.f14948f.get(i5);
    }

    @Override // androidx.recyclerview.widget.m1
    public int getItemCount() {
        return this.mDiffer.f14948f.size();
    }

    public void onCurrentListChanged(List<Object> list, List<Object> list2) {
    }

    public void submitList(List<Object> list) {
        this.mDiffer.b(list, null);
    }

    public void submitList(List<Object> list, Runnable runnable) {
        this.mDiffer.b(list, runnable);
    }
}
