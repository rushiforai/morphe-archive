package b10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k2 f16739t;

    /* renamed from: u, reason: collision with root package name */
    public w70.i2 f16740u;

    /* renamed from: v, reason: collision with root package name */
    public w70.i2 f16741v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f16742w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ k2 f16743x;

    /* renamed from: y, reason: collision with root package name */
    public int f16744y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j2(k2 k2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f16743x = k2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f16742w = obj;
        this.f16744y |= Integer.MIN_VALUE;
        return this.f16743x.c(this);
    }
}
