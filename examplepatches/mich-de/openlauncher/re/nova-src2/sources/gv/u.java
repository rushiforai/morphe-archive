package gv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f57946t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f57947u;

    /* renamed from: v, reason: collision with root package name */
    public int f57948v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f57947u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57946t = obj;
        this.f57948v |= Integer.MIN_VALUE;
        Object objD = x.d(this.f57947u, null, null, null, null, null, null, null, this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
