package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class lf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ag f6220a;

    /* renamed from: b, reason: collision with root package name */
    public d f6221b;

    /* renamed from: c, reason: collision with root package name */
    public long f6222c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f6223d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ag f6224e;

    /* renamed from: f, reason: collision with root package name */
    public int f6225f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6224e = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6223d = obj;
        this.f6225f |= Integer.MIN_VALUE;
        return ag.a(this.f6224e, 0L, this);
    }
}
