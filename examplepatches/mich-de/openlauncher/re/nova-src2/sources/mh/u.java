package mh;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class u extends j {

    /* renamed from: e, reason: collision with root package name */
    public static final u f76380e = new u(new Object[0], 0);

    /* renamed from: c, reason: collision with root package name */
    public final transient Object[] f76381c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f76382d;

    public u(Object[] objArr, int i5) {
        this.f76381c = objArr;
        this.f76382d = i5;
    }

    @Override // mh.j, mh.f
    public final int b(Object[] objArr) {
        Object[] objArr2 = this.f76381c;
        int i5 = this.f76382d;
        System.arraycopy(objArr2, 0, objArr, 0, i5);
        return i5;
    }

    @Override // mh.f
    public final int c() {
        return this.f76382d;
    }

    @Override // mh.f
    public final int d() {
        return 0;
    }

    @Override // mh.f
    public final Object[] f() {
        return this.f76381c;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        a.e(i5, this.f76382d);
        Object obj = this.f76381c[i5];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f76382d;
    }
}
