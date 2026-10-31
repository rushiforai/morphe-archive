package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class z61 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b71 f12455a;

    /* renamed from: b, reason: collision with root package name */
    public d f12456b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f12457c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b71 f12458d;

    /* renamed from: e, reason: collision with root package name */
    public int f12459e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z61(b71 b71Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12458d = b71Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12457c = obj;
        this.f12459e |= Integer.MIN_VALUE;
        return this.f12458d.a(this);
    }
}
