package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ve extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public we f10745a;

    /* renamed from: b, reason: collision with root package name */
    public Object f10746b;

    /* renamed from: c, reason: collision with root package name */
    public Object f10747c;

    /* renamed from: d, reason: collision with root package name */
    public Object f10748d;

    /* renamed from: e, reason: collision with root package name */
    public Object f10749e;

    /* renamed from: f, reason: collision with root package name */
    public mv0 f10750f;

    /* renamed from: g, reason: collision with root package name */
    public mv0 f10751g;

    /* renamed from: h, reason: collision with root package name */
    public mv0 f10752h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f10753i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ we f10754j;

    /* renamed from: k, reason: collision with root package name */
    public int f10755k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ve(we weVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10754j = weVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10753i = obj;
        this.f10755k |= Integer.MIN_VALUE;
        return this.f10754j.a(this);
    }
}
