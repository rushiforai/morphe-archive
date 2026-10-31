package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class xu2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public cv2 f11838a;

    /* renamed from: b, reason: collision with root package name */
    public d33 f11839b;

    /* renamed from: c, reason: collision with root package name */
    public d f11840c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11841d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ cv2 f11842e;

    /* renamed from: f, reason: collision with root package name */
    public int f11843f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xu2(cv2 cv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11842e = cv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11841d = obj;
        this.f11843f |= Integer.MIN_VALUE;
        return this.f11842e.a((d33) null, this);
    }
}
