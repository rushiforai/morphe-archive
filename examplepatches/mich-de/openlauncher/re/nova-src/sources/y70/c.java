package y70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f96788a = AtomicReferenceFieldUpdater.newUpdater(c.class, Object.class, "_next$volatile");

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f96789b = AtomicReferenceFieldUpdater.newUpdater(c.class, Object.class, "_prev$volatile");
    private volatile /* synthetic */ Object _next$volatile;
    private volatile /* synthetic */ Object _prev$volatile;

    public c(t tVar) {
        this._prev$volatile = tVar;
    }

    public final void b() {
        f96789b.set(this, null);
    }

    public final c c() {
        Object obj = f96788a.get(this);
        if (obj == b.f96787a) {
            return null;
        }
        return (c) obj;
    }

    public abstract boolean d();

    public final void e() {
        Object obj;
        c cVarC;
        if (c() == null) {
            return;
        }
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f96789b;
            c cVar = (c) atomicReferenceFieldUpdater.get(this);
            while (cVar != null && cVar.d()) {
                cVar = (c) atomicReferenceFieldUpdater.get(cVar);
            }
            c cVarC2 = c();
            Intrinsics.d(cVarC2);
            while (cVarC2.d() && (cVarC = cVarC2.c()) != null) {
                cVarC2 = cVarC;
            }
            do {
                obj = atomicReferenceFieldUpdater.get(cVarC2);
            } while (!x8.h.h(atomicReferenceFieldUpdater, cVarC2, obj, ((c) obj) == null ? null : cVar));
            if (cVar != null) {
                f96788a.set(cVar, cVarC2);
            }
            if (!cVarC2.d() || cVarC2.c() == null) {
                if (cVar == null || !cVar.d()) {
                    return;
                }
            }
        }
    }
}
