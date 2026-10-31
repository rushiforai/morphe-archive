package dv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class v extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public w f49649t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f49650u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ w f49651v;

    /* renamed from: w, reason: collision with root package name */
    public int f49652w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49651v = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49650u = obj;
        this.f49652w |= Integer.MIN_VALUE;
        return this.f49651v.g(this);
    }
}
