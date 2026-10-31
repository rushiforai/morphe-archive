package m00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75542t;

    /* renamed from: u, reason: collision with root package name */
    public int f75543u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z f75544v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f0(z zVar, Continuation continuation) {
        super(continuation);
        this.f75544v = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75542t = obj;
        this.f75543u |= Integer.MIN_VALUE;
        return this.f75544v.emit(null, this);
    }
}
