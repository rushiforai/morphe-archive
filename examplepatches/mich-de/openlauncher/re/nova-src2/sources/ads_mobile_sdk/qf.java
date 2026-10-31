package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class qf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ag f8614a;

    /* renamed from: b, reason: collision with root package name */
    public String f8615b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8616c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ag f8617d;

    /* renamed from: e, reason: collision with root package name */
    public int f8618e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8617d = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8616c = obj;
        this.f8618e |= Integer.MIN_VALUE;
        return this.f8617d.a((String) null, (kv0) null, this);
    }
}
