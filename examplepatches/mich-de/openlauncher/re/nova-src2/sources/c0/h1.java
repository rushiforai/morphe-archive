package c0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class h1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f18820t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f18821u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ i1 f18822v;

    /* renamed from: w, reason: collision with root package name */
    public int f18823w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f18822v = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f18821u = obj;
        this.f18823w |= Integer.MIN_VALUE;
        return i1.m(this.f18822v, this);
    }
}
