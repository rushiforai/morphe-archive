package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gs1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public js1 f4047a;

    /* renamed from: b, reason: collision with root package name */
    public d f4048b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4049c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ js1 f4050d;

    /* renamed from: e, reason: collision with root package name */
    public int f4051e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gs1(js1 js1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4050d = js1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4049c = obj;
        this.f4051e |= Integer.MIN_VALUE;
        return js1.a(this.f4050d, this);
    }
}
