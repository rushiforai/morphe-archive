package kotlin.jvm.internal;

import java.util.NoSuchElementException;
import kotlin.collections.IntIterator;

/* loaded from: classes4.dex */
public final class f extends IntIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f71884a;

    public f() {
        Intrinsics.g(null, "array");
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }

    @Override // kotlin.collections.IntIterator
    public final int nextInt() {
        try {
            this.f71884a++;
            throw null;
        } catch (ArrayIndexOutOfBoundsException e3) {
            this.f71884a--;
            throw new NoSuchElementException(e3.getMessage());
        }
    }
}
