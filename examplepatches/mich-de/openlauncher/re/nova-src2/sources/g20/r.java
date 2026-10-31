package g20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;

/* loaded from: classes4.dex */
public final class r extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public w f56977t;

    /* renamed from: u, reason: collision with root package name */
    public ExternalLink f56978u;

    /* renamed from: v, reason: collision with root package name */
    public r80.d f56979v;

    /* renamed from: w, reason: collision with root package name */
    public String f56980w;

    /* renamed from: x, reason: collision with root package name */
    public long f56981x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f56982y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ w f56983z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56983z = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56982y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f56983z.h(null, null, null, 0L, this);
    }
}
