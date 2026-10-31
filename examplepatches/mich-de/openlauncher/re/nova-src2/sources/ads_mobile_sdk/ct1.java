package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ct1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ft1 f2012a;

    /* renamed from: b, reason: collision with root package name */
    public d f2013b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f2014c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ft1 f2015d;

    /* renamed from: e, reason: collision with root package name */
    public int f2016e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ct1(ft1 ft1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2015d = ft1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2014c = obj;
        this.f2016e |= Integer.MIN_VALUE;
        return this.f2015d.a(this);
    }
}
