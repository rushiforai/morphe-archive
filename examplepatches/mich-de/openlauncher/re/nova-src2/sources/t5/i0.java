package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class i0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k0 f88607t;

    /* renamed from: u, reason: collision with root package name */
    public f0 f88608u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f88609v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f88610w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ k0 f88611x;

    /* renamed from: y, reason: collision with root package name */
    public int f88612y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i0(k0 k0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88611x = k0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88610w = obj;
        this.f88612y |= Integer.MIN_VALUE;
        return this.f88611x.a(null, this);
    }
}
