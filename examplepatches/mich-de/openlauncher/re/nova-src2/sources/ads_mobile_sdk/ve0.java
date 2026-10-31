package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ve0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public rf0 f10756a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f10757b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f10758c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f10759d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ rf0 f10760e;

    /* renamed from: f, reason: collision with root package name */
    public int f10761f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ve0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10760e = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10759d = obj;
        this.f10761f |= Integer.MIN_VALUE;
        return rf0.a(this.f10760e, (String) null, (String) null, (com.google.gson.r) null, (mi3) null, this);
    }
}
