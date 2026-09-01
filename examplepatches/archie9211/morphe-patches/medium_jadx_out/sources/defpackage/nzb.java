package defpackage;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nzb implements Iterator, n92, th6 {
    public int a;
    public Object b;
    public Iterator c;
    public n92 d;

    public final RuntimeException a() {
        int i = this.a;
        if (i == 4) {
            return new NoSuchElementException();
        }
        if (i == 5) {
            return new IllegalStateException("Iterator has failed.");
        }
        return new IllegalStateException("Unexpected state of the iterator: " + this.a);
    }

    public final tb2 b(n92 n92Var, Object obj) {
        this.b = obj;
        this.a = 3;
        this.d = n92Var;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        n92Var.getClass();
        return tb2Var;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return zx3.a;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        while (true) {
            int i = this.a;
            if (i != 0) {
                if (i != 1) {
                    if (i == 2 || i == 3) {
                        return true;
                    }
                    if (i == 4) {
                        return false;
                    }
                    throw a();
                }
                Iterator it2 = this.c;
                it2.getClass();
                if (it2.hasNext()) {
                    this.a = 2;
                    return true;
                }
                this.c = null;
            }
            this.a = 5;
            n92 n92Var = this.d;
            n92Var.getClass();
            this.d = null;
            n92Var.resumeWith(c1e.a);
        }
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        if (i == 0 || i == 1) {
            if (hasNext()) {
                return next();
            }
            ywb.n();
            return null;
        }
        if (i == 2) {
            this.a = 1;
            Iterator it2 = this.c;
            it2.getClass();
            return it2.next();
        }
        if (i != 3) {
            throw a();
        }
        this.a = 0;
        Object obj = this.b;
        this.b = null;
        return obj;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        br7.v(obj);
        this.a = 4;
    }
}
