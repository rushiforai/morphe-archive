package p0;

import c0.l1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public int f81209t;

    /* renamed from: u, reason: collision with root package name */
    public l1 f81210u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f81211v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ y f81212w;

    /* renamed from: x, reason: collision with root package name */
    public int f81213x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(y yVar, Continuation continuation) {
        super(continuation);
        this.f81212w = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81211v = obj;
        this.f81213x |= Integer.MIN_VALUE;
        return this.f81212w.f(0, null, this);
    }
}
