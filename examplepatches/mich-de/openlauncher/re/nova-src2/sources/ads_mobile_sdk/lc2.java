package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class lc2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public mc2 f6201a;

    /* renamed from: b, reason: collision with root package name */
    public d f6202b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f6203c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ mc2 f6204d;

    /* renamed from: e, reason: collision with root package name */
    public int f6205e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lc2(mc2 mc2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6204d = mc2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6203c = obj;
        this.f6205e |= Integer.MIN_VALUE;
        return mc2.a(this.f6204d, this);
    }
}
