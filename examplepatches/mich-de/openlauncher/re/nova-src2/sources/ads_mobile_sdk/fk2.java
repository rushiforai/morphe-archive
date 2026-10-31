package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;

/* loaded from: classes2.dex */
public final class fk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f3375a;

    /* renamed from: b, reason: collision with root package name */
    public String f3376b;

    /* renamed from: c, reason: collision with root package name */
    public a0 f3377c;

    /* renamed from: d, reason: collision with root package name */
    public ni.z f3378d;

    /* renamed from: e, reason: collision with root package name */
    public d f3379e;

    /* renamed from: f, reason: collision with root package name */
    public fl2 f3380f;

    /* renamed from: g, reason: collision with root package name */
    public String f3381g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f3382h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ fl2 f3383i;

    /* renamed from: j, reason: collision with root package name */
    public int f3384j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fk2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3383i = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3382h = obj;
        this.f3384j |= Integer.MIN_VALUE;
        return fl2.b(this.f3383i, null, null, null, this);
    }
}
