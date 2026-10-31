package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class f4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f3140a;

    /* renamed from: b, reason: collision with root package name */
    public xo2 f3141b;

    /* renamed from: c, reason: collision with root package name */
    public Ref.IntRef f3142c;

    /* renamed from: d, reason: collision with root package name */
    public Ref.BooleanRef f3143d;

    /* renamed from: e, reason: collision with root package name */
    public d f3144e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f3145f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ f5 f3146g;

    /* renamed from: h, reason: collision with root package name */
    public int f3147h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3146g = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3145f = obj;
        this.f3147h |= Integer.MIN_VALUE;
        return this.f3146g.a((xo2) null, this);
    }
}
