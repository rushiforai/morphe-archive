package aq;

import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final class i extends m0 {

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Method f15473k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f15474l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Class f15475m;

    public i(Method method, Object obj, Class cls) {
        this.f15473k = method;
        this.f15474l = obj;
        this.f15475m = cls;
    }

    @Override // aq.m0
    public final Object e() {
        return this.f15473k.invoke(this.f15474l, this.f15475m);
    }

    public final String toString() {
        return this.f15475m.getName();
    }
}
