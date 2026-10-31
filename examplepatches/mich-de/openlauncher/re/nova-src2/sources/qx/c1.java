package qx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i1 f84456t;

    /* renamed from: u, reason: collision with root package name */
    public l f84457u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f84458v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i1 f84459w;

    /* renamed from: x, reason: collision with root package name */
    public int f84460x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84459w = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84458v = obj;
        this.f84460x |= Integer.MIN_VALUE;
        return i1.a(this.f84459w, null, null, this);
    }
}
