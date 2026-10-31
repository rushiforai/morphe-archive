package ads_mobile_sdk;

import java.util.UUID;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class zw0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public tx0 f12695a;

    /* renamed from: b, reason: collision with root package name */
    public Object f12696b;

    /* renamed from: c, reason: collision with root package name */
    public String f12697c;

    /* renamed from: d, reason: collision with root package name */
    public UUID f12698d;

    /* renamed from: e, reason: collision with root package name */
    public t70.s f12699e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f12700f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ tx0 f12701g;

    /* renamed from: h, reason: collision with root package name */
    public int f12702h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zw0(tx0 tx0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12701g = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12700f = obj;
        this.f12702h |= Integer.MIN_VALUE;
        return this.f12701g.a(null, null, null, this);
    }
}
