package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;

/* loaded from: classes2.dex */
public final class pk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f8302a;

    /* renamed from: b, reason: collision with root package name */
    public String f8303b;

    /* renamed from: c, reason: collision with root package name */
    public a0 f8304c;

    /* renamed from: d, reason: collision with root package name */
    public ni.z f8305d;

    /* renamed from: e, reason: collision with root package name */
    public d f8306e;

    /* renamed from: f, reason: collision with root package name */
    public fl2 f8307f;

    /* renamed from: g, reason: collision with root package name */
    public String f8308g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f8309h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ fl2 f8310i;

    /* renamed from: j, reason: collision with root package name */
    public int f8311j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pk2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8310i = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8309h = obj;
        this.f8311j |= Integer.MIN_VALUE;
        return fl2.c(this.f8310i, null, null, null, this);
    }
}
