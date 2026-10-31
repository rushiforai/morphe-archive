package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ks extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f5945a;

    /* renamed from: b, reason: collision with root package name */
    public String f5946b;

    /* renamed from: c, reason: collision with root package name */
    public Object f5947c;

    /* renamed from: d, reason: collision with root package name */
    public d62 f5948d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f5949e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ ls f5950f;

    /* renamed from: g, reason: collision with root package name */
    public int f5951g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ks(ls lsVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5950f = lsVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5949e = obj;
        this.f5951g |= Integer.MIN_VALUE;
        return this.f5950f.d(this);
    }
}
