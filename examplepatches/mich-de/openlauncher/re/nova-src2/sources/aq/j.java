package aq;

import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final class j extends m0 {

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Method f15477k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Class f15478l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f15479m;

    public j(Method method, Class cls, int i5) {
        this.f15477k = method;
        this.f15478l = cls;
        this.f15479m = i5;
    }

    @Override // aq.m0
    public final Object e() {
        return this.f15477k.invoke(null, this.f15478l, Integer.valueOf(this.f15479m));
    }

    public final String toString() {
        return this.f15478l.getName();
    }
}
