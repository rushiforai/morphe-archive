package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class xe0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public rf0 f11700a;

    /* renamed from: b, reason: collision with root package name */
    public rw0 f11701b;

    /* renamed from: c, reason: collision with root package name */
    public rf0 f11702c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11703d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ rf0 f11704e;

    /* renamed from: f, reason: collision with root package name */
    public int f11705f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xe0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11704e = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11703d = obj;
        this.f11705f |= Integer.MIN_VALUE;
        return this.f11704e.c(this);
    }
}
