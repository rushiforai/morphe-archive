package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;

/* loaded from: classes2.dex */
public final class tk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f9974a;

    /* renamed from: b, reason: collision with root package name */
    public String f9975b;

    /* renamed from: c, reason: collision with root package name */
    public a0 f9976c;

    /* renamed from: d, reason: collision with root package name */
    public ni.z f9977d;

    /* renamed from: e, reason: collision with root package name */
    public d f9978e;

    /* renamed from: f, reason: collision with root package name */
    public fl2 f9979f;

    /* renamed from: g, reason: collision with root package name */
    public String f9980g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f9981h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ fl2 f9982i;

    /* renamed from: j, reason: collision with root package name */
    public int f9983j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tk2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9982i = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9981h = obj;
        this.f9983j |= Integer.MIN_VALUE;
        return fl2.d(this.f9982i, null, null, null, this);
    }
}
