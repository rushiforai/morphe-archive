package xk;

/* loaded from: classes.dex */
public final class z2 extends d1 {

    /* renamed from: i, reason: collision with root package name */
    public static final Object[] f96073i;

    /* renamed from: j, reason: collision with root package name */
    public static final z2 f96074j;

    /* renamed from: d, reason: collision with root package name */
    public final transient Object[] f96075d;

    /* renamed from: e, reason: collision with root package name */
    public final transient int f96076e;

    /* renamed from: f, reason: collision with root package name */
    public final transient Object[] f96077f;

    /* renamed from: g, reason: collision with root package name */
    public final transient int f96078g;

    /* renamed from: h, reason: collision with root package name */
    public final transient int f96079h;

    static {
        Object[] objArr = new Object[0];
        f96073i = objArr;
        f96074j = new z2(objArr, 0, objArr, 0, 0);
    }

    public z2(Object[] objArr, int i5, Object[] objArr2, int i11, int i12) {
        this.f96075d = objArr;
        this.f96076e = i5;
        this.f96077f = objArr2;
        this.f96078g = i11;
        this.f96079h = i12;
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj != null) {
            Object[] objArr = this.f96077f;
            if (objArr.length != 0) {
                int iQ = w20.h.q(obj);
                while (true) {
                    int i5 = iQ & this.f96078g;
                    Object obj2 = objArr[i5];
                    if (obj2 == null) {
                        return false;
                    }
                    if (obj2.equals(obj)) {
                        return true;
                    }
                    iQ = i5 + 1;
                }
            }
        }
        return false;
    }

    @Override // xk.q0
    public final int d(Object[] objArr, int i5) {
        Object[] objArr2 = this.f96075d;
        int i11 = this.f96079h;
        System.arraycopy(objArr2, 0, objArr, i5, i11);
        return i5 + i11;
    }

    @Override // xk.q0
    public final Object[] e() {
        return this.f96075d;
    }

    @Override // xk.q0
    public final int f() {
        return this.f96079h;
    }

    @Override // xk.q0
    public final int g() {
        return 0;
    }

    @Override // xk.q0
    public final boolean h() {
        return false;
    }

    @Override // xk.d1, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.f96076e;
    }

    @Override // xk.q0
    public final lh.h j() {
        return c().listIterator(0);
    }

    @Override // xk.d1
    public final v0 p() {
        return v0.k(this.f96079h, this.f96075d);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f96079h;
    }
}
