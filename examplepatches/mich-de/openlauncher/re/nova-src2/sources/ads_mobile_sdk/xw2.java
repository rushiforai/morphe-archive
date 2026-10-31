package ads_mobile_sdk;

import c80.d;
import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class xw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ax2 f11870a;

    /* renamed from: b, reason: collision with root package name */
    public Map f11871b;

    /* renamed from: c, reason: collision with root package name */
    public String f11872c;

    /* renamed from: d, reason: collision with root package name */
    public String f11873d;

    /* renamed from: e, reason: collision with root package name */
    public String f11874e;

    /* renamed from: f, reason: collision with root package name */
    public d f11875f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f11876g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ ax2 f11877h;

    /* renamed from: i, reason: collision with root package name */
    public int f11878i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xw2(ax2 ax2Var, Continuation continuation) {
        super(continuation);
        this.f11877h = ax2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11876g = obj;
        this.f11878i |= Integer.MIN_VALUE;
        return this.f11877h.a((tx0) null, (Map) null, this);
    }
}
