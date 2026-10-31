package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class bd2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public hd2 f1374a;

    /* renamed from: b, reason: collision with root package name */
    public ni.k f1375b;

    /* renamed from: c, reason: collision with root package name */
    public qw2 f1376c;

    /* renamed from: d, reason: collision with root package name */
    public String f1377d;

    /* renamed from: e, reason: collision with root package name */
    public ue2 f1378e;

    /* renamed from: f, reason: collision with root package name */
    public int f1379f;

    /* renamed from: g, reason: collision with root package name */
    public int f1380g;

    /* renamed from: h, reason: collision with root package name */
    public int f1381h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f1382i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ hd2 f1383j;

    /* renamed from: k, reason: collision with root package name */
    public int f1384k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bd2(hd2 hd2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1383j = hd2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1382i = obj;
        this.f1384k |= Integer.MIN_VALUE;
        return hd2.a(this.f1383j, (ni.k) null, (qw2) null, (String) null, 0, (ue2) null, this);
    }
}
