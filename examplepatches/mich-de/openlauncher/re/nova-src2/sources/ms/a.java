package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76625t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76626u;

    /* renamed from: v, reason: collision with root package name */
    public int f76627v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76626u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76625t = obj;
        this.f76627v |= Integer.MIN_VALUE;
        Object objC = this.f76626u.c(null, null, null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
