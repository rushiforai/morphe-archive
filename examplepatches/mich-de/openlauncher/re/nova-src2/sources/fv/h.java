package fv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i f56115t;

    /* renamed from: u, reason: collision with root package name */
    public String f56116u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56117v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i f56118w;

    /* renamed from: x, reason: collision with root package name */
    public int f56119x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56118w = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56117v = obj;
        this.f56119x |= Integer.MIN_VALUE;
        Object objF = this.f56118w.f(null, null, null, this);
        return objF == CoroutineSingletons.f71806a ? objF : new Result(objF);
    }
}
