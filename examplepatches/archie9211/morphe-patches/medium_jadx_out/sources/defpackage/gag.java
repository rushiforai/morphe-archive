package defpackage;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gag extends mk7 {
    public final AtomicReferenceFieldUpdater c;
    public final AtomicReferenceFieldUpdater d;
    public final AtomicReferenceFieldUpdater e;
    public final AtomicReferenceFieldUpdater f;
    public final AtomicReferenceFieldUpdater g;

    public gag(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater3, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater4, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater5) {
        this.c = atomicReferenceFieldUpdater;
        this.d = atomicReferenceFieldUpdater2;
        this.e = atomicReferenceFieldUpdater3;
        this.f = atomicReferenceFieldUpdater4;
        this.g = atomicReferenceFieldUpdater5;
    }

    @Override // defpackage.mk7
    public final void K(meg megVar, meg megVar2) {
        this.d.lazySet(megVar, megVar2);
    }

    @Override // defpackage.mk7
    public final void L(meg megVar, Thread thread) {
        this.c.lazySet(megVar, thread);
    }

    @Override // defpackage.mk7
    public final boolean N(ggg gggVar, k6g k6gVar, k6g k6gVar2) {
        return fp7.t(this.f, gggVar, k6gVar, k6gVar2);
    }

    @Override // defpackage.mk7
    public final boolean O(ggg gggVar, Object obj, Object obj2) {
        return fp7.t(this.g, gggVar, obj, obj2);
    }

    @Override // defpackage.mk7
    public final boolean P(ggg gggVar, meg megVar, meg megVar2) {
        return fp7.t(this.e, gggVar, megVar, megVar2);
    }
}
