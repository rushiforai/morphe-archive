package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class qx1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public String f8875a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f8876b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c7 f8877c;

    /* renamed from: d, reason: collision with root package name */
    public int f8878d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qx1(c7 c7Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8877c = c7Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8876b = obj;
        this.f8878d |= Integer.MIN_VALUE;
        return c7.a(this.f8877c, (com.google.gson.r) null, this);
    }
}
