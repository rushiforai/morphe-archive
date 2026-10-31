package kotlin.jvm.internal;

import java.util.NoSuchElementException;
import kotlin.collections.FloatIterator;

/* loaded from: classes4.dex */
public final class e extends FloatIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f71883a;

    public e() {
        Intrinsics.g(null, "array");
    }

    @Override // kotlin.collections.FloatIterator
    public final float a() {
        try {
            this.f71883a++;
            throw null;
        } catch (ArrayIndexOutOfBoundsException e3) {
            this.f71883a--;
            throw new NoSuchElementException(e3.getMessage());
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }
}
