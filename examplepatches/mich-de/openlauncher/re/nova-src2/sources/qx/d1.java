package qx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i1 f84463t;

    /* renamed from: u, reason: collision with root package name */
    public l f84464u;

    /* renamed from: v, reason: collision with root package name */
    public Object f84465v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f84466w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ i1 f84467x;

    /* renamed from: y, reason: collision with root package name */
    public int f84468y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84467x = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84466w = obj;
        this.f84468y |= Integer.MIN_VALUE;
        return this.f84467x.m(null, null, this);
    }
}
