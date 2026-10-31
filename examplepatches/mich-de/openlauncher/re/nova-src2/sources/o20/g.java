package o20;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public b6.b f79419t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f79420u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f79421v;

    /* renamed from: w, reason: collision with root package name */
    public int f79422w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(l lVar, Continuation continuation) {
        super(continuation);
        this.f79421v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f79420u = obj;
        this.f79422w |= Integer.MIN_VALUE;
        return this.f79421v.a(null, null, this);
    }
}
