package kotlin.ranges;

import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.collections.IntIterator;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/ranges/IntProgressionIterator;", "Lkotlin/collections/IntIterator;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class IntProgressionIterator extends IntIterator {

    /* renamed from: a, reason: collision with root package name */
    public final int f71909a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71910b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f71911c;

    /* renamed from: d, reason: collision with root package name */
    public int f71912d;

    public IntProgressionIterator(int i5, int i11, int i12) {
        this.f71909a = i12;
        this.f71910b = i11;
        boolean z11 = false;
        if (i12 <= 0 ? i5 >= i11 : i5 <= i11) {
            z11 = true;
        }
        this.f71911c = z11;
        this.f71912d = z11 ? i5 : i11;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f71911c;
    }

    @Override // kotlin.collections.IntIterator
    public final int nextInt() {
        int i5 = this.f71912d;
        if (i5 != this.f71910b) {
            this.f71912d = this.f71909a + i5;
            return i5;
        }
        if (!this.f71911c) {
            throw new NoSuchElementException();
        }
        this.f71911c = false;
        return i5;
    }
}
