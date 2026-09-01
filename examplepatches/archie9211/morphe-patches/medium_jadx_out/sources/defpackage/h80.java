package defpackage;

import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h80 extends k1 implements RandomAccess {
    public final /* synthetic */ int[] a;

    public h80(int[] iArr) {
        this.a = iArr;
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        if (obj instanceof Integer) {
            return k80.c0(((Number) obj).intValue(), this.a);
        }
        return false;
    }

    @Override // java.util.List
    public final Object get(int i) {
        return Integer.valueOf(this.a[i]);
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.a.length;
    }

    @Override // defpackage.k1, java.util.List
    public final int indexOf(Object obj) {
        if (obj instanceof Integer) {
            return k80.z0(((Number) obj).intValue(), this.a);
        }
        return -1;
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return this.a.length == 0;
    }

    @Override // defpackage.k1, java.util.List
    public final int lastIndexOf(Object obj) {
        if (obj instanceof Integer) {
            int iIntValue = ((Number) obj).intValue();
            int[] iArr = this.a;
            int length = iArr.length - 1;
            if (length >= 0) {
                while (true) {
                    int i = length - 1;
                    if (iIntValue == iArr[length]) {
                        return length;
                    }
                    if (i < 0) {
                        break;
                    }
                    length = i;
                }
            }
        }
        return -1;
    }
}
