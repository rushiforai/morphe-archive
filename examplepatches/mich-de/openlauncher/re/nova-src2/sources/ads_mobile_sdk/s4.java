package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class s4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f9408a;

    /* renamed from: b, reason: collision with root package name */
    public d f9409b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f9410c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f5 f9411d;

    /* renamed from: e, reason: collision with root package name */
    public int f9412e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9411d = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9410c = obj;
        this.f9412e |= Integer.MIN_VALUE;
        return f5.j(this.f9411d, this);
    }
}
