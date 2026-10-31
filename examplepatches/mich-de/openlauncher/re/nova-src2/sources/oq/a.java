package oq;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c f80584t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f80585u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c f80586v;

    /* renamed from: w, reason: collision with root package name */
    public int f80587w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f80586v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80585u = obj;
        this.f80587w |= Integer.MIN_VALUE;
        return this.f80586v.b(null, null, this);
    }
}
