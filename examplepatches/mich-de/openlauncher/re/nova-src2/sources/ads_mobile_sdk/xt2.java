package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class xt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f11824a;

    /* renamed from: b, reason: collision with root package name */
    public d f11825b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f11826c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ lu2 f11827d;

    /* renamed from: e, reason: collision with root package name */
    public int f11828e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xt2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11827d = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11826c = obj;
        this.f11828e |= Integer.MIN_VALUE;
        return this.f11827d.a(this);
    }
}
