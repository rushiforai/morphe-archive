package v70;

import java.util.concurrent.atomic.AtomicReferenceArray;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import t70.t2;

/* loaded from: classes.dex */
public final class s extends y70.t {

    /* renamed from: e, reason: collision with root package name */
    public final i f92195e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ AtomicReferenceArray f92196f;

    public s(long j11, s sVar, i iVar, int i5) {
        super(j11, sVar, i5);
        this.f92195e = iVar;
        this.f92196f = new AtomicReferenceArray(k.f92173b * 2);
    }

    @Override // y70.t
    public final int g() {
        return k.f92173b;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x005a, code lost:
    
        n(r7, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x005d, code lost:
    
        if (r1 == false) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x005f, code lost:
    
        kotlin.jvm.internal.Intrinsics.d(r4);
        r7 = r4.f92169b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0064, code lost:
    
        if (r7 == null) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0066, code lost:
    
        ps.c.j(r7, r0, r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0069, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:?, code lost:
    
        return;
     */
    @Override // y70.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void h(int i5, CoroutineContext coroutineContext) {
        int i11 = k.f92173b;
        boolean z11 = i5 >= i11;
        if (z11) {
            i5 -= i11;
        }
        Object obj = this.f92196f.get(i5 * 2);
        while (true) {
            Object objL = l(i5);
            boolean z12 = objL instanceof t2;
            i iVar = this.f92195e;
            if (z12 || (objL instanceof b0)) {
                if (k(i5, objL, z11 ? k.f92181j : k.f92182k)) {
                    n(i5, null);
                    m(i5, !z11);
                    if (z11) {
                        Intrinsics.d(iVar);
                        Function1 function1 = iVar.f92169b;
                        if (function1 != null) {
                            ps.c.j(function1, obj, coroutineContext);
                            return;
                        }
                        return;
                    }
                    return;
                }
            } else {
                if (objL == k.f92181j || objL == k.f92182k) {
                    break;
                }
                if (objL != k.f92178g && objL != k.f92177f) {
                    if (objL == k.f92180i || objL == k.f92175d || objL == k.f92183l) {
                        return;
                    }
                    throw new IllegalStateException(("unexpected state: " + objL).toString());
                }
            }
        }
    }

    public final boolean k(int i5, Object obj, Object obj2) {
        AtomicReferenceArray atomicReferenceArray;
        int i11 = (i5 * 2) + 1;
        do {
            atomicReferenceArray = this.f92196f;
            if (atomicReferenceArray.compareAndSet(i11, obj, obj2)) {
                return true;
            }
        } while (atomicReferenceArray.get(i11) == obj);
        return false;
    }

    public final Object l(int i5) {
        return this.f92196f.get((i5 * 2) + 1);
    }

    public final void m(int i5, boolean z11) {
        if (z11) {
            i iVar = this.f92195e;
            Intrinsics.d(iVar);
            iVar.M((this.f96826c * k.f92173b) + i5);
        }
        i();
    }

    public final void n(int i5, Object obj) {
        this.f92196f.set(i5 * 2, obj);
    }

    public final void o(int i5, Object obj) {
        this.f92196f.set((i5 * 2) + 1, obj);
    }
}
