package kotlin.jvm.internal;

import java.util.NoSuchElementException;
import kotlin.collections.ShortIterator;

/* loaded from: classes4.dex */
public final class h extends ShortIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f71886a;

    public h() {
        Intrinsics.g(null, "array");
    }

    @Override // kotlin.collections.ShortIterator
    public final short a() {
        try {
            this.f71886a++;
            throw null;
        } catch (ArrayIndexOutOfBoundsException e3) {
            this.f71886a--;
            throw new NoSuchElementException(e3.getMessage());
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }
}
