package fe;

import android.util.SparseBooleanArray;

/* loaded from: classes3.dex */
public final class h1 implements e {

    /* renamed from: a, reason: collision with root package name */
    public final wf.d f54833a;

    static {
        SparseBooleanArray sparseBooleanArray = new SparseBooleanArray();
        wf.a.i(!false);
        new wf.d(sparseBooleanArray);
    }

    public h1(wf.d dVar) {
        this.f54833a = dVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof h1) {
            return this.f54833a.equals(((h1) obj).f54833a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f54833a.hashCode();
    }
}
