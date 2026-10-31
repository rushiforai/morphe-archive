package t70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class t1 extends y70.k implements a1, n1 {

    /* renamed from: d, reason: collision with root package name */
    public x1 f88860d;

    @Override // t70.n1
    public final boolean b() {
        return true;
    }

    @Override // t70.n1
    public final b2 c() {
        return null;
    }

    @Override // t70.a1
    public final void dispose() {
        x1 x1VarI = i();
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = x1.f88882a;
            Object obj = atomicReferenceFieldUpdater.get(x1VarI);
            if (obj instanceof t1) {
                if (obj != this) {
                    return;
                }
                c1 c1Var = m0.f88834j;
                while (!atomicReferenceFieldUpdater.compareAndSet(x1VarI, obj, c1Var)) {
                    if (atomicReferenceFieldUpdater.get(x1VarI) != obj) {
                        break;
                    }
                }
                return;
            }
            if (!(obj instanceof n1) || ((n1) obj).c() == null) {
                return;
            }
            while (true) {
                AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = y70.k.f96807a;
                Object obj2 = atomicReferenceFieldUpdater2.get(this);
                if (obj2 instanceof y70.q) {
                    return;
                }
                if (obj2 == this) {
                    return;
                }
                Intrinsics.e(obj2, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode");
                y70.k kVar = (y70.k) obj2;
                AtomicReferenceFieldUpdater atomicReferenceFieldUpdater3 = y70.k.f96809c;
                y70.q qVar = (y70.q) atomicReferenceFieldUpdater3.get(kVar);
                if (qVar == null) {
                    qVar = new y70.q(kVar);
                    atomicReferenceFieldUpdater3.set(kVar, qVar);
                }
                while (!atomicReferenceFieldUpdater2.compareAndSet(this, obj2, qVar)) {
                    if (atomicReferenceFieldUpdater2.get(this) != obj2) {
                        break;
                    }
                }
                kVar.e();
                return;
            }
        }
    }

    public r1 getParent() {
        return i();
    }

    public final x1 i() {
        x1 x1Var = this.f88860d;
        if (x1Var != null) {
            return x1Var;
        }
        Intrinsics.m("job");
        throw null;
    }

    public abstract boolean j();

    public abstract void k(Throwable th2);

    @Override // y70.k
    public final String toString() {
        return getClass().getSimpleName() + '@' + m0.m(this) + "[job@" + m0.m(i()) + AbstractJsonLexerKt.END_LIST;
    }
}
