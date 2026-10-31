package kotlin.ranges;

import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.collections.CharIterator;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/ranges/CharProgressionIterator;", "Lkotlin/collections/CharIterator;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class CharProgressionIterator extends CharIterator {

    /* renamed from: a, reason: collision with root package name */
    public final int f71901a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71902b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f71903c;

    /* renamed from: d, reason: collision with root package name */
    public int f71904d;

    public CharProgressionIterator(char c11, char c12, int i5) {
        this.f71901a = i5;
        this.f71902b = c12;
        boolean z11 = false;
        if (i5 <= 0 ? Intrinsics.h(c11, c12) >= 0 : Intrinsics.h(c11, c12) <= 0) {
            z11 = true;
        }
        this.f71903c = z11;
        this.f71904d = z11 ? c11 : c12;
    }

    @Override // kotlin.collections.CharIterator
    public final char a() {
        int i5 = this.f71904d;
        if (i5 != this.f71902b) {
            this.f71904d = this.f71901a + i5;
        } else {
            if (!this.f71903c) {
                throw new NoSuchElementException();
            }
            this.f71903c = false;
        }
        return (char) i5;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f71903c;
    }
}
