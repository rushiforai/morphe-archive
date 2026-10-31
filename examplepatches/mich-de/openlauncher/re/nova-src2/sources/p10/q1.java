package p10;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f81879t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ r1 f81880u;

    /* renamed from: v, reason: collision with root package name */
    public int f81881v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q1(r1 r1Var, Continuation continuation) {
        super(continuation);
        this.f81880u = r1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81879t = obj;
        this.f81881v |= Integer.MIN_VALUE;
        return r1.a(this.f81880u, null, this);
    }
}
