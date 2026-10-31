package p10;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f81925t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f81926u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f81927v;

    /* renamed from: w, reason: collision with root package name */
    public int f81928w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(y yVar, Continuation continuation) {
        super(continuation);
        this.f81927v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81926u = obj;
        this.f81928w |= Integer.MIN_VALUE;
        return this.f81927v.b(this);
    }
}
