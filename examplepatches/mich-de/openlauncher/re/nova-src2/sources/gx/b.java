package gx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d f58019t;

    /* renamed from: u, reason: collision with root package name */
    public String f58020u;

    /* renamed from: v, reason: collision with root package name */
    public c0 f58021v;

    /* renamed from: w, reason: collision with root package name */
    public c80.d f58022w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f58023x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ d f58024y;

    /* renamed from: z, reason: collision with root package name */
    public int f58025z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58024y = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58023x = obj;
        this.f58025z |= Integer.MIN_VALUE;
        return this.f58024y.b(null, null, this);
    }
}
