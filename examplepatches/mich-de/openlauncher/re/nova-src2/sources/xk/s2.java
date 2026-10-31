package xk;

import java.util.AbstractMap;
import java.util.Objects;

/* loaded from: classes.dex */
public final class s2 extends v0 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ t2 f96011c;

    public s2(t2 t2Var) {
        this.f96011c = t2Var;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        t2 t2Var = this.f96011c;
        vk.b0.e(i5, t2Var.f96021g);
        Object[] objArr = t2Var.f96019e;
        int i11 = i5 * 2;
        int i12 = t2Var.f96020f;
        Object obj = objArr[i11 + i12];
        Objects.requireNonNull(obj);
        Object obj2 = objArr[i11 + (i12 ^ 1)];
        Objects.requireNonNull(obj2);
        return new AbstractMap.SimpleImmutableEntry(obj, obj2);
    }

    @Override // xk.q0
    public final boolean h() {
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f96011c.f96021g;
    }
}
