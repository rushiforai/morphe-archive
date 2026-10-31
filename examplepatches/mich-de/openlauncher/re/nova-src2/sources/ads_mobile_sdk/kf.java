package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class kf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ag f5720a;

    /* renamed from: b, reason: collision with root package name */
    public d f5721b;

    /* renamed from: c, reason: collision with root package name */
    public long f5722c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f5723d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ag f5724e;

    /* renamed from: f, reason: collision with root package name */
    public int f5725f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5724e = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5723d = obj;
        this.f5725f |= Integer.MIN_VALUE;
        return this.f5724e.r(this);
    }
}
