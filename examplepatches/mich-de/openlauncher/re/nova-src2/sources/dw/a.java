package dw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c f49668t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f49669u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c f49670v;

    /* renamed from: w, reason: collision with root package name */
    public int f49671w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49670v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49669u = obj;
        this.f49671w |= Integer.MIN_VALUE;
        Object objA = this.f49670v.a(null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
