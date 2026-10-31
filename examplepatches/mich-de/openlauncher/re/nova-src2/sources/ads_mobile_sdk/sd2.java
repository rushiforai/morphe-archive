package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class sd2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pe2 f9531a;

    /* renamed from: b, reason: collision with root package name */
    public Ref.ObjectRef f9532b;

    /* renamed from: c, reason: collision with root package name */
    public Ref.ObjectRef f9533c;

    /* renamed from: d, reason: collision with root package name */
    public Object f9534d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f9535e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ pe2 f9536f;

    /* renamed from: g, reason: collision with root package name */
    public int f9537g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sd2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9536f = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9535e = obj;
        this.f9537g |= Integer.MIN_VALUE;
        return this.f9536f.a((qw2) null, (String) null, false, (ContinuationImpl) this);
    }
}
