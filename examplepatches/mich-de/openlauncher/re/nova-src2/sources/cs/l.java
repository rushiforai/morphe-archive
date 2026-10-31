package cs;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f47825t;

    /* renamed from: u, reason: collision with root package name */
    public int f47826u;

    /* renamed from: v, reason: collision with root package name */
    public w70.n f47827v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ m f47828w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(m mVar, Continuation continuation) {
        super(continuation);
        this.f47828w = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f47825t = obj;
        this.f47826u |= Integer.MIN_VALUE;
        return this.f47828w.emit(null, this);
    }
}
