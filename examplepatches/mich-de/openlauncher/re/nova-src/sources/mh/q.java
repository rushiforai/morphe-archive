package mh;

import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class q extends a0 {

    /* renamed from: b, reason: collision with root package name */
    public static final Object f76370b = new Object();

    /* renamed from: a, reason: collision with root package name */
    public Object f76371a;

    public q(Object obj) {
        this.f76371a = obj;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f76371a != f76370b;
    }

    @Override // java.util.Iterator
    public final Object next() {
        Object obj = this.f76371a;
        Object obj2 = f76370b;
        if (obj == obj2) {
            throw new NoSuchElementException();
        }
        this.f76371a = obj2;
        return obj;
    }
}
