package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class t60 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public x60 f9786a;

    /* renamed from: b, reason: collision with root package name */
    public d f9787b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f9788c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ x60 f9789d;

    /* renamed from: e, reason: collision with root package name */
    public int f9790e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t60(x60 x60Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9789d = x60Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9788c = obj;
        this.f9790e |= Integer.MIN_VALUE;
        return this.f9789d.a(this);
    }
}
