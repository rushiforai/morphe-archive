package xk;

import java.util.Objects;

/* loaded from: classes.dex */
public final class r2 extends v0 {

    /* renamed from: e, reason: collision with root package name */
    public static final r2 f96007e = new r2(new Object[0], 0);

    /* renamed from: c, reason: collision with root package name */
    public final transient Object[] f96008c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f96009d;

    public r2(Object[] objArr, int i5) {
        this.f96008c = objArr;
        this.f96009d = i5;
    }

    @Override // xk.v0, xk.q0
    public final int d(Object[] objArr, int i5) {
        Object[] objArr2 = this.f96008c;
        int i11 = this.f96009d;
        System.arraycopy(objArr2, 0, objArr, i5, i11);
        return i5 + i11;
    }

    @Override // xk.q0
    public final Object[] e() {
        return this.f96008c;
    }

    @Override // xk.q0
    public final int f() {
        return this.f96009d;
    }

    @Override // xk.q0
    public final int g() {
        return 0;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        vk.b0.e(i5, this.f96009d);
        Object obj = this.f96008c[i5];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // xk.q0
    public final boolean h() {
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f96009d;
    }
}
