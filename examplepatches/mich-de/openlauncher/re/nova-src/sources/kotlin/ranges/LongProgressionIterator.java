package kotlin.ranges;

import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.collections.LongIterator;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/ranges/LongProgressionIterator;", "Lkotlin/collections/LongIterator;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LongProgressionIterator extends LongIterator {

    /* renamed from: a, reason: collision with root package name */
    public final long f71918a;

    /* renamed from: b, reason: collision with root package name */
    public final long f71919b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f71920c;

    /* renamed from: d, reason: collision with root package name */
    public long f71921d;

    public LongProgressionIterator(long j11, long j12, long j13) {
        this.f71918a = j13;
        this.f71919b = j12;
        boolean z11 = false;
        if (j13 <= 0 ? j11 >= j12 : j11 <= j12) {
            z11 = true;
        }
        this.f71920c = z11;
        this.f71921d = z11 ? j11 : j12;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f71920c;
    }

    @Override // kotlin.collections.LongIterator
    public final long nextLong() {
        long j11 = this.f71921d;
        if (j11 != this.f71919b) {
            this.f71921d = this.f71918a + j11;
            return j11;
        }
        if (!this.f71920c) {
            throw new NoSuchElementException();
        }
        this.f71920c = false;
        return j11;
    }
}
