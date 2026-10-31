package j20;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f68742t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f68743u;

    /* renamed from: v, reason: collision with root package name */
    public int f68744v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f68743u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68742t = obj;
        this.f68744v |= Integer.MIN_VALUE;
        Object objM = this.f68743u.m(this);
        return objM == CoroutineSingletons.f71806a ? objM : new Result(objM);
    }
}
