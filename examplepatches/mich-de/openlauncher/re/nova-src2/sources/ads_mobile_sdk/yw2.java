package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class yw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ax2 f12331a;

    /* renamed from: b, reason: collision with root package name */
    public com.google.gson.r f12332b;

    /* renamed from: c, reason: collision with root package name */
    public String f12333c;

    /* renamed from: d, reason: collision with root package name */
    public String f12334d;

    /* renamed from: e, reason: collision with root package name */
    public com.google.gson.r f12335e;

    /* renamed from: f, reason: collision with root package name */
    public d f12336f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f12337g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ ax2 f12338h;

    /* renamed from: i, reason: collision with root package name */
    public int f12339i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yw2(ax2 ax2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12338h = ax2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12337g = obj;
        this.f12339i |= Integer.MIN_VALUE;
        return this.f12338h.a(null, this);
    }
}
