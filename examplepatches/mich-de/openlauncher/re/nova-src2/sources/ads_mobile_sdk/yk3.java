package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class yk3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f12184a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ wk3 f12185b;

    /* renamed from: c, reason: collision with root package name */
    public int f12186c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yk3(wk3 wk3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12185b = wk3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12184a = obj;
        this.f12186c |= Integer.MIN_VALUE;
        return this.f12185b.a((p5) null, this);
    }
}
