package defpackage;

import android.util.SparseArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum dy1 {
    NOT_SET(0),
    EVENT_OVERRIDE(5);

    public static final SparseArray b;
    public final int a;

    static {
        dy1 dy1Var = NOT_SET;
        dy1 dy1Var2 = EVENT_OVERRIDE;
        SparseArray sparseArray = new SparseArray();
        b = sparseArray;
        sparseArray.put(0, dy1Var);
        sparseArray.put(5, dy1Var2);
    }

    dy1(int i) {
        this.a = i;
    }

    public static dy1 forNumber(int i) {
        return (dy1) b.get(i);
    }

    public int getValue() {
        return this.a;
    }
}
