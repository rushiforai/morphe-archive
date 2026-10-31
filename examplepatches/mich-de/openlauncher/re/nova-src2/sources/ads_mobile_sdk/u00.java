package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class u00 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f10159a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k00 f10160b;

    /* renamed from: c, reason: collision with root package name */
    public int f10161c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u00(k00 k00Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10160b = k00Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10159a = obj;
        this.f10161c |= Integer.MIN_VALUE;
        return this.f10160b.a((p5) null, this);
    }
}
