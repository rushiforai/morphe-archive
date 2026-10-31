package xw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f96466t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g f96467u;

    /* renamed from: v, reason: collision with root package name */
    public int f96468v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f96467u = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96466t = obj;
        this.f96468v |= Integer.MIN_VALUE;
        Object objC = this.f96467u.c(this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
