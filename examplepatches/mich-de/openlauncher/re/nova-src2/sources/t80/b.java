package t80;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c f88890t;

    /* renamed from: u, reason: collision with root package name */
    public int f88891u;

    /* renamed from: v, reason: collision with root package name */
    public long f88892v;

    /* renamed from: w, reason: collision with root package name */
    public long f88893w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f88894x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ c f88895y;

    /* renamed from: z, reason: collision with root package name */
    public int f88896z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88895y = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88894x = obj;
        this.f88896z |= Integer.MIN_VALUE;
        return this.f88895y.g(0, this);
    }
}
