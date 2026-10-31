package v5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import m90.z;

/* loaded from: classes2.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h f92083t;

    /* renamed from: u, reason: collision with root package name */
    public Object f92084u;

    /* renamed from: v, reason: collision with root package name */
    public z f92085v;

    /* renamed from: w, reason: collision with root package name */
    public Object f92086w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f92087x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ h f92088y;

    /* renamed from: z, reason: collision with root package name */
    public int f92089z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f92088y = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92087x = obj;
        this.f92089z |= Integer.MIN_VALUE;
        return this.f92088y.d(null, this);
    }
}
