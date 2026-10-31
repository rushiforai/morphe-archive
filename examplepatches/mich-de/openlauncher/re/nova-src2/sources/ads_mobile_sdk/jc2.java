package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class jc2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public mc2 f5220a;

    /* renamed from: b, reason: collision with root package name */
    public d f5221b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5222c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ mc2 f5223d;

    /* renamed from: e, reason: collision with root package name */
    public int f5224e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jc2(mc2 mc2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5223d = mc2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5222c = obj;
        this.f5224e |= Integer.MIN_VALUE;
        return mc2.b(this.f5223d, this);
    }
}
