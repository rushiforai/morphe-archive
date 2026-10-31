package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class qv1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b90.p f8825a;

    /* renamed from: b, reason: collision with root package name */
    public String f8826b;

    /* renamed from: c, reason: collision with root package name */
    public long f8827c;

    /* renamed from: d, reason: collision with root package name */
    public long f8828d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f8829e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ b90.p f8830f;

    /* renamed from: g, reason: collision with root package name */
    public int f8831g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qv1(b90.p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8830f = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8829e = obj;
        this.f8831g |= Integer.MIN_VALUE;
        return this.f8830f.a(this);
    }
}
