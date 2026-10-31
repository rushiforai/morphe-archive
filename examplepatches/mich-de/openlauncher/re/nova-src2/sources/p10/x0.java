package p10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class x0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.IntRef f81958t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f81959u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z0 f81960v;

    /* renamed from: w, reason: collision with root package name */
    public int f81961w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x0(z0 z0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81960v = z0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81959u = obj;
        this.f81961w |= Integer.MIN_VALUE;
        return z0.a(this.f81960v, this);
    }
}
