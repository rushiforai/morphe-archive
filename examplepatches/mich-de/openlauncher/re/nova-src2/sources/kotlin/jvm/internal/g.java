package kotlin.jvm.internal;

import java.util.NoSuchElementException;
import kotlin.collections.LongIterator;

/* loaded from: classes4.dex */
public final class g extends LongIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f71885a;

    public g() {
        Intrinsics.g(null, "array");
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }

    @Override // kotlin.collections.LongIterator
    public final long nextLong() {
        try {
            this.f71885a++;
            throw null;
        } catch (ArrayIndexOutOfBoundsException e3) {
            this.f71885a--;
            throw new NoSuchElementException(e3.getMessage());
        }
    }
}
