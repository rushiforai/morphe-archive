package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gs3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public is3 f4052a;

    /* renamed from: b, reason: collision with root package name */
    public qo3 f4053b;

    /* renamed from: c, reason: collision with root package name */
    public d f4054c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4055d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ is3 f4056e;

    /* renamed from: f, reason: collision with root package name */
    public int f4057f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gs3(is3 is3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4056e = is3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4055d = obj;
        this.f4057f |= Integer.MIN_VALUE;
        return is3.a(this.f4056e, null, this);
    }
}
