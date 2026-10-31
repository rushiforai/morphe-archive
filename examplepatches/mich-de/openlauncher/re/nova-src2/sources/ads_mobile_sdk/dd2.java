package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class dd2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public hd2 f2460a;

    /* renamed from: b, reason: collision with root package name */
    public ni.k f2461b;

    /* renamed from: c, reason: collision with root package name */
    public qw2 f2462c;

    /* renamed from: d, reason: collision with root package name */
    public String f2463d;

    /* renamed from: e, reason: collision with root package name */
    public ue2 f2464e;

    /* renamed from: f, reason: collision with root package name */
    public mi3 f2465f;

    /* renamed from: g, reason: collision with root package name */
    public yc2 f2466g;

    /* renamed from: h, reason: collision with root package name */
    public th3 f2467h;

    /* renamed from: i, reason: collision with root package name */
    public th3 f2468i;

    /* renamed from: j, reason: collision with root package name */
    public int f2469j;

    /* renamed from: k, reason: collision with root package name */
    public /* synthetic */ Object f2470k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ hd2 f2471l;

    /* renamed from: m, reason: collision with root package name */
    public int f2472m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dd2(hd2 hd2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2471l = hd2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2470k = obj;
        this.f2472m |= Integer.MIN_VALUE;
        return this.f2471l.a(null, null, null, 0, null, this);
    }
}
