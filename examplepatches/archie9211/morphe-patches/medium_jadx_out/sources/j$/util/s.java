package j$.util;

import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class s extends m implements RandomAccess {
    private static final long serialVersionUID = -2542308836966382001L;

    private Object writeReplace() {
        return new m(this.b);
    }

    @Override // j$.util.m, java.util.List
    public final java.util.List subList(int i, int i2) {
        return new s(this.b.subList(i, i2));
    }
}
