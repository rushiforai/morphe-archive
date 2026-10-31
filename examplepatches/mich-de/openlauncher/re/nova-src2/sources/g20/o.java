package g20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public w f56963t;

    /* renamed from: u, reason: collision with root package name */
    public s80.a f56964u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56965v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ w f56966w;

    /* renamed from: x, reason: collision with root package name */
    public int f56967x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56966w = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56965v = obj;
        this.f56967x |= Integer.MIN_VALUE;
        return this.f56966w.f(null, this);
    }
}
