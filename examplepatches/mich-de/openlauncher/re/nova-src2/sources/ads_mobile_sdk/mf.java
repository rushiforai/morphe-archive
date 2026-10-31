package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class mf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f7194a;

    /* renamed from: b, reason: collision with root package name */
    public d f7195b;

    /* renamed from: c, reason: collision with root package name */
    public long f7196c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f7197d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ag f7198e;

    /* renamed from: f, reason: collision with root package name */
    public int f7199f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7198e = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7197d = obj;
        this.f7199f |= Integer.MIN_VALUE;
        return ag.b(this.f7198e, 0L, this);
    }
}
