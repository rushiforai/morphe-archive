package vx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f93331t;

    /* renamed from: u, reason: collision with root package name */
    public Object f93332u;

    /* renamed from: v, reason: collision with root package name */
    public c80.a f93333v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f93334w;

    /* renamed from: x, reason: collision with root package name */
    public int f93335x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93334w = obj;
        this.f93335x |= Integer.MIN_VALUE;
        p pVar = p.f93347a;
        return p.a(null, null, this);
    }
}
