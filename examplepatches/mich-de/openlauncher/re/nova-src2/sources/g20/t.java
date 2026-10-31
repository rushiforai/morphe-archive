package g20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class t extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public w f56985t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56986u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ w f56987v;

    /* renamed from: w, reason: collision with root package name */
    public int f56988w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56987v = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56986u = obj;
        this.f56988w |= Integer.MIN_VALUE;
        return this.f56987v.j(this);
    }
}
