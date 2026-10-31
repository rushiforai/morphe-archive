package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ik0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4812a;

    /* renamed from: b, reason: collision with root package name */
    public re1 f4813b;

    /* renamed from: c, reason: collision with root package name */
    public d f4814c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4815d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ tk0 f4816e;

    /* renamed from: f, reason: collision with root package name */
    public int f4817f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ik0(tk0 tk0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4816e = tk0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4815d = obj;
        this.f4817f |= Integer.MIN_VALUE;
        return this.f4816e.c(null, this);
    }
}
