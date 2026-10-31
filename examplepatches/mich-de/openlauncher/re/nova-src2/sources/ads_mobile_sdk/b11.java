package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class b11 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f1222a;

    /* renamed from: b, reason: collision with root package name */
    public Object f1223b;

    /* renamed from: c, reason: collision with root package name */
    public Ref.ObjectRef f1224c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f1225d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f1226e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f1227f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ h11 f1228g;

    /* renamed from: h, reason: collision with root package name */
    public int f1229h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b11(h11 h11Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1228g = h11Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1227f = obj;
        this.f1229h |= Integer.MIN_VALUE;
        return this.f1228g.a((y11) null, (Duration) null, (Map) null, false, false, (ContinuationImpl) this);
    }
}
