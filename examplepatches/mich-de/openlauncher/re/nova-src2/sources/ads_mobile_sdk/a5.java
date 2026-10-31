package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a5 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f843a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f844b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f845c;

    /* renamed from: d, reason: collision with root package name */
    public d f846d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f847e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f848f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ f5 f849g;

    /* renamed from: h, reason: collision with root package name */
    public int f850h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a5(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f849g = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f848f = obj;
        this.f850h |= Integer.MIN_VALUE;
        return this.f849g.h(this);
    }
}
