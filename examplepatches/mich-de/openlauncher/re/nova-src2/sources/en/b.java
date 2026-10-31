package en;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c80.a f52811t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f52812u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c f52813v;

    /* renamed from: w, reason: collision with root package name */
    public int f52814w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52813v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52812u = obj;
        this.f52814w |= Integer.MIN_VALUE;
        return this.f52813v.d(this);
    }
}
