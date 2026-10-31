package ads_mobile_sdk;

import b.e6;
import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class se0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f9538a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f9539b;

    /* renamed from: c, reason: collision with root package name */
    public Object f9540c;

    /* renamed from: d, reason: collision with root package name */
    public Object f9541d;

    /* renamed from: e, reason: collision with root package name */
    public e6 f9542e;

    /* renamed from: f, reason: collision with root package name */
    public int f9543f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f9544g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ rf0 f9545h;

    /* renamed from: i, reason: collision with root package name */
    public int f9546i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public se0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9545h = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9544g = obj;
        this.f9546i |= Integer.MIN_VALUE;
        return this.f9545h.a(this);
    }
}
