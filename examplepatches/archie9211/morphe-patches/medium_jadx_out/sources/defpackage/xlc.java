package defpackage;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReferenceArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xlc extends AtomicReferenceArray implements eec {
    public static final Integer f = Integer.getInteger("jctools.spsc.max.lookahead.step", 4096);
    public final int a;
    public final AtomicLong b;
    public long c;
    public final AtomicLong d;
    public final int e;

    public xlc(int i) {
        super(1 << (32 - Integer.numberOfLeadingZeros(i - 1)));
        this.a = length() - 1;
        this.b = new AtomicLong();
        this.d = new AtomicLong();
        this.e = Math.min(i / 4, f.intValue());
    }

    @Override // defpackage.fec
    public final void clear() {
        while (true) {
            if (poll() == null && isEmpty()) {
                return;
            }
        }
    }

    @Override // defpackage.fec
    public final boolean isEmpty() {
        return this.b.get() == this.d.get();
    }

    @Override // defpackage.fec
    public final boolean offer(Object obj) {
        if (obj == null) {
            z72.c("Null is not a valid element");
            return false;
        }
        AtomicLong atomicLong = this.b;
        long j = atomicLong.get();
        int i = this.a;
        int i2 = ((int) j) & i;
        if (j >= this.c) {
            long j2 = ((long) this.e) + j;
            if (get(i & ((int) j2)) == null) {
                this.c = j2;
            } else if (get(i2) != null) {
                return false;
            }
        }
        lazySet(i2, obj);
        atomicLong.lazySet(j + 1);
        return true;
    }

    @Override // defpackage.fec
    public final Object poll() {
        AtomicLong atomicLong = this.d;
        long j = atomicLong.get();
        int i = ((int) j) & this.a;
        Object obj = get(i);
        if (obj == null) {
            return null;
        }
        atomicLong.lazySet(j + 1);
        lazySet(i, null);
        return obj;
    }
}
