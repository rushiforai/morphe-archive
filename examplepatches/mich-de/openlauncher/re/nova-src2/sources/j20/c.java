package j20;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f68739t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f68740u;

    /* renamed from: v, reason: collision with root package name */
    public int f68741v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f68740u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68739t = obj;
        this.f68741v |= Integer.MIN_VALUE;
        Object objL = this.f68740u.l(this);
        return objL == CoroutineSingletons.f71806a ? objL : new Result(objL);
    }
}
