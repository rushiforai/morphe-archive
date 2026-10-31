package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class cs extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public hs f1982a;

    /* renamed from: b, reason: collision with root package name */
    public d f1983b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1984c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ hs f1985d;

    /* renamed from: e, reason: collision with root package name */
    public int f1986e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cs(hs hsVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1985d = hsVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1984c = obj;
        this.f1986e |= Integer.MIN_VALUE;
        return hs.a(this.f1985d, this);
    }
}
