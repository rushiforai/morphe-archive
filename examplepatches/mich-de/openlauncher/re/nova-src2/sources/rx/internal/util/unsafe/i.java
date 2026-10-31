package rx.internal.util.unsafe;

import androidx.recyclerview.widget.u1;
import java.util.Iterator;
import sun.misc.Unsafe;

/* loaded from: classes5.dex */
public final class i extends j {

    /* renamed from: h, reason: collision with root package name */
    public static final long f86477h;

    /* renamed from: i, reason: collision with root package name */
    public static final long f86478i;

    /* renamed from: j, reason: collision with root package name */
    public static final long f86479j;

    /* renamed from: k, reason: collision with root package name */
    public static final int f86480k;

    /* renamed from: g, reason: collision with root package name */
    public static final int f86476g = Integer.getInteger("jctools.spsc.max.lookahead.step", u1.FLAG_APPEARED_IN_PRE_LAYOUT).intValue();

    /* renamed from: l, reason: collision with root package name */
    public static final Object f86481l = new Object();

    static {
        Unsafe unsafe = l.f86488a;
        int iArrayIndexScale = unsafe.arrayIndexScale(Object[].class);
        if (4 == iArrayIndexScale) {
            f86480k = 2;
        } else {
            if (8 != iArrayIndexScale) {
                throw new IllegalStateException("Unknown pointer size");
            }
            f86480k = 3;
        }
        f86479j = unsafe.arrayBaseOffset(Object[].class);
        try {
            f86477h = unsafe.objectFieldOffset(k.class.getDeclaredField("producerIndex"));
            try {
                f86478i = unsafe.objectFieldOffset(j.class.getDeclaredField("consumerIndex"));
            } catch (NoSuchFieldException e3) {
                InternalError internalError = new InternalError();
                internalError.initCause(e3);
                throw internalError;
            }
        } catch (NoSuchFieldException e11) {
            InternalError internalError2 = new InternalError();
            internalError2.initCause(e11);
            throw internalError2;
        }
    }

    public i(int i5) {
        int iN = ps.f.n(i5);
        long j11 = iN - 1;
        Object[] objArr = new Object[iN + 1];
        this.f86485d = objArr;
        this.f86484c = j11;
        this.f86482a = Math.min(iN / 4, f86476g);
        this.f86487f = objArr;
        this.f86486e = j11;
        this.f86483b = j11 - 1;
        h(0L);
    }

    public static long b(long j11) {
        return f86479j + (j11 << f86480k);
    }

    public static Object d(Object[] objArr, long j11) {
        return l.f86488a.getObjectVolatile(objArr, j11);
    }

    public static void g(Object[] objArr, long j11, Object obj) {
        l.f86488a.putOrderedObject(objArr, j11, obj);
    }

    public final long c() {
        return l.f86488a.getLongVolatile(this, f86478i);
    }

    public final long e() {
        return l.f86488a.getLongVolatile(this, f86477h);
    }

    public final void f(long j11) {
        l.f86488a.putOrderedLong(this, f86478i, j11);
    }

    public final void h(long j11) {
        l.f86488a.putOrderedLong(this, f86477h, j11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Queue
    public final boolean offer(Object obj) {
        if (obj == null) {
            throw new NullPointerException("Null is not a valid element");
        }
        Object[] objArr = this.f86485d;
        long j11 = this.producerIndex;
        long j12 = this.f86484c;
        long jB = b(j11 & j12);
        if (j11 < this.f86483b) {
            g(objArr, jB, obj);
            h(j11 + 1);
            return true;
        }
        long j13 = this.f86482a + j11;
        if (d(objArr, b(j13 & j12)) == null) {
            this.f86483b = j13 - 1;
            g(objArr, jB, obj);
            h(j11 + 1);
            return true;
        }
        long j14 = j11 + 1;
        if (d(objArr, b(j14 & j12)) != null) {
            g(objArr, jB, obj);
            h(j14);
            return true;
        }
        Object[] objArr2 = new Object[objArr.length];
        this.f86485d = objArr2;
        this.f86483b = (j11 + j12) - 1;
        g(objArr2, jB, obj);
        g(objArr, b(objArr.length - 1), objArr2);
        g(objArr, jB, f86481l);
        h(j14);
        return true;
    }

    @Override // java.util.Queue
    public final Object peek() {
        Object[] objArr = this.f86487f;
        long j11 = this.consumerIndex & this.f86486e;
        Object objD = d(objArr, b(j11));
        if (objD != f86481l) {
            return objD;
        }
        Object[] objArr2 = (Object[]) d(objArr, b(objArr.length - 1));
        this.f86487f = objArr2;
        return d(objArr2, b(j11));
    }

    @Override // java.util.Queue
    public final Object poll() {
        Object[] objArr = this.f86487f;
        long j11 = this.consumerIndex;
        long j12 = this.f86486e & j11;
        long jB = b(j12);
        Object objD = d(objArr, jB);
        boolean z11 = objD == f86481l;
        if (objD != null && !z11) {
            g(objArr, jB, null);
            f(j11 + 1);
            return objD;
        }
        if (z11) {
            Object[] objArr2 = (Object[]) d(objArr, b(objArr.length - 1));
            this.f86487f = objArr2;
            long jB2 = b(j12);
            Object objD2 = d(objArr2, jB2);
            if (objD2 != null) {
                g(objArr2, jB2, null);
                f(j11 + 1);
                return objD2;
            }
        }
        return null;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        long jC = c();
        while (true) {
            long jE = e();
            long jC2 = c();
            if (jC == jC2) {
                return (int) (jE - jC2);
            }
            jC = jC2;
        }
    }
}
