package sb0;

import androidx.recyclerview.widget.u1;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReferenceArray;

/* loaded from: classes5.dex */
public final class b extends a {

    /* renamed from: g, reason: collision with root package name */
    public static final Integer f87104g = Integer.getInteger("jctools.spsc.max.lookahead.step", u1.FLAG_APPEARED_IN_PRE_LAYOUT);

    /* renamed from: c, reason: collision with root package name */
    public final AtomicLong f87105c;

    /* renamed from: d, reason: collision with root package name */
    public long f87106d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicLong f87107e;

    /* renamed from: f, reason: collision with root package name */
    public final int f87108f;

    public b(int i5) {
        super(i5);
        this.f87105c = new AtomicLong();
        this.f87107e = new AtomicLong();
        this.f87108f = Math.min(i5 / 4, f87104g.intValue());
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean isEmpty() {
        return this.f87105c.get() == this.f87107e.get();
    }

    @Override // java.util.Queue
    public final boolean offer(Object obj) {
        if (obj == null) {
            throw new NullPointerException("Null is not a valid element");
        }
        AtomicLong atomicLong = this.f87105c;
        long j11 = atomicLong.get();
        int i5 = this.f87103b;
        int i11 = ((int) j11) & i5;
        long j12 = this.f87106d;
        AtomicReferenceArray atomicReferenceArray = this.f87102a;
        if (j11 >= j12) {
            long j13 = this.f87108f + j11;
            if (atomicReferenceArray.get(i5 & ((int) j13)) == null) {
                this.f87106d = j13;
            } else if (atomicReferenceArray.get(i11) != null) {
                return false;
            }
        }
        atomicReferenceArray.lazySet(i11, obj);
        atomicLong.lazySet(j11 + 1);
        return true;
    }

    @Override // java.util.Queue
    public final Object peek() {
        return this.f87102a.get(((int) this.f87107e.get()) & this.f87103b);
    }

    @Override // java.util.Queue
    public final Object poll() {
        AtomicLong atomicLong = this.f87107e;
        long j11 = atomicLong.get();
        int i5 = ((int) j11) & this.f87103b;
        AtomicReferenceArray atomicReferenceArray = this.f87102a;
        Object obj = atomicReferenceArray.get(i5);
        if (obj == null) {
            return null;
        }
        atomicReferenceArray.lazySet(i5, null);
        atomicLong.lazySet(j11 + 1);
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        AtomicLong atomicLong = this.f87107e;
        long j11 = atomicLong.get();
        while (true) {
            long j12 = this.f87105c.get();
            long j13 = atomicLong.get();
            if (j11 == j13) {
                return (int) (j12 - j13);
            }
            j11 = j13;
        }
    }
}
