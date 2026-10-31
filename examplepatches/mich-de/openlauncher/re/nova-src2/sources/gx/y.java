package gx;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class y extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f58207t;

    /* renamed from: u, reason: collision with root package name */
    public int f58208u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v f58209v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(v vVar, Continuation continuation) {
        super(continuation);
        this.f58209v = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58207t = obj;
        this.f58208u |= Integer.MIN_VALUE;
        return this.f58209v.emit(null, this);
    }
}
