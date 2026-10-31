package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class oe2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pe2 f7871a;

    /* renamed from: b, reason: collision with root package name */
    public wk0 f7872b;

    /* renamed from: c, reason: collision with root package name */
    public String f7873c;

    /* renamed from: d, reason: collision with root package name */
    public String f7874d;

    /* renamed from: e, reason: collision with root package name */
    public String f7875e;

    /* renamed from: f, reason: collision with root package name */
    public int f7876f;

    /* renamed from: g, reason: collision with root package name */
    public int f7877g;

    /* renamed from: h, reason: collision with root package name */
    public long f7878h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f7879i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ pe2 f7880j;

    /* renamed from: k, reason: collision with root package name */
    public int f7881k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oe2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7880j = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7879i = obj;
        this.f7881k |= Integer.MIN_VALUE;
        return pe2.b(this.f7880j, this);
    }
}
