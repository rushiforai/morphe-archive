package y70;

import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f96812e = AtomicReferenceFieldUpdater.newUpdater(n.class, Object.class, "_next$volatile");

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f96813f = AtomicLongFieldUpdater.newUpdater(n.class, "_state$volatile");

    /* renamed from: g, reason: collision with root package name */
    public static final w50.g f96814g = new w50.g("REMOVE_FROZEN", 1);
    private volatile /* synthetic */ Object _next$volatile;
    private volatile /* synthetic */ long _state$volatile;

    /* renamed from: a, reason: collision with root package name */
    public final int f96815a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f96816b;

    /* renamed from: c, reason: collision with root package name */
    public final int f96817c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ AtomicReferenceArray f96818d;

    public n(int i5, boolean z11) {
        this.f96815a = i5;
        this.f96816b = z11;
        int i11 = i5 - 1;
        this.f96817c = i11;
        this.f96818d = new AtomicReferenceArray(i5);
        if (i11 > 1073741823) {
            throw new IllegalStateException("Check failed.");
        }
        if ((i5 & i11) != 0) {
            throw new IllegalStateException("Check failed.");
        }
    }

    public final int a(Object obj) {
        while (true) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = f96813f;
            long j11 = atomicLongFieldUpdater.get(this);
            if ((3458764513820540928L & j11) != 0) {
                return (2305843009213693952L & j11) != 0 ? 2 : 1;
            }
            int i5 = (int) (1073741823 & j11);
            int i11 = (int) ((1152921503533105152L & j11) >> 30);
            int i12 = this.f96817c;
            if (((i11 + 2) & i12) == (i5 & i12)) {
                return 1;
            }
            boolean z11 = this.f96816b;
            AtomicReferenceArray atomicReferenceArray = this.f96818d;
            if (z11 || atomicReferenceArray.get(i11 & i12) == null) {
                if (f96813f.compareAndSet(this, j11, ((-1152921503533105153L) & j11) | (((i11 + 1) & 1073741823) << 30))) {
                    atomicReferenceArray.set(i11 & i12, obj);
                    n nVarC = this;
                    while ((atomicLongFieldUpdater.get(nVarC) & 1152921504606846976L) != 0) {
                        nVarC = nVarC.c();
                        AtomicReferenceArray atomicReferenceArray2 = nVarC.f96818d;
                        int i13 = nVarC.f96817c & i11;
                        Object obj2 = atomicReferenceArray2.get(i13);
                        if ((obj2 instanceof m) && ((m) obj2).f96811a == i11) {
                            atomicReferenceArray2.set(i13, obj);
                        } else {
                            nVarC = null;
                        }
                        if (nVarC == null) {
                            return 0;
                        }
                    }
                    return 0;
                }
            } else {
                int i14 = this.f96815a;
                if (i14 < 1024 || ((i11 - i5) & 1073741823) > (i14 >> 1)) {
                    return 1;
                }
            }
        }
    }

    public final boolean b() {
        AtomicLongFieldUpdater atomicLongFieldUpdater;
        long j11;
        do {
            atomicLongFieldUpdater = f96813f;
            j11 = atomicLongFieldUpdater.get(this);
            if ((j11 & 2305843009213693952L) != 0) {
                return true;
            }
            if ((1152921504606846976L & j11) != 0) {
                return false;
            }
        } while (!atomicLongFieldUpdater.compareAndSet(this, j11, 2305843009213693952L | j11));
        return true;
    }

    public final n c() {
        AtomicLongFieldUpdater atomicLongFieldUpdater;
        long j11;
        n nVar;
        while (true) {
            atomicLongFieldUpdater = f96813f;
            j11 = atomicLongFieldUpdater.get(this);
            if ((j11 & 1152921504606846976L) != 0) {
                nVar = this;
                break;
            }
            long j12 = 1152921504606846976L | j11;
            nVar = this;
            if (atomicLongFieldUpdater.compareAndSet(nVar, j11, j12)) {
                j11 = j12;
                break;
            }
        }
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f96812e;
            n nVar2 = (n) atomicReferenceFieldUpdater.get(this);
            if (nVar2 != null) {
                return nVar2;
            }
            n nVar3 = new n(nVar.f96815a * 2, nVar.f96816b);
            int i5 = (int) (1073741823 & j11);
            int i11 = (int) ((1152921503533105152L & j11) >> 30);
            while (true) {
                int i12 = nVar.f96817c;
                int i13 = i5 & i12;
                if (i13 == (i12 & i11)) {
                    break;
                }
                Object mVar = nVar.f96818d.get(i13);
                if (mVar == null) {
                    mVar = new m(i5);
                }
                nVar3.f96818d.set(nVar3.f96817c & i5, mVar);
                i5++;
            }
            atomicLongFieldUpdater.set(nVar3, (-1152921504606846977L) & j11);
            while (!atomicReferenceFieldUpdater.compareAndSet(this, null, nVar3) && atomicReferenceFieldUpdater.get(this) == null) {
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0041, code lost:
    
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d() {
        n nVarC = this;
        while (true) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = f96813f;
            long j11 = atomicLongFieldUpdater.get(nVarC);
            if ((j11 & 1152921504606846976L) != 0) {
                return f96814g;
            }
            int i5 = (int) (j11 & 1073741823);
            int i11 = nVarC.f96817c;
            int i12 = i5 & i11;
            if ((((int) ((1152921503533105152L & j11) >> 30)) & i11) == i12) {
                break;
            }
            AtomicReferenceArray atomicReferenceArray = nVarC.f96818d;
            Object obj = atomicReferenceArray.get(i12);
            boolean z11 = nVarC.f96816b;
            if (obj == null) {
                if (z11) {
                    break;
                }
            } else {
                if (obj instanceof m) {
                    break;
                }
                long j12 = (i5 + 1) & 1073741823;
                if (f96813f.compareAndSet(nVarC, j11, (j11 & (-1073741824)) | j12)) {
                    atomicReferenceArray.set(i12, null);
                    return obj;
                }
                nVarC = this;
                if (z11) {
                    while (true) {
                        long j13 = atomicLongFieldUpdater.get(nVarC);
                        int i13 = (int) (j13 & 1073741823);
                        if ((j13 & 1152921504606846976L) != 0) {
                            nVarC = nVarC.c();
                        } else {
                            n nVar = nVarC;
                            if (f96813f.compareAndSet(nVar, j13, (j13 & (-1073741824)) | j12)) {
                                nVar.f96818d.set(i13 & nVar.f96817c, null);
                                nVarC = null;
                            } else {
                                nVarC = nVar;
                            }
                        }
                        if (nVarC == null) {
                            return obj;
                        }
                    }
                }
            }
        }
    }
}
