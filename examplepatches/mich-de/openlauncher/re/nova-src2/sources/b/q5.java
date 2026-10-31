package b;

import java.util.Iterator;

/* loaded from: classes.dex */
public abstract class q5 implements Iterator {
    public abstract byte a();

    @Override // java.util.Iterator
    public final Object next() {
        return Byte.valueOf(a());
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
