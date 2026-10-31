package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class p62 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8113a;

    /* renamed from: b, reason: collision with root package name */
    public d f8114b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8115c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w62 f8116d;

    /* renamed from: e, reason: collision with root package name */
    public int f8117e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p62(w62 w62Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8116d = w62Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8115c = obj;
        this.f8117e |= Integer.MIN_VALUE;
        return w62.b(this.f8116d, this);
    }
}
