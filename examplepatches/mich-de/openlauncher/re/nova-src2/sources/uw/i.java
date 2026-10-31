package uw;

import as.p;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f91597t;

    /* renamed from: u, reason: collision with root package name */
    public int f91598u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p f91599v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(p pVar, Continuation continuation) {
        super(continuation);
        this.f91599v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f91597t = obj;
        this.f91598u |= Integer.MIN_VALUE;
        return this.f91599v.emit(null, this);
    }
}
