package kotlin.jvm.internal;

import java.util.NoSuchElementException;
import kotlin.collections.BooleanIterator;

/* loaded from: classes4.dex */
public final class a extends BooleanIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f71879a;

    public a() {
        Intrinsics.g(null, "array");
    }

    @Override // kotlin.collections.BooleanIterator
    public final boolean a() {
        try {
            this.f71879a++;
            throw null;
        } catch (ArrayIndexOutOfBoundsException e3) {
            this.f71879a--;
            throw new NoSuchElementException(e3.getMessage());
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }
}
