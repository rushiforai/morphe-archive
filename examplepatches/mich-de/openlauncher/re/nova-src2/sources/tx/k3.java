package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k3 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p3 f89843t;

    /* renamed from: u, reason: collision with root package name */
    public String f89844u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f89845v;

    /* renamed from: w, reason: collision with root package name */
    public int f89846w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89845v = obj;
        this.f89846w |= Integer.MIN_VALUE;
        p3 p3Var = p3.f89946a;
        return p3.a(null, this);
    }
}
