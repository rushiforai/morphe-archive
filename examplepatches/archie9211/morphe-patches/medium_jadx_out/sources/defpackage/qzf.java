package defpackage;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qzf extends ur7 {
    public static final AtomicReferenceFieldUpdater i = AtomicReferenceFieldUpdater.newUpdater(tzf.class, Thread.class, "a");
    public static final AtomicReferenceFieldUpdater j = AtomicReferenceFieldUpdater.newUpdater(tzf.class, tzf.class, "b");
    public static final AtomicReferenceFieldUpdater k = AtomicReferenceFieldUpdater.newUpdater(vzf.class, tzf.class, "c");
    public static final AtomicReferenceFieldUpdater l = AtomicReferenceFieldUpdater.newUpdater(vzf.class, nzf.class, "b");
    public static final AtomicReferenceFieldUpdater m = AtomicReferenceFieldUpdater.newUpdater(vzf.class, Object.class, "a");

    @Override // defpackage.ur7
    public final nzf G(h1g h1gVar) {
        return (nzf) l.getAndSet(h1gVar, nzf.d);
    }

    @Override // defpackage.ur7
    public final tzf K(h1g h1gVar) {
        return (tzf) k.getAndSet(h1gVar, tzf.c);
    }

    @Override // defpackage.ur7
    public final void L(tzf tzfVar, tzf tzfVar2) {
        j.lazySet(tzfVar, tzfVar2);
    }

    @Override // defpackage.ur7
    public final void M(tzf tzfVar, Thread thread) {
        i.lazySet(tzfVar, thread);
    }

    @Override // defpackage.ur7
    public final boolean N(h1g h1gVar, nzf nzfVar, nzf nzfVar2) {
        return ek7.Q(l, h1gVar, nzfVar, nzfVar2);
    }

    @Override // defpackage.ur7
    public final boolean O(vzf vzfVar, Object obj, Object obj2) {
        return ek7.Q(m, vzfVar, obj, obj2);
    }

    @Override // defpackage.ur7
    public final boolean P(vzf vzfVar, tzf tzfVar, tzf tzfVar2) {
        return ek7.Q(k, vzfVar, tzfVar, tzfVar2);
    }
}
