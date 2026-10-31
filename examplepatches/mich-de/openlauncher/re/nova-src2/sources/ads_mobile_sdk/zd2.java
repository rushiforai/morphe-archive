package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class zd2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pe2 f12521a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f12522b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ pe2 f12523c;

    /* renamed from: d, reason: collision with root package name */
    public int f12524d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zd2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12523c = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12522b = obj;
        this.f12524d |= Integer.MIN_VALUE;
        return this.f12523c.a(this);
    }
}
