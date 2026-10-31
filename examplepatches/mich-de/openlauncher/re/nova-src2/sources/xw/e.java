package xw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g f96461t;

    /* renamed from: u, reason: collision with root package name */
    public g f96462u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f96463v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ g f96464w;

    /* renamed from: x, reason: collision with root package name */
    public int f96465x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f96464w = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96463v = obj;
        this.f96465x |= Integer.MIN_VALUE;
        Object objB = this.f96464w.b(this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
