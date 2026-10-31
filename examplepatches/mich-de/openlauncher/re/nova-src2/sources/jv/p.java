package jv;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f70116t;

    /* renamed from: u, reason: collision with root package name */
    public int f70117u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f70118v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f70118v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f70116t = obj;
        this.f70117u |= Integer.MIN_VALUE;
        return this.f70118v.emit(null, this);
    }
}
