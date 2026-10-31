package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class q62 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8498a;

    /* renamed from: b, reason: collision with root package name */
    public d f8499b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8500c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w62 f8501d;

    /* renamed from: e, reason: collision with root package name */
    public int f8502e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q62(w62 w62Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8501d = w62Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8500c = obj;
        this.f8502e |= Integer.MIN_VALUE;
        return w62.c(this.f8501d, this);
    }
}
