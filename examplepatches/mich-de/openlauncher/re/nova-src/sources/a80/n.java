package a80;

import com.vungle.ads.internal.protos.Sdk;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f503b = AtomicReferenceFieldUpdater.newUpdater(n.class, Object.class, "lastScheduledTask$volatile");

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f504c = AtomicIntegerFieldUpdater.newUpdater(n.class, "producerIndex$volatile");

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f505d = AtomicIntegerFieldUpdater.newUpdater(n.class, "consumerIndex$volatile");

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f506e = AtomicIntegerFieldUpdater.newUpdater(n.class, "blockingTasksInBuffer$volatile");

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReferenceArray f507a = new AtomicReferenceArray(128);
    private volatile /* synthetic */ int blockingTasksInBuffer$volatile;
    private volatile /* synthetic */ int consumerIndex$volatile;
    private volatile /* synthetic */ Object lastScheduledTask$volatile;
    private volatile /* synthetic */ int producerIndex$volatile;

    public final i a(i iVar) {
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = f504c;
        if (atomicIntegerFieldUpdater.get(this) - f505d.get(this) == 127) {
            return iVar;
        }
        if (iVar.f494b) {
            f506e.incrementAndGet(this);
        }
        int i5 = atomicIntegerFieldUpdater.get(this) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        while (true) {
            AtomicReferenceArray atomicReferenceArray = this.f507a;
            if (atomicReferenceArray.get(i5) == null) {
                atomicReferenceArray.lazySet(i5, iVar);
                atomicIntegerFieldUpdater.incrementAndGet(this);
                return null;
            }
            Thread.yield();
        }
    }

    public final i b() {
        i iVar;
        while (true) {
            AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = f505d;
            int i5 = atomicIntegerFieldUpdater.get(this);
            if (i5 - f504c.get(this) == 0) {
                return null;
            }
            int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
            if (atomicIntegerFieldUpdater.compareAndSet(this, i5, i5 + 1) && (iVar = (i) this.f507a.getAndSet(i11, null)) != null) {
                if (iVar.f494b) {
                    f506e.decrementAndGet(this);
                }
                return iVar;
            }
        }
    }

    public final i c(int i5, boolean z11) {
        int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        AtomicReferenceArray atomicReferenceArray = this.f507a;
        i iVar = (i) atomicReferenceArray.get(i11);
        if (iVar == null || iVar.f494b != z11 || !m.v(atomicReferenceArray, i11, iVar)) {
            return null;
        }
        if (z11) {
            f506e.decrementAndGet(this);
        }
        return iVar;
    }
}
