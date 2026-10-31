package rx.internal.util.unsafe;

/* loaded from: classes5.dex */
public final class c extends g {
    public c(int i5) {
        super(i5);
        e.f86474f.getClass();
    }

    public final long d() {
        return l.f86488a.getLongVolatile(this, d.f86473h);
    }

    public final long e() {
        return l.f86488a.getLongVolatile(this, h.f86475g);
    }

    public final void f(long j11) {
        l.f86488a.putOrderedLong(this, d.f86473h, j11);
    }

    public final void g(long j11) {
        l.f86488a.putOrderedLong(this, h.f86475g, j11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean isEmpty() {
        return e() == d();
    }

    @Override // java.util.Queue
    public final boolean offer(Object obj) {
        if (obj == null) {
            throw new NullPointerException("null elements not allowed");
        }
        long j11 = this.producerIndex;
        long j12 = a.f86469d + ((this.f86471a & j11) << a.f86470e);
        Object[] objArr = this.f86472b;
        if (a.b(objArr, j12) != null) {
            return false;
        }
        a.c(objArr, j12, obj);
        g(j11 + 1);
        return true;
    }

    @Override // java.util.Queue
    public final Object peek() {
        return a.b(this.f86472b, a.f86469d + ((this.consumerIndex & this.f86471a) << a.f86470e));
    }

    @Override // java.util.Queue
    public final Object poll() {
        long j11 = this.consumerIndex;
        long j12 = a.f86469d + ((this.f86471a & j11) << a.f86470e);
        Object[] objArr = this.f86472b;
        Object objB = a.b(objArr, j12);
        if (objB == null) {
            return null;
        }
        a.c(objArr, j12, null);
        f(j11 + 1);
        return objB;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        long jD = d();
        while (true) {
            long jE = e();
            long jD2 = d();
            if (jD == jD2) {
                return (int) (jE - jD2);
            }
            jD = jD2;
        }
    }
}
