package g20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public w f56968t;

    /* renamed from: u, reason: collision with root package name */
    public w f56969u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56970v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ w f56971w;

    /* renamed from: x, reason: collision with root package name */
    public int f56972x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56971w = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56970v = obj;
        this.f56972x |= Integer.MIN_VALUE;
        return this.f56971w.g(this);
    }
}
