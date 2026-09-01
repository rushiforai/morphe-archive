package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tt8 extends x70 {
    public final oy a;
    public final int b;

    public tt8(int i, oy oyVar) {
        this.a = oyVar;
        this.b = i;
    }

    @Override // defpackage.x70
    public final int d() {
        return 1;
    }

    @Override // defpackage.x70
    public final void f(int i, oy oyVar) {
        throw new IllegalStateException();
    }

    @Override // defpackage.x70
    public final Object get(int i) {
        if (i == this.b) {
            return this.a;
        }
        return null;
    }

    @Override // defpackage.x70, java.lang.Iterable
    public final Iterator iterator() {
        return new tzb(2, this);
    }
}
