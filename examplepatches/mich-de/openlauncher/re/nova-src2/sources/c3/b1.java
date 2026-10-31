package c3;

import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class b1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f19227t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ d1 f19228u;

    /* renamed from: v, reason: collision with root package name */
    public int f19229v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b1(d1 d1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f19228u = d1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f19227t = obj;
        this.f19229v |= Integer.MIN_VALUE;
        this.f19228u.a(null, this);
        return CoroutineSingletons.f71806a;
    }
}
