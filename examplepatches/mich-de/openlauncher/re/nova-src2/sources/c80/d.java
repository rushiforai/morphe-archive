package c80;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import t70.m;
import t70.m0;

/* loaded from: classes.dex */
public final class d extends i implements a {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f19835h = AtomicReferenceFieldUpdater.newUpdater(d.class, Object.class, "owner$volatile");
    private volatile /* synthetic */ Object owner$volatile;

    public d() {
        super(1);
        this.owner$volatile = e.f19836a;
    }

    public final boolean d() {
        return Math.max(i.f19843g.get(this), 0) == 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0022, code lost:
    
        r0.o(kotlin.Unit.f71706a, r3.f19845b);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(Continuation continuation) {
        if (f()) {
            return Unit.f71706a;
        }
        m mVarO = m0.o(IntrinsicsKt.b(continuation));
        try {
            c cVar = new c(this, mVarO);
            while (true) {
                int andDecrement = i.f19843g.getAndDecrement(this);
                if (andDecrement <= this.f19844a) {
                    if (andDecrement > 0) {
                        break;
                    }
                    if (b(cVar)) {
                        break;
                    }
                }
            }
            Object objS = mVarO.s();
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (objS != coroutineSingletons) {
                objS = Unit.f71706a;
            }
            return objS == coroutineSingletons ? objS : Unit.f71706a;
        } catch (Throwable th2) {
            mVarO.B();
            throw th2;
        }
    }

    public final boolean f() {
        int i5;
        while (true) {
            AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = i.f19843g;
            int i11 = atomicIntegerFieldUpdater.get(this);
            int i12 = this.f19844a;
            if (i11 > i12) {
                do {
                    i5 = atomicIntegerFieldUpdater.get(this);
                    if (i5 > i12) {
                    }
                } while (!atomicIntegerFieldUpdater.compareAndSet(this, i5, i12));
            } else {
                if (i11 <= 0) {
                    return false;
                }
                if (atomicIntegerFieldUpdater.compareAndSet(this, i11, i11 - 1)) {
                    f19835h.set(this, null);
                    return true;
                }
            }
        }
    }

    public final void g(Object obj) {
        while (d()) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f19835h;
            Object obj2 = atomicReferenceFieldUpdater.get(this);
            w50.g gVar = e.f19836a;
            if (obj2 != gVar) {
                if (obj2 == obj || obj == null) {
                    while (!atomicReferenceFieldUpdater.compareAndSet(this, obj2, gVar)) {
                        if (atomicReferenceFieldUpdater.get(this) != obj2) {
                            break;
                        }
                    }
                    c();
                    return;
                }
                throw new IllegalStateException(("This mutex is locked by " + obj2 + ", but " + obj + " is expected").toString());
            }
        }
        throw new IllegalStateException("This mutex is not locked");
    }

    public final String toString() {
        return "Mutex@" + m0.m(this) + "[isLocked=" + d() + ",owner=" + f19835h.get(this) + AbstractJsonLexerKt.END_LIST;
    }
}
