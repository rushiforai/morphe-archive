package defpackage;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceArray;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w7f {
    public static final /* synthetic */ AtomicIntegerFieldUpdater b;
    public static final /* synthetic */ AtomicIntegerFieldUpdater c;
    public static final /* synthetic */ long d;
    public static final /* synthetic */ long e;
    public static final /* synthetic */ long f;
    public static final /* synthetic */ long g;
    public final AtomicReferenceArray a = new AtomicReferenceArray(128);
    private volatile /* synthetic */ int blockingTasksInBuffer$volatile;
    private volatile /* synthetic */ int consumerIndex$volatile;
    private volatile /* synthetic */ Object lastScheduledTask$volatile;
    private volatile /* synthetic */ int producerIndex$volatile;

    static {
        Unsafe unsafe = m80.a;
        f = unsafe.objectFieldOffset(w7f.class.getDeclaredField("lastScheduledTask$volatile"));
        b = AtomicIntegerFieldUpdater.newUpdater(w7f.class, "producerIndex$volatile");
        g = unsafe.objectFieldOffset(w7f.class.getDeclaredField("producerIndex$volatile"));
        e = unsafe.objectFieldOffset(w7f.class.getDeclaredField("consumerIndex$volatile"));
        c = AtomicIntegerFieldUpdater.newUpdater(w7f.class, "blockingTasksInBuffer$volatile");
        d = unsafe.objectFieldOffset(w7f.class.getDeclaredField("blockingTasksInBuffer$volatile"));
    }

    public final vfd a(vfd vfdVar) {
        if (b() == 127) {
            return vfdVar;
        }
        if (vfdVar.b) {
            c.incrementAndGet(this);
        }
        int intVolatile = m80.a.getIntVolatile(this, g) & 127;
        while (true) {
            AtomicReferenceArray atomicReferenceArray = this.a;
            if (atomicReferenceArray.get(intVolatile) == null) {
                atomicReferenceArray.lazySet(intVolatile, vfdVar);
                b.incrementAndGet(this);
                return null;
            }
            Thread.yield();
        }
    }

    public final int b() {
        return m80.a.getIntVolatile(this, g) - m80.a.getIntVolatile(this, e);
    }

    public final vfd c() {
        vfd vfdVar;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = e;
            int intVolatile = unsafe.getIntVolatile(this, j);
            if (intVolatile - unsafe.getIntVolatile(this, g) == 0) {
                return null;
            }
            int i = intVolatile & 127;
            w7f w7fVar = this;
            if (unsafe.compareAndSwapInt(w7fVar, j, intVolatile, intVolatile + 1) && (vfdVar = (vfd) w7fVar.a.getAndSet(i, null)) != null) {
                if (vfdVar.b) {
                    c.decrementAndGet(w7fVar);
                }
                return vfdVar;
            }
            this = w7fVar;
        }
    }

    public final vfd d(int i, boolean z) {
        int i2 = i & 127;
        AtomicReferenceArray atomicReferenceArray = this.a;
        vfd vfdVar = (vfd) atomicReferenceArray.get(i2);
        if (vfdVar != null && vfdVar.b == z) {
            while (!atomicReferenceArray.compareAndSet(i2, vfdVar, null)) {
                if (atomicReferenceArray.get(i2) != vfdVar) {
                }
            }
            if (z) {
                c.decrementAndGet(this);
            }
            return vfdVar;
        }
        return null;
    }
}
