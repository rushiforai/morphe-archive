package rx.internal.util.unsafe;

import java.util.Iterator;

/* loaded from: classes5.dex */
public abstract class a extends b {

    /* renamed from: c, reason: collision with root package name */
    public static final int f86468c;

    /* renamed from: d, reason: collision with root package name */
    public static final long f86469d;

    /* renamed from: e, reason: collision with root package name */
    public static final int f86470e;

    /* renamed from: a, reason: collision with root package name */
    public final long f86471a;

    /* renamed from: b, reason: collision with root package name */
    public final Object[] f86472b;

    static {
        int iIntValue = Integer.getInteger("sparse.shift", 0).intValue();
        f86468c = iIntValue;
        int iArrayIndexScale = l.f86488a.arrayIndexScale(Object[].class);
        if (4 == iArrayIndexScale) {
            f86470e = iIntValue + 2;
        } else {
            if (8 != iArrayIndexScale) {
                throw new IllegalStateException("Unknown pointer size");
            }
            f86470e = iIntValue + 3;
        }
        f86469d = r1.arrayBaseOffset(Object[].class) + (32 << (f86470e - iIntValue));
    }

    public a(int i5) {
        int iN = ps.f.n(i5);
        this.f86471a = iN - 1;
        this.f86472b = new Object[(iN << f86468c) + 64];
    }

    public static Object b(Object[] objArr, long j11) {
        return l.f86488a.getObjectVolatile(objArr, j11);
    }

    public static void c(Object[] objArr, long j11, Object obj) {
        l.f86488a.putOrderedObject(objArr, j11, obj);
    }

    @Override // java.util.AbstractQueue, java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        while (true) {
            if (((c) this).poll() == null && isEmpty()) {
                return;
            }
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        throw new UnsupportedOperationException();
    }
}
