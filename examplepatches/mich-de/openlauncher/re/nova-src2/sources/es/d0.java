package es;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f52933t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.f0 f52934u;

    /* renamed from: v, reason: collision with root package name */
    public int f52935v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(com.stripe.android.link.f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52934u = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52933t = obj;
        this.f52935v |= Integer.MIN_VALUE;
        Object objC = this.f52934u.c(null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
