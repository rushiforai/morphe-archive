package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class fw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iw2 f3529a;

    /* renamed from: b, reason: collision with root package name */
    public String f3530b;

    /* renamed from: c, reason: collision with root package name */
    public d f3531c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3532d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ iw2 f3533e;

    /* renamed from: f, reason: collision with root package name */
    public int f3534f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fw2(iw2 iw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3533e = iw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3532d = obj;
        this.f3534f |= Integer.MIN_VALUE;
        return iw2.d(this.f3533e, null, null, this);
    }
}
