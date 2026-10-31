package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class sk3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f9594a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ dz1 f9595b;

    /* renamed from: c, reason: collision with root package name */
    public int f9596c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sk3(dz1 dz1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9595b = dz1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9594a = obj;
        this.f9596c |= Integer.MIN_VALUE;
        return this.f9595b.a((p5) null, (ContinuationImpl) this);
    }
}
