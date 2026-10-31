package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class g4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f3626a;

    /* renamed from: b, reason: collision with root package name */
    public jl2 f3627b;

    /* renamed from: c, reason: collision with root package name */
    public kl2 f3628c;

    /* renamed from: d, reason: collision with root package name */
    public d f3629d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f3630e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ f5 f3631f;

    /* renamed from: g, reason: collision with root package name */
    public int f3632g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3631f = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3630e = obj;
        this.f3632g |= Integer.MIN_VALUE;
        return this.f3631f.a((jl2) null, this);
    }
}
