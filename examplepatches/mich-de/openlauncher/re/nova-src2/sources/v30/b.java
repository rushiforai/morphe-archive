package v30;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {
    public final /* synthetic */ c A;
    public int B;

    /* renamed from: t, reason: collision with root package name */
    public c f92043t;

    /* renamed from: u, reason: collision with root package name */
    public String f92044u;

    /* renamed from: v, reason: collision with root package name */
    public String[] f92045v;

    /* renamed from: w, reason: collision with root package name */
    public String f92046w;

    /* renamed from: x, reason: collision with root package name */
    public int f92047x;

    /* renamed from: y, reason: collision with root package name */
    public int f92048y;

    /* renamed from: z, reason: collision with root package name */
    public /* synthetic */ Object f92049z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.A = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92049z = obj;
        this.B |= Integer.MIN_VALUE;
        return this.A.a(null, this);
    }
}
