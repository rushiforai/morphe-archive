package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class za2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fb2 f12501a;

    /* renamed from: b, reason: collision with root package name */
    public Object f12502b;

    /* renamed from: c, reason: collision with root package name */
    public d f12503c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f12504d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ fb2 f12505e;

    /* renamed from: f, reason: collision with root package name */
    public int f12506f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public za2(fb2 fb2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12505e = fb2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12504d = obj;
        this.f12506f |= Integer.MIN_VALUE;
        return this.f12505e.b(this);
    }
}
