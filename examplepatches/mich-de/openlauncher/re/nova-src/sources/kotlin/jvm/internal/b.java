package kotlin.jvm.internal;

import java.util.NoSuchElementException;
import kotlin.collections.ByteIterator;

/* loaded from: classes4.dex */
public final class b extends ByteIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f71880a;

    public b() {
        Intrinsics.g(null, "array");
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }

    @Override // kotlin.collections.ByteIterator
    public final byte nextByte() {
        try {
            this.f71880a++;
            throw null;
        } catch (ArrayIndexOutOfBoundsException e3) {
            this.f71880a--;
            throw new NoSuchElementException(e3.getMessage());
        }
    }
}
