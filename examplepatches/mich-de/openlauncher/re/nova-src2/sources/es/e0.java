package es;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f52941t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.f0 f52942u;

    /* renamed from: v, reason: collision with root package name */
    public int f52943v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0(com.stripe.android.link.f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52942u = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52941t = obj;
        this.f52943v |= Integer.MIN_VALUE;
        Object objD = this.f52942u.d(null, null, this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
