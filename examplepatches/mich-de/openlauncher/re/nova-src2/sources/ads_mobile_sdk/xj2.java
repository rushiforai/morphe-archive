package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;

/* loaded from: classes.dex */
public final class xj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f11745a;

    /* renamed from: b, reason: collision with root package name */
    public String f11746b;

    /* renamed from: c, reason: collision with root package name */
    public a0 f11747c;

    /* renamed from: d, reason: collision with root package name */
    public ni.z f11748d;

    /* renamed from: e, reason: collision with root package name */
    public d f11749e;

    /* renamed from: f, reason: collision with root package name */
    public fl2 f11750f;

    /* renamed from: g, reason: collision with root package name */
    public String f11751g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f11752h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ fl2 f11753i;

    /* renamed from: j, reason: collision with root package name */
    public int f11754j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11753i = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11752h = obj;
        this.f11754j |= Integer.MIN_VALUE;
        return fl2.a(this.f11753i, null, null, null, this);
    }
}
