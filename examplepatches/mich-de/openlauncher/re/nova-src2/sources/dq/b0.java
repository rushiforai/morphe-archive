package dq;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49295t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e0 f49296u;

    /* renamed from: v, reason: collision with root package name */
    public int f49297v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(e0 e0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49296u = e0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49295t = obj;
        this.f49297v |= Integer.MIN_VALUE;
        Object objC = this.f49296u.c(null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
