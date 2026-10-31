package gx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d f58045t;

    /* renamed from: u, reason: collision with root package name */
    public String f58046u;

    /* renamed from: v, reason: collision with root package name */
    public dx.f f58047v;

    /* renamed from: w, reason: collision with root package name */
    public c80.d f58048w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f58049x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ d f58050y;

    /* renamed from: z, reason: collision with root package name */
    public int f58051z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58050y = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58049x = obj;
        this.f58051z |= Integer.MIN_VALUE;
        return this.f58050y.c(null, null, this);
    }
}
