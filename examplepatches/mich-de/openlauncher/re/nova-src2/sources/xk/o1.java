package xk;

import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class o1 extends lh.h {

    /* renamed from: b, reason: collision with root package name */
    public boolean f95982b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f95983c;

    public o1(Object obj) {
        super(1);
        this.f95983c = obj;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return !this.f95982b;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.f95982b) {
            throw new NoSuchElementException();
        }
        this.f95982b = true;
        return this.f95983c;
    }
}
