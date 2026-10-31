package wf;

import android.util.SparseBooleanArray;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final SparseBooleanArray f94322a;

    public d(SparseBooleanArray sparseBooleanArray) {
        this.f94322a = sparseBooleanArray;
    }

    public final int a(int i5) {
        SparseBooleanArray sparseBooleanArray = this.f94322a;
        a.h(i5, sparseBooleanArray.size());
        return sparseBooleanArray.keyAt(i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        SparseBooleanArray sparseBooleanArray = dVar.f94322a;
        int i5 = v.f94376a;
        SparseBooleanArray sparseBooleanArray2 = this.f94322a;
        if (i5 >= 24) {
            return sparseBooleanArray2.equals(sparseBooleanArray);
        }
        if (sparseBooleanArray2.size() != sparseBooleanArray.size()) {
            return false;
        }
        for (int i11 = 0; i11 < sparseBooleanArray2.size(); i11++) {
            if (a(i11) != dVar.a(i11)) {
                return false;
            }
        }
        return true;
    }

    public final int hashCode() {
        int i5 = v.f94376a;
        SparseBooleanArray sparseBooleanArray = this.f94322a;
        if (i5 >= 24) {
            return sparseBooleanArray.hashCode();
        }
        int size = sparseBooleanArray.size();
        for (int i11 = 0; i11 < sparseBooleanArray.size(); i11++) {
            size = (size * 31) + a(i11);
        }
        return size;
    }
}
