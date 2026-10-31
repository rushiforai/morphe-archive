package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class cv1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public String f2035a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f2036b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ iv1 f2037c;

    /* renamed from: d, reason: collision with root package name */
    public int f2038d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cv1(iv1 iv1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2037c = iv1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2036b = obj;
        this.f2038d |= Integer.MIN_VALUE;
        return this.f2037c.b(null, this);
    }
}
