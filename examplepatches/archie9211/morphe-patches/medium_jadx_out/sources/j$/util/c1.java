package j$.util;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class c1 implements Iterator, Consumer {
    public boolean a = false;
    public Object b;
    public final /* synthetic */ Spliterator c;

    public c1(Spliterator spliterator) {
        this.c = spliterator;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) {
        this.a = true;
        this.b = obj;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (!this.a) {
            this.c.tryAdvance(this);
        }
        return this.a;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!this.a && !hasNext()) {
            throw new NoSuchElementException();
        }
        this.a = false;
        return this.b;
    }
}
