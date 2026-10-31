package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class cw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iw2 f2082a;

    /* renamed from: b, reason: collision with root package name */
    public String f2083b;

    /* renamed from: c, reason: collision with root package name */
    public d f2084c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2085d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ iw2 f2086e;

    /* renamed from: f, reason: collision with root package name */
    public int f2087f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cw2(iw2 iw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2086e = iw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2085d = obj;
        this.f2087f |= Integer.MIN_VALUE;
        return iw2.a(this.f2086e, null, null, this);
    }
}
