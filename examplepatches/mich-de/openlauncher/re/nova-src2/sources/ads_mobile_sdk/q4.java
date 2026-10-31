package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class q4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8486a;

    /* renamed from: b, reason: collision with root package name */
    public d f8487b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8488c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f5 f8489d;

    /* renamed from: e, reason: collision with root package name */
    public int f8490e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8489d = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8488c = obj;
        this.f8490e |= Integer.MIN_VALUE;
        return f5.h(this.f8489d, this);
    }
}
