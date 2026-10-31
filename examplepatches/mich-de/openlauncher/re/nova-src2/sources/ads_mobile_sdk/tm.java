package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class tm extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f9991a;

    /* renamed from: b, reason: collision with root package name */
    public Object f9992b;

    /* renamed from: c, reason: collision with root package name */
    public Object f9993c;

    /* renamed from: d, reason: collision with root package name */
    public b.pc f9994d;

    /* renamed from: e, reason: collision with root package name */
    public Object f9995e;

    /* renamed from: f, reason: collision with root package name */
    public Object f9996f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f9997g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ vm f9998h;

    /* renamed from: i, reason: collision with root package name */
    public int f9999i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tm(vm vmVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9998h = vmVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9997g = obj;
        this.f9999i |= Integer.MIN_VALUE;
        return vm.a(this.f9998h, this);
    }
}
