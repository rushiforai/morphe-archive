package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class o43 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public q43 f7760a;

    /* renamed from: b, reason: collision with root package name */
    public k43 f7761b;

    /* renamed from: c, reason: collision with root package name */
    public d f7762c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f7763d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ q43 f7764e;

    /* renamed from: f, reason: collision with root package name */
    public int f7765f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o43(q43 q43Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7764e = q43Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7763d = obj;
        this.f7765f |= Integer.MIN_VALUE;
        return q43.a(this.f7764e, null, this);
    }
}
