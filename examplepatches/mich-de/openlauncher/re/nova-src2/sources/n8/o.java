package n8;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f78002t;

    /* renamed from: u, reason: collision with root package name */
    public int f78003u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p f78004v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(p pVar, Continuation continuation) {
        super(continuation);
        this.f78004v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f78002t = obj;
        this.f78003u |= Integer.MIN_VALUE;
        return this.f78004v.emit(null, this);
    }
}
