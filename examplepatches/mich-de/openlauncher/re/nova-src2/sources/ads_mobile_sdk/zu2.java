package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class zu2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public cv2 f12671a;

    /* renamed from: b, reason: collision with root package name */
    public b.a1 f12672b;

    /* renamed from: c, reason: collision with root package name */
    public z1 f12673c;

    /* renamed from: d, reason: collision with root package name */
    public km0 f12674d;

    /* renamed from: e, reason: collision with root package name */
    public Integer f12675e;

    /* renamed from: f, reason: collision with root package name */
    public d f12676f;

    /* renamed from: g, reason: collision with root package name */
    public long f12677g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f12678h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ cv2 f12679i;

    /* renamed from: j, reason: collision with root package name */
    public int f12680j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zu2(cv2 cv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12679i = cv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12678h = obj;
        this.f12680j |= Integer.MIN_VALUE;
        return this.f12679i.a(null, null, 0L, this);
    }
}
