package defpackage;

import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dw8 extends k1 implements RandomAccess {
    public final h21[] a;
    public final int[] b;

    public dw8(h21[] h21VarArr, int[] iArr) {
        this.a = h21VarArr;
        this.b = iArr;
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final /* bridge */ boolean contains(Object obj) {
        if (obj instanceof h21) {
            return super.contains((h21) obj);
        }
        return false;
    }

    @Override // java.util.List
    public final Object get(int i) {
        return this.a[i];
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.a.length;
    }

    @Override // defpackage.k1, java.util.List
    public final /* bridge */ int indexOf(Object obj) {
        if (obj instanceof h21) {
            return super.indexOf((h21) obj);
        }
        return -1;
    }

    @Override // defpackage.k1, java.util.List
    public final /* bridge */ int lastIndexOf(Object obj) {
        if (obj instanceof h21) {
            return super.lastIndexOf((h21) obj);
        }
        return -1;
    }
}
