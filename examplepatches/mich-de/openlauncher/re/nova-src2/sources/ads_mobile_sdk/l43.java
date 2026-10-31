package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class l43 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public q43 f6070a;

    /* renamed from: b, reason: collision with root package name */
    public Object f6071b;

    /* renamed from: c, reason: collision with root package name */
    public d f6072c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f6073d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ q43 f6074e;

    /* renamed from: f, reason: collision with root package name */
    public int f6075f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l43(q43 q43Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6074e = q43Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6073d = obj;
        this.f6075f |= Integer.MIN_VALUE;
        return q43.a(this.f6074e, this);
    }
}
