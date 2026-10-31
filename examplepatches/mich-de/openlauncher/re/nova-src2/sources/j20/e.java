package j20;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f68745t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f68746u;

    /* renamed from: v, reason: collision with root package name */
    public int f68747v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f68746u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68745t = obj;
        this.f68747v |= Integer.MIN_VALUE;
        Object objN = this.f68746u.n(this);
        return objN == CoroutineSingletons.f71806a ? objN : new Result(objN);
    }
}
