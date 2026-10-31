package fv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56096t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i f56097u;

    /* renamed from: v, reason: collision with root package name */
    public int f56098v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56097u = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56096t = obj;
        this.f56098v |= Integer.MIN_VALUE;
        Object objC = this.f56097u.c(null, null, false, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
