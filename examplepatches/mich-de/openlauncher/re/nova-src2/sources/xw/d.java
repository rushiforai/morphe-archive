package xw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g f96455t;

    /* renamed from: u, reason: collision with root package name */
    public g f96456u;

    /* renamed from: v, reason: collision with root package name */
    public c80.a f96457v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f96458w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g f96459x;

    /* renamed from: y, reason: collision with root package name */
    public int f96460y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f96459x = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96458w = obj;
        this.f96460y |= Integer.MIN_VALUE;
        Object objA = this.f96459x.a(this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
