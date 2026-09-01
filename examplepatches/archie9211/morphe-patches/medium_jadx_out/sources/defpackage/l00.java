package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l00 extends l2 {
    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final /* bridge */ boolean contains(Object obj) {
        if (obj instanceof String) {
            return super.contains((String) obj);
        }
        return false;
    }

    @Override // defpackage.l2, java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        return obj == this;
    }

    @Override // defpackage.t0
    public final int getSize() {
        return 0;
    }

    @Override // defpackage.l2, java.util.Collection, java.util.Set
    public final int hashCode() {
        return 0;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return dy3.a;
    }
}
