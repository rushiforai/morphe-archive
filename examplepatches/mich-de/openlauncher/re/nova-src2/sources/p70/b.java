package p70;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.UInt;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes4.dex */
public final class b implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final int f82412a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f82413b;

    /* renamed from: c, reason: collision with root package name */
    public final int f82414c;

    /* renamed from: d, reason: collision with root package name */
    public int f82415d;

    public b(int i5, int i11) {
        this.f82412a = i5;
        boolean z11 = false;
        int iCompareUnsigned = Integer.compareUnsigned(-1, i5);
        if (i11 <= 0 ? iCompareUnsigned >= 0 : iCompareUnsigned <= 0) {
            z11 = true;
        }
        this.f82413b = z11;
        UInt.Companion companion = UInt.f71696b;
        this.f82414c = i11;
        this.f82415d = z11 ? -1 : i5;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f82413b;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i5 = this.f82415d;
        if (i5 != this.f82412a) {
            int i11 = this.f82414c + i5;
            UInt.Companion companion = UInt.f71696b;
            this.f82415d = i11;
        } else {
            if (!this.f82413b) {
                throw new NoSuchElementException();
            }
            this.f82413b = false;
        }
        return new UInt(i5);
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
