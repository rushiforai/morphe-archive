package defpackage;

import java.util.concurrent.atomic.AtomicReferenceArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qyb extends jwb {
    public final /* synthetic */ AtomicReferenceArray g;

    public qyb(long j, qyb qybVar, int i) {
        super(j, qybVar, i);
        this.g = new AtomicReferenceArray(pyb.f);
    }

    @Override // defpackage.jwb
    public final int g() {
        return pyb.f;
    }

    @Override // defpackage.jwb
    public final void h(int i, ib2 ib2Var) {
        this.g.set(i, pyb.e);
        i();
    }

    public final String toString() {
        return "SemaphoreSegment[id=" + this.d + ", hashCode=" + hashCode() + ']';
    }
}
