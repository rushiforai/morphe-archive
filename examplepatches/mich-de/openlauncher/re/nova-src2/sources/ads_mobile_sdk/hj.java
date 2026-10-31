package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4400a;

    /* renamed from: b, reason: collision with root package name */
    public String f4401b;

    /* renamed from: c, reason: collision with root package name */
    public String f4402c;

    /* renamed from: d, reason: collision with root package name */
    public d f4403d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f4404e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ wj f4405f;

    /* renamed from: g, reason: collision with root package name */
    public int f4406g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4405f = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4404e = obj;
        this.f4406g |= Integer.MIN_VALUE;
        return this.f4405f.a((String) null, (String) null, this);
    }
}
