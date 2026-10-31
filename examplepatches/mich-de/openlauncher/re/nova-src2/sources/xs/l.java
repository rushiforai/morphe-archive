package xs;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public o f96277t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f96278u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ o f96279v;

    /* renamed from: w, reason: collision with root package name */
    public int f96280w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(o oVar, Continuation continuation) {
        super(continuation);
        this.f96279v = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96278u = obj;
        this.f96280w |= Integer.MIN_VALUE;
        return this.f96279v.h(null, this);
    }
}
