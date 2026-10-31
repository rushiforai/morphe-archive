package xk;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class v2 extends v0 {

    /* renamed from: c, reason: collision with root package name */
    public final transient Object[] f96033c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f96034d;

    /* renamed from: e, reason: collision with root package name */
    public final transient int f96035e;

    public v2(Object[] objArr, int i5, int i11) {
        this.f96033c = objArr;
        this.f96034d = i5;
        this.f96035e = i11;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        vk.b0.e(i5, this.f96035e);
        Object obj = this.f96033c[(i5 * 2) + this.f96034d];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // xk.q0
    public final boolean h() {
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f96035e;
    }
}
