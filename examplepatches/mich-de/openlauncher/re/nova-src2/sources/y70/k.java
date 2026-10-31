package y70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.jvm.internal.Intrinsics;
import l1.m4;
import t70.m0;

/* loaded from: classes.dex */
public class k {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f96807a = AtomicReferenceFieldUpdater.newUpdater(k.class, Object.class, "_next$volatile");

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f96808b = AtomicReferenceFieldUpdater.newUpdater(k.class, Object.class, "_prev$volatile");

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f96809c = AtomicReferenceFieldUpdater.newUpdater(k.class, Object.class, "_removedRef$volatile");
    private volatile /* synthetic */ Object _next$volatile = this;
    private volatile /* synthetic */ Object _prev$volatile = this;
    private volatile /* synthetic */ Object _removedRef$volatile;

    public final boolean d(k kVar, int i5) {
        while (true) {
            k kVarE = e();
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f96808b;
            if (kVarE == null) {
                Object obj = atomicReferenceFieldUpdater.get(this);
                while (true) {
                    kVarE = (k) obj;
                    if (!kVarE.h()) {
                        break;
                    }
                    obj = atomicReferenceFieldUpdater.get(kVarE);
                }
            }
            if (kVarE instanceof i) {
                return (((i) kVarE).f96806d & i5) == 0 && kVarE.d(kVar, i5);
            }
            atomicReferenceFieldUpdater.set(kVar, kVarE);
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = f96807a;
            atomicReferenceFieldUpdater2.set(kVar, this);
            while (!atomicReferenceFieldUpdater2.compareAndSet(kVarE, this, kVar)) {
                if (atomicReferenceFieldUpdater2.get(kVarE) != this) {
                    break;
                }
            }
            kVar.f(this);
            return true;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x001d, code lost:
    
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0033, code lost:
    
        if (x8.h.i(r5, r4, r3, ((y70.q) r6).f96823a) != false) goto L21;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final k e() {
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f96808b;
            k kVar = (k) atomicReferenceFieldUpdater.get(this);
            k kVar2 = kVar;
            while (true) {
                k kVar3 = null;
                while (true) {
                    AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = f96807a;
                    Object obj = atomicReferenceFieldUpdater2.get(kVar2);
                    if (obj == this) {
                        if (kVar == kVar2 || x8.h.i(atomicReferenceFieldUpdater, this, kVar, kVar2)) {
                            break;
                        }
                    } else {
                        if (h()) {
                            return null;
                        }
                        if (!(obj instanceof q)) {
                            Intrinsics.e(obj, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode");
                            kVar3 = kVar2;
                            kVar2 = (k) obj;
                        } else {
                            if (kVar3 != null) {
                                break;
                            }
                            kVar2 = (k) atomicReferenceFieldUpdater.get(kVar2);
                        }
                    }
                }
                kVar2 = kVar3;
            }
        }
    }

    public final void f(k kVar) {
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f96808b;
            k kVar2 = (k) atomicReferenceFieldUpdater.get(kVar);
            if (f96807a.get(this) != kVar) {
                return;
            }
            while (!atomicReferenceFieldUpdater.compareAndSet(kVar, kVar2, this)) {
                if (atomicReferenceFieldUpdater.get(kVar) != kVar2) {
                    break;
                }
            }
            if (h()) {
                kVar.e();
                return;
            }
            return;
        }
    }

    public final k g() {
        k kVar;
        Object obj = f96807a.get(this);
        q qVar = obj instanceof q ? (q) obj : null;
        if (qVar != null && (kVar = qVar.f96823a) != null) {
            return kVar;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode");
        return (k) obj;
    }

    public boolean h() {
        return f96807a.get(this) instanceof q;
    }

    public String toString() {
        return new m4(this) + '@' + m0.m(this);
    }
}
