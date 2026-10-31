package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class y03 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public z03 f11899a;

    /* renamed from: b, reason: collision with root package name */
    public String f11900b;

    /* renamed from: c, reason: collision with root package name */
    public d f11901c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11902d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ z03 f11903e;

    /* renamed from: f, reason: collision with root package name */
    public int f11904f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y03(z03 z03Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11903e = z03Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11902d = obj;
        this.f11904f |= Integer.MIN_VALUE;
        return z03.a(this.f11903e, (String) null, this);
    }
}
