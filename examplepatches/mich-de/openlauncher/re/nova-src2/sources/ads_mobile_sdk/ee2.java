package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ee2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f2849a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f2850b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f2851c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ pe2 f2852d;

    /* renamed from: e, reason: collision with root package name */
    public int f2853e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ee2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2852d = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2851c = obj;
        this.f2853e |= Integer.MIN_VALUE;
        return pe2.a(this.f2852d, (ue2) null, this);
    }
}
