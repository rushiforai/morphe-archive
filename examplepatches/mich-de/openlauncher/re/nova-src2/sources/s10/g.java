package s10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h f86597t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f86598u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h f86599v;

    /* renamed from: w, reason: collision with root package name */
    public int f86600w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86599v = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86598u = obj;
        this.f86600w |= Integer.MIN_VALUE;
        return this.f86599v.c(null, this);
    }
}
