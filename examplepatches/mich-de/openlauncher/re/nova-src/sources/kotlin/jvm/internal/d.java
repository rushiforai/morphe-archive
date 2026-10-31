package kotlin.jvm.internal;

import java.util.NoSuchElementException;
import kotlin.collections.DoubleIterator;

/* loaded from: classes4.dex */
public final class d extends DoubleIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f71882a;

    public d() {
        Intrinsics.g(null, "array");
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }

    @Override // kotlin.collections.DoubleIterator
    public final double nextDouble() {
        try {
            this.f71882a++;
            throw null;
        } catch (ArrayIndexOutOfBoundsException e3) {
            this.f71882a--;
            throw new NoSuchElementException(e3.getMessage());
        }
    }
}
