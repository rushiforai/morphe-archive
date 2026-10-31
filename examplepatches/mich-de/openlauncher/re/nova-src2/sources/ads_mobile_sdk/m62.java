package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class m62 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f7023a;

    /* renamed from: b, reason: collision with root package name */
    public d f7024b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7025c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w62 f7026d;

    /* renamed from: e, reason: collision with root package name */
    public int f7027e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m62(w62 w62Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7026d = w62Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7025c = obj;
        this.f7027e |= Integer.MIN_VALUE;
        return w62.a(this.f7026d, this);
    }
}
