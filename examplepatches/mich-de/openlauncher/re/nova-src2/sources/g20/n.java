package g20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public w f56959t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56960u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ w f56961v;

    /* renamed from: w, reason: collision with root package name */
    public int f56962w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56961v = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56960u = obj;
        this.f56962w |= Integer.MIN_VALUE;
        return this.f56961v.c(this);
    }
}
