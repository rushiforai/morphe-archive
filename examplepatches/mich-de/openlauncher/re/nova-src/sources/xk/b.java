package xk;

import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public abstract class b extends lh.h {

    /* renamed from: b, reason: collision with root package name */
    public int f95861b;

    /* renamed from: c, reason: collision with root package name */
    public Object f95862c;

    public b() {
        super(1);
        this.f95861b = 2;
    }

    public abstract Object a();

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i5 = this.f95861b;
        if (i5 == 4) {
            throw new IllegalStateException();
        }
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return true;
        }
        if (iF == 2) {
            return false;
        }
        this.f95861b = 4;
        this.f95862c = a();
        if (this.f95861b == 3) {
            return false;
        }
        this.f95861b = 1;
        return true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.f95861b = 2;
        Object obj = this.f95862c;
        this.f95862c = null;
        return obj;
    }
}
