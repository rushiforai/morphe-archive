package p70;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.ULong;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes4.dex */
public final class c implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final long f82416a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f82417b;

    /* renamed from: c, reason: collision with root package name */
    public final long f82418c;

    /* renamed from: d, reason: collision with root package name */
    public long f82419d;

    public c(long j11, long j12) {
        this.f82416a = j11;
        boolean z11 = false;
        if (j12 <= 0 ? Long.compareUnsigned(-1L, j11) >= 0 : Long.compareUnsigned(-1L, j11) <= 0) {
            z11 = true;
        }
        this.f82417b = z11;
        ULong.Companion companion = ULong.f71699b;
        this.f82418c = j12;
        this.f82419d = z11 ? -1L : j11;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f82417b;
    }

    @Override // java.util.Iterator
    public final Object next() {
        long j11 = this.f82419d;
        if (j11 != this.f82416a) {
            long j12 = this.f82418c + j11;
            ULong.Companion companion = ULong.f71699b;
            this.f82419d = j12;
        } else {
            if (!this.f82417b) {
                throw new NoSuchElementException();
            }
            this.f82417b = false;
        }
        return new ULong(j11);
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
