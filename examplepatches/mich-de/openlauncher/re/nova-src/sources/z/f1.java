package z;

import kotlin.collections.IntIterator;

/* loaded from: classes2.dex */
public final class f1 extends IntIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f97768a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d1 f97769b;

    public f1(d1 d1Var) {
        this.f97769b = d1Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f97768a < this.f97769b.f();
    }

    @Override // kotlin.collections.IntIterator
    public final int nextInt() {
        int i5 = this.f97768a;
        this.f97768a = i5 + 1;
        return this.f97769b.d(i5);
    }
}
