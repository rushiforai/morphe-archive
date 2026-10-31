package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ae2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pe2 f938a;

    /* renamed from: b, reason: collision with root package name */
    public qw2 f939b;

    /* renamed from: c, reason: collision with root package name */
    public String f940c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f941d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ pe2 f942e;

    /* renamed from: f, reason: collision with root package name */
    public int f943f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ae2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f942e = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f941d = obj;
        this.f943f |= Integer.MIN_VALUE;
        return this.f942e.a((qw2) null, (String) null, this);
    }
}
