package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class y0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public as.p f94081t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f94082u;

    /* renamed from: v, reason: collision with root package name */
    public int f94083v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ as.p f94084w;

    /* renamed from: x, reason: collision with root package name */
    public Object f94085x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y0(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f94084w = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94082u = obj;
        this.f94083v |= Integer.MIN_VALUE;
        return this.f94084w.emit(null, this);
    }
}
