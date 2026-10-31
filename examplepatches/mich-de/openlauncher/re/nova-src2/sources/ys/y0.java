package ys;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class y0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e1 f97621t;

    /* renamed from: u, reason: collision with root package name */
    public String f97622u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f97623v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f97624w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ e1 f97625x;

    /* renamed from: y, reason: collision with root package name */
    public int f97626y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y0(e1 e1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f97625x = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f97624w = obj;
        this.f97626y |= Integer.MIN_VALUE;
        return this.f97625x.i(null, this, false);
    }
}
