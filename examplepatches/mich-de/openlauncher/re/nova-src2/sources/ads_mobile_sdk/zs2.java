package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class zs2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f12642a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ bt2 f12643b;

    /* renamed from: c, reason: collision with root package name */
    public int f12644c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zs2(bt2 bt2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12643b = bt2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12642a = obj;
        this.f12644c |= Integer.MIN_VALUE;
        return this.f12643b.a(false, (Continuation) this);
    }
}
