package defpackage;

import android.util.SparseArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xz7 {
    public final SparseArray a;
    public byd b;

    public xz7(int i) {
        this.a = new SparseArray(i);
    }

    public final void a(byd bydVar, int i, int i2) {
        int iA = bydVar.a(i);
        SparseArray sparseArray = this.a;
        xz7 xz7Var = (xz7) sparseArray.get(iA);
        if (xz7Var == null) {
            xz7Var = new xz7(1);
            sparseArray.put(bydVar.a(i), xz7Var);
        }
        if (i2 > i) {
            xz7Var.a(bydVar, i + 1, i2);
        } else {
            xz7Var.b = bydVar;
        }
    }
}
