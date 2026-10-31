package kotlin.jvm.internal;

import java.util.NoSuchElementException;
import kotlin.collections.CharIterator;

/* loaded from: classes4.dex */
public final class c extends CharIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f71881a;

    public c() {
        Intrinsics.g(null, "array");
    }

    @Override // kotlin.collections.CharIterator
    public final char a() {
        try {
            this.f71881a++;
            throw null;
        } catch (ArrayIndexOutOfBoundsException e3) {
            this.f71881a--;
            throw new NoSuchElementException(e3.getMessage());
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }
}
