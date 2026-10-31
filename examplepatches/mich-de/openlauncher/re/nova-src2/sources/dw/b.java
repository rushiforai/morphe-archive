package dw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c f49672t;

    /* renamed from: u, reason: collision with root package name */
    public int f49673u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f49674v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ c f49675w;

    /* renamed from: x, reason: collision with root package name */
    public int f49676x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49675w = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Exception {
        this.f49674v = obj;
        this.f49676x |= Integer.MIN_VALUE;
        Object objB = this.f49675w.b(0, null, null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
