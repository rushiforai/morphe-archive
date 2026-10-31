package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class zw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ax2 f12706a;

    /* renamed from: b, reason: collision with root package name */
    public String f12707b;

    /* renamed from: c, reason: collision with root package name */
    public t70.r f12708c;

    /* renamed from: d, reason: collision with root package name */
    public d f12709d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f12710e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ ax2 f12711f;

    /* renamed from: g, reason: collision with root package name */
    public int f12712g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zw2(ax2 ax2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12711f = ax2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12710e = obj;
        this.f12712g |= Integer.MIN_VALUE;
        return this.f12711f.a((String) null, (t70.r) null, this);
    }
}
