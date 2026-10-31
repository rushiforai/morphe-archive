package cs;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f47814t;

    /* renamed from: u, reason: collision with root package name */
    public String f47815u;

    /* renamed from: v, reason: collision with root package name */
    public yw.a f47816v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f47817w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ p f47818x;

    /* renamed from: y, reason: collision with root package name */
    public int f47819y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f47818x = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f47817w = obj;
        this.f47819y |= Integer.MIN_VALUE;
        return this.f47818x.b(null, null, null, this);
    }
}
