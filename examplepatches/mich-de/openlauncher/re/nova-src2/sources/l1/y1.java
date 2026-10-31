package l1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class y1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public z1 f74287t;

    /* renamed from: u, reason: collision with root package name */
    public long f74288u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f74289v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ z1 f74290w;

    /* renamed from: x, reason: collision with root package name */
    public int f74291x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y1(z1 z1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f74290w = z1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f74289v = obj;
        this.f74291x |= Integer.MIN_VALUE;
        return this.f74290w.b(0L, 0L, this);
    }
}
