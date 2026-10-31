package uu;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f91551t;

    /* renamed from: u, reason: collision with root package name */
    public int f91552u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f91553v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f91553v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f91551t = obj;
        this.f91552u |= Integer.MIN_VALUE;
        return this.f91553v.emit(null, this);
    }
}
