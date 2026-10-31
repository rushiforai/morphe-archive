package gu;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f57822t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f57823u;

    /* renamed from: v, reason: collision with root package name */
    public int f57824v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f57823u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57822t = obj;
        this.f57824v |= Integer.MIN_VALUE;
        Object objA = this.f57823u.a(null, null, null, null, null, null, null, null, null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
