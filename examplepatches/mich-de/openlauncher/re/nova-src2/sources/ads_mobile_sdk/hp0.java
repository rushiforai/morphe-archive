package ads_mobile_sdk;

import b.r1;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hp0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public jp0 f4469a;

    /* renamed from: b, reason: collision with root package name */
    public r1 f4470b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4471c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ jp0 f4472d;

    /* renamed from: e, reason: collision with root package name */
    public int f4473e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hp0(jp0 jp0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4472d = jp0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4471c = obj;
        this.f4473e |= Integer.MIN_VALUE;
        return jp0.b(this.f4472d, (r1) null, this);
    }
}
