package cl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public final class e0 extends y {

    /* renamed from: p, reason: collision with root package name */
    public List f19996p;

    public e0(xk.v0 v0Var) {
        List arrayList;
        super(v0Var, true, true);
        if (v0Var.isEmpty()) {
            arrayList = Collections.EMPTY_LIST;
        } else {
            int size = v0Var.size();
            w20.e.e(size, "initialArraySize");
            arrayList = new ArrayList(size);
        }
        for (int i5 = 0; i5 < v0Var.size(); i5++) {
            arrayList.add(null);
        }
        this.f19996p = arrayList;
        w();
    }

    @Override // cl.y
    public final void r(int i5, Object obj) {
        List list = this.f19996p;
        if (list != null) {
            list.set(i5, new f0(obj));
        }
    }

    @Override // cl.y
    public final void u() {
        List<f0> list = this.f19996p;
        if (list != null) {
            int size = list.size();
            w20.e.e(size, "initialArraySize");
            ArrayList arrayList = new ArrayList(size);
            for (f0 f0Var : list) {
                arrayList.add(f0Var != null ? f0Var.f19999a : null);
            }
            n(Collections.unmodifiableList(arrayList));
        }
    }

    @Override // cl.y
    public final void x(int i5) {
        b.c0.a(i5);
        this.f20088l = null;
        this.f19996p = null;
    }
}
