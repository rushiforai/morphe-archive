package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class x22 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public y22 f11547a;

    /* renamed from: b, reason: collision with root package name */
    public fq f11548b;

    /* renamed from: c, reason: collision with root package name */
    public String f11549c;

    /* renamed from: d, reason: collision with root package name */
    public x11 f11550d;

    /* renamed from: e, reason: collision with root package name */
    public String f11551e;

    /* renamed from: f, reason: collision with root package name */
    public x11 f11552f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f11553g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ y22 f11554h;

    /* renamed from: i, reason: collision with root package name */
    public int f11555i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x22(y22 y22Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11554h = y22Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11553g = obj;
        this.f11555i |= Integer.MIN_VALUE;
        return this.f11554h.a(null, this);
    }
}
