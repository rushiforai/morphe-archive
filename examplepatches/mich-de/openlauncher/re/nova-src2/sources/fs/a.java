package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f55723t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f55724u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f55725v;

    /* renamed from: w, reason: collision with root package name */
    public int f55726w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55725v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55724u = obj;
        this.f55726w |= Integer.MIN_VALUE;
        Object objA = this.f55725v.a(null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
