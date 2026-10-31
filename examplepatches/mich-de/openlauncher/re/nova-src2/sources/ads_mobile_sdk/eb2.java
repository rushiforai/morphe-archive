package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class eb2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fb2 f2834a;

    /* renamed from: b, reason: collision with root package name */
    public d f2835b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f2836c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ fb2 f2837d;

    /* renamed from: e, reason: collision with root package name */
    public int f2838e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public eb2(fb2 fb2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2837d = fb2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2836c = obj;
        this.f2838e |= Integer.MIN_VALUE;
        return this.f2837d.c(this);
    }
}
