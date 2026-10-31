package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55802t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f55803u;

    /* renamed from: v, reason: collision with root package name */
    public int f55804v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55803u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55802t = obj;
        this.f55804v |= Integer.MIN_VALUE;
        Object objM = this.f55803u.m(false, this);
        return objM == CoroutineSingletons.f71806a ? objM : new Result(objM);
    }
}
