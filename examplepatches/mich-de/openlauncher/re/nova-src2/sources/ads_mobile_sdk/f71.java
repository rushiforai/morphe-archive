package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class f71 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public g71 f3228a;

    /* renamed from: b, reason: collision with root package name */
    public com.google.gson.m f3229b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f3230c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ g71 f3231d;

    /* renamed from: e, reason: collision with root package name */
    public int f3232e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f71(g71 g71Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3231d = g71Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3230c = obj;
        this.f3232e |= Integer.MIN_VALUE;
        return g71.a(this.f3231d, this);
    }
}
